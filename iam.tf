variable lambda_permissions_list {
    description = "Permissions for the Lambda function"
    type = list
    default = ["dynamodb:PutItem", "dynamodb:UpdateItem", "dynamodb:BatchWriteItem", "ecr:GetDownloadUrlForLayer",
               "ecr:BatchGetImage", "logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = [aws_lambda_function.lambda_function.arn]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "lambda_dynamodb_write_policy" {
  name        = "lambda-dynamodb-write-policy"
  description = "Policy to allow Lambda to write data to DynamoDB"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = var.lambda_permissions_list
        Effect   = "Allow"
        Resource = module.dynamodb-table.dynamodb_table_arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_dynamodb_attachment" {
  policy_arn = aws_iam_policy.lambda_dynamodb_write_policy.arn
  role       = aws_iam_role.iam_for_lambda.name
}