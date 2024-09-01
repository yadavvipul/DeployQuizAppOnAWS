import boto3
import json
import requests

# Initialize a DynamoDB resource
dynamodb = boto3.resource('dynamodb')
# Specify the DynamoDB table name
table = dynamodb.Table('QuizQuestions')


def lambda_handler(event, context):
    # Fetch trivia questions from the API
    response = requests.get("https://opentdb.com/api.php?amount=10")
    questions = response.json().get('results', [])
    
    for question in questions:
        # Prepare the item to be stored in DynamoDB
        item = {
            'QuestionID': question['question_id'],
            'Category': question['category'],
            'Difficulty': question['difficulty'],
            'Question': question['question'],
            'Options': json.dumps(question['incorrect_answers'] + [question['correct_answer']]),  # JSON-encoded list of options
            'CorrectAnswer': question['correct_answer']
        }
        table.put_item(Item=item)  # Storing item in the DynamoDB table

    
    return {
        'statusCode': 200,
        'body': json.dumps('Questions loaded into DynamoDB')
    }
