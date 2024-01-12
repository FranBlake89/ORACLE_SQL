-- ***********************
-- Name: Francisco Castillo
-- ID: #########
-- Date: 2021-02-07
-- Purpose: Lab 4 DBS311
-- ***********************

--All solutions MUST include UNION/INTERSECT/MINUS


-- Q1: Create a query that selects the maximum sale price per month for year 2022. 
--Create another query that selects the first name and last name of the user with 
--the most amount of sales for each month of 2022. Union both queries together.


SELECT  c.id, 
        CONCAT(CONCAT(c.name, ' '), c.last_name) AS NAME, 
        EXTRACT(MONTH FROM s.sale_date) AS month 
FROM customer c 
JOIN sale s 
    ON c.id = s.customer_id 
WHERE s.sale_price IN (SELECT MAX(sale_price) 
FROM sale 
    WHERE EXTRACT(YEAR FROM sale_date) = 2022 
    GROUP BY EXTRACT(MONTH FROM sale_date), c.id) 
    AND EXTRACT(YEAR FROM s.sale_date) = 2022
UNION
SELECT  customer_id,
        TO_CHAR( MAX(sale_price)) "max_sale_price", 
        EXTRACT(MONTH FROM sale_date) AS month 
FROM sale 
WHERE EXTRACT(YEAR FROM sale_date) = 2022 
GROUP BY EXTRACT(MONTH FROM sale_date),  sale.customer_id;


-- Q2:  Create a query that selects First name and last name all users who made a 
--purchase in 2021 but they haven�t made a purchase in 2022. Hint: MINUS

SELECT name, last_name 
FROM customer c 
INNER JOIN sale s ON c.id = s.customer_id 
WHERE s.sale_date BETWEEN '2022-01-01' AND '2022-12-31'
MINUS
SELECT name, last_name 
FROM customer c 
INNER JOIN sale s ON c.id = s.customer_id 
WHERE s.sale_date BETWEEN '2021-01-01' AND '2021-12-31' 


-- Q3:  Create a query that selects first name and last name of users that have 
--purchased something totaling more than $20  (in any year) and have purchased 
--something totalling less than $55 in year 2022

SELECT c.name, c.last_name 
FROM customer c 
INNER JOIN sale s ON s.customer_id = c.id 
WHERE EXTRACT( YEAR FROM s.sale_date) = 2022 AND s.sale_price < 55
UNION
SELECT c.name, c.last_name
FROM customer c
INNER JOIN sale s ON s.customer_id = c.id
WHERE s.sale_price > 20 

--IN ORACLE SQL  Q1: Create a procedure call birthday_calculator. The procedure has one date input parameter that represents a birthday date. The procedure should output a message to console that reads: “X number of days to your birthday” where X represents the integer number of days left to the input date. 