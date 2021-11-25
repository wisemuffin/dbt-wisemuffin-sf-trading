resource "snowflake_database" "dbt_hol_dev" {
  provider = snowflake.sys_admin
  name     = "DBT_HOL_DEV"
}
resource "snowflake_database" "dbt_hol_prod" {
  provider = snowflake.sys_admin
  name     = "DBT_HOL_PROD"
}
