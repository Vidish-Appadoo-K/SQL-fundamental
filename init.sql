-- CREATE DATABASE supplier;

-- \l

-- \c supplier

CREATE TABLE employee_statuses(
    id UUID PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE product_statuses(
    id UUID PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE customer_statuses(
    id UUID PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE order_statuses(
    id UUID PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE departments(
    id UUID PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    description VARCHAR(100)
);

CREATE TABLE employees(
    id UUID PRIMARY KEY,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(25),
    phone VARCHAR(12),
    salary INTEGER, 
    status_id UUID NOT NULL REFERENCES employee_statuses(id),
    department_id UUID NOT NULL REFERENCES departments(id),
    hired_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE customers(
    id UUID PRIMARY KEY,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(25),
    phone VARCHAR(12),
    status_id UUID NOT NULL REFERENCES customer_statuses(id)
);

CREATE TABLE products(
    id UUID PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(100),
    sku INTEGER,
    unit_price DECIMAL(5, 2),
    status_id UUID NOT NULL REFERENCES product_statuses(id)
);

CREATE TABLE orders(
    id UUID PRIMARY KEY,
    customer_id UUID NOT NULL REFERENCES customers(id),
    status_id UUID NOT NULL REFERENCES order_statuses(id),
    ordered_at TIMESTAMPTZ DEFAULT NOW(),
    assigned_to UUID NOT NULL REFERENCES employees(id)
);

CREATE TABLE order_items(
    id UUID PRIMARY KEY,
    order_id UUID NOT NULL REFERENCES orders(id),
    product_id UUID NOT NULL REFERENCES products(id),
    ordered_quantity INTEGER NOT NULL
);
