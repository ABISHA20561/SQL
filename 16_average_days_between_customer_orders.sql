WITH ordered AS (
    SELECT customer_id, order_date,
           LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_order_date
    FROM orders
)
SELECT customer_id,
       AVG(order_date - previous_order_date) AS average_days_between_orders
FROM ordered
WHERE previous_order_date IS NOT NULL
GROUP BY customer_id;
