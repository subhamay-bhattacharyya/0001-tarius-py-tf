## ---------------------------------------------------------------------------------------------------------------------
## Main                                 - IAM Execution Role Module
## Modification History:
##   - 1.0.0    May 22,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

########################################  IAM Role #################################################
resource "aws_iam_role" "iam-role" {
  name        = local.iam_role_name
  description = "Tarius Lambda execution role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

  tags = local.tags
}
########################################  IAM Policy #################################################
resource "aws_iam_policy" "iam-policy" {
  name        = local.iam_policy_name
  path        = "/"
  description = "Tarius Lambda execution policy"


  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = data.aws_iam_policy_document.iam-policy-document.json
}
########################################  IAM Role / Policy attachment #############################
resource "aws_iam_role_policy_attachment" "iam-role-policy-attachment" {
  depends_on = [aws_iam_role.iam-role, aws_iam_policy.iam-policy]

  role       = aws_iam_role.iam-role.name
  policy_arn = aws_iam_policy.iam-policy.arn
}