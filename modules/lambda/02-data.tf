## ---------------------------------------------------------------------------------------------------------------------
## Data Definition                      - Lambda Module
## Modification History:
##   - 1.0.0    May 22,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

# AWS Region and Caller Identity
data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

# Lambda code zip file
data "archive_file" "package_zip" {
  type        = "zip"
  source_file = "${path.module}/code/${var.lambda_function_base_name}.py"
  output_path = "${path.module}/code/${var.lambda_function_base_name}.zip"
}