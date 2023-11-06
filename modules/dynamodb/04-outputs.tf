## ---------------------------------------------------------------------------------------------------------------------
## Output                               - DynamoDB Module
## Modification History:
##   - 1.0.0    May 22,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

######################################## AWS REGION ################################################
output "current_region" {
  value = data.aws_region.current.name
}

output "current_region_description" {
  value = data.aws_region.current.description
}
######################################## DYNAMODB TABLE ############################################
output "dynamodb_table_id" {
  value = aws_dynamodb_table.dynamodb_table.id
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.dynamodb_table.arn
}

output "dynamodb_table_tags_all" {
  value = aws_dynamodb_table.dynamodb_table.tags_all
}
