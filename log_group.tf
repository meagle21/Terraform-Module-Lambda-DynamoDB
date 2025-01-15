resource "aws_cloudwatch_log_group" "lambda_logging" {
    name = "sportsbook_apis/${var.lambda_function_name}"
}