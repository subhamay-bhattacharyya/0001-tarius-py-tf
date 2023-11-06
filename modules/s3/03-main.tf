## ---------------------------------------------------------------------------------------------------------------------
## Main                                 - S3 Module
## Modification History:
##   - 1.0.0    May 22,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

########################################  S3 Bucket ################################################
resource "aws_s3_bucket" "s3-bucket" {
  bucket        = local.bucket_name
  force_destroy = true

  tags = local.tags
}

resource "aws_s3_bucket_ownership_controls" "s3-bucket-owner-control" {
  bucket = aws_s3_bucket.s3-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3-bucket-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3-bucket-owner-control]

  bucket = aws_s3_bucket.s3-bucket.id
  acl    = "private"
}
########################################  S3 Bucket Verisoning #####################################
resource "aws_s3_bucket_versioning" "s3-bucket-versioning" {
  bucket = aws_s3_bucket.s3-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
######################################## SSE Encryption ############################################
resource "aws_s3_bucket_server_side_encryption_configuration" "s3-bucket-sse" {
  bucket = aws_s3_bucket.s3-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.KmsMasterKeyId
      sse_algorithm     = "aws:kms"
    }
  }
}
######################################## S3 Bucket Policy ##########################################
resource "aws_s3_bucket_policy" "allow-lambda-role-access" {
  bucket = aws_s3_bucket.s3-bucket.id
  policy = data.aws_iam_policy_document.allow-lambda-role-access.json
}
######################################## SSE Encryption ############################################
resource "aws_s3_object" "s3-bucket-folder" {
  bucket     = aws_s3_bucket.s3-bucket.id
  acl        = "private"
  key        = "${var.s3_default_folder}/"
  source     = "/dev/null"
  kms_key_id = var.KmsMasterKeyId
}
######################################## S3 Event Notification #####################################
resource "aws_lambda_permission" "lambda-permission" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.s3-bucket.arn
}

resource "aws_s3_bucket_notification" "s3-bucket-notification" {
  bucket = aws_s3_bucket.s3-bucket.id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = var.s3_default_folder
    filter_suffix       = ".csv"
  }

  depends_on = [aws_lambda_permission.lambda-permission]
}