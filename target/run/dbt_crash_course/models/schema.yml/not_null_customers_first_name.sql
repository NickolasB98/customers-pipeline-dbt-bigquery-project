select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select first_name
from `deep-presence-424218-r4`.`dbt_crash_course`.`customers`
where first_name is null



      
    ) dbt_internal_test