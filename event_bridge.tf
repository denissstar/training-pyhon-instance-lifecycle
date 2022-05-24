resource "aws_cloudwatch_event_rule" "stop" {
  name        = "StopEC2Instances"
  description = "StopEC2Instances"

  schedule_expression = "cron(0 17 ? * * *)"
}

resource "aws_cloudwatch_event_rule" "start" {
  name        = "StartEC2Instances"
  description = "StartEC2Instances"

  schedule_expression = "cron(0 10 ? * * *)"
}

resource "aws_cloudwatch_event_target" "stop_lambda" {
  rule      = aws_cloudwatch_event_rule.stop.name
  target_id = "StopLambda"
  arn       = aws_lambda_function.stop_function.arn
}

resource "aws_cloudwatch_event_target" "start_lambda" {
  rule      = aws_cloudwatch_event_rule.start.name
  target_id = "StartLambda"
  arn       = aws_lambda_function.start_function.arn
}