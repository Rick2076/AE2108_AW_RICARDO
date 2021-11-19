WITH
    temp as (
    SELECT 
        salesreasonid
        , reasontype
        , sr.name as sales_reason	
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('adventure_works','salesreason') }} sr
),
    final as (
    SELECT 
        sor.salesreasonid
        , sor.salesorderid
        , t.sales_reason
        ---Sticht
        ,sor._sdc_table_version	
        ,sor._sdc_received_at
        ,sor._sdc_sequence
        ,sor._sdc_batched_at
    FROM {{ source('adventure_works','salesorderheadersalesreason') }} as sor
    left join temp t on sor.salesreasonid = t.salesreasonid
    )

SELECT * FROM final