--1

CREATE TABLE employees (
  id INT PRIMARY KEY IDENTITY(1,1),
  name VARCHAR(50),
  hire_date DATE,
  salary DECIMAL(10, 2),
  department_id INT,
  CONSTRAINT FK_employees_departments FOREIGN KEY (department_id) REFERENCES departments(id)
);




--2
CREATE TABLE departments (
  id INT PRIMARY KEY IDENTITY(1,1),
  name VARCHAR(50)
);


--3
CREATE TABLE projects (
  id INT PRIMARY KEY IDENTITY(1,1),
  name VARCHAR(50),
  description TEXT,
  start_date DATE,
  end_date DATE,
  budget DECIMAL(10, 2)
);



--4
CREATE TABLE employees_projects (
  employee_id INT,
  project_id INT,
  FOREIGN KEY (employee_id) REFERENCES employees(id),
  FOREIGN KEY (project_id) REFERENCES projects(id)
);

--5
ALTER TABLE departments
ADD manager_id INT,
ADD CONSTRAINT FK_departments_employees FOREIGN KEY (manager_id) REFERENCES employees(id);

--6
CREATE TABLE inventory (
  id INT PRIMARY KEY IDENTITY(1,1),
  product_name VARCHAR(50),
  price DECIMAL(10, 2),
  quantity INT,
  supplier_id INT,
  notes TEXT,
  is_available BIT,
  FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

--7
CREATE TABLE suppliers (
  id INT PRIMARY KEY IDENTITY(1,1),
  name VARCHAR(50),
  address VARCHAR(100)
);

--8
ALTER TABLE employees
ADD type VARCHAR(20);

--9
CREATE TABLE logins (
  id INT PRIMARY KEY IDENTITY(1,1),
  username VARCHAR(50),
  password VARCHAR(50),
  employee_id INT,
  FOREIGN KEY (employee_id) REFERENCES employees(id)
);

--10
ALTER TABLE employees
ADD status VARCHAR(20);

--11
CREATE TABLE customer_orders (
  id INT PRIMARY KEY IDENTITY(1,1),
  customer_id INT,
  order_date DATE,
  total_price DECIMAL(10, 2),
  shipping_address VARCHAR(100),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

--12
CREATE TABLE customers11 (
  id INT PRIMARY KEY IDENTITY(1,1),
  name VARCHAR(50),
  email VARCHAR(100),
  phone_number VARCHAR(20),
  created_at DATETIME
);

--13
ALTER TABLE inventory
ADD notes TEXT;

--14
ALTER TABLE inventory
ADD is_available BIT;

--15
ALTER TABLE employees
ADD is_manager BIT;
