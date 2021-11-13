with 
    currency as (
        Select *
        from {{ ref('stg_currency') }}
),
    reason as (
        Select *
        from {{ ref('stg_reason') }}
),

Select * from final