## ---------------------------------------------------------------------------------------------------------------------
## Main                                 - CloudWatch Alarm Module 
## Modification History:
##   - 1.0.0    May 22,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------


resource "aws_cloudwatch_metric_alarm" "cloudwatch_metric_alarm" {
  alarm_name          = local.cloudwatch_alarm_name
  comparison_operator = var.cloudwatch_alarm_comparison_operator
  evaluation_periods  = var.cloudwatch_alarm_evaluation_period
  metric_name         = var.cloudwatch_metric_name
  namespace           = var.cloudwatch_alarm_namespace
  period              = var.cloudwatch_alarm_period
  statistic           = var.cloudwatch_alarm_statistics
  threshold           = var.cloudwatch_alarm_threshold
  alarm_description   = var.cloudwatch_alarm_description
  datapoints_to_alarm = var.datapoints_to_alarm
  actions_enabled     = "true"
  alarm_actions       = [var.sns_topic_arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    FunctionName = local.lambda_function_name
  }

  tags = local.tags
}