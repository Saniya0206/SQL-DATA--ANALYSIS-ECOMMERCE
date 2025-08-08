
-- Task 4: SQL for Data Analysis using Ecommerce SQL Database

-- Query 1: Select first 10 orders
SELECT * FROM orders LIMIT 10;
-- See screenshot: screenshots/01_select_orders.png

-- Query 2: Total sales by product category
SELECT category, SUM(total_price) AS total_sales
FROM products
GROUP BY category;
-- See screenshot: screenshots/02_group_by_category.png

-- Query 3: Join customers and orders to see who ordered what
SELECT c.customer_name, o.order_id, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;
-- See screenshot: screenshots/03_join_customers_orders.png

-- Query 4: Subquery to find products more expensive than average
SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);
-- See screenshot: screenshots/04_subquery_avg_price.png

-- Query 5: Create a view for monthly sales
CREATE VIEW monthly_sales AS
SELECT MONTH(order_date) AS month, SUM(total_price) AS revenue
FROM orders
GROUP BY MONTH(order_date);
-- See screenshot: screenshots/05_view_monthly_sales.png

-- Query 6: Create an index on customer name
CREATE INDEX idx_customer_name ON customers(customer_name);
-- See screenshot: screenshots/06_index_customer_name.png
