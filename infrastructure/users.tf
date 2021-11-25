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

resource "snowflake_user" "user_david_gmail" {
  provider          = snowflake.security_admin
  name              = "david_gmail"
  default_warehouse = snowflake_warehouse.dbt_dev_wh.name
  default_role      = snowflake_role.dev_role.name
  # password     = "secret"
  email = "davidgriffithsgg777@gmail.com"

  must_change_password = true
}
