resource "aws_ecr_repository" "repo" {
  name                 = "repo-for-${var.lambda_function_name}"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}