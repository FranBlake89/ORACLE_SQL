/*
BusinessReport.SQL
*********************************************************************
FINAL PROJECT DBS-211
*********************************************************************
Names: 
    1.Raymond Javier
    2.Francisco Castillo
    3.Gurleen

Version 1.0
+ Create Business Reports

*********************************************************************
*/

-- Create reports to know who has books near due and overdue
SELECT 
    rec.record_id AS "Record ID",
    (usr.firstname || ' ' || usr.lastname) AS "Borrower Name",
    book.title AS "Book Title",
    book.author AS "Author",
    rec.borrowdate AS "Date Borrowed",
    rec.duedate AS "Due Date"
FROM records_library rec 
    LEFT OUTER JOIN users_library usr 
    ON rec.library_id = usr.library_id
    LEFT OUTER JOIN books_library book
    ON rec.book_id = book.book_id
WHERE RETURNDATE IS NULL;

-- Create reports that compute the fines
SELECT 
    rec.record_id AS "Record ID",
    (usr.firstname || ' ' || usr.lastname) AS "Borrower Name",
    book.title AS "Book Title",
    book.author AS "Author",
    rec.duedate AS "Due Date",
    rec.returndate AS "Date Returned",
    rec.returndate - rec.duedate AS "Days",
    book.fines AS "per Day",
    (((rec.returndate - rec.duedate) * book.fines)/100) AS "Fines ($)"
FROM records_library rec 
    LEFT OUTER JOIN users_library usr 
    ON rec.library_id = usr.library_id
    LEFT OUTER JOIN books_library book
    ON rec.book_id = book.book_id
WHERE RETURNDATE > DUEDATE;


-- Create reports that will show the most borrowed books
SELECT 
    book.title, COUNT(rec.book_id) AS "Total of Borrows"
FROM records_library rec
    LEFT JOIN books_library book
    ON rec.book_id = book.book_id
GROUP BY title
ORDER BY "Total of Borrows" DESC;


-- Create user/borrowers report

SELECT 
    COUNT(rec.library_id) AS Borrows, 
    users.library_id AS "USER ID", 
    users.firstname||' '||users.lastname AS Name
FROM records_library rec
    LEFT JOIN users_library users
    ON  rec.library_id = users.library_id
GROUP BY users.library_id, users.firstname, users.lastname
ORDER BY Borrows DESC;