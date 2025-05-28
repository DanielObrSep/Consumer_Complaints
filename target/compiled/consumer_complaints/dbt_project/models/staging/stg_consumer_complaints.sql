with source as (

    select * from "dev"."main"."consumer_complaints"
    qualify row_number() over (partition by complaint_id order by date_received desc) = 1
),

cleaned as (

    select
        cast(complaint_id as bigint) as complaint_id,
        cast(date_submitted as date) as date_submitted,
        cast(date_received as date) as date_received,
        upper(trim(state)) as state,
        lower(trim(product)) as product,
        lower(trim(sub_product)) as sub_product,
        lower(trim(issue)) as issue,
        lower(trim(sub_issue)) as sub_issue,
        lower(trim(submitted_via)) as submitted_via,
        lower(trim(company_response_to_consumer)) as company_response_to_consumer,
        coalesce(lower(trim(company_public_response)), 'no_public_response') as company_public_response,

        -- Derived columns
        case 
            when lower(trim(submitted_via)) in ('web', 'email') then 'digital'
            when lower(trim(submitted_via)) in ('phone', 'fax') then 'phone'
            else 'other'
        end as contact_channel,

        -- Resolution type
        case 
            when company_response_to_consumer ilike '%monetary%' then 'compensation'
            when company_response_to_consumer ilike '%non-monetary%' then 'compensation'
            when company_response_to_consumer ilike '%explanation%' then 'explanation'
            when company_response_to_consumer ilike '%in progress%' then 'in_progress'
            when company_response_to_consumer is null then 'no_response'
            else 'other'
        end as resolution_type,

        -- Product group
        case
            when product like '%card%' then 'card'
            when product like '%loan%' then 'loan'
            when product like '%mortgage%' then 'mortgage'
            when product like '%credit%' then 'credit'
            else 'other'
        end as product_group,

        -- Time metric
        (date_received - date_submitted) as response_days


    from source
    where complaint_id is not null
)

select * from cleaned