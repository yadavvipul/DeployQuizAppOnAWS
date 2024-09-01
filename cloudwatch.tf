resource "aws_cloudwatch_event_rule" "every_day" {
  name               = "TriggerLambdaDaily"
  schedule_expression = "rate(1 day)"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.every_day.name
  target_id = "lambda_target"
  arn       = aws_lambda_function.fetch_trivia_questions.arn
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.fetch_trivia_questions.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.every_day.arn
}
