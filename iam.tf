variable dynamodb_lambda_permissions_list {
    description = "Permissions for the Lambda function"
    type = list
    default = ["dynamodb:PutItem", "dynamodb:UpdateItem", "dynamodb:BatchWriteItem"]
}

variable ecr_permissions_list {
    description = "Permissions for the Lambda function"
    type = list
    default = ["ecr:BatchGetImage", "ecr:GetDownloadUrlForLayer"]
}
//, "logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"

variable allow_string {
  default = "Allow"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "lambda_policy_document" {
  statement {
    effect    = var.allow_string
    actions   = var.dynamodb_lambda_permissions_list
    resources = [module.dynamodb-table.dynamodb_table_arn]
  }

  statement {
    effect    = var.allow_string
    actions   = var.ecr_permissions_list
    resources = [aws_ecr_repository.repo.arn]
  }
}

resource "aws_iam_policy" "lambda_policy" {
  name   = "lambda-policy"
  policy = data.aws_iam_policy_document.lambda_policy_document.json
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}