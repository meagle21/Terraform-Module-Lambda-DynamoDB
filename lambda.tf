variable package_type {
    description = "Name of the lambda function"
    type = string
    default = "Image"
}

variable snap_start_setting {
    description = "Setting that sets whether to apply a snap start setting or not, this will speed up Lambda activation."
    type = string
    default = "PublishedVersions"
}

resource "aws_lambda_function" "lambda_function" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.iam_for_lambda.arn
  image_uri     = "${aws_ecr_repository.repo.repository_url}:latest"
  package_type = var.package_type
  environment {
    variables = {
      URL = var.sportsbook_website_url
    }
  }

  snap_start {
    apply_on = var.snap_start_setting
  }
}