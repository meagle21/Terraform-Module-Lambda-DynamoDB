resource "aws_lambda_function" "lambda_function" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.iam_for_lambda.arn

  environment {
    variables = {
      URL = var.sportsbook_website_url
    }
  }

  snap_start {
    apply_on = "PublishedVersions"
  }
}