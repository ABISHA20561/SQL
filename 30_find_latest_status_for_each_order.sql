SELECT order_id, status, status_changed_at
FROM (
    SELECT order_id, status, status_changed_at,
           ROW_NUMBER() OVER (
               PARTITION BY order_id
               ORDER BY status_changed_at DESC
           ) AS rn
    FROM order_status_history
) latest_status
WHERE rn = 1;
