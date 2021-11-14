WITH
    sources as (
    SELECT 
        currencyrateid
        , averagerate
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('adventure_works','currencyrate') }}
)

SELECT * FROM sources