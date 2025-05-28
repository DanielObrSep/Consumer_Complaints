
  
    
    

    create  table
      "dev"."main"."mrt_state_resolution__dbt_tmp"
  
    as (
      with source as (

    select
        state,
        resolution_type
    from "dev"."main"."stg_consumer_complaints"

),

sr as (

    select
        state,
        count(*) as total_complaints,
        sum(case when resolution_type = 'no_response' then 1 else 0 end) as no_response_count,
        round(100.0 * sum(case when resolution_type = 'no_response' then 1 else 0 end) / count(*), 2) as pct_no_response
    from source
    group by 1

)

select * from sr
    );
  
  