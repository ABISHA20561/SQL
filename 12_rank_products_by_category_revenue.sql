WITH product_revenue AS (
    SELECT p.category_id, p.product_id, p.product_name,
           SUM(oi.quantity * oi.unit_price) AS revenue
    FROM products p
    JOIN order_items oi ON oi.product_id = p.product_id
    GROUP BY p.category_id, p.product_id, p.product_name
)
SELECT category_id, product_id, product_name, revenue,
       RANK() OVER (PARTITION BY category_id ORDER BY revenue DESC) AS revenue_rank
FROM product_revenue;
