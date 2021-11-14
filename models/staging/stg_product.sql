WITH
    sources as (
    SELECT 
        productid	
        , productsubcategoryid	
        , "name"	
        , style	
        , standardcost	
        , sizeunitmeasurecode	
        , listprice	
        , daystomanufacture	
        , productline	
        , "size"	
        , color	
        , sellstartdate	
        , "weight"		
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('adventure_works','product') }}
)

SELECT * FROM sources