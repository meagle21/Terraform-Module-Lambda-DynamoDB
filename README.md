# Terraform-Module-Lambda-DynamoDB

## Table of Contents
- [Terraform-Module-Lambda-DynamoDB](#terraform-module-lambda-dynamodb)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Features](#features)
  - [Usage Guide](#usage-guide)
  - [What the System Looks Like:](#what-the-system-looks-like)

## Overview 

## Features

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
![image](Deployed Resources.png)