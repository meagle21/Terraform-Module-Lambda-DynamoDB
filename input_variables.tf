variable lambda_function_name {
    description = "Name of the lambda function"
    type = string
    nullable = false
}

variable sportsbook_website_url {
    description = "URL of the sportsbook"
    type = string
    nullable = false
}

variable dynambodb_table_name {
    description = "Name of DynamoDB table"
    type = string
    nullable = false
}

variable sportsbook {
    description = "Name of sportsbooks that the lambda/dynamodb are an API for"
    type = string
    nullable = true
}

variable sport {
    description = "Sport that the data is in relation to"
    type = string
    nullable = true
}

variable team_odds_bool {
    description = "Boolean, defines whether or not the odds are team based odds or are player props"
    type = bool
    nullable = true
}

