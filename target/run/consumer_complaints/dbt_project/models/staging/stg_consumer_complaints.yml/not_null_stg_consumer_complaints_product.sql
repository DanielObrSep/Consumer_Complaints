select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select product
from "dev"."main"."stg_consumer_complaints"
where product is null



      
    ) dbt_internal_test