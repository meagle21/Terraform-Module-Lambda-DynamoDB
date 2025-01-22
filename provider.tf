variable region {
    default = "us-east-2"
}

provider "aws" {
  region = var.region
}