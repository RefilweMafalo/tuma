CREATE TABLE customers1 (
  customer_id INT,
  customer_name VARCHAR(50),
  customer_email VARCHAR(100)
);

CREATE TABLE orders1 (
  order_id INT,
  customer_id INT,
  order_date DATE,
  order_value DECIMAL(10, 2),
  product_id INT
);

CREATE TABLE products (
  product_id INT,
  product_name VARCHAR(50),
  price DECIMAL(10, 2)
);

CREATE TABLE sales (
  sales_id INT,
  sales_date DATE,
  sales_amount DECIMAL(10, 2)
);

CREATE TABLE employees1 (
  employee_id INT,
  employee_name VARCHAR(50),
  hire_date DATE
);

--1
INSERT INTO customers1(customer_id, customer_name, customer_email)
VALUES (1234, 'John Doe', 'john.doe@example.com');


--2
UPDATE customers1
SET customer_email = 'newemail@example.com'
WHERE customer_id = 1234;

--3
DELETE FROM orders1
WHERE order_date < '2022-01-01';

--4
SELECT *
FROM products
WHERE price > 100;

--5
SELECT TOP 10 *
FROM sales
ORDER BY sales_date ASC;


--6
SELECT customer_id, AVG(order_value) AS average_order_value
FROM orders1
GROUP BY customer_id;

--7
SELECT *
FROM customers1
JOIN orders1 ON customers1.customer_id = orders1.customer_id
WHERE order_date > '2022-01-01';

--8
SELECT customer_id, MAX(order_value) AS max_order_value
FROM orders1
GROUP BY customer_id;

--9
SELECT customer_id, COUNT(order_id) AS order_count
FROM orders1
GROUP BY customer_id;

--10
SELECT DISTINCT product_name
FROM products;

--11
SELECT TOP 5 customer_id, SUM(order_value) AS total_order_value
FROM orders1
GROUP BY customer_id
ORDER BY total_order_value DESC;


--12
SELECT SUM(order_value) AS total_revenue
FROM orders1
WHERE product_id = 5678;

--13
SELECT *
FROM employees
WHERE hire_date BETWEEN '2020-01-01' AND '2021-12-31';

--14
UPDATE products
SET product_name = 'New Product Name'
WHERE product_id = 5678;

--15
SELECT TOP 10 product_id, SUM(order_value) AS total_revenue
FROM orders1
GROUP BY product_id
ORDER BY total_revenue DESC;


