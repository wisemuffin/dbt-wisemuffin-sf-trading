SELECT "Company"                    Company
     , "Company Name"               Company_Name
     , "Company Symbol"             Company_Symbol
     , "Stock Exchange"             Stock_Exchange
     , "Stock Exchange Name"        Stock_Exchange_Name
     , "Indicator"                  Indicator
     , "Indicator Name"             Indicator_Name
     , "Units"                      Units
     , "Scale"                      Scale
     , "Frequency"                  Frequency
     , "Date"                       Date
     , "Value"                      Value
     , 'Knoema.Stock History' data_source_name
  FROM {{source('economy_data_atlas','usindssp2020')}}  src 