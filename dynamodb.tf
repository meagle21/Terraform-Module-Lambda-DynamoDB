locals {
  odds_type = var.team_odds_bool ? "Team" : "Player"
}
module "dynamodb-table" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "4.2.0"
  name     = var.dynambodb_table_name
  hash_key = "game-id"
  deletion_protection_enabled = true
  tags = {
    Terraform   = "true"
    Sportsbook = var.sportsbook
    Sport = var.sport
    Odds_type = local.odds_type
  }
}