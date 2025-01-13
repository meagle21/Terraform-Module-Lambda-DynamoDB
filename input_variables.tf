variable lambda_function_name {
    description = "Name of the lambda function"
    type = string
    validation {
        condition = length(var.lambda_function_name) == 0
        error_message = "Lambda Function Name is required!"
    }
}

variable sportsbook_website_url {
    description = "URL of the sportsbook"
    type = string
    validation {
        condition = length(var.sportsbook_website_url) == 0
        error_message = "Sportsbook Website URL is required!"
    }
}

variable dynambodb_table_name {
    description = "Name of DynamoDB table"
    type = string
    validation {
        condition = length(var.dynambodb_table_name) == 0
        error_message = "DynamoDB Table Name is required!"
    }
}

variable sportsbook {
    description = "Name of sportsbooks that the lambda/dynamodb are an API for"
    type = string
    default = ""
}

variable sport {
    description = "Sport that the data is in relation to"
    type = string
    default = ""
}

variable team_odds_bool {
    description = "Boolean, defines whether or not the odds are team based odds or are player props"
    type = bool
    default = ""
}

