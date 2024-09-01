# Define the DynamoDB table for storing quiz questions
resource "aws_dynamodb_table" "quiz_questions" {
  name           = "QuizQuestions"
  billing_mode    = "PAY_PER_REQUEST"  

  hash_key        = "QuestionID" # Define the primary key of the table

  # Define the attributes used in the table
  attribute {
    name = "QuestionID"
    type = "S"
  }
  
  attribute {
    name = "Category"
    type = "S"
  }

  attribute {
    name = "Difficulty"
    type = "S"
  }

  # Define the first global secondary index for querying by category
  global_secondary_index {
    name            = "Category"
    hash_key        = "Category"
    projection_type = "ALL"
    
    read_capacity  = 5
    write_capacity = 5
  }
 # Define the second global secondary index for querying by difficulty
  global_secondary_index {
    name            = "Difficulty"
    hash_key        = "Difficulty"
    projection_type = "ALL"

    read_capacity  = 5
    write_capacity = 5
  }
}
