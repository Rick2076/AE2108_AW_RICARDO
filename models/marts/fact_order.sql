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
        , [name] as reason
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
    order as (
        Select
        o.salesorderid	
        , o.taxamt	
        , o.[status]
        , r.reason
        , ce.firstname	
        , ce.middlename		
        , ce.lastname
        , cardtype
        , o.orderdate
        , o.subtotal	
        , o.shipdate
        , o.freight	
        , o.totaldue
        , re.country
        , re.country_group	
        , averagerate
        , o.customerid	
        , o.territoryid	
        , o.creditcardid		
        , o.salespersonid	
        , o.currencyrateid	
        from{{ ref('stg_order') }} o
        left join currency cr on o.currencyrateid = cr.currencyrateid
        left join reason r on o.salesorderid = r.salesorderid
        left join credit c on o.creditcardid = c.creditcardid
        left join region re on o.territoryid = re.territoryid
        left join client ce on o.salespersonid = ce.businessentityid
),
    final as (
        Select   
        od.salesorderdetailid	
        , o.taxamt	
        , o.status
        , reason
        , firstname	
        , middlename		
        , lastname
        , cardtype
        , country
        , country_group	
        , o.orderdate
        , (((od.unitprice)/(averagerate))*(od.orderqty))*(1-od.unitpricediscount) as totalvalue
        , o.subtotal	
        , o.shipdate
        , o.freight	
        , o.totaldue
        , od.orderqty	
        , od.unitpricediscount	
        , od.unitprice	
        , averagerate
        , o.customerid	
        , o.territoryid	
        , o.creditcardid		
        , o.salespersonid	
        , o.currencyrateid	     
        , od.salesorderid	
        , od.productid	
        , od.specialofferid	
        from{{ ref('stg_order_detail') }} od
        left join order o on od.salesorderid = o.salesorderid
)

Select * from final