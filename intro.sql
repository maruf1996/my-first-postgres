-- Active: 1695295897220@@127.0.0.1@5432@postgres

-- ## CREATE DATABASE 
-- CREATE DATABASE db3;

-- ## RENAME DATABASE 
-- ALTER DATABASE db3 RENAME TO db1;

-- ## DELETE DATABASE 
-- DROP DATABASE db1;

-- ## CREATE A TABLE
--  CREATE TABLE student(
--     studentId INT,
--     firstName VARCHAR(50),
--     lastName VARCHAR(50),
--     cgpa NUMERIC(1,2)
--  )

-- ## RENAME a TABLE
-- ALTER TABLE student RENAME TO learners;

-- ## DELETE a TABLE
-- DROP TABLE learners


-- ## CREATE A TABLE With CONSTRAINTS

-- CREATE TABLE users(
--     userId SERIAL PRIMARY KEY,
--     userName VARCHAR(255) UNIQUE NOT NULL,
--     email VARCHAR(255) UNIQUE NOT NULL
-- )

-- CREATE TABLE "user"(
--     userId SERIAL,
--     userName VARCHAR(255) NOT NULL,
--     email VARCHAR(255) NOT NULL,
--      PRIMARY KEY (userId,userName), [composite key]
--      UNIQUE (userName,email)
-- )

CREATE TABLE "user2"(
    userId SERIAL PRIMARY KEY,
    userName VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    age INT DEFAULT 18
)

-- INSERT INTO user2 VALUES (1,'abc','abc@gmail.com')

INSERT INTO user2(userId,userName,email,age) VALUES(2,'Maruf','Maruf@gmail.com',27);

INSERT INTO user2(userName,email) VALUES 
('user1','user1@gmail.com'),
('user2','user2@gmail.com');

SELECT * FROM user2;

-- ## DELETE all Rows in a Table without deleting the table
TRUNCATE TABLE user2;

-- ## ALTER TABLE 
-- Add a COLUMN, DROP a COLUMN, CHANGE datatype of a COLUMN
-- RENAME a COLUMN, set a DEFAULT VALUES for a COLUMN
-- add CONSTRAINTS to a COLUMN, drop CONSTRAINT for a COLUMN
-- TABLE RENAME 
-- ALTER TABLE table_name ACTION

-- add a COLUMN
ALTER TABLE user2 
add COLUMN password VARCHAR(255) DEFAULT 'admin123' NOT NULL;

ALTER TABLE user2 
add COLUMN password VARCHAR(255) NOT NULL;

-- DELETE a COLUMN
ALTER TABLE user2
DROP COLUMN age;

ALTER TABLE user2 ADD COLUMN demo INT;

-- CHANGE data type of COLUMN
ALTER TABLE user2
ALTER COLUMN demo type TEXT;

-- set DEFAULT VALUES
ALTER TABLE user2 
alter COLUMN demo set DEFAULT 'bangladesh';

-- drop DEFAULT VALUES
ALTER TABLE user2 
alter COLUMN demo DROP DEFAULT;

-- RENAME DEFAULT VALUES
ALTER TABLE user2
RENAME COLUMN demo to country;

-- add a CONSTRAINT
ALTER TABLE user2 
alter COLUMN country set NOT NULL;

-- drop a CONSTRAINT
ALTER TABLE user2 
alter COLUMN country DROP NOT NULL;

-- ADD a CONSTRAINT
ALTER TABLE user2 
ADD constraint unique_email UNIQUE (email)


-- DELETE a CONSTRAINT
ALTER TABLE user2 
DROP constraint unique_email UNIQUE (email)

INSERT INTO user2 VALUES (5,'user5','user5@gmail.com');

SELECT * FROM user2;
-- SELECT userName FROM user2;


-- Department TABLE
-- Each department has many employes
CREATE TABLE Department(
    deptId SERIAL PRIMARY KEY,
    deptName VARCHAR(50)
);

INSERT INTO Department VALUES(1,'IT');

DELETE from Department WHERE deptId=1;
SELECT * FROM Department;

-- Employe TABLE
-- Each employe belongs to a department

-- Example Foreign Key 
CREATE TABLE Employe(
    empId SERIAL PRIMARY KEY,
    empName VARCHAR(50) NOT NULL,
    departmentId INT,
    CONSTRAINT fk_constraint_dept
        FOREIGN KEY (departmentId)
        REFERENCES Department(deptId)
);

INSERT INTO Employe VALUES (1,'Muktadir',1);
DELETE from Employe WHERE empId=1;
select * from Employe;


-- UPDATE and Delete Column 
CREATE TABLE course(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    published_date DATE
);

SELECT * FROM course;

INSERT INTO course(course_name,description,published_date) VALUES
('Postgres for Developer', 'A Complete PostgreSql for Developers','2020-07-13'),
('PostgreSql Administration', 'A PostgreSql Guide for DBA',NULL),
('PostgreSql High Performance', 'Learn PostgreSql Via Bootcamp','2013-07-11'),
('Mastering PostgreSql', 'Mastering PostgreSql in 21 Days','2012-06-30');

UPDATE course set course_name ='Postgres for Beginners'
WHERE course_id=1;

DELETE FROM course WHERE course_id=4;
