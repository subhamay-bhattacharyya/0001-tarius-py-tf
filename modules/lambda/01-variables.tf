## ---------------------------------------------------------------------------------------------------------------------
## Variable Definition                  - Lambda Module
## Modification History:
##   - 1.0.0    May 22,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

######################################## Project Name ##############################################
variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "devl"
}
######################################## Environment Name ##########################################
variable "environment_name" {
  type        = string
  description = <<EOT
  (Optional) The environment in which to deploy our resources to.

  Options:
  - devl : Development
  - test: Test
  - prod: Production

  Default: devl
  EOT
  default     = "devl"

  validation {
    condition     = can(regex("^devl$|^test$|^prod$", var.environment_name))
    error_message = "Err: environment is not valid."
  }
}
######################################## GitHub Variables ##########################################
variable "GitHubRepository" {
  type        = string
  description = "GitHub Repository Name"
  default     = ""
}

variable "GitHubURL" {
  type        = string
  description = "GitHub Repository URL"
  default     = ""
}
variable "GitHubRef" {
  type        = string
  description = "GitHub Ref"
  default     = ""
}
variable "GitHubSHA" {
  type        = string
  description = "GitHub SHA"
  default     = ""
}
variable "GitHubWFRunNumber" {
  type        = string
  description = "GitHub Workflow Run Number"
  default     = ""
}
variable "CiBuild" {
  type        = string
  description = "Ci Build String"
  default     = ""
}
variable "KmsMasterKeyId" {
  type        = string
  description = "KMS Key Arn"
  default     = ""
}
######################################## DynamoDB Table ############################################
variable "dynamodb_table_base_name" {
  description = "The name of the DynamoDB table"
  type        = string
}
######################################## SNS Topic #################################################
variable "sns_topic_arn" {
  description = "The arn of the SNS Topic"
  type        = string
}
######################################## Dead Letter Queue Arn #####################################
variable "dead_letter_queue_arn" {
  description = "The arn of the Dead Letter Queue"
  type        = string
}
######################################## Lambda Function  ##########################################
variable "lambda_function_base_name" {
  description = "The base name of the lambda function"
  type        = string
}
variable "lambda_function_description" {
  description = "The description of the lambda function"
  type        = string
}
variable "iam_role_base_name" {
  description = "The Arn of the lambda function execution role"
  type        = string
}
variable "memory_size" {
  description = "The allocated memory size of the lambda function in MB"
  type        = number
}
variable "runtime" {
  description = "The runtime the lambda function"
  type        = string
}
variable "timeout" {
  description = "The timeout period of the lambda function in seconds"
  type        = number
}
variable "reserved_concurrent_executions" {
  description = "The reserved concurrency for the lambda function."
  type        = number
}
######################################## Local Variables ###########################################
locals {
  tags = tomap({
    Environment       = var.environment_name
    ProjectName       = var.project_name
    GitHubRepository  = var.GitHubRepository
    GitHubRef         = var.GitHubRef
    GitHubURL         = var.GitHubURL
    GitHubWFRunNumber = var.GitHubWFRunNumber
    GitHubSHA         = var.GitHubSHA
  })
}

locals {
  iam_role_name = "${var.project_name}-${var.iam_role_base_name}-${var.environment_name}${var.CiBuild}"
}

locals {
  lambda_function_name = "${var.project_name}-${var.lambda_function_base_name}-${var.environment_name}-${data.aws_region.current.name}${var.CiBuild}"
}

locals {
  lambda_execution_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.project_name}-${var.iam_role_base_name}-${var.environment_name}${var.CiBuild}"
}

locals {
  dynamodb_table_name = "${var.project_name}-${var.dynamodb_table_base_name}-${var.environment_name}-${data.aws_region.current.name}${var.CiBuild}"
}

locals {
  cloudwatch_log_group = "/aws/lambda/${var.project_name}-${var.lambda_function_base_name}-${var.environment_name}-${data.aws_region.current.name}${var.CiBuild}"
}