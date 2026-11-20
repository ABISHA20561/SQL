SELECT product_id, product_name, category_id, price
FROM (
    SELECT product_id, product_name, category_id, price,
           AVG(price) OVER (PARTITION BY category_id) AS category_average
    FROM products
) priced
WHERE price > category_average;
