SELECT customer_id, order_id, order_date, total_amount
FROM (
    SELECT customer_id, order_id, order_date, total_amount,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date, order_id) AS rn
    FROM orders
) first_orders
WHERE rn = 1;
