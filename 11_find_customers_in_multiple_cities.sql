SELECT customer_name, COUNT(DISTINCT city) AS city_count
FROM customer_addresses
GROUP BY customer_name
HAVING COUNT(DISTINCT city) > 1;
