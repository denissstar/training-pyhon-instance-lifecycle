variable "environment" {
  description = "The target environment account type - DEV | PROD"
  default     = "Dev"
}

variable "lambda_timeout" {
  description = "Lambda timeout"
  default     = "60"
}

variable "lambda_runtime" {
  description = "Lambda runtime"
  default     = "python3.9"
}
