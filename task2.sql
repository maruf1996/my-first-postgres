-- Active: 1695295897220@@127.0.0.1@5432@task2

-- sub queries

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (emp_id, emp_name, department, salary)
VALUES
    (1, 'John Doe', 'HR', 50000.00),
    (2, 'Jane Smith', 'IT', 60000.00),
    (3, 'Michael Johnson', 'Finance', 55000.00),
    (4, 'Emily Brown', 'HR', 52000.00);

SELECT * FROM employees WHERE salary = (SELECT max(salary) FROM employees);
SELECT * FROM employees WHERE salary IN (SELECT salary FROM employees WHERE emp_name LIKE '%a%');

SELECT * FROM employees WHERE salary > (SELECT AVG(salary) from employees);

SELECT emp_name,(SELECT AVG(salary) FROM employees) FROM employees;


-- view 
select * FROM view_name;
select * FROM department_emp_count;