# sfguide-terraform-sample

[guide](https://quickstarts.snowflake.com/guide/terraforming_snowflake/#1)

## state files
If multiple users run Terraform, and/or if it runs on different computers, and/or if runs through CI/CD, the state files' state needs to be put in [Remote Storage](https://www.terraform.io/docs/language/state/remote.html). While using local state, you'll see the current state stored in *.tfstate and old versions named *.tfstate.*.

## running

**create the user in step 3 of the [guide](https://quickstarts.snowflake.com/guide/terraforming_snowflake/#1)

```bash
terraform apply

terraform destroy
```

## Importing Existing Resources into the .tfstate File

```bash
terraform import snowflake_role.public "PUBLIC"
```