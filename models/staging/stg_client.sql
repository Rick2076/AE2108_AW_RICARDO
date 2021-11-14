WITH
    sources as (
    SELECT 
        businessentityid		
        , firstname	
        , middlename		
        , lastname	
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('adventure_works','person') }}
)

SELECT * FROM sources