WITH duplicates AS (
    SELECT customer_id,
           ROW_NUMBER() OVER (
               PARTITION BY email
               ORDER BY customer_id
           ) AS rn
    FROM customers
    WHERE email IS NOT NULL
)
DELETE FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM duplicates
    WHERE rn > 1
);
