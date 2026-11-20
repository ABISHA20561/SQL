SELECT phone_number, COUNT(*) AS occurrence_count
FROM customers
WHERE phone_number IS NOT NULL
GROUP BY phone_number
HAVING COUNT(*) > 1;
