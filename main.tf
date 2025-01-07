provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

# Create a Cognito User Pool
resource "aws_cognito_user_pool" "user_pool" {
  name = "typing-speed-test-user-pool"

  alias_attributes = ["email"]
  auto_verified_attributes = ["email"]
}

# Create a DynamoDB Table
resource "aws_dynamodb_table" "typing_test_results" {
  name         = "TypingTestResults"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "UserID"
    type = "S"
  }

  hash_key = "UserID"
}

# Create IAM Role for Lambda execution
resource "aws_iam_role" "lambda_exec" {
  name               = "lambda_exec_role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions   = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

# Create IAM Policy for DynamoDB Access
resource "aws_iam_policy" "dynamodb_access" {
  name        = "DynamoDBAccessPolicy"

  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:Scan",
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.typing_test_results.arn
      },
    ]
  })
}

# Attach policy to allow DynamoDB access
resource "aws_iam_policy_attachment" "lambda_dynamodb_access" {
  name       = "lambda-dynamodb-access"
  roles      = [aws_iam_role.lambda_exec.name]
  policy_arn = aws_iam_policy.dynamodb_access.arn
}

# Define the archive_file data source to create a ZIP file for the Lambda function
data "archive_file" "lambda_zip" {
  type        = "zip"
  output_path = "${path.module}/lambda/store-results.zip" # Path where the zip will be created

  # Include your source files
  source {
    content  = file("${path.module}/lambda/store-results.js") # Path to your source file
    filename = "store-results.js"
  }
}

# Create Lambda function for storing results
resource "aws_lambda_function" "store_results" {
  function_name     = "StoreTypingTestResults"
  handler           = "store-results.handler"
  runtime           = "nodejs18.x" # Updated to a supported runtime

  role              = aws_iam_role.lambda_exec.arn
  filename          = data.archive_file.lambda_zip.output_path # Use the output path of the archive_file

  environment {
    variables = {
      DYNAMODB_TABLE_NAME = aws_dynamodb_table.typing_test_results.name
    }
  }
}

# Create API Gateway
resource "aws_api_gateway_rest_api" "api" {
  name        = "TypingSpeedTestAPI"
}

resource "aws_api_gateway_resource" "results_resource" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "results"
}

resource "aws_api_gateway_method" "post_results_method" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.results_resource.id
  http_method   = "POST"
  
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "post_results_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.results_resource.id
  http_method             = aws_api_gateway_method.post_results_method.http_method
  
  integration_http_method = "POST"
  
  type                    = "AWS_PROXY"
  
  uri                     = aws_lambda_function.store_results.invoke_arn
}

# Outputs for convenience
output "cognito_user_pool_id" {
  value       = aws_cognito_user_pool.user_pool.id
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.typing_test_results.name
}

output "api_endpoint" {
  value       = "${aws_api_gateway_rest_api.api.execution_arn}/results"
}
