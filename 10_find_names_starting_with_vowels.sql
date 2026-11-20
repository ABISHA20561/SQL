SELECT employee_id, employee_name
FROM employees
WHERE LOWER(SUBSTRING(employee_name FROM 1 FOR 1)) IN ('a', 'e', 'i', 'o', 'u');
