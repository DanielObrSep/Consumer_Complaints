select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        contact_channel as value_field,
        count(*) as n_records

    from "dev"."main"."stg_consumer_complaints"
    group by contact_channel

)

select *
from all_values
where value_field not in (
    'digital','phone','other'
)



      
    ) dbt_internal_test