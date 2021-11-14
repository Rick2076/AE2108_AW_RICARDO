WITH
    temp as (
    SELECT 
        salesreasonid
        , reasontype
        , 'name'	
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('adventure_works','salesreason') }}
),
    final as (
    SELECT 
        sor.salesreasonid
        , sor.salesorderid
        , t.'name'
        ---Sticht
        ,sor._sdc_table_version	
        ,sor._sdc_received_at
        ,sor._sdc_sequence
        ,sor._sdc_batched_at
    FROM {{ source('adventure_works','salesorderheadersalesreason') }} as sor
    left join temp t on sor.salesreasonid = t.salesreasonid
    )

SELECT * FROM final