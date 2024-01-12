--FRANCISCO CASTILLO 

--2022-09-23

SET AUTOCOMMIT ON;

--1.	Display the data for all offices.
SELECT *
FROM offices;

--2.    Display the employee number for all employees whose office code is 4.
SELECT  employeenumber 
FROM    employees
WHERE   officecode = 4;

--3.	Display customer number, customer name, contact first name and contact last name, and phone for all customers in NYC. (hint: be wary of case sensitivity)
SELECT  customernumber , 
        customername, 
        contactfirstname, 
        contactlastname, 
        phone
FROM    customers
WHERE   city = 'NYC';

--4.	Repeat the previous Query with a couple small changes:
--a.	The contact�s first and last name should be in a single column in the format �firstname : lastname�.
SELECT  customernumber , 
        customername, 
        contactfirstname ||':'|| contactlastname AS contactname, 
        phone
FROM    customers
WHERE   city = 'NYC';

--b.	Show customers who are in Canada
SELECT  customernumber , 
        customername, 
        contactfirstname, 
        contactlastname, 
        phone
FROM    customers
WHERE   country = 'Canada';

--5.	Display customer number for customers who have payments.  Do not included any repeated 
--values. (hints: how do you know a customer has made a payment? You will need to access only one table for this query)
SELECT customernumber
FROM customers
WHERE creditlimit !=0

--6.	List customer numbers, check number, and amount for customers whose payment amount is not in the range of $30,000 to $65,000. Sort the output by top payments amount first.
SELECT  customernumber,
        checknumber,
        amount
FROM    payments
WHERE   amount <= 65000
        OR  amount >= 30000
ORDER BY amount desc;

--7.	Display the order information for all orders that are cancelled. 
SELECT  ordernumber,
        orderdate,
        requireddate,
        shippeddate,
        status
FROM    orders
WHERE   status = 'Cancelled';
        
--8.	The company needs to know the percentage markup for each product sold.  Produce a query that outputs the ProductCode, ProductName, BuyPrice, MSRP in addition to
--a.	The difference between MSRP and BuyPrice (i.e. MSRP-BuyPrice) called markup
SELECT  productcode,
        productname,
        buyprice,
        msrp,
        msrp - buyprice AS markup,
        100 * (msrp - buyprice) / buyprice AS percentagemarkup
FROM    products;

--b.	The percentage markup (100 * calculated by difference / BuyPrice) called percmarkup
--rounded to 1 decimal place.
SELECT  productcode,
        productname,
        buyprice,
        msrp,
        msrp - buyprice AS markup,
        round (100 * (msrp - buyprice) / buyprice, 1) AS percmarkup
FROM    products;

--9.	Display the information of all products with string �co� in their product name. (c and o can be lower or upper case).
SELECT  productcode,
        productname,
        productline,
        productscale,
        productvendor,
        quantityinstock
FROM    products
WHERE   LOWER(productname) LIKE '%co%';

--10.	Display all customers whose contact first name starts with letter s (both lowercase and uppercase) and includes letter e (both lowercase and uppercase).
SELECT  customernumber,
        contactfirstname,
        contactlastname
FROM    customers
WHERE   LOWER(contactfirstname) LIKE 's%e%';

--11.	Create a statement that will insert yourself as an employee of the company.  
--a.	Use a unique employee number of your choice
--b.	Use your school email address
--c.	Your job title will be �Cashier�
--d.	Office code will be 1
--e.	You will report to employee 1088

INSERT INTO employees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
VALUES  ( 2022, 'Castillo', 'Francisco', 'zzz22', 'fcastillo-rojas1@myseneca.ca', 1, 1088, 'Cahier' );

--12.	Create a query that displays your, and only your, employee data
SELECT *
FROM employees
WHERE employeenumber = 2022;

--13.	Create a statement to update your job title to �Head Cashier�
UPDATE employees
SET jobtitle = 'Head Cashier'
WHERE employeenumber = 2022;

--14.	Create a statement to insert another fictional employee into the database.  
--This employee will be a �Cashier� and will report to you.  Make up fake data for the other fields.
INSERT INTO employees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
VALUES ( 2023, 'Cooper', 'Sheldon', 'aaa8', 'cooper.sheldon@myseneca.ca', 1, 2022, 'Cashier' );

--15.	Create a statement to Delete yourself from the database.  Did it work?  If not, why?
DELETE FROM employees
WHERE employeenumber = 2022;
--No, it did not work because the employee Cooper is related to my employee number.  

--16.	Create a statement to delete the fake employee from the database and then rerun the statement to delete yourself.  Did it work?
DELETE FROM employees
WHERE  employeenumber = 2023;
--yes, it did work because is not related to others.

--17.	Create a single statement that will insert both yourself and the fake employee at the same time.  This time the fake employee will report to 1088 as well.
INSERT ALL
INTO employees VALUES ( 2022, 'Castillo', 'Francisco', 'zzz22', 'fcastillo-rojas1@myseneca.ca', 1, 1088, 'Cahier' )
INTO employees VALUES ( 2023, 'Cooper', 'Sheldon', 'aaa8', 'cooper.sheldon@myseneca.ca', 1, 1088, 'Cashier' ) 
SELECT * FROM dual;

--18.	Create a single statement to delete both yourself and the fake employee.
DELETE FROM employees
WHERE employeenumber
IN
    ( 2023,
      2022 );
