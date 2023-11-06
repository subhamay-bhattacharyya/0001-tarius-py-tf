## ---------------------------------------------------------------------------------------------------------------------
## Main                                 - DynamoDB Module
## Modification History:
##   - 1.0.0    May 22,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

## DynamoDB Table
resource "aws_dynamodb_table" "dynamodb_table" {
  name         = local.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.partition_key
  attribute {
    name = var.partition_key
    type = var.partition_key_data_type
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = var.KmsMasterKeyId
  }

  tags = local.tags
}