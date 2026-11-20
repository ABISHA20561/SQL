SELECT customer_id,
       SUBSTRING(email FROM POSITION('@' IN email) + 1) AS email_domain
FROM customers
WHERE email LIKE '%@%';
