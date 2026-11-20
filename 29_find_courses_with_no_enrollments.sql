SELECT c.course_id, c.course_name
FROM courses c
WHERE NOT EXISTS (
    SELECT 1
    FROM course_enrollments ce
    WHERE ce.course_id = c.course_id
);
