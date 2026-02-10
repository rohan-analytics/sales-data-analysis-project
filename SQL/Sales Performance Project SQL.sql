-- Sales Performance & Revenue Analysis Project --

CREATE DATABASE sales_project;

USE sales_project;

SELECT * FROM orders;
SELECT * FROM order_details;
SELECT * FROM sales_target;

DESC orders;


-- Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM orders;

-- Total Sales --
SELECT SUM(Amount) AS total_sales
FROM order_details;

-- Total Profit --
SELECT SUM(Profit) AS total_profit
FROM order_details;

-- Total Quantity Sold --
SELECT SUM(Quantity) AS total_quantity
FROM order_details;


-- Joins --

-- Total sales by State --
SELECT o.State,
       SUM(od.Amount) AS total_sales
FROM orders o
JOIN order_details od 
ON o.order_id = od.order_id
GROUP BY o.State
ORDER BY total_sales DESC;


-- Total sales by Category --
SELECT Category,
       SUM(Amount) AS total_sales
FROM order_details
GROUP BY Category
ORDER BY total_sales DESC;


-- Top 5 Cities by Sales --
SELECT o.City,
       SUM(od.Amount) AS total_sales
FROM orders o
JOIN order_details od 
ON o.order_id = od.Order_ID
GROUP BY o.City
ORDER BY total_sales DESC
LIMIT 5;


-- Monthly Sales Trend --
SELECT o.Month,
       SUM(od.Amount) AS monthly_sales
FROM orders o
JOIN order_details od 
ON o.order_id = od.Order_ID
GROUP BY o.Month, o.`Month Number`
ORDER BY o.`Month Number`;


