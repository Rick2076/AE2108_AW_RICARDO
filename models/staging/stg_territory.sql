WITH
    sources as (
    SELECT 
        territoryid	
        , [group] as country_group
        , [name] as country
        , modifieddate		
        , costytd	
        , salesytd		
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('adventure_works','salesterritory') }}
)

SELECT * FROM sources