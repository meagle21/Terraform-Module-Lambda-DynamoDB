resource "aws_cloudwatch_log_group" "lambda_logging" {
    name = "${var.sport}/${var.lambda_function_name}"
}