USE edutrack_yumnaa;

USE edutrack_yumnaa;

-- Task 1: Display all trainees sorted by last name in ascending order
SELECT *
FROM trainees
ORDER BY last_name ASC;

-- Task 2: Display all courses sorted by duration in descending order
SELECT *
FROM courses
ORDER BY duration_weeks DESC;

-- Task 3: Display the 3 most recently enrolled records
SELECT *
FROM enrolments
ORDER BY enrolment_date DESC
LIMIT 3;

-- Task 4: Display trainees from the Western Cape
SELECT *
FROM trainees
WHERE province = 'Western Cape';

-- Task 5: Display trainees whose first names start with the letter A
SELECT *
FROM trainees
WHERE first_name LIKE 'A%';

-- Task 6: Display courses longer than 10 weeks
SELECT *
FROM courses
WHERE duration_weeks > 10;

-- Task 7: Display active enrolments
SELECT *
FROM enrolments
WHERE status = 'Active';

-- Task 8: Count the total number of trainees
SELECT COUNT(*) AS total_trainees
FROM trainees;

-- Task 9: Display the average course duration
SELECT AVG(duration_weeks) AS average_duration
FROM courses;

-- Task 10: Display the maximum course duration
SELECT MAX(duration_weeks) AS maximum_duration
FROM courses;

-- Task 11: Display the number of enrolments per course
SELECT
    course_id,
    COUNT(*) AS total_enrolments
FROM enrolments
GROUP BY course_id;

-- Task 12: Display the number of trainees in each province
SELECT
    province,
    COUNT(*) AS total_trainees
FROM trainees
GROUP BY province;

-- Task 13: Display provinces with more than one trainee
SELECT
    province,
    COUNT(*) AS total_trainees
FROM trainees
GROUP BY province
HAVING COUNT(*) > 1;

-- Stretch Goal 1: Display the 2nd and 3rd most recent enrolments
SELECT *
FROM enrolments
ORDER BY enrolment_date DESC
LIMIT 2 OFFSET 1;

-- Stretch Goal 2: Display trainees whose email ends with '.co.za'
SELECT *
FROM trainees
WHERE email LIKE '%.co.za';

-- Stretch Goal 3: Display each facilitator's full name and the number of courses they facilitate,
-- but only include facilitators who facilitate more than one course
SELECT
    CONCAT(f.first_name, ' ', f.last_name) AS facilitator_name,
    COUNT(c.course_id) AS total_courses
FROM facilitators f
JOIN courses c
ON f.facilitator_id = c.facilitator_id
GROUP BY f.facilitator_id, f.first_name, f.last_name
HAVING COUNT(c.course_id) > 1;