-- Active: 1695295897220@@127.0.0.1@5432@postgres

CREATE TABLE IF NOT EXISTS departments(
    deptId SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO departments(name) VALUES 
('IT'),
('CSE'),
('BBA'),
('IBA');
select * from departments;

CREATE TABLE if NOT EXISTS employees(
    empId SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    salary INTEGER NOT NULL,
    joining_date DATE NOT NULL,
    deptId INTEGER NOT NULL,
    constraint fk_deptID
    FOREIGN KEY (deptId)
    REFERENCES departments(deptId)
);

INSERT INTO employees(name,email,salary,joining_date,deptId) VALUES 
('Maruf','maruf@email.com',23000,'2020-07-13',1),
('Saruf','saruf@email.com',25000,'2020-07-13',1),
('Jaruf','jaruf@email.com',23000,'2020-07-13',1),
('Haruf','haruf@email.com',23000,'2020-07-13',1),
('Karuf','karuf@email.com',23000,'2020-07-13',1)
;

-- select all fields/rows
select * from employees;


-- select some COLUMN
select name,email,joining_date from employees;

-- duplicate column not showing
select DISTINCT name from departments;


-- conditional column
SELECT * FROM employees
WHERE salary >10000 AND salary<90000;

SELECT * FROM employees
WHERE salary >10000 OR salary<90000;

SELECT * FROM employees
WHERE joining_date > '2020-01-01';


-- not equal example
SELECT * FROM employees
WHERE name <> 'Maruf';


-- pagination and filtaring
SELECT * FROM employees
ORDER BY name ASC;

SELECT * FROM employees
ORDER BY name ASC LIMIT 10 OFFSET 2;

SELECT * FROM employees
ORDER BY name DESC;

-- Highest salary from employees table 
SELECT * FROM employees 
ORDER BY salary DESC LIMIT 1;

-- Third Highest salary from employees table 
SELECT * FROM employees 
ORDER BY salary DESC LIMIT 1 OFFSET 2;

-- IN, NOT IN, BETWEEN, LIKE
SELECT * FROM employees WHERE empId IN (2,3,5);
SELECT * FROM employees WHERE empId NOT IN (2,3,5);

SELECT * FROM employees WHERE salary BETWEEN 10000 AND 15000;
SELECT * FROM employees WHERE name LIKE 'a%';
SELECT * FROM employees WHERE name LIKE '%a';
SELECT * FROM employees WHERE name LIKE '%a%';

-- Specifik position
SELECT * FROM employees WHERE name LIKE '_r%';
SELECT * FROM employees WHERE name LIKE '__r%';
SELECT * FROM employees WHERE name LIKE '__r__';
SELECT * FROM employees WHERE name LIKE 'a%g';

SELECT * FROM employees WHERE deptId IS NULL;


-- joining table to table 

-- inner join
SELECT employees.full_name,employees.job_role,department.department_name
FROM employees
INNER JOIN department ON department.department_id = employees.department_id;

SELECT *
FROM employees
INNER JOIN department ON department.department_id = employees.department_id;

-- left JOIN
SELECT *
FROM employees
LEFT JOIN department ON department.department_id = employees.department_id;

-- Right JOIN
SELECT *
FROM employees
RIGHT JOIN department ON department.department_id = employees.department_id;

-- Full JOIN
SELECT *
FROM employees
FULL JOIN department ON department.department_id = employees.department_id;

-- Natural JOIN
SELECT *
FROM employees
NATURAL JOIN department;

-- Cross JOIN
SELECT *
FROM employees
CROSS JOIN department;

DROP TABLE employees;

-- Aggregate function
SELECT AVG(salary) FROM employees;
SELECT AVG(salary) avarageSalary FROM employees;
SELECT MIN(salary) minSalary FROM employees;
SELECT MAX(salary) maxSalary FROM employees;
SELECT SUM(salary) totalSalary FROM employees;
SELECT deptId,AVG(salary) FROM employees GROUP BY deptId;

SELECT d.name,AVG(e.salary) FROM employees e FULL JOIN department d ON e.deptId=d.deptId GROUP BY d.name;

SELECT d.name,sum(salary),avg(salary),min(salary),count(*) FROM department d  FULL JOIN employees e ON e.deptId=d.deptId GROUP BY d.deptId;




