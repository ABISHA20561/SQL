SELECT employee_id, employee_name, salary,
       PERCENT_RANK() OVER (ORDER BY salary) AS salary_percentile
FROM employees;
