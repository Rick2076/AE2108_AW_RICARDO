WITH
    sources as (
    SELECT 
        salesorderid	
        , territoryid	
        , creditcardid	
        , shipmethodid	
        , billtoaddressid	
        , salespersonid	
        , shiptoaddressid	
        , currencyrateid	
        , customerid	
        , purchaseordernumber	
        , modifieddate	
        , rowguid	
        , taxamt	
        , onlineorderflag	
        , 'status'
        , orderdate
        , creditcardapprovalcode	
        , subtotal	
        , revisionnumber	
        , duedate	
        , shipdate
        , freight	
        , totaldue	
        , accountnumber
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('adventure_works','salesorderheader') }}
)

SELECT * FROM sources