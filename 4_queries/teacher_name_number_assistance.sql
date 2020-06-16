SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests.*) as total_assistance
FROM cohorts JOIN students ON cohorts.id = cohort_id
             JOIN assistance_requests ON students.id = student_id
             JOIN teachers ON teachers.id = teacher_id

WHERE cohorts.name = 'JUL02'
GROUP BY teacher, cohort
ORDER BY teacher;