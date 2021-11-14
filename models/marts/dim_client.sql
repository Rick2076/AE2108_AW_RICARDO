WITH
    selected as (
    SELECT 
        businessentityid		
        , firstname	
        , middlename		
        , lastname	
    FROM {{ ref('stg_client') }}
)
, transformed as (
    SELECT
        row_number() over (order by businessentityid) as client_sk
        ,*
    from selected
    order by client_sk
)

SELECT* From transformed