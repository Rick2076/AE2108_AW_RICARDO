WITH
    sources as (
    SELECT 
        productid	
        , productsubcategoryid	
        ,p.name as product_name	
        , style	
        , standardcost	
        , sizeunitmeasurecode	
        , listprice	
        , daystomanufacture	
        , productline	
        , p.size as product_size
        , color	
        , sellstartdate	
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('adventure_works','product') }} p
)

SELECT * FROM sources