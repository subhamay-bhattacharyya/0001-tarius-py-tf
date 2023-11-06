## ---------------------------------------------------------------------------------------------------------------------
## Variable Values - Project Tarius     - Production
## Modification History:
##   - 1.0.0    Jun 3,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

######################################## Project Name ##############################################
project_name                   = "tarius"
######################################## SNS Topic #################################################
sns_topic_base_name            = "sns-topic"
sns_topic_display_name         = "SNS Topic to send a notification once the data load is complete."
######################################## SNS Topic Subscription ####################################
sns_subscription_email         = ["tarius-prod-1@mailinator.com", "tarius-prod-2@mailinator.com"]
######################################## SQS Queue #################################################
sqs_queue_base_name            = "std-queue"
delay_seconds                  = 0
max_message_size               = 262144
message_retention_seconds      = 345600
receive_wait_time_seconds      = 10
######################################## DynamoDB Table ############################################
dynamodb_table_base_name       = "product"
partition_key                  = "ID"
partition_key_data_type        = "S"
######################################## S3 Bucket #################################################
s3_bucket_base_name            = "landing-zone"
s3_default_folder              = "raw-data"
######################################## Lambda IAM Role and Policy ################################
iam_role_base_name             = "lambda-role"
iam_policy_base_name           = "lambda-policy"
######################################## Lambda Function ###########################################
lambda_function_base_name      = "process-data"
lambda_function_description    = "Tarius Lambda Function to load a file from S3 to DynamoDB using event notification"
memory_size                    = 512
runtime                        = "python3.7"
timeout                        = 900
reserved_concurrent_executions = 3