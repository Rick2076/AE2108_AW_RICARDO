WITH
    selected as (
    SELECT 
        territoryid	
        , group as country_group
        , name as country
        , modifieddate		
        , costytd	
        , salesytd	
    FROM {{ ref('stg_territory') }}
)
, transformed as (
    SELECT
        row_number() over (order by territoryid) as territory_sk
        ,*
    from selected
    order by territory_sk
)

SELECT* From transformed