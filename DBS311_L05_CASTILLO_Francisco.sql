--Francisco Castillo

--NGG
--DBS 311

--Lab 05

-- Q1: 
-- Create a procedure call birthday_calculator. The procedure has one date 
-- input parameter that represents a birthday date. The procedure should output 
-- a message to console that reads: �X number of days to your birthday� where 
-- X represents the integer number of days left to the input date. 

--Q1 SOLUTION --
CREATE OR REPLACE PROCEDURE birthday_calculator ( b_date IN DATE)
AS
    days_left NUMBER;
BEGIN
    days_left := trunc(b_date) - trunc(sysdate);
    dbms_output.put_line(days_left || ' number of days to your birthday');
END birthday_calculator;

-- Q2:  Create a function that returns the distance in miles between 
-- two coordinates. The distance must be returned as a float with two 
-- decimal points. HINT: You can find the formula and how to calculate 
-- the distance in km between two coordinates 
-- here https://www.movable-type.co.uk/scripts/latlong.html

--Q2 SOLUTION --
CREATE OR REPLACE FUNCTION in_miles (lat_1 NUMBER, long_1 NUMBER, lat_2 NUMBER, long_2 NUMBER)
RETURN NUMBER
AS
    dist NUMBER; 
    R NUMBER := 3963.19; --in miles radius = 6378.13 km
    --d = acos( sin ?1 ? sin ?2 + cos ?1 ? cos ?2 ? cos ?? ) ? R
BEGIN
    dist := acos( sin(lat_1) * sin(lat_2) + cos(lat_1) * cos(lat_2) * cos(long_2 - long_1) ) * R;
    RETURN ROUND(dist, 2);
END in_miles;

    