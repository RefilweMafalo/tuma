CREATE TABLE employees (
  employee_id decimal(10,0) PRIMARY KEY,
  first_name varchar(255),
  last_name varchar(255),
  email varchar(255),
  phone_number varchar(255),
  hire_date date,
  job_id varchar(255),
  salary decimal(10,2),
  manager_id decimal(10,0),
  department_id decimal(10,0)
);


INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id)
VALUES
  (1, 'John', 'Doe', 'john.doe@example.com', '555-1234', '2023-01-01', '001', 5000, NULL, 50),
  (2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', '2023-02-01', '002', 6000, 1, 50),
  (3, 'Robert', 'Johnson', 'robert.johnson@example.com', '555-9012', '2023-03-01', '003', 7000, 2, 60),
  (4, 'Emily', 'Davis', 'emily.davis@example.com', '555-3456', '2023-04-01', '002', 5500, 2, 60),
  (5, 'Michael', 'Wilson', 'michael.wilson@example.com', '555-7890', '2023-05-01', '004', 8000, 1, 50);


SELECT * FROM employees;

SELECT first_name, last_name, salary FROM employees;

SELECT employee_id, first_name, last_name, hire_date FROM employees ORDER BY hire_date ASC;

SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary > 5000;

SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary > 5000 AND department_id = 50;

UPDATE employees SET salary = salary * 1.1 WHERE department_id = 50;

SELECT department_id, AVG(salary) AS average_salary FROM employees GROUP BY department_id ORDER BY average_salary DESC;

SELECT job_id, MIN(salary) AS min_salary, MAX(salary) AS max_salary, AVG(salary) AS average_salary FROM employees GROUP BY job_id ORDER BY job_id;


--Continuation
--1
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--2
SELECT department_id, SUM(salary) AS total_salary_expenditure
FROM employees
GROUP BY department_id
ORDER BY department_id ASC;

--3
SELECT e.first_name, e.last_name, e.salary, m.first_name AS manager_first_name, m.last_name AS manager_last_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.manager_id IS NOT NULL;


--4
SELECT first_name, last_name, salary
FROM employees
WHERE manager_id IS NULL;


--5
SELECT TOP 5 first_name, last_name, salary
FROM employees
ORDER BY salary DESC;


--6
SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE 'J%';


--7
SELECT first_name, last_name, salary
FROM employees
WHERE last_name LIKE '%son';


--8
SELECT first_name, last_name, salary
FROM employees
WHERE hire_date BETWEEN '2005-01-01' AND '2007-12-31';


--9
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary >= (SELECT MIN(salary) FROM employees WHERE department_id = e.department_id) * 0.9
  AND e.salary <= (SELECT MAX(salary) FROM employees WHERE department_id = e.department_id) * 1.1;


--10
SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE m.department_id = 50;
