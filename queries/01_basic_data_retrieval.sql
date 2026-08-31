--list of all currently active employees, including their full name, department, and status.
SELECT e.first_name, e.last_name, s.name AS status, d.name as department
FROM employees AS e
INNER JOIN employee_statuses AS s ON  e.status_id = s.id
INNER JOIN departments AS d ON e.department_id = d.id
WHERE s.name = 'Active';


--list of all active products ordered from the most expensive to the cheapest.
SELECT p.name, p.description, p.sku, p.unit_price, s.name as status
FROM products AS p
INNER JOIN product_statuses AS s ON s.id = p.status_id
WHERE s.name = 'Active'
ORDER BY p.unit_price DESC;

--list of all active customers and their contact information
SELECT c.first_name, c.last_name, c.email, c.phone, s.name AS status
FROM customers AS c
INNER JOIN customer_statuses AS s ON s.id = c.status_id
WHERE s.name = 'Active';

--list of all orders placed during August 2026, including the customer, assigned employee, order status, and order date.
SELECT  CONCAT(c.first_name,' ', c.last_name) AS customer, CONCAT(e.first_name,' ', e.last_name) AS assigned_to , s.name AS status, o.ordered_at
FROM orders AS o
INNER JOIN customers AS c ON c.id = o.customer_id
INNER JOIN employees AS e on e.id = o.assigned_to
INNER JOIN order_statuses AS s ON s.id = o.status_id
WHERE o.ordered_at >= '2026-08-01' AND o.ordered_at < '2026-09-01';