## ---------------------------------------------------------------------------------------------------------------------
## Provider                             - Project Tarius 
## Modification History:
##   - 1.0.0    May 22,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

terraform {
  backend "s3" {
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
}
