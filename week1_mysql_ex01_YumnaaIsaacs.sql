-- Task 1: Create the database if it doesn't already exist

CREATE DATABASE IF NOT EXISTS edutrack_sa;

USE edutrack_sa;

-- Task 2: Create the facilitators table

CREATE TABLE facilitators (
    facilitator_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20)
);

-- Task 3: Create the courses table

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    duration_weeks INT NOT NULL,
    facilitator_id INT NOT NULL,
    FOREIGN KEY (facilitator_id)
    REFERENCES facilitators(facilitator_id)
);

-- Task 4: Create the trainees table

CREATE TABLE trainees (
    trainee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    province VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Task 5: Create the enrolments table

CREATE TABLE enrolments (
    enrolment_id INT AUTO_INCREMENT PRIMARY KEY,
    trainee_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolment_date DATE,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (trainee_id)
        REFERENCES trainees(trainee_id),
    FOREIGN KEY (course_id)
        REFERENCES courses(course_id),
    CHECK (status IN ('Active', 'Completed', 'Withdrawn'))
);

-- Task 6: Insert facilitator data

INSERT INTO facilitators (first_name, last_name, email, phone)
VALUES
('Sipho', 'Dlamini', 'sipho.dlamini@edutrack.co.za', '0821234567'),
('Nomsa', 'Jacobs', 'nomsa.jacobs@edutrack.co.za', '0832345678'),
('Thabo', 'Mokoena', 'thabo.mokoena@edutrack.co.za', '0843456789'),
('Ayesha', 'Khan', 'ayesha.khan@edutrack.co.za', '0814567890');

-- Task 7: Insert course data

INSERT INTO courses (course_name, duration_weeks, facilitator_id)
VALUES
('Frontend Web Development', 12, 1),
('Backend Web Development', 10, 2),
('Database Design', 8, 3),
('Python Programming', 14, 4);

-- Task 8: Insert trainee data

INSERT INTO trainees (first_name, last_name, email, province)
VALUES
('Lindiwe', 'Nkosi', 'lindiwe.nkosi@gmail.com', 'Gauteng'),
('Aiden', 'Peters', 'aiden.peters@gmail.com', 'Western Cape'),
('Naledi', 'Molefe', 'naledi.molefe@gmail.com', 'Limpopo'),
('Zanele', 'Khumalo', 'zanele.khumalo@gmail.com', 'KwaZulu-Natal');

-- Task 9: Insert enrolment data

INSERT INTO enrolments (trainee_id, course_id, enrolment_date, status)
VALUES
(1, 1, '2026-07-01', 'Active'),
(2, 2, '2026-07-03', 'Completed'),
(3, 3, '2026-07-05', 'Withdrawn'),
(4, 4, '2026-07-08', 'Active');

-- Task 10: View facilitators
SELECT * FROM facilitators;

-- View courses
SELECT * FROM courses;

-- View trainees
SELECT * FROM trainees;

-- View enrolments
SELECT * FROM enrolments;

