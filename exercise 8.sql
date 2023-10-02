--1
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  product_description TEXT,
  price DECIMAL(10, 2),
  in_stock INT
);


--2
CREATE INDEX idx_price ON products (price);

--3
CREATE TYPE phone_number FROM VARCHAR(10);

--4
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  phone_number phone_number
);

--5
CREATE PROCEDURE add_customer
  @customer_id INT,
  @first_name VARCHAR(50),
  @last_name VARCHAR(50),
  @email VARCHAR(100),
  @phone_number phone_number
AS
BEGIN
  INSERT INTO customers (customer_id, first_name, last_name, email, phone_number)
  VALUES (@customer_id, @first_name, @last_name, @email, @phone_number);
END;

--6
CREATE FUNCTION calculate_discount (@price DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
AS
BEGIN
  DECLARE @discounted_price DECIMAL(10, 2);
  SET @discounted_price = @price * 0.9; -- 10% discount
  RETURN @discounted_price;
END;

--7
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  order_date DATE,
  quantity INT
);

--8
CREATE TRIGGER update_stock
ON orders
AFTER INSERT
AS
BEGIN
  UPDATE products
  SET in_stock = in_stock - (SELECT quantity FROM inserted WHERE inserted.product_id = products.product_id)
  WHERE product_id IN (SELECT product_id FROM inserted);
END;

--9
CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50)
);

--10
CREATE TABLE product_categories (
  product_id INT,
  category_id INT,
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
