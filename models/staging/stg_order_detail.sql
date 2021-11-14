WITH
    sources as (
    SELECT 
        salesorderdetailid	
        , salesorderid	
        , productid	
        , specialofferid	
        , modifieddate	
        , orderqty	
        , unitpricediscount	
        , unitprice	
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('adventure_works','salesorderdetail') }}
)

SELECT * FROM sources