SELECT employee_id, employee_name,
       COALESCE(commission, 0) AS commission
FROM employees;
