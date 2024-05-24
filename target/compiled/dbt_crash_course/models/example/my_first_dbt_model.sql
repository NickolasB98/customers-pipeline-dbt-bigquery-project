/*
   
    Configuring models directly within SQL files,
    will override configurations stated in dbt_project.yml
*/



with source_data as (

    select 1 as id
    union all
    select null as id

)

select *
from source_data
where id is not null