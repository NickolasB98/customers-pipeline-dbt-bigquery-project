select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select id
from `deep-presence-424218-r4`.`dbt_crash_course`.`customers`
where id is null



      
    ) dbt_internal_test