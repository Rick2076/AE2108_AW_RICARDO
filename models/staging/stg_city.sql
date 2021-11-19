WITH
    sources as (
    SELECT 
        addressid
        , stateprovinceid	
        , city	
        , addressline2	
        , postalcode	
        , spatiallocation	
        , addressline1	
        , modifieddate	
        , rowguid	
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('adventure_works','address') }}
)

SELECT * FROM sources