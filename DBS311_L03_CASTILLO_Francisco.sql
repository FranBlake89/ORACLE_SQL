-- ***********************
-- Name: Francisco Castillo
-- Date: 2023-01-31
-- Purpose: Lab 3 DBS311
-- ***********************


-- Q1: Create a query to select date and price of all the sales for customer named �Jane Smith�

SELECT  s.sale_date,
        s.sale_price,
        c.name ||' '|| c.last_name AS Name
FROM sale s
FULL OUTER JOIN customer c
ON s.customer_id =  c.id
WHERE c.name = 'Jane'
    AND c.last_name = 'Smith';

-- Q2:  Create a query to select all emails of all sales where the price is greater than the avg price for year 2022

SELECT c.email,
        c.name
FROM customer c
INNER JOIN sale s
ON c.id = s.customer_id
WHERE s.sale_price > (
            SELECT AVG(sale_price)
            FROM sale
            WHERE EXTRACT( YEAR FROM s.sale_date) = 2022
            );

-- Q3:  Create a query that returns the names of users where the transaction ID is equal to 1 or 5 or 10 or 44 or 155

SELECT customer.name 
FROM customer 
INNER JOIN sale 
ON sale.customer_id = customer.id 
WHERE sale.id IN (1, 5, 10, 44, 155);

-- Q4: Select the percentage of monthly sales for every year.

--wrong answer but I could't group by month
SELECT  EXTRACT( year FROM s.sale_date) AS YEAR,
        EXTRACT( month FROM s.sale_date) AS MONTH,
             ROUND(PERCENT_RANK() OVER (
        PARTITION BY EXTRACT( year FROM s.sale_date)
        ORDER BY s.sale_price DESC
            ) * 100,2) || '%' percent_rank
FROM SALE s


--correct answer given by Proffesor 

--first create the subquery and then create the main query, using WHERE

SELECT EXTRACT(YEAR FROM SALE_DATE) AS Year, EXTRACT(MONTH FROM SALE_DATE) AS Month, 
    round ( ( (SUM(SALE_PRICE) / ( 
                        SELECT SUM(SALE_PRICE) 
                        FROM SALE 
                        WHERE EXTRACT(YEAR FROM SALE_DATE)  = EXTRACT(YEAR FROM M.SALE_dATE)
                        )
                        )*100 ), 2) AS AVERAGE
FROM SALE M
GROUP BY EXTRACT(YEAR FROM SALE_DATE), EXTRACT(MONTH FROM SALE_DATE)
ORDER BY Year ASC;