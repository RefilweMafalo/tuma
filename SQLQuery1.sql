CREATE DATABASE mydb1;
USE mydb1;

CREATE TABLE employees (
    id INT,
    name TEXT,
    department TEXT,
    salary DECIMAL
);


INSERT INTO employees (id, name, department, salary)
VALUES (1, 'John Doe', 'IT', 50000),
       (2, 'Jane Smith', 'HR', 60000);


SELECT name, salary FROM employees;


UPDATE employees
SET salary = 55000
WHERE id = 1;


DELETE FROM employees
WHERE id = 2;
