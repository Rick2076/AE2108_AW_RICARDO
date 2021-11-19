WITH
    country as (
        SELECT 
        territoryid	
        , country_group
        , country
        , modifieddate		
        , costytd	
        , salesytd	
        FROM {{ ref('stg_territory') }}
),
    city as(
        SELECT 
        addressid
        , city
        , stateprovinceid	
        FROM {{ ref('stg_city') }}
),
    state_ as(
        SELECT 
        stateprovinceid	
        , territoryid	
        , state_
        FROM {{ ref('stg_state') }}
),
    selected as (
        SELECT 
            city
            ,s.state_
            ,co.country
            ,c.stateprovinceid
            ,s.territoryid
        FROM city c
        left join state_ s on c.stateprovinceid = s.stateprovinceid
        left join country co on s.territoryid = co.territoryid
)
, transformed as (
    SELECT
        row_number() over (order by territoryid) as territory_sk
        ,*
    from selected
    order by territory_sk
)

SELECT* From transformed