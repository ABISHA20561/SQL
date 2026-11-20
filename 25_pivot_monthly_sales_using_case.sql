SELECT EXTRACT(YEAR FROM order_date) AS sales_year,
       SUM(CASE WHEN EXTRACT(MONTH FROM order_date) = 1 THEN total_amount ELSE 0 END) AS january,
       SUM(CASE WHEN EXTRACT(MONTH FROM order_date) = 2 THEN total_amount ELSE 0 END) AS february,
       SUM(CASE WHEN EXTRACT(MONTH FROM order_date) = 3 THEN total_amount ELSE 0 END) AS march
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY sales_year;
