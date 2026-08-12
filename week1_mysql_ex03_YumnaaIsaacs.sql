USE edutrack_sa;

DESCRIBE trainees;
DESCRIBE enrolments;
DESCRIBE courses;
DESCRIBE facilitators;

-- Task 1: Display trainees and the courses they are enrolled in

SELECT
    t.first_name,
    t.last_name,
    c.course_name,
    e.enrolment_date,
    e.status
FROM trainees t
INNER JOIN enrolments e
    ON t.trainee_id = e.trainee_id
INNER JOIN courses c
    ON e.course_id = c.course_id;
    
    -- Task 2: Display courses together with their facilitators

SELECT
    c.course_name,
    f.first_name AS facilitator_first_name,
    f.last_name AS facilitator_last_name
FROM courses c
INNER JOIN facilitators f
    ON c.facilitator_id = f.facilitator_id;
    
-- Task 3: Display all trainees, including trainees
-- who are not enrolled in any course

SELECT
    t.trainee_id,
    t.first_name,
    t.last_name,
    c.course_name
FROM trainees t
LEFT JOIN enrolments e
    ON t.trainee_id = e.trainee_id
LEFT JOIN courses c
    ON e.course_id = c.course_id;
    
-- Task 4: Display all courses, including courses
-- that have no trainees enrolled

SELECT
    c.course_id,
    c.course_name,
    t.first_name,
    t.last_name
FROM trainees t
RIGHT JOIN enrolments e
    ON t.trainee_id = e.trainee_id
RIGHT JOIN courses c
    ON e.course_id = c.course_id;
    
-- Task 5: Update the province of a specific trainee

UPDATE trainees
SET province = 'Western Cape'
WHERE trainee_id = 1;

-- Task 6: Update the status of a specific enrolment

UPDATE enrolments
SET status = 'Completed'
WHERE enrolment_id = 1;

-- Task 7: Delete the most recent enrolment record

DELETE FROM enrolments
ORDER BY enrolment_id DESC
LIMIT 1;

-- Task 8: Display courses with more than one enrolled trainee

SELECT
    c.course_name,
    COUNT(e.trainee_id) AS number_of_trainees
FROM courses c
INNER JOIN enrolments e
    ON c.course_id = e.course_id
WHERE e.status = 'Active'
GROUP BY c.course_id, c.course_name
HAVING COUNT(e.trainee_id) > 1
ORDER BY number_of_trainees DESC;