--FRANCISCO CASTILLO
--2022-09-30

--1.	Create a query that shows employee number, first name, last name, city, 
--phone number and postal code for all employees in Japan.
--a.	Answer this question using an ANSI-89 Join
--b.	Answer this question using an ANSI-92 Join
SELECT employeenumber, firstname, lastname, offices.city, offices.phone, offices.postalcode
FROM    employees, 
        offices
WHERE offices.officecode = 5;

SELECT employees.employeenumber, employees.firstname, employees.lastname, offices.city, offices.phone, offices.postalcode
FROM employees 
LEFT OUTER JOIN offices
ON offices.officecode = 5;

--2.	Create a query that displays all payments made by customers from Canada and France.  
--a.	Sort the output by Customer Number.

SELECT customers.customernumber, customers.customername, customers.country, payments.checknumber, payments.paymentdate
FROM customers 
INNER JOIN payments 
    ON customers.country = 'France' 
    OR customers.country = 'Canada'
ORDER BY 
customers.customernumber;

--b.	Only display the Country , Customer Number, Customer Name, Payment Date and Amount.

SELECT customers.customernumber, customers.customername, customers.country, payments.paymentdate, payments.amount
FROM customers 
INNER JOIN payments 
    ON customers.country = 'Canada' 
    OR customers.country = 'France'
ORDER
BY customers.customernumber;

--c.	Make sure the date is displayed clearly to know what date it is. (i.e. what date is 02-04-19??? – Feb 4, 2019,
--April 2, 2019, April 19, 2002, ….)
SELECT c.customernumber, c.customername, TO_CHAR(p.paymentdate,
'MON DD, YYYY'), p.amount
FROM customers c 
INNER JOIN payments p 
    ON c.country = 'Canada' 
    OR c.country='France' 
ORDER 
BY c.customernumber;

--3.	Create a query that shows all USA customers who have not made a payment.  Display only the customer number and 
--customer name sorted by customer number.
--Views and Joins
SELECT c.customernumber, c.customername
FROM customers c 
LEFT OUTER JOIN payments p
    ON c.country = 'USA' 
    AND p.paymentdate != NULL
ORDER 
BY c.customernumber;
--4.	a) Create a view (vwCustomerOrder) to list all orders with the following data for all customers:  
--Customer Number, Order number, order date, product name, quantity ordered, and price for each product in every order.

CREATE VIEW vwCustomerOrder AS
SELECT customernumber, ordernumber, orderdate, p.productname,
quantityordered, priceeach
FROM orders 
JOIN orderdetails 
USING (ordernumber) 
LEFT OUTER JOIN
products p
ON orderdetails.productcode = p.productcode;

--b) Write a statement to view the results of the view just created.
SELECT * FROM vwCustomerOrder;

--5.	Using the vwCustomerOrder  view, display the order information for customer number 124. Sort the output based 
--on order number and then order line number. (Yes, I know orderLineNumber is not in the view)
 SELECT * FROM vwCustomerOrder v LEFT OUTER JOIN orderdetails o
ON v.ordernumber = o.ordernumber
WHERE customernumber = 124
ORDER BY v.ordernumber, orderlinenumber;
 
--6.	Create a query that displays the customer number, first name, last name, phone, and credit limits for all 
--customers who do not have any orders.
SELECT c.customernumber, c.contactfirstname, c.contactlastname, c.phone,
c.creditlimit
FROM customers c LEFT OUTER JOIN orders o
ON o.ordernumber = NULL;

--7.	Create a view (vwEmployeeManager) to display all information of all employees and the name and the last name of 
--their managers if there is any manager that the employee reports to.  Include all employees, including those who do not 
--report to anyone.

--8.	Modify the vwEmployeeManager view so the view returns only employee information for employees who have a manager. 
--Do not DROP and recreate the view – modify it. (Google is your friend).


--9.	Drop both vwCustomerOrder  and vwEmployeeManager views. 
DROP VIEW vwemployeemanager;
DROP VIEW vwCustomerOrder;