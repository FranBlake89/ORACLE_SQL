# ORACLE_SQL

The repository provides a comprehensive set of SQL scripts designed to interact with and retrieve data from the specified databases.
 
>In the collapsed section, you will find a short `description` and the announcement for the `queries`.

>The `Oracle sample database` was used for Project 04 and subsequent projects.

# Content

## 1. Database Management System Project

<details>
<summary> Click to expand! </summary>

### Project Overview

This repository contains the final project for the DBS-211 course. The project involves the design and implementation of a database system for a library management system. It includes the creation of tables, SQL queries, stored procedures, and data population.

### Contributors

- Raymond Javier
- Francisco Castillo
- Gurleen

### Table of Contents

1. [SQL Queries](#sql-queries)
    - [Business Reports](#business-reports)
    - [Create Tables](#create-tables)
    - [Data Source](#data-source)

2. [SQL Queries Details](#sql-queries-details)
    - [Business Reports Details](#business-reports-details)
    - [Create Tables Details](#create-tables-details)
    - [Data Source Details](#data-source-details)

3. [Sample Data Insertion](#sample-data-insertion)

### SQL Queries

#### Business Reports

The `BusinessReport.SQL` file includes SQL queries to generate various reports for the library management system. These reports cover aspects such as due dates, fines, most borrowed books, and user/borrowers reports.

#### Create Tables

The `CreateTable.SQL` file contains SQL scripts to create the necessary tables for the library management system. These tables include `status_library`, `users_library`, `books_library`, `librarians_library`, `sections_library`, `catalogs_library`, and `records_library`.

#### Data Source

The `DataSource.SQL` file includes sample data insertion scripts for the created tables.

### SQL Queries Details

#### Business Reports Details

- The first set of queries focuses on reports related to due dates and overdue books.
- The second set calculates fines for late returns.
- The third set determines the most borrowed books.
- The fourth set generates a user/borrowers report.

#### Create Tables Details

- Creation of tables such as `status_library`, `users_library`, `books_library`, `librarians_library`, `sections_library`, `catalogs_library`, and `records_library`.

#### Data Source Details

- Sample data insertion for each table to populate the database with initial records.

### Sample Data Insertion

The sample data inserted into the tables provides a starting point for testing and development. It includes data for users, books, librarians, sections, catalogs, and records.

Feel free to explore and use this repository for educational or reference purposes. For any inquiries, please contact the contributors.

</details>

## 2. ORACLE_01 - Description and Queries

<details>
<summary> Click to expand! </summary>

## SQL Queries and Views

This SQL script includes queries and view operations for employee and customer data retrieval, using ANSI-89 and ANSI-92 joins, creating the "vwCustomerOrder" view for order information, and refining the "vwEmployeeManager" view.

### Queries

1. Retrieve employee details in Japan using ANSI-89 and ANSI-92 joins.
2. Display payments made by customers from Canada and France.
3. Show all USA customers who haven't made payments.
4. Create and view the "vwCustomerOrder" view for comprehensive order details.
5. Display order information for customer number 124 using the "vwCustomerOrder" view.
6. Show customer details without orders.
7. Create the "vwEmployeeManager" view for employee and manager information.
8. Modify the "vwEmployeeManager" view to include only employees with managers.
9. Drop both the "vwCustomerOrder" and "vwEmployeeManager" views.

</details>
 
## 3. ORACLE_02 - Description and Queries

<details>
<summary> Click to expand! </summary>

## SQL Queries and Operations

This SQL script includes a variety of queries and operations on an employee and customer database. It covers fundamental data retrieval, complex queries like calculating percentage markup, and operations on views and tables, including view creation and modification. The script also demonstrates data manipulation operations such as inserting, updating, and deleting records in the employee database. It concludes with a single statement handling the insertion and deletion of multiple records simultaneously, providing a comprehensive overview of SQL capabilities.

### Queries and Operations

1. Display data for all offices.
2. Retrieve employee numbers for employees in a specific office.
3. Display customer information for a specific city and format contact names.
4. Repeat the previous query with variations in contact name formatting and country filtering.
5. Display customer numbers for customers with payments.
6. List top payments outside a specified range, sorted by amount.
7. Display order information for canceled orders.
8. Calculate and display product markup and percentage markup.
9. Display information for products with a specific string in their names.
10. Display customers with specific letters in their contact names.
11. Insert a new employee record.
12. Display your employee data.
13. Update your job title.
14. Insert a fictional employee record.
15. Attempt to delete yourself (explaining why it may not work).
16. Delete the fictional employee and then delete yourself.
17. Insert both yourself and the fictional employee at the same time.
18. Delete both yourself and the fictional employee.

</details>

## 4. ORACLE_03 - Description and Queries

<details>
<summary> Click to expand! </summary>

## SQL Table Operations

This SQL script performs various operations on tables in a relational database, including table creation, modification, data insertion, and manipulation.

### Part A: Movie Database Operations

1. Create tables for movies, actors, castings, and directors with constraints and foreign keys.
2. Modify the "dbs211ndd_movies" table to add a foreign key constraint referencing the "dbs211ndd_directors" table.
3. Add a unique constraint to the "dbs211ndd_movies" table to guarantee the uniqueness of movie titles.
4. Insert data into tables "dbs211ndd_directors" and "dbs211ndd_movies."
5. Remove tables in the correct order to avoid foreign key constraints.

### Part B: Employee Database Operations

1. Create a new table "dbs211ndd_employee2" identical to the "employees" table and insert data simultaneously.
2. Modify the "dbs211ndd_employee2" table to add a new column "username."
3. Delete all data in the "dbs211ndd_employee2" table.
4. Re-insert data from the "employees" table into "dbs211ndd_employee2."
5. Update the first name and last name of an employee in "dbs211ndd_employee2."
6. Generate email addresses for usernames in "dbs211ndd_employee2."
7. Remove employees with office code 4 from "dbs211ndd_employee2."
8. Drop the "dbs211ndd_employee2" table.

</details>

## 5. ORACLE_04 - Description and Queries

<details>
<summary> Click to expand! </summary>

## Lab 1 DBS311 SQL Queries

This repository contains SQL queries created for Lab 1 of the DBS311 course. Each query addresses a specific task related to database management and SQL querying. Here's a brief overview of the queries:

1. **Tomorrow's Date Format:** Display tomorrow's date in a specific format.
2. **Product Price Update:** Show product details, including new prices increased by 2%, and the price difference.
3. **Employee Job Title Query:** Display full names and job titles for employees whose manager ID is 2.
4. **Years Worked Calculation:** Display employee details and calculate the number of years worked for those hired before October 2016.
5. **Review Date Calculation:** Display employee details and calculate the review date, considering the first Tuesday after a year of service.
6. **Warehouse Information:** Display details for all warehouses, including handling null values for the state column.

</details>

## 6. ORACLE_05 - Description and Queries

<details>
<summary> Click to expand! </summary>

## Lab 2 DBS311 SQL Queries

This repository contains SQL queries created for Lab 2 of the DBS311 course. Each query addresses a specific aspect of querying a sales-related database. Here's a brief overview of the queries:

1. **Total and Average Sales:** Calculate the total and average sales in the database, named "Total" and "Total average per sale."
2. **Sales per Email Domain:** Extend the previous query to calculate total and average sales per email domain.
3. **Monthly Sales Statistics:** Display the name of the month, number of sales, and average sale amount for each month.
4. **User-based Sales Statistics:** Calculate the minimum, maximum, and total sales per user, displaying user details.
5. **Taxed Total Prices:** List every sale ID, sale date, and total price plus tax (assuming a tax rate of 13 percent).

</details>

## 7. ORACLE_06 - Description and Queries

<details>
<summary> Click to expand! </summary>

## Lab 3 DBS311 SQL Queries

This repository contains SQL queries created for Lab 3 of the DBS311 course. Each query addresses a specific aspect of querying a sales-related database. Here's a brief overview of the queries:

1. **Sales for Specific Customer:** Select date and price for all sales made to a customer named "Jane Smith."
2. **Emails with Above-Average Prices:** Retrieve emails for sales where the price is greater than the average for the year 2022.
3. **User Names for Specific Transactions:** Return the names of users associated with specific transaction IDs.
4. **Monthly Sales Percentages:** Calculate the percentage of monthly sales for every year.

</details>

## 8. ORACLE_07 - Description and Queries

<details>
<summary> Click to expand! </summary>

## Lab 4 DBS311 SQL Queries

This repository contains SQL queries developed for Lab 4 of the DBS311 course, showcasing the use of UNION and MINUS set operations. Here's an overview of the queries:

1. **Max Sale Prices and Top Users in 2022:** Retrieve the maximum sale prices per month in 2022 and the users with the most sales for each month. Combine results using UNION.

2. **Users with Purchases in 2021 but Not in 2022:** Identify users who made purchases in 2021 but haven't made any in 2022 using MINUS.

3. **User Purchase Totals:** Select users who made purchases totaling more than $20 in any year and less than $55 in 2022, demonstrating the versatility of set operations.

</details>

## 9. ORACLE_08 - Description and Queries

<details>
<summary> Click to expand! </summary>

## Lab 05 DBS 311 SQL Solutions

This repository contains solutions for Lab 05 of the DBS 311 course, showcasing the implementation of an Oracle SQL procedure and function. Here's an overview:

1. **Birthday Calculator Procedure:** The `birthday_calculator` procedure takes a birthday date as input and outputs the number of days left to the birthday.

2. **Coordinate Distance Function:** The `in_miles` function calculates the distance in miles between two sets of coordinates using the Haversine formula, a method for accurate spherical distance calculations.

</details>


## 10. ORACLE_EXTRA - Description and Queries

<details>
<summary> Click to expand! </summary>

## SQL Queries for Warehouse and Customer Statistics

This repository includes SQL queries for two distinct scenarios:

1. **Warehouse and Product Categories:**
   - Display Warehouse Id, Warehouse Name, Product Category Id, Product Category Name, and the lowest product standard cost.
   - Include rows where the lowest standard cost is less than $200 or more than $500.
   - Sort the output by Warehouse Id, Warehouse Name, Product Category Id, and Product Category Name.

2. **Customer Statistics:**
   - Calculate the number of customers with a total purchase amount over and below the average.
   - Determine the number of customers with no orders.
   - Provide the total number of customers.

</details>

## License

This project is licensed under the [MIT License](https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt).