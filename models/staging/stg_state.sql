WITH
    sources as (
    SELECT 
        stateprovinceid	
        , territoryid	
        , st.name as state_
        , countryregioncode	
        , rowguid	
        , modifieddate	
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('adventure_works','stateprovince') }} st
)

SELECT * FROM sources