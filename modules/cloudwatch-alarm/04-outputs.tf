## ---------------------------------------------------------------------------------------------------------------------
## Output                               - CloudWatch Alarm Module
## Modification History:
##   - 1.0.0    May 22,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

output "alarm_arn" {
  value = aws_cloudwatch_metric_alarm.cloudwatch_metric_alarm.arn
}