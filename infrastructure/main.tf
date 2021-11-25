terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.22.0"
    }
  }
}

provider "snowflake" {
  alias  = "sys_admin"
  role   = "SYSADMIN"
  region = "ap-southeast-2"

}

provider "snowflake" {
  alias  = "security_admin"
  role   = "SECURITYADMIN"
  region = "ap-southeast-2"
}
