# Define the Lambda function for fetching trivia questions
resource "aws_lambda_function" "fetch_trivia_questions" {
  function_name = "FetchTriviaQuestions"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"

  role          = aws_iam_role.lambda_exec.arn

  environment {
    variables = {
      TABLE_NAME     = aws_dynamodb_table.quiz_questions.name
      TRIVIA_API_URL = "https://opentdb.com/api.php?amount=10"
    }
  }

  filename = "lambda_function.zip"  
}

# Define the IAM role for Lambda function execution
resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com",
      },
    }],
  })
}

# Attach basic execution policy to the Lambda execution role
resource "aws_iam_role_policy_attachment" "lambda_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_exec.name
}

# Attach basic execution policy to the Lambda execution role
resource "aws_iam_role_policy_attachment" "dynamodb_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  role       = aws_iam_role.lambda_exec.name
}
