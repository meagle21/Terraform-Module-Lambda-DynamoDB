variable lambda_function_name {
    description = "Name of the lambda function"
    type = string
}

variable sportsbook_website_url {
    description = "URL of the sportsbook"
    type = string
}

variable dynambodb_table_name {
    description = "Name of DynamoDB table"
    type = string
}

variable sportsbook {
    description = "Name of sportsbooks that the lambda/dynamodb are an API for"
    type = string
}

variable sport {
    description = "Sport that the data is in relation to"
    type = string
}

variable team_odds_bool {
    description = "Boolean, defines whether or not the odds are team based odds or are player props"
    type = bool
}

