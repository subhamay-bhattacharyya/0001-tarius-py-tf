## ---------------------------------------------------------------------------------------------------------------------
## Output                               - S3 Module
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
######################################## S3 Bucket #################################################
output "s3_bucket_arn" {
  value = aws_s3_bucket.s3-bucket.arn
}

output "s3_bucket_id" {
  value = aws_s3_bucket.s3-bucket.id
}

output "s3_bucket_tags_all" {
  value = aws_s3_bucket.s3-bucket.tags_all
}