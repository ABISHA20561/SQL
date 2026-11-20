WITH product_sales AS (
    SELECT p.category_id, p.product_id, p.product_name,
           SUM(oi.quantity) AS units_sold
    FROM products p
    JOIN order_items oi ON oi.product_id = p.product_id
    GROUP BY p.category_id, p.product_id, p.product_name
),
ranked AS (
    SELECT product_sales.*,
           DENSE_RANK() OVER (PARTITION BY category_id ORDER BY units_sold DESC) AS sales_rank
    FROM product_sales
)
SELECT category_id, product_id, product_name, units_sold
FROM ranked
WHERE sales_rank <= 3;
