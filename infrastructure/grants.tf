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
