## ---------------------------------------------------------------------------------------------------------------------
## Variable Definition                  - Project Tarius
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
######################################## SNS Topic #################################################
variable "sns_topic_base_name" {
  description = "The base name of the SNS Topic"
  type        = string
}
variable "sns_topic_display_name" {
  description = "The display name of the SNS Topic"
  type        = string
}
######################################## SNS Topic Subscription ####################################
variable "sns_subscription_email" {
  description = "The SNS subscription email"
  type        = list(string)
  default     = ["someone@email.com"]
}
######################################## SQS Queue #################################################
variable "sqs_queue_base_name" {
  description = "The base name of the SQS Queue"
  type        = string
  default     = "tarius-sqs-queue"
}
variable "delay_seconds" {
  description = "SQS queue delay seconds"
  type        = number
}
variable "max_message_size" {
  description = "SQS queue maximum message size"
  type        = number
}
variable "message_retention_seconds" {
  description = "SQS queue message retention period in seconds"
  type        = number
}
variable "receive_wait_time_seconds" {
  description = "SQS queue receive wait time in seconds"
  type        = number
}
######################################## DynamoDB Table ############################################
variable "dynamodb_table_base_name" {
  description = "The base name of the DynamoDB table"
  type        = string
}
variable "partition_key" {
  description = "The partition key or hash key of the dynamodb table."
  type        = string
}
variable "partition_key_data_type" {
  description = "The partition key or hash key datat type of the dynamodb table."
  type        = string
}
######################################## S3 Bucket #################################################
variable "s3_bucket_base_name" {
  description = "The base name of the S3 bucket"
  type        = string
}

variable "s3_default_folder" {
  description = "The default folder to be created"
  type        = string
  default     = "raw-zone"
}
######################################## IAM Role / Policy #########################################
variable "iam_role_base_name" {
  description = "The name of the IAM Role"
  type        = string
}

variable "iam_policy_base_name" {
  description = "The name of the IAM Policy"
  type        = string
}
######################################## Lambda Function  git stagit ##########################################
variable "lambda_function_base_name" {
  description = "The base name of the lambda function"
  type        = string
}
variable "lambda_function_description" {
  description = "The description of the lambda function"
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
