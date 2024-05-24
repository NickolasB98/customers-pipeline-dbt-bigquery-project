
  
    

    create or replace table `deep-presence-424218-r4`.`dbt_crash_course`.`customers`
      
    
    

    OPTIONS()
    as (
      WITH customers AS (
    SELECT id,
           first_name,
           last_name
    FROM dbt-tutorial.jaffle_shop.customers
),

orders AS (
    SELECT id,
           user_id,
           order_date,
           status
    FROM dbt-tutorial.jaffle_shop.orders
),

customer_orders AS (
    SELECT user_id,
           min(order_date) AS first_order,
           max(order_date) AS most_recent_order,
           count(id) AS number_of_orders
    FROM orders
    GROUP BY user_id
),

final AS (
    SELECT customers.id,
           customers.first_name,
           customers.last_name,
           customer_orders.first_order,
           customer_orders.most_recent_order,
           customer_orders.number_of_orders
    FROM customers
    LEFT JOIN customer_orders
    ON customers.id = customer_orders.user_id
)

SELECT *
FROM final
    );
  