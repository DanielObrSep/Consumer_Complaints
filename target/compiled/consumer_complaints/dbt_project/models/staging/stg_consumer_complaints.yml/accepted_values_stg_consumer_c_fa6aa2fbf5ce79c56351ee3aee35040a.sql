
    
    

with all_values as (

    select
        resolution_type as value_field,
        count(*) as n_records

    from "dev"."main"."stg_consumer_complaints"
    group by resolution_type

)

select *
from all_values
where value_field not in (
    'compensation','explanation','in_progress','no_response','other'
)


