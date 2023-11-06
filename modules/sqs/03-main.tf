## ---------------------------------------------------------------------------------------------------------------------
## Main                                 - SQS Module
## Modification History:
##   - 1.0.0    May 22,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

######################################## SQS Queue# ################################################
resource "aws_sqs_queue" "sqs-queue" {
  name                      = local.queue_name
  delay_seconds             = var.delay_seconds
  max_message_size          = var.max_message_size
  message_retention_seconds = var.message_retention_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds
  kms_master_key_id         = var.KmsMasterKeyId
  tags                      = local.tags
}
######################################## SQS Queue Policy############################################
resource "aws_sqs_queue_policy" "sqs-queue-policy" {
  queue_url = aws_sqs_queue.sqs-queue.id
  policy    = data.aws_iam_policy_document.sqs-policy-document.json
}