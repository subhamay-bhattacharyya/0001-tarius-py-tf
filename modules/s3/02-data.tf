## ---------------------------------------------------------------------------------------------------------------------
## Data Definition                      - S3 Module
## Modification History:
##   - 1.0.0    May 22,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

# AWS Region and Caller Identity
data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

########################################  S3 Bucket Policy #########################################
data "aws_iam_policy_document" "allow-lambda-role-access" {
  statement {
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${local.iam_role_name}",
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/iamadmin"
      ]
    }
    sid    = "allow-s3-list-bucket"
    effect = "Allow"
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      "${aws_s3_bucket.s3-bucket.arn}",
    ]
  }

  statement {
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${local.iam_role_name}",
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/iamadmin"
      ]
    }
    sid    = "allow-s3-read-write"
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]
    resources = [
      "arn:aws:s3:::${local.bucket_name}/*"
    ]
  }
}