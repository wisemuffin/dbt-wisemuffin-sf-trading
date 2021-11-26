# dbt_trading

This is built from snowflakes quick start [Accelerating Data Engineering with Snowflake & dbt CLI](https://quickstarts.snowflake.com/guide/data_engineering_with_dbt_cli/index.html?index=..%2F..index#1)

*dbt features demoed:*
- custom schema naming
- query tagging
- basic incremental model (append only) - models/l30_mart/fct_trading_pnl.sql as the source data is live this is easy to show.
- dbt_utils.union_relations - see models/l20_transform/tfm_book.sql which unions two manually uploaded (seeds) trading books.

*snowflake features demoed*
- uses live data market data shared on snowflake

*sources*
-  Knoema Dataset Catalog table: daily exchange rates  
-  Knoema Dataset Catalog table: daily US trading history

## features - snowflake

### query tagging

if you go in Snowflake UI and click ‘History' icon on top, you are going to see all SQL queries run on Snowflake account(successful, failed, running etc) and clearly see what dbt model this particular query is related to:

![image](./images/query_tagging.png)

[source](https://quickstarts.snowflake.com/guide/data_engineering_with_dbt_cli/index.html?index=..%2F..index#6)



## features - dbt

### custom schema naming

By default, dbt is [generating a schema name](https://docs.getdbt.com/docs/building-a-dbt-project/building-models/using-custom-schemas) by appending it to the target schema environment name(dev, prod). In dbt_trading I show you a quick way to override this macro, making our schema names to look exactly the same between dev and prod databases. 