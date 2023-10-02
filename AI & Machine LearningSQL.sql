CREATE TABLE sales_data (
    order_date DATE,
    product_name VARCHAR(50),
    quantity INT,
    revenue DECIMAL(10, 2)
);


INSERT INTO sales_data (order_date, product_name, quantity, revenue) VALUES
('2021-12-15', 'Product A', 110, 5500.00),
('2022-01-05', 'Product A', 120, 6000.00),
('2022-01-10', 'Product B', 90, 4500.00),
('2022-02-15', 'Product A', 110, 5500.00),
('2022-02-20', 'Product B', 80, 4000.00),
('2022-03-10', 'Product A', 100, 5000.00),
('2022-03-15', 'Product B', 70, 3500.00),
('2022-04-08', 'Product A', 95, 4750.00),
('2022-04-12', 'Product B', 65, 3250.00),
('2022-05-02', 'Product A', 105, 5250.00),
('2022-05-06', 'Product B', 75, 3750.00),
('2023-01-05', 'Product A', 100, 5000.00),
('2023-01-10', 'Product B', 75, 4500.00),
('2023-02-15', 'Product A', 120, 6000.00),
('2023-02-20', 'Product B', 90, 5400.00),
('2023-03-10', 'Product A', 110, 5500.00),
('2023-03-15', 'Product B', 80, 4800.00),
('2023-04-08', 'Product A', 95, 4750.00),
('2023-04-12', 'Product B', 70, 4200.00),
('2023-05-02', 'Product A', 105, 5250.00),
('2023-05-06', 'Product B', 85, 5100.00);

WITH total_revenue AS (
    SELECT SUM(revenue) AS total_revenue
    FROM sales_data
    WHERE DATEPART(YEAR, order_date) IN (2021, 2022, 2023)
),
product_revenue AS (
    SELECT product_name, SUM(revenue) AS product_revenue
    FROM sales_data
    WHERE DATEPART(YEAR, order_date) IN (2021, 2022, 2023)
    GROUP BY product_name
)
SELECT pr.product_name, 
       pr.product_revenue, 
       (pr.product_revenue / tr.total_revenue) * 100 AS revenue_contribution_percentage
FROM product_revenue pr
CROSS JOIN total_revenue tr
ORDER BY revenue_contribution_percentage DESC;

