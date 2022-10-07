resource "aws_lambda_function" "stop_function" {
  filename         = data.archive_file.stop_archive.output_path
  function_name    = "stop-lamda"
  role             = aws_iam_role.lambda_role.arn
  handler          = "stop_lambda.lambda_handler"
  source_code_hash = data.archive_file.stop_archive.output_base64sha256
  runtime          = var.lambda_runtime
  timeout          = var.lambda_timeout
  tags = {
    "Name" : "stop-lamda",
    "Env" : var.environment
  }
}

data "archive_file" "stop_archive" {
  type        = "zip"
  source_file  = "${path.module}/src/stop_lambda.py"
  output_path = "${path.module}/files/stop_lambda.zip"
}

resource "aws_lambda_function" "start_function" {
  filename         = data.archive_file.start_archive.output_path
  function_name    = "start-lamda"
  role             = aws_iam_role.lambda_role.arn
  handler          = "start_lambda.lambda_handler"
  source_code_hash = data.archive_file.start_archive.output_base64sha256
  runtime          = var.lambda_runtime
  timeout          = var.lambda_timeout
  tags = {
    "Name" : "start-lamda",
    "Env" : var.environment
  }
}

data "archive_file" "start_archive" {
  type        = "zip"
  source_file  = "${path.module}/src/start_lambda.py"
  output_path = "${path.module}/files/start_lambda.zip"
}