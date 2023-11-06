## ---------------------------------------------------------------------------------------------------------------------
## Variable Definition                  - S3 Module
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
######################################## S3 Bucket #################################################
variable "s3_bucket_base_name" {
  description = "The base name of the S3 Bucket"
  type        = string
  default     = "landing-zone"
}
variable "s3_default_folder" {
  description = "The default folder to be created"
  type        = string
}
######################################## Lambda Function ###########################################
variable "lambda_function_arn" {
  description = "The arn of the lambda function used for bucket notification"
  type        = string
}
######################################## IAM Role / Policy #########################################
variable "iam_role_base_name" {
  description = "The name of the IAM Role"
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
  bucket_name = "${var.project_name}-${var.s3_bucket_base_name}-${var.environment_name}-${data.aws_region.current.name}${var.CiBuild}"
}