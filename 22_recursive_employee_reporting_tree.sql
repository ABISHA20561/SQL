WITH RECURSIVE employee_tree AS (
    SELECT employee_id, employee_name, manager_id, 1 AS hierarchy_level
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.employee_name, e.manager_id, t.hierarchy_level + 1
    FROM employees e
    JOIN employee_tree t ON e.manager_id = t.employee_id
)
SELECT employee_id, employee_name, manager_id, hierarchy_level
FROM employee_tree
ORDER BY hierarchy_level, manager_id, employee_id;
