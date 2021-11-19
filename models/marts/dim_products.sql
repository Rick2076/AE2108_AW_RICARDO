with 
    category as (
        Select *
        from {{ ref('stg_product_category') }}
),
    product as (
        SELECT 
        productid	
        , product_name 
        , category
        , subcategory
        , style	
        , standardcost	
        , listprice	
        , p.productsubcategoryid
    FROM {{ ref('stg_product') }} p
    left join category c on p.productsubcategoryid = c.productsubcategoryid
),
 transformed as (
    SELECT
        row_number() over (order by productid) as product_sk
        ,*
    from product
    order by product_sk
)

SELECT* From transformed