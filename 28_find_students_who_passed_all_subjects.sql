SELECT student_id
FROM exam_results
GROUP BY student_id
HAVING MIN(CASE WHEN marks >= 40 THEN 1 ELSE 0 END) = 1;
