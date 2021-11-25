resource "snowflake_role" "dev_role" {
  provider = snowflake.security_admin
  name     = "DBT_DEV_ROLE"
}

resource "snowflake_role" "prod_role" {
  provider = snowflake.security_admin
  name     = "DBT_PROD_ROLE"
}
