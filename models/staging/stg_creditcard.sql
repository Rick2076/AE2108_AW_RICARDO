WITH
    sources as (
    SELECT 
        creditcardid		
        , cardtype	
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('adventure_works','creditcard') }}
)

SELECT * FROM sources