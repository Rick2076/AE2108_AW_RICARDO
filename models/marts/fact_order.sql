with 
    currency as (
    Select 
    currencyrateid
    , averagerate
    from {{ ref('stg_currency') }}
),
    reason as (
    Select 
    salesreasonid
    , salesorderid
    , sales_reason
    from {{ ref('stg_reason') }}
),
    credit as (
    Select 
    creditcardid		
    , cardtype        
    from {{ ref('stg_creditcard') }}
), 
    product as (
    Select *
    from {{ ref('dim_products') }}
), 
    region as (
    Select *
    from {{ ref('dim_region') }}
), 
    client as (
    Select *
    from {{ ref('dim_client') }}
), 
    order_ as (
    Select
    o.salesorderid	
    , o.taxamt	
    , o.status
    , r.sales_reason
    , ce.firstname	
    , ce.middlename		
    , ce.lastname
    , cardtype
    , o.orderdate
    , o.subtotal	
    , o.shipdate
    , o.freight	
    , o.totaldue
    , re.city
    , re.state_
    , re.country
    , cr.averagerate
    , o.customerid	
    , o.territoryid
    , o.creditcardid		
    , o.salespersonid	
    , o.currencyrateid	
    from {{ ref('stg_order') }} o
    left join currency cr on o.currencyrateid = cr.currencyrateid
    left join reason r on o.salesorderid = r.salesorderid
    left join credit c on o.creditcardid = c.creditcardid
    left join region re on o.territoryid = re.territoryid
    left join client ce on o.salespersonid = ce.businessentityid
),
    final as (
    Select   
    od.salesorderdetailid	
    , o.orderdate
    , o.shipdate
    , firstname	
    , middlename
    , lastname
    , product_name	
    , sales_reason
    , cardtype
    , city
    , state_
    , country
    , (((od.unitprice)/(averagerate))*(od.orderqty))*(1-od.unitpricediscount) as total_value
    , od.orderqty	
    , od.unitpricediscount	
    , od.unitprice	
    , o.subtotal	
    , o.freight	
    , o.totaldue
    , o.averagerate
    , o.taxamt	
    , o.status
    , od.salesorderid	
    , o.customerid	
    , o.territoryid	
    , o.creditcardid		
    , o.salespersonid	
    , o.currencyrateid	     
    , od.productid	
    , od.specialofferid	
    from {{ ref('stg_order_detail') }} od
    left join order_ o on od.salesorderid = o.salesorderid
    left join product p on od.productid = p.productid
)

Select * from final