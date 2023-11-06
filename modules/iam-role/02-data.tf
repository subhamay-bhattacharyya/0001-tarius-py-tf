## ---------------------------------------------------------------------------------------------------------------------
## Data Definition                      - IAM Execution Role Module
## Modification History:
##   - 1.0.0    May 22,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

# AWS Region and Caller Identity
data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

# IAM Policy Document
data "aws_iam_policy_document" "iam-policy-document" {
  statement {
    sid = "AllowCloudWatchLogStream"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = [
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${local.lambda_function_name}:*",
    ]
  }

  statement {
    sid = "AllowDynamoDBBatchWriteItem"

    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem"
    ]

    resources = [
      "arn:aws:dynamodb:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/${local.dynamodb_table_name}",
    ]
  }

  statement {
    sid = "AllowSNSPublishMessage"

    actions = [
      "sns:Publish"
    ]

    resources = [
      "arn:aws:sns:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${local.sns_topic_name}",
    ]
  }

  statement {
    sid = "AllowSQSSendMessage"

    actions = [
      "sqs:SendMessage"
    ]

    resources = [
      "arn:aws:sqs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${local.queue_name}"
    ]
  }

  statement {
    sid = "AllowReadAccessToS3Bucket"

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "arn:aws:s3:::${local.bucket_name}/${var.s3_default_folder}/*"
    ]
  }
  statement {
    sid = "AllowWriteAccessToS3Bucket"

    actions = [
      "s3:PutObject"
    ]

    resources = [
      "arn:aws:s3:::${local.bucket_name}/invalid-records/*"
    ]
  }

  statement {
    sid = "AllowKMSDecryption"

    actions = [
      "kms:Decrypt",
      "kms:Encrypt",
      "kms:GenerateDataKey",
      "kms:GenerateDataKeyPair"
    ]

    resources = [
      "${var.KmsMasterKeyId}"
    ]
  }

}