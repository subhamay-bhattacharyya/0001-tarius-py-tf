## ---------------------------------------------------------------------------------------------------------------------
## Output                               - Project Tarius
## Modification History:
##   - 1.0.0    May 22,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

######################################## AWS REGION ################################################
output "aws_current_region" {
  value = module.tarius_sns.current_region
}

output "aws_current_region_name" {
  value = module.tarius_sns.current_region_description
}
######################################## SNS Topic #################################################
output "tarius_sns_topic_arn" {
  value = module.tarius_sns.sns_topic_arn
}

output "tarius_sns_topic_display_name" {
  value = module.tarius_sns.sns_topic_display_name
}

output "tarius_sns_topic_id" {
  value = module.tarius_sns.sns_topic_id
}

output "tarius_sns_topic_owner" {
  value = module.tarius_sns.sns_topic_owner
}

output "tarius_sns_topic_tags_all" {
  value = module.tarius_sns.sns_topic_tags_all
}
######################################## SNS Subscription ##########################################
output "tarius_sns_topic_subscription_arn" {
  value = module.tarius_sns.sns_topic_subscription_arn
}
######################################## SQS Queue #################################################
output "tarius_sqs_queue_arn" {
  value = module.tarius_sqs.sqs_queue_arn
}

output "tarius_sqs_queue_id" {
  value = module.tarius_sqs.sqs_queue_id
}

output "tarius_sqs_queue_url" {
  value = module.tarius_sqs.sqs_queue_url
}

output "tarius_sqs_queue_tags_all" {
  value = module.tarius_sqs.sqs_topic_tags_all
}
######################################## DynamoDB Table ############################################
output "tarius_dynamodb_table_id" {
  value = module.tarius_dynamodb.dynamodb_table_id
}

output "tarius_dynamodb_table_arn" {
  value = module.tarius_dynamodb.dynamodb_table_arn
}

output "tarius_dynamodb_table_tags_all" {
  value = module.tarius_dynamodb.dynamodb_table_tags_all
}
######################################## S3 Bucket #################################################
output "tarius_s3_bucket_arn" {
  value = module.tarius_s3_bucket.s3_bucket_arn
}

output "tarius_s3_bucket_id" {
  value = module.tarius_s3_bucket.s3_bucket_id
}

output "tarius_s3_bucket_tags_all" {
  value = module.tarius_s3_bucket.s3_bucket_tags_all
}
######################################## IAM Role ##################################################
output "tarius_lambda_role_arn" {
  value = module.tarius_lambda_execution_role.iam_role_arn
}
######################################## Lambda Function ###########################################
output "tarius_lambda_function_arn" {
  value = module.tarius_lambda_function.lambda_function_arn
}
output "tarius_lambda_function_log_group_arn" {
  value = module.tarius_lambda_function.lambda_log_group_arn
}
######################################## Lambda Alarm ##############################################
output "tarius_lambda_duration_alarm_arn" {
  value = module.tarius_lambda_duration_alarm.alarm_arn
}
output "tarius_lambda_errors_alarm_arn" {
  value = module.tarius_lambda_errors_alarm.alarm_arn
}
output "tarius_lambda_invocations_alarm_arn" {
  value = module.tarius_lambda_invocations_alarm.alarm_arn
}
output "tarius_lambda_throttles_alarm_arn" {
  value = module.tarius_lambda_duration_alarm.alarm_arn
}
output "tarius_lambda_executions_alarm_arn" {
  value = module.tarius_lambda_executions_alarm.alarm_arn
}
