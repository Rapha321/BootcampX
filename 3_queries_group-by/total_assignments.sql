SELECT cohorts.name as cohort, count(assignment_submissions.*) as total_submissions
FROM students JOIN assignment_submissions ON students.id = student_id
    JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY total_submissions desc;
