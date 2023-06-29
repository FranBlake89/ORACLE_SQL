--//////////////////////////////////////////////////////////////////////////////
--Francisco Castillo

--//////////////////////////////////////////////////////////////////////////////
SET AUTOCOMMIT ON;

--------------------------------------------------------------------------------
-- 1.	Create table the following tables and their given constraints:
CREATE  TABLE DBS211NDD_MOVIES(
    movieid INT,
    title VARCHAR(35) NOT NULL,
    releaseYear INT NOT NULL,
    directorid INT NOT NULL,
    score DECIMAL(3,2)
        CONSTRAINT SCORE_check CHECK
        (   SCORE <= 5 AND  
            SCORE > 0),
    PRIMARY KEY (movieid)
);

CREATE TABLE DBS211NDD_ACTORS(
    actorid INT,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    PRIMARY KEY (actorid)
); 

CREATE TABLE DBS211NDD_CASTINGS (
    movieid INT,
    actorid INT,
    PRIMARY KEY (movieid, actorid),
    CONSTRAINT movie_fk FOREIGN KEY (movieid) REFERENCES DBS211NDD_MOVIES(movieid),
    CONSTRAINT actor_fk FOREIGN KEY (actorid) REFERENCES DBS211NDD_ACTORS(actorid)
);

CREATE TABLE DBS211NDD_DIRECTORS(
    directorid INT,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    PRIMARY KEY ( directorid )
);

--------------------------------------------------------------------------------
--2.	Modify the dbs211ndd_movies table to create a foreign key 
--      constraint that refers to table dbs211ndd_directors. 
ALTER TABLE DBS211NDD_MOVIES
ADD CONSTRAINT director_fk FOREIGN KEY(directorid) REFERENCES DBS211NDD_DIRECTORS;

--------------------------------------------------------------------------------
--3.	Modify the dbs211ndd_movies table to create a new constraint 
--      so the uniqueness of the movie title is guaranteed. 
ALTER TABLE DBS211NDD_MOVIES
ADD CONSTRAINT title_unique UNIQUE(title);

--------------------------------------------------------------------------------
--4.	Write insert statements to add the following data to 
--      table dbs211ndd_directors and dbs211ndd_movies.
INSERT ALL 
INTO DBS211NDD_DIRECTORS VALUES (1010, 'Rob', 'Minkoff')
INTO DBS211NDD_DIRECTORS VALUES (1020, 'Bill', 'Condon')
INTO DBS211NDD_DIRECTORS VALUES (1050, 'Josh', 'Cooley')
INTO DBS211NDD_DIRECTORS VALUES (2010, 'Brad', 'Bird')
INTO DBS211NDD_DIRECTORS VALUES (3020, 'Lake', 'Bell')
SELECT *  FROM dual;

INSERT ALL
INTO DBS211NDD_MOVIES VALUES (100, 'The Lion King', 2019, 3020, 3.50)
INTO DBS211NDD_MOVIES VALUES (200, 'Beauty and the Beast', 2017, 1050, 4.20)
INTO DBS211NDD_MOVIES VALUES (300, 'Toy Story 4', 2019, 1020, 4.50)
INTO DBS211NDD_MOVIES VALUES (400, 'Mission Impossible', 2018, 2010, 5.00)
INTO DBS211NDD_MOVIES VALUES (500, 'The Secret Life of Pets', 2016, 1010, 3.90)
SELECT * FROM dual;

--------------------------------------------------------------------------------
--5.	Write SQL statements to remove all above tables. 
--      Is the order of tables important when removing? Why? 
DROP TABLE DBS211NDD_CASTINGS;
DROP TABLE DBS211NDD_ACTORS;
DROP TABLE DBS211NDD_MOVIES;
DROP TABLE DBS211NDD_DIRECTORS;

-- ~~~> YES, the orders of the tables matters because if we try to delete
--  the tables which has a foreign key from the other table otherwise 
--  it create a problem.
-------------------------------------------------------------------------------
--/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
--                              PART B
--/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
--------------------------------------------------------------------------------
--1.	Create a new empty table dbs211ndd_employee2 the same as table employees.  
--      Use a single statement to create the table and insert the data at the 
--      same time.
CREATE TABLE dbs211ndd_employee2
AS (SELECT * FROM employees);

--------------------------------------------------------------------------------
--2.	Modify table dbs211ndd_employee2 and add a new column username to 
--      this table. The value of this column is not required and does not have 
--      to be unique.
ALTER TABLE dbs211ndd_employee2
ADD username VARCHAR(50);

--------------------------------------------------------------------------------
--3.	Delete all the data in the dbs211ndd_employee2 table
DELETE FROM dbs211ndd_employee2;

--------------------------------------------------------------------------------
--4.	Re-insert all data from the employees table into your new table 
--      dbs211ndd_employee2 using a single statement. 
INSERT INTO dbs211ndd_employee2 (
                employeeNumber, 
                lastName, 
                firstName, 
                extension, 
                email,
                officeCode, 
                reportsTo, 
                jobTitle
                )
SELECT *
FROM employees;

--------------------------------------------------------------------------------
--5.	In table dbs211ndd_employee2, write a SQL statement to change the 
--      first name and the last name of employee with ID 1002 to your name. 
UPDATE dbs211ndd_employee2
SET 
    firstName = 'Francisco',
    lastName = 'Castillo'
WHERE
    employeeNumber = 1002;


--------------------------------------------------------------------------------
--6.	In table dbs211ndd_employee2, generate the email address for 
--      column username for each student by concatenating the first character 
--      of employee�s first name and the employee�s last name. For instance, 
--      the username of employee Peter Stone will be pstone. 
--      NOTE: the username is in all lower case letters.  
SELECT rownum,lower(concat(substr(firstname,1,1),lastname))|| '@gmail.com' 
FROM employees;


--------------------------------------------------------------------------------
--7.	In table dbs211ndd_employee2, remove all employees with office code 4. 
DELETE FROM dbs211ndd_employee2
WHERE
    officeCode = 4;

--------------------------------------------------------------------------------
--8.	Drop table dbs211ndd_employee2. 
DROP TABLE dbs211ndd_employee2;



