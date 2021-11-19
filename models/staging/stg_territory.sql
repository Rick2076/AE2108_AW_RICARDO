WITH
    sources as (
    SELECT 
        territoryid	
        , t.group as country_group
        , case
            when countryregioncode = 'US' then 'USA'
            when countryregioncode != 'US' then t.name
        end as country
        , modifieddate		
        , costytd	
        , salesytd		
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('adventure_works','salesterritory') }} t
)

SELECT * FROM sources