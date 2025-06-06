# Ecommerce_SQL_Database
SQL for Data Analysis 

# SQL Script:  
 - <a href="https://github.com/SOUJIT-BAKSHI/-Ecommerce_SQL_Database/blob/main/Ecommerce_DB.sql">E-commerce_analysis.sql
# SQL_Outputs:
 - <a href="https://github.com/SOUJIT-BAKSHI/-Ecommerce_SQL_Database/blob/main/E-commerce_sql_output.pdf">Screenshots_Folder


Task Objective:
To utilize SQL queries to extract and analyze data from an e-commerce database to gain insights, optimize queries, and apply data manipulation techniques.

Tools Used:



Interface: MySQL Workbench

Dataset:
Custom-created Ecommerce_SQL_Database consisting of the following tables:

customers (customer_id, name, email, phone, address)

products (product_id, name, category, price, stock_quantity)

orders (order_id, customer_id, order_date, total_amount)

order_items (order_item_id, order_id, product_id, quantity, price)

payments (payment_id, order_id, payment_date, payment_method, amount)

SQL Queries & Descriptions:

SELECT with WHERE, ORDER BY

SELECT * FROM products WHERE price > 500 ORDER BY price DESC;

Description: Retrieves products priced over 500 sorted from highest to lowest.

GROUP BY with COUNT

SELECT customer_id, COUNT(*) AS total_orders FROM orders GROUP BY customer_id;

Description: Shows number of orders placed by each customer.

INNER JOIN

SELECT o.order_id, c.name, o.total_amount FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;

Description: Lists order details along with customer names.

LEFT JOIN

SELECT c.customer_id, c.name, o.order_id FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id;

Description: Lists all customers and their orders (if any).

Subquery

SELECT * FROM customers WHERE customer_id IN (
  SELECT customer_id FROM orders GROUP BY customer_id HAVING SUM(total_amount) > 1000
);

Description: Retrieves customers whose total spending exceeds 1000.

Aggregate Function: AVG

SELECT AVG(total_amount) AS avg_order FROM orders;

Description: Calculates average order amount.

GROUP BY with SUM

SELECT p.category, SUM(oi.price * oi.quantity) AS total_revenue
FROM order_items oi JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category;

Description: Calculates total revenue by product category.

Create View

CREATE VIEW sales_by_customer AS
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

Description: Creates a reusable view for total sales by customer.

Indexing for Optimization

CREATE INDEX idx_order_date ON orders(order_date);
CREATE INDEX idx_product_category ON products(category);

Description: Adds indexes to improve query performance on frequently filtered columns.

Screenshots:

Queries with their outputs were executed in MySQL Workbench.

Screenshots saved in folder: SQL_Outputs

Outcome:

Learned to structure and analyze relational data using SQL.

Applied best practices in joins, aggregations, and indexing.

Created optimized, readable, and insightful queries for real-world e-commerce datasets.

Deliverables:

SQL Script: ecommerce_analysis.sql

Screenshots Folder: SQL_Outputs

Report Document: This file

Prepared by:
[Soujit Bakshi]
Topic: SQL for Data Analysis

