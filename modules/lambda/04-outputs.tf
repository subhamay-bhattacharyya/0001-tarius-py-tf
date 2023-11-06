## ---------------------------------------------------------------------------------------------------------------------
## Output                               - Lambda Module
## Modification History:
##   - 1.0.0    May 22,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

output "lambda_function_arn" {
  value = aws_lambda_function.lambda-function.arn
}

output "lambda_log_group_arn" {
  value = aws_cloudwatch_log_group.log-group.arn
}