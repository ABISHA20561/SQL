WITH monthly AS (
    SELECT DATE_TRUNC('month', order_date) AS sales_month,
           SUM(total_amount) AS revenue
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
)
SELECT sales_month, revenue,
       LAG(revenue) OVER (ORDER BY sales_month) AS previous_month_revenue
FROM monthly
ORDER BY sales_month;
