-- Evolución mensual de quejas + resolución favorable

with source as (

    select
        date_trunc('month', date_received) as month,
        product_group,
        resolution_type
    from {{ ref('stg_consumer_complaints') }}

),

ms as (

    select
        month,
        product_group,
        count(*) as total_complaints,
        sum(case when resolution_type in ('compensation', 'explanation') then 1 else 0 end) as resolved_favorably,
        round(100.0 * sum(case when resolution_type in ('compensation', 'explanation') then 1 else 0 end) / count(*), 2) as pct_resolved_favorably
    from source
    group by 1, 2

)

select * from ms
