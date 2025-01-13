locals {
  odds_type = var.team_odds_bool ? "Team" : "Player"
}

variable hash_key {
  type = string
  default = "game-id"
}

variable hash_key_data_type {
  type = string
  default = "S"
}

variable deletion_protection_boolean {
  type = bool
  default = true
}

module "dynamodb-table" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "4.2.0"
  name     = var.dynambodb_table_name
  hash_key = var.hash_key
  attributes = [
    {
      name = var.hash_key
      type = var.hash_key_data_type
    }
  ]
  deletion_protection_enabled = var.deletion_protection_boolean
  tags = {
    Sportsbook = var.sportsbook
    Sport = var.sport
    Odds_type = local.odds_type
  }
}