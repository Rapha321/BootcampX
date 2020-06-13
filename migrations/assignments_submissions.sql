CREATE TABLE assignments ( id SERIAL PRIMARY KEY NOT NULL,
                           name VARCHAR(255),
                           content TEXT,
                           day INTEGER,
                           chapter INTEGER,
                           duration INTEGER
                          );


CREATE TABLE assignment_submissions ( id SERIAL PRIMARY KEY NOT NULL,
                                      assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
                                      student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
                                      duration INTEGER,
                                      submission_date DATE
                                    );


-- SELECT students.name as student_name, students.start_date as student_start_date, cohorts.name as cohort_name, cohorts.start_date as cohort_start_date
-- FROM students JOIN cohorts ON cohort_id = cohorts.id
-- WHERE cohorts.start_date != students.start_date
-- ORDER BY cohort_start_date;


-- An assignment will have the following attributes:
--   id: A unique identifier
--   name: The name of the assignment
--   content: The written content body of the assignment
--   day: The day that the assignment appears on
--   chapter: The order that the assignment will appear in the day.
--   duration: The average time it takes a student to finish

-- An assignment_submission will have the following attributes:
--   id: A unique identifier
--   assignment_id: The id of the assignment
--   student_id: The id of the student
--   duration: The time it took the student to complete the assignment
--   submission_date: The date is was submitted