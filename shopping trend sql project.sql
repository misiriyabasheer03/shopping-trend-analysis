CREATE DATABASE shopping_trend;
USE shopping_trend;

CREATE TABLE customer (
    Customer_ID INT,
    Age INT,
    Gender VARCHAR(10),
    Category VARCHAR(50),
    `Purchase Amount (USD)` DECIMAL(10,2),
    Location VARCHAR(50),
    Season VARCHAR(20),
    `Payment Method` VARCHAR(30),
    `Preferred Payment Method` VARCHAR(30),
    `Previous Purchases` INT,
    `Promo Code Used` VARCHAR(5),
    `Review Rating` DECIMAL(3,2),
    `Subscription Status` VARCHAR(10)
);

SELECT * FROM customer;

#1.selecting data
SELECT Category, `Purchase Amount (USD)`
FROM customer;

SELECT * FROM customer
WHERE Customer_ID = 2001;

#2.inserting
INSERT INTO customer
VALUES (2001, 29, 'Female', 'Clothing', 120.50, 'India', 'Winter',
        'Credit Card', 'Credit Card', 12, 'Yes', 4.5, 'Yes');

#3.update
SET SQL_SAFE_UPDATES = 0;

UPDATE customer
SET `Promo Code Used` = 'No'
WHERE Customer_ID = 2001;


#4.remove
DELETE FROM customer
WHERE Customer_ID = 2001;

#5.where
SELECT *
FROM customer
WHERE Season = 'Winter';

#6.aggregate
SELECT
    COUNT(*) AS total_customers,
    AVG(`Purchase Amount (USD)`) AS avg_purchase
FROM customer;

#7.group by
SELECT Category,
       SUM(`Purchase Amount (USD)`) AS total_sales
FROM customer
GROUP BY Category;

#8. order by
SELECT *
FROM customer
ORDER BY `Purchase Amount (USD)` DESC;

#9.limit
SELECT *
FROM customer
LIMIT 5;

#10.condition (and/or)
SELECT *
FROM customer
WHERE Gender = 'Female'
AND Season = 'Summer';

#11.case (decision making)
SELECT Customer_ID,
       `Purchase Amount (USD)`,
       CASE
           WHEN `Purchase Amount (USD)` >= 100 THEN 'High'
           ELSE 'Low'
       END AS purchase_type
FROM customer;

#12.view
CREATE VIEW winter_customers AS
SELECT *
FROM customer
WHERE Season = 'Winter';

#13.index
CREATE INDEX idx_category
ON customer (Category);

#14.revenue
SELECT 
    SUM(`Purchase Amount (USD)`) AS total_revenue
FROM customer;

#15.revenue by each season
SELECT 
    Season,
    SUM(`Purchase Amount (USD)`) AS season_revenue
FROM customer
GROUP BY Season;

#16.revenue by payment
SELECT 
    `Payment Method`,
    SUM(`Purchase Amount (USD)`) AS payment_revenue
FROM customer
GROUP BY `Payment Method`;

#17.top 5 revenue generated costomers
SELECT 
    Customer_ID,
    SUM(`Purchase Amount (USD)`) AS customer_revenue
FROM customer
GROUP BY Customer_ID
ORDER BY customer_revenue DESC
LIMIT 5;

#18.display
SHOW TABLES;

#19.structure of customer table
DESCRIBE customer;

