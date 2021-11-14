with 
    category as (
        Select *
        from {{ ref('stg_product_category') }}
),
    product as (
        SELECT 
        p.productid	
        , product_name 
        , category
        , subcategory
        , style	
        , standardcost	
        , listprice	
        , p.productcategoryid
    FROM {{ ref('stg_product') }} p
    left join category c on o.productcategoryid = c.productcategoryid
    )

Select * from product