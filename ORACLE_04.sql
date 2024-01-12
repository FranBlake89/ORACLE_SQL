-- ***********************
-- Name: Francisco Castillo
-- Date: 2023-01-12
-- Purpose: Lab 1 DBS311
-- ***********************

-- Question 1 � Write a query to display the tomorrow�s date in the following format:
--  January 10th of year 2019

-- Q1 SOLUTION --
SELECT TO_CHAR (SYSDATE + 1, 'Month ddth "of the year" YYYY') as maxdate
FROM dual;

--January   13th of the year 2023

-- Q2: For each product in category 2, 3, and 5, show product ID, product name, list price, 
-- and the new list price increased by 2%. Display a new list price as a whole number.
--In your result, add a calculated column to show the difference of old and new list prices.

-- Q2 SOLUTION --
SELECT product_id,
       product_name,
       list_price,
       (list_price + (list_price * 0.02)) AS "PRICE Incresed 2%"
FROM products
WHERE   category_id = 2 OR
        category_id = 3 OR
        category_id = 5;
        
-- Q3: For employees whose manager ID is 2, write a query that displays the employee�s 
--Full Name and Job Title in the following format:
--SUMMER, PAYNE is Public Accountant.

-- Q3 SOLUTION --
SELECT  UPPER( last_name || ', ' || first_name ) || ' is ' ||job_title AS "Query job title"
FROM employees
WHERE manager_id = 2;

-- Q4: For each employee hired before October 2016, display the employee�s last name, 
--hire date and calculate the number of YEARS between TODAY and the date the employee was hired.
-- �	Label the column Years worked. 
-- �	Order your results by the number of years employed.  Round the number of years employed 
--up to the closest whole number.

-- Q4 SOLUTION --
SELECT  last_name,
         hire_date,
         TO_CHAR (SYSDATE, 'YYYY')-TO_CHAR(hire_date, 'YYYY') AS "Years worked"
FROM    employees,
        dual
WHERE TO_CHAR(hire_date, 'MM-YYYY') >= '10-2016'
order by employees.hire_date DESC;
--Newest first

-- Q5: Display each employee�s last name, hire date, and the review date, 
-- which is the first Tuesday after a year of service, but only for those hired after 2016.  
-- �	Label the column REVIEW DAY. 
-- �	Format the dates to appear in the format like:
--    TUESDAY, August the Thirty-First of year 2016
-- �	Sort by review date

-- Q5 SOLUTION --
SELECT  last_name,
        hire_date,
        TO_CHAR(NEXT_DAY( (hire_date + 365), 'Tuesday'), 'DAY", "Month" the "Ddsp" of year "YYYY' )AS "Review Day"
FROM employees
WHERE hire_date >= TO_DATE('2016-01-01','yyyy-mm-dd')
ORDER BY "Review Day";

--ANSWER, GIVEN by proffessor
-- round( (sysdate-dateColumn)/365.25) //every 4 year we add 1 day, for that reason it's 365.25


-- Q6: For all warehouses, display warehouse id, warehouse name, city, and state. 
--For warehouses with the null value for the state column, display �unknown�.

-- Q6 SOLUTION --
SELECT  W.warehouse_id,
        W.warehouse_name,
        L.city,
        CASE WHEN L.state IS NULL THEN 'Unknow'
            ELSE L.state END AS "STATE"
FROM        warehouses W
INNER JOIN  locations L
ON W.location_id = L.location_id;


