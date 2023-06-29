-- ***********************
-- Name: Francisco Castillo
-- Date: 2023-01-12
-- Purpose: Lab 2 DBS311
-- ***********************

-- LAB 2

-- Q1: Create a query to determine the average and the total sales in the database. 
--Named the columns �Total� and �Total average per sale�
SELECT round( AVG(sale_price), 2 ) AS "Total average per sale",
        count(sale_price) AS "Total"
FROM SALE;
   

-- Q2: Repeat the same as the previous questions but add another column named �Email domain� 
--that represents the domain of the email of the user (google.com, icloud.com, outlook.com, etc). 
--Calculate the total sales and the average value per sale per each email domain

SELECT  SUBSTR(customer.email, INSTR(customer.email, '@')+1) AS "Email Domain",
        SUM(sale.sale_price) AS "Total Sales",
        AVG(sale.sale_price) AS "Average Sale Value"
FROM SALE
JOIN CUSTOMER 
ON sale.customer_id = customer.id
GROUP BY Email;

-- Q3:  Create a query that returns the name of the month a sale took place, 
--the number of sales for each of those months, plus the average sale amount per month

SELECT  TO_CHAR(TO_DATE(sale.sale_date, 'YYYY-MM-DD'), 'Month') AS "Month",
        COUNT(sale.id) AS "Number of sales per Month",
        ROUND ( AVG(sale.sale_price), 2 ) AS "Average sale amount per Month"
FROM SALE
GROUP BY TO_CHAR(TO_DATE(sale.sale_date, 'YYYY-MM-DD'), 'Month')
ORDER BY TO_CHAR(TO_DATE(sale.sale_date, 'YYYY-MM-DD'), 'Month') ASC;

-- Q4: Create a query to calculate the minimum, maximum and total sales per user. 
--Display the user name in one column and named it �fullname�, the user_id, the minimum, 
--maximum and total sales per user.

SELECT C.name ||' '|| C.last_name AS "Fullname", 
       C.id AS "User ID", 
       MIN(S.sale_price) AS "Minimum Sale", 
       MAX(S.sale_price) AS "Maximum Sale", 
       SUM(S.sale_price) AS "Total Sales"
FROM SALE S
JOIN CUSTOMER C
ON s.customer_id = c.id
GROUP BY c.name, c.last_name, c.id;


-- Q5: Create a query that lists every sale ID, sale date and total price plus tax. 
--Assume a ta rate of 13 percent.
SELECT  S.id, 
        S.sale_date,
        (S.sale_price * 1.13) AS "Price with TAX" 
FROM SALE S;
