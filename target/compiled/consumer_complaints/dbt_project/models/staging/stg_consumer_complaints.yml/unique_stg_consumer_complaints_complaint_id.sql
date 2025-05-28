
    
    

select
    complaint_id as unique_field,
    count(*) as n_records

from "dev"."main"."stg_consumer_complaints"
where complaint_id is not null
group by complaint_id
having count(*) > 1


