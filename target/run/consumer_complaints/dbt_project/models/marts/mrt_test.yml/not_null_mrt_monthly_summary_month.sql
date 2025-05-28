select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select month
from "dev"."main"."mrt_monthly_summary"
where month is null



      
    ) dbt_internal_test