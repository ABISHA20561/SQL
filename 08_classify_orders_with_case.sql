SELECT order_id, total_amount,
       CASE
           WHEN total_amount >= 1000 THEN 'HIGH'
           WHEN total_amount >= 500 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS order_category
FROM orders;
