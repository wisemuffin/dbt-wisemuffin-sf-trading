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

resource "snowflake_database" "dbt_hol_dev" {
  provider = snowflake.sys_admin
  name     = "DBT_HOL_DEV"
}

resource "snowflake_warehouse" "dbt_dev_wh" {
  provider            = snowflake.sys_admin
  name                = "dbt_dev_wh"
  warehouse_size      = "xsmall"
  initially_suspended = true

  auto_suspend = 60
}

resource "snowflake_warehouse" "dbt_dev_heavy_wh" {
  provider            = snowflake.sys_admin
  name                = "dbt_dev_heavy_wh"
  warehouse_size      = "large"
  initially_suspended = true

  auto_suspend = 60
}


resource "snowflake_database" "dbt_hol_prod" {
  provider = snowflake.sys_admin
  name     = "DBT_HOL_PROD"
}

resource "snowflake_warehouse" "dbt_prod_wh" {
  provider            = snowflake.sys_admin
  name                = "dbt_prod_wh"
  warehouse_size      = "xsmall"
  initially_suspended = true

  auto_suspend = 60
}

resource "snowflake_warehouse" "dbt_prod_heavy_wh" {
  provider            = snowflake.sys_admin
  name                = "dbt_prod_heavy_wh"
  warehouse_size      = "large"
  initially_suspended = true

  auto_suspend = 60
}


provider "snowflake" {
  alias  = "security_admin"
  role   = "SECURITYADMIN"
  region = "ap-southeast-2"
}


resource "snowflake_role" "dev_role" {
  provider = snowflake.security_admin
  name     = "DBT_DEV_ROLE"
}

resource "snowflake_role" "prod_role" {
  provider = snowflake.security_admin
  name     = "DBT_PROD_ROLE"
}


resource "snowflake_database_grant" "grant_dbt_hol_dev" {
  provider          = snowflake.security_admin
  database_name     = snowflake_database.dbt_hol_dev.name
  privilege         = "USAGE"
  roles             = [snowflake_role.dev_role.name]
  with_grant_option = false
}

resource "snowflake_database_grant" "grant_dbt_hol_prod" {
  provider          = snowflake.security_admin
  database_name     = snowflake_database.dbt_hol_prod.name
  privilege         = "USAGE"
  roles             = [snowflake_role.prod_role.name]
  with_grant_option = false
}


resource "snowflake_warehouse_grant" "grant_dbt_dev_wh" {
  provider          = snowflake.security_admin
  warehouse_name    = snowflake_warehouse.dbt_dev_wh.name
  privilege         = "USAGE"
  roles             = [snowflake_role.dev_role.name]
  with_grant_option = false
}

resource "snowflake_warehouse_grant" "grant_dbt_dev_heavy_wh" {
  provider          = snowflake.security_admin
  warehouse_name    = snowflake_warehouse.dbt_dev_heavy_wh.name
  privilege         = "USAGE"
  roles             = [snowflake_role.dev_role.name]
  with_grant_option = false
}

resource "snowflake_warehouse_grant" "grant_dbt_prod_wh" {
  provider          = snowflake.security_admin
  warehouse_name    = snowflake_warehouse.dbt_prod_wh.name
  privilege         = "USAGE"
  roles             = [snowflake_role.prod_role.name]
  with_grant_option = false
}

resource "snowflake_warehouse_grant" "grant_dbt_prod_heavy_wh" {
  provider          = snowflake.security_admin
  warehouse_name    = snowflake_warehouse.dbt_prod_heavy_wh.name
  privilege         = "USAGE"
  roles             = [snowflake_role.prod_role.name]
  with_grant_option = false
}


resource "tls_private_key" "svc_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


resource "snowflake_user" "user" {
  provider          = snowflake.security_admin
  name              = "dbt_user"
  default_warehouse = snowflake_warehouse.dbt_dev_wh.name
  default_role      = snowflake_role.dev_role.name
  rsa_public_key    = substr(tls_private_key.svc_key.public_key_pem, 27, 398)
}


resource "snowflake_role_grants" "grants_dev" {
  provider  = snowflake.security_admin
  role_name = snowflake_role.dev_role.name
  users     = [snowflake_user.user.name]
}

resource "snowflake_role_grants" "grants_prod" {
  provider  = snowflake.security_admin
  role_name = snowflake_role.prod_role.name
  users     = [snowflake_user.user.name]
}
