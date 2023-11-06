## ---------------------------------------------------------------------------------------------------------------------
## Variable Definition                  - IAM Execution Role Module
## Modification History:
##   - 1.0.0    May 22,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

######################################## Project Name ##############################################
variable "project_name" {
  description = "The name of the project"
  type        = string
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

######################################## IAM Role / Policy #########################################
variable "iam_role_base_name" {
  description = "The name of the IAM Role"
  type        = string
}
variable "iam_policy_base_name" {
  description = "The name of the IAM Policy"
  type        = string
}
######################################## Lambda Function  ##########################################
variable "lambda_function_base_name" {
  description = "The base name of the lambda function"
  type        = string
}
######################################## DynamoDB Table ############################################
variable "dynamodb_table_base_name" {
  description = "The base name of the DynamoDB table"
  type        = string
}
######################################## SNS Topic #################################################
variable "sns_topic_base_name" {
  description = "The base name of the SNS Topic"
  type        = string
}
######################################## SQS Queue #################################################
variable "sqs_queue_base_name" {
  description = "The base name of the SQS Queue"
  type        = string
}
######################################## S3 Bucket #################################################
variable "s3_bucket_base_name" {
  description = "The base name of the S3 Bucket"
  type        = string
}
variable "s3_default_folder" {
  description = "The default folder to be created"
  type        = string
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
  iam_policy_name = "${var.project_name}-${var.iam_policy_base_name}-${var.environment_name}${var.CiBuild}"
}


locals {
  bucket_name = "${var.project_name}-${var.s3_bucket_base_name}-${var.environment_name}-${data.aws_region.current.name}${var.CiBuild}"
}


locals {
  lambda_function_name = "${var.project_name}-${var.lambda_function_base_name}-${var.environment_name}-${data.aws_region.current.name}${var.CiBuild}"
}

locals {
  dynamodb_table_name = "${var.project_name}-${var.dynamodb_table_base_name}-${var.environment_name}-${data.aws_region.current.name}${var.CiBuild}"
}

locals {
  queue_name = "${var.project_name}-${var.sqs_queue_base_name}-${var.environment_name}-${data.aws_region.current.name}${var.CiBuild}"
}

locals {
  sns_topic_name = "${var.project_name}-${var.sns_topic_base_name}-${var.environment_name}-${data.aws_region.current.name}${var.CiBuild}"
}
