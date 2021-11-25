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
