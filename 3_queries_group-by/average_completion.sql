SELECT students.name as student, AVG(assignment_submissions.duration) as average_assignment_duration
FROM assignments JOIN assignment_submissions ON assignments.id = assignment_id
    JOIN students ON student_id = students.id

WHERE students.end_date IS NULL
GROUP BY students.name
ORDER BY average_assignment_duration desc;