--display number of order placed by customers
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer, COUNT(o.id) as total_order_placed
FROM customers AS c
LEFT JOIN orders AS o ON o.customer_id = c.id
GROUP BY customer
ORDER BY total_order_placed DESC;

--number of assigned orders per employee
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee, COUNT(o.assigned_to) as assigned_orders
FROM orders as o
RIGHT JOIN employees AS e on e.id = o.assigned_to
GROUP BY employee
ORDER BY assigned_orders DESC;

--display number of order placed by customers
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer, c.email, c.phone
FROM customers AS c
LEFT JOIN orders AS o ON o.customer_id = c.id
WHERE o.id IS NULL;

--display product never ordered
SELECT p.name as product, p.description, p.sku, p.unit_price
FROM products AS p
LEFT JOIN order_items AS o ON o.product_id = p.id
WHERE o.id IS NULL;

--display high value products
SELECT p.name as product, SUM(o.ordered_quantity) as ordered_quantity
FROM products AS p
INNER JOIN order_items AS o ON o.product_id = p.id
GROUP BY product
HAVING SUM(o.ordered_quantity) > 10
ORDER BY ordered_quantity DESC;
