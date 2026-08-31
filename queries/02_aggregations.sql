--list of employees work in each department.
SELECT d.name , COUNT(e.id) AS staff_number
FROM employees AS e
INNER JOIN departments AS d ON d.id = e.department_id
GROUP BY d.name;

--list of orders per customer
SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer,
    COUNT(o.id) AS total_orders
FROM customers AS c
LEFT JOIN orders AS o
    ON c.id = o.customer_id
GROUP BY
    c.id,
    c.first_name,
    c.last_name
ORDER BY total_orders DESC;

--total quantity ordered per product
SELECT p.name AS product ,SUM(o.ordered_quantity) AS ordered_quantity
FROM order_items AS o
INNER JOIN products AS p ON p.id = o.product_id
GROUP BY product
ORDER BY product;



--average salary per deparment
SELECT d.name as department, ROUND(AVG(e.salary), 2) AS average_salary
FROM employees AS e
INNER JOIN departments AS d ON d.id = e.department_id
GROUP BY department;
