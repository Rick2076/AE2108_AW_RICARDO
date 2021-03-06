WITH
    category as (
    SELECT 
        productcategoryid	
        , c.name as category		
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('adventure_works','productcategory') }} c
), subcategory as (
    SELECT 
        s.productsubcategoryid
        , s.productcategoryid	
        , s.name as subcategory
        , category
    FROM {{ source('adventure_works','productsubcategory') }} s
        left join category c on s.productcategoryid=c.productcategoryid
)

SELECT * FROM subcategory