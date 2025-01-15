# Terraform-Module-Lambda-DynamoDB

## Table of Contents
- [Terraform-Module-Lambda-DynamoDB](#terraform-module-lambda-dynamodb)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Usage Guide](#usage-guide)
  - [What the System Looks Like:](#what-the-system-looks-like)

## Overview 
This module provisions a Lambda function, DynamoDB table, IAM policies, CloudWatch Log Group, and an ECR registry with the necessary permissions. I originally created this module to streamline the deployment of Lambdas and DynamoDB tables for a project that queries odds data from various sportsbooks. By leveraging this module, I can easily customize the configuration for different sportsbooks or sports.

While the module is tailored to my specific use case, it is designed to be somewhat flexible and can be used in any project that requires a configured Lambda-DynamoDB connection with proper permissions. Simply input the relevant variables to adapt it to your needs.

## Usage Guide
``` 
module draftkings_basketball_team_api {
    source = "github.com/meagle21/Terraform-Module-Lambda-DynamoDB-Odds-Comparison"
    lambda_function_name = "draftkings_scraping_lambda_nba_team"
    sportsbook_website_url = "https://sportsbook.draftkings.com/leagues/basketball/nba"
    dynambodb_table_name = "draftkings-basketball-team-odds"
    sportsbook = "DraftKings"
    sport = "Basketball"
    team_odds_bool = false
} 
```

## What the System Looks Like:
![image](Deployed%20Resources.png)