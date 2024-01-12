/*
DATA SOURCE  
*********************************************************************
FINAL PROJECT DBS-211
*********************************************************************
Names: 
    1.Raymond Javier
    2.Francisco Castillo
    3.Gurleen

Version 1.1
+ Data added (section data population)
Version 1.0
+ Creation of tables

*********************************************************************
*/

SET ECHO OFF;

-- TABLE DROP STATEMENTS

SET VERIFICATION OFF

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE status_library CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE users_library CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE books_library CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE librarians_library CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE sections_library CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE catalogs_library CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE records_library CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/


/* NEW TABLE CREATION */ 
PROMPT '*******  Starting Table Creation';

-- STATUS Table Structure (DDL)
PROMPT '******* Create status table';
CREATE TABLE status_library (
    STATUS VARCHAR2(20) NOT NULL,
    BOOKLIMIT NUMBER(2,0) NOT NULL,
    PRIMARY KEY(STATUS)
);


-- USERS Table Structure (DDL)
PROMPT '******* Create users table';
CREATE TABLE users_library (
    LIBRARY_ID NUMBER(8,0) NOT NULL,
    FIRSTNAME VARCHAR2(30) NOT NULL,
    LASTNAME VARCHAR2(30) NOT NULL,
    PHONE NUMBER(10,0) NOT NULL,
    EMAIL VARCHAR2(125) DEFAULT NULL,
    DOB DATE NOT NULL,
    PHYLOSOPHY NUMBER(1) DEFAULT 0,
    HORROR NUMBER(1) DEFAULT 0,
    SCIENCE NUMBER(1) DEFAULT 0,
    FICTION NUMBER(1) DEFAULT 0,
    MYSTERY NUMBER(1) DEFAULT 0,
    SCIENCEFICTION NUMBER(1) DEFAULT 0,
    PASSWORD VARCHAR2(50) NOT NULL,
    STATUS VARCHAR2(20) NOT NULL,
    PRIMARY KEY (LIBRARY_ID),
    CONSTRAINT status_fk FOREIGN KEY (STATUS) REFERENCES STATUS_LIBRARY(STATUS)
);


-- BOOKS Table Structure (DDL)
PROMPT '******* Create books table';
CREATE TABLE books_library (
    BOOK_ID NUMBER(8,0) NOT NULL,
    TITLE VARCHAR2(100) NOT NULL,
    PUBLISHER VARCHAR2(50) NOT NULL,
    YEAR NUMBER(4,0) NOT NULL,
    AUTHOR VARCHAR2(60) NOT NULL,
    TOTALNUMBER NUMBER(2,0) DEFAULT 0,
    DAYS NUMBER(3,0) DEFAULT 7,
    FINES NUMBER(5,2) DEFAULT 0,
    PRIMARY KEY (BOOK_ID)
);

-- LIBRARIANS Table Structure (DDL)
PROMPT '******* Create librarians table';
CREATE TABLE librarians_library (
    EMPLOYEE_ID NUMBER(8,0) NOT NULL,
    FIRSTNAME VARCHAR2(30) NOT NULL,
    LASTNAME VARCHAR2(30) NOT NULL,
    PHONE NUMBER(10,0) NOT NULL,
    EMAIL VARCHAR2(125) DEFAULT NULL,
    DOB DATE NOT NULL,
    MANAGER_ID NUMBER(8,0) DEFAULT NULL,
    POSTITION VARCHAR2(20) DEFAULT 'Librarians',
    PASSWORD VARCHAR2(50) DEFAULT 'P@ssw0rd',
    PRIMARY KEY (EMPLOYEE_ID),
    CONSTRAINT employee_fk FOREIGN KEY (MANAGER_ID) REFERENCES LIBRARIANS_LIBRARY(EMPLOYEE_ID)
);

-- SECTIONS Table Structure (DDL)
PROMPT '******* Create sections table';
CREATE TABLE sections_library (
    SECTION_ID VARCHAR2(4) NOT NULL,
    SECTIONNAME VARCHAR2(30) NOT NULL,
    DESCRIPTION VARCHAR2(100) DEFAULT NULL,
    GENRE VARCHAR2(30) NOT NULL,
    EMPLOYEE_ID NUMBER(8,0) NOT NULL,
    PRIMARY KEY (SECTION_ID),
    CONSTRAINT employee_sec_fk FOREIGN KEY (EMPLOYEE_ID) REFERENCES LIBRARIANS_LIBRARY(EMPLOYEE_ID)
);

-- CATALOGS Table Structure (DDL)
PROMPT '******* Create catalogs table';
CREATE TABLE catalogs_library (
    SECTION_ID VARCHAR2(4) NOT NULL,
    BOOK_ID NUMBER(8,0) NOT NULL,
    PRIMARY KEY (SECTION_ID, BOOK_ID),
    CONSTRAINT section_fk FOREIGN KEY (SECTION_ID) REFERENCES SECTIONS_LIBRARY(SECTION_ID),
    CONSTRAINT book_fk FOREIGN KEY (BOOK_ID) REFERENCES BOOKS_LIBRARY(BOOK_ID)
);

-- RECORDS Table Structure (DDL)
PROMPT '******* Create records table';
CREATE TABLE records_library (
    RECORD_ID NUMBER(8,0) NOT NULL,
    LIBRARY_ID NUMBER(8,0) NOT NULL,
    BOOK_ID NUMBER(6,0) NOT NULL,
    EMPLOYEE_ID NUMBER(8,0) NOT NULL,
    DUEDATE DATE NOT NULL,
    BORROWDATE DATE NOT NULL,
    RETURNDATE DATE NOT NULL,
    PRIMARY KEY (RECORD_ID),
    CONSTRAINT library_fk FOREIGN KEY (LIBRARY_ID) REFERENCES USERS_LIBRARY(LIBRARY_ID),
    CONSTRAINT book_rec_fk FOREIGN KEY (BOOK_ID) REFERENCES BOOKS_LIBRARY(BOOK_ID),
    CONSTRAINT employee_rec_fk FOREIGN KEY (EMPLOYEE_ID) REFERENCES LIBRARIANS_LIBRARY(EMPLOYEE_ID)
);
-- ------------------------------------------------------------------------------------------------------
-- DATA POPULATION
/*DATA TABLE STATUS_LIBRARY*/
INSERT ALL
    INTO status_library VALUES ( 'GOOD' , '10' )
    INTO status_library VALUES ( 'LATE' , '3' )
    INTO status_library VALUES ( 'BAD' , '1' )
    INTO status_library VALUES ( 'DISABLE' , '0' )
    SELECT * FROM DUAL;
COMMIT;

/*DATA TABLE users_library*/
INSERT ALL  
    INTO users_library VALUES ( '20000001' , 'Bart'	     ,  'Simpson'	, '6472321001'	,   'bart.simpson@gmail.com	     ' ,' 1978/10/01' , 'TRUE' , 'TRUE' , 'TRUE' , 'TRUE' , 'TRUE'  , 'TRUE', 'abCD!12345', 'GOOD' )
    INTO users_library VALUES ( '20000002' , 'Hans'	     ,  'Solo'	    , '4379921002'	,   'hans.solo@gmail.com	     ' ,' 1978/10/02' , 'FALSE', 'FALSE', 'TRUE' , 'TRUE' , 'FALSE'	, 'FALSE'	, 'abCD!12346', 'GOOD' )
    INTO users_library VALUES ( '20000003' , 'Leia'	     ,  'Organa'	, '6478701003'  ,   'leia.organa@gmail.com	     ' ,' 1978/10/03' , 'TRUE' , 'FALSE', 'FALSE', 'FALSE', 'FALSE'	, 'FALSE'	, 'abCD!12347', 'BAD' )
    INTO users_library VALUES ( '20000004' , 'Alexander' ,  'Ramiscal'	, '6479951004'  ,   'alexander.ramiscal@gmail.com' ,' 2005/10/04' , 'FALSE', 'FALSE', 'FALSE', 'TRUE' , 'TRUE'	, 'TRUE'	, 'abCD!12348', 'GOOD' )
    INTO users_library VALUES ( '20000005' , 'Gregory'   ,  'Khan'	    , '4372321005'	,   'gregory.khan@gmail.com	     ' ,' 2008/10/05' , 'TRUE' , 'TRUE' , 'FALSE', 'FALSE', 'FALSE'	, 'TRUE'	, 'abCD!12349', 'GOOD' )
    INTO users_library VALUES ( '20000006' , 'Patrick'	 ,  'Chan' 	    , '6478871006'  ,   'patrick.chan@gmail.com	     ' ,' 2000/10/06' , 'TRUE' , 'TRUE' , 'TRUE' , 'FALSE', 'FALSE'	, 'FALSE'	, 'abCD!12350', 'GOOD' )
    INTO users_library VALUES ( '20000007' , 'Aaron'     ,  'Yu'	    , '4379921007'	,   'aaron.yu@gmail.com	         ' ,' 2010/10/07' , 'TRUE' , 'TRUE' , 'TRUE' , 'TRUE' , 'TRUE'	, 'FALSE'	, 'abCD!12351', 'GOOD' )
    INTO users_library VALUES ( '20000008' , 'Priti'     ,	'Rao'	    , '4163931008'	,   'priti.rao@gmail.com	     ' , '2006/10/08' , 'TRUE' , 'TRUE' , 'FALSE', 'TRUE' , 'TRUE'	, 'TRUE'	, 'abCD!12352', 'GOOD' )
    INTO users_library VALUES ( '20000009' , 'Kishore'   ,	'Kumar'	    , '4163931009'	,   'kishore.kumar@gmail.com	 ' , '1991/10/09' , 'FALSE', 'FALSE', 'TRUE' , 'TRUE' , 'TRUE'	, 'TRUE'	, 'abCD!12353', 'GOOD' )
    INTO users_library VALUES ( '20000010' , 'Baby'      ,	'Gerald'	, '8668501010'  ,   'baby.gerald@gmail.com	     ' , '1992/10/10' , 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE'	, 'TRUE'	, 'abCD!12354', 'LATE' )
    INTO users_library VALUES ( '20000011' , 'Dolph'     ,	'Starbeam'	, '7052071011'  ,   'dolph.starbeam@gmail.com	 ' , '1995/10/11' , 'FALSE', 'FALSE', 'FALSE', 'TRUE' , 'TRUE'	, 'FALSE'	, 'abCD!12355', 'GOOD' )
    INTO users_library VALUES ( '20000012' , 'Luigi'     ,	'Risotto'	, '4379731012'  ,   'luigi.risotto@gmail.com	 ' , '1986/10/12' , 'FALSE', 'FALSE', 'FALSE', 'TRUE' , 'FALSE'	, 'FALSE'	, 'abCD!12356', 'GOOD' )
    INTO users_library VALUES ( '20000013' , 'Homer'     ,	'Simpson'	, '6472321013'  ,   'homer.simpson@gmail.com	 ' , '1988/10/13' , 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'TRUE'	, 'FALSE'	, 'abCD!12357', 'GOOD' )
    INTO users_library VALUES ( '20000014' , 'Selma'     ,	'Bouvier'	, '4374561014'  ,   'selma.bouvier@gmail.com	 ' , '1999/10/14' , 'TRUE' , 'FALSE', 'FALSE', 'TRUE' , 'FALSE'	, 'FALSE'	, 'abCD!12358', 'GOOD' )
    INTO users_library VALUES ( '20000015' , 'Ralph'     ,	'Wiggum'	, '4377981015'  ,   'ralph.wiggum@gmail.com	     ' , '2001/10/15' , 'FALSE', 'TRUE' , 'TRUE' , 'FALSE', 'FALSE'	, 'FALSE'	, 'abCD!12359', 'LATE' )
    INTO users_library VALUES ( '20000016' , 'Barney'    ,	'Gumble'	, '4161231016'  ,   'barney.gumble@gmail.com	 ' , '2011/10/16' , 'TRUE' , 'FALSE', 'FALSE', 'FALSE', 'FALSE'	, 'TRUE'	, 'abCD!12360', 'GOOD' )
    INTO users_library VALUES ( '20000017' , 'Rod'       ,	'Flanders'	, '4164561017'  ,   'rod.flanders@gmail.com	     ' , '2008/10/17' , 'FALSE', 'TRUE' , 'TRUE' , 'FALSE', 'FALSE'	, 'TRUE'	, 'abCD!12361', 'GOOD' )
    INTO users_library VALUES ( '20000018' , 'Carl'      ,	'Carlson'	, '6471231018'  ,   'carl.carlson@gmail.com	     ' , '2008/10/18' , 'TRUE' , 'FALSE', 'FALSE', 'TRUE' , 'TRUE'	, 'TRUE'	, 'abCD!12362', 'GOOD' )
    INTO users_library VALUES ( '20000019' , 'Helen'     ,	'Lovejoy'	, '6474561019'  ,   'helen.lovejoy@gmail.com	 ' , '1977/10/19' , 'TRUE' , 'TRUE' , 'FALSE', 'TRUE' , 'FALSE'	, 'FALSE'   , 'abCD!12363', 'GOOD' )
    INTO users_library VALUES ( '20000020' , 'Shauna'    ,	'Chalmers'	, '6477891020'  ,   'shauna.chalmers@gmail.com	 ' , '1987/10/20' , 'FALSE', 'TRUE' , 'FALSE', 'TRUE' , 'FALSE'	, 'TRUE'    , 'abCD!12364', 'GOOD' )
    INTO users_library VALUES ( '20000021' , 'Bernice'   ,	'Hibbert'	, '7051231021'  ,   'bernice.hibbert@gmail.com	 ' , '1998/10/21' , 'TRUE' , 'FALSE', 'TRUE' , 'FALSE', 'TRUE'	, 'FALSE'   , 'abCD!12365', 'GOOD' )
    INTO users_library VALUES ( '20000022' , 'Dewey'     ,	'Largo'	    , '7054561022'	,   'dewey.largo@gmail.com	     ' , '1978/10/22' , 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE'	, 'FALSE'   , 'abCD!12366', 'GOOD' )
    INTO users_library VALUES ( '20000023' , 'Herman'    ,	'Hermann'	, '7057891023'  ,   'herman.hermann@gmail.com	 ' , '2003/10/23' , 'FALSE', 'FALSE', 'FALSE', 'TRUE' , 'TRUE'	, 'FALSE'   , 'abCD!12367', 'GOOD' )
    INTO users_library VALUES ( '20000024' , 'Lindsey'   ,	'Naegle'	, '4166471024'  ,   'lindsey.naegle@gmail.com	 ' , '2004/10/24' , 'FALSE', 'TRUE' , 'FALSE', 'FALSE', 'TRUE'	, 'FALSE'   , 'abCD!12368', 'GOOD' )
    INTO users_library VALUES ( '20000025' , 'Ned'       ,	'Flanders'	, '4161471025'  ,   'ned.flanders@gmail.com	     ' , '2003/10/25' , 'FALSE', 'TRUE' , 'TRUE' , 'FALSE', 'FALSE'	, 'FALSE'   , 'abCD!12369', 'GOOD' )
    INTO users_library VALUES ( '20000026' , 'Kent'      ,	'Brockman'	, '4162581026'  ,   'kent.brockman@gmail.com	 ' , '2006/10/26' , 'TRUE' , 'TRUE' , 'FALSE', 'FALSE', 'FALSE'	, 'FALSE'   , 'abCD!12370', 'GOOD' )
    INTO users_library VALUES ( '20000027' , 'Todd'      ,	'Flanders'	, '4163691027'  ,   'todd.flanders@gmail.com	 ' , '2003/10/27' , 'TRUE' , 'FALSE', 'FALSE', 'TRUE' , 'TRUE'	, 'TRUE'    , 'abCD!12371', 'GOOD' )
    INTO users_library VALUES ( '20000028' , 'Allison'   ,	'Taylor'    , '4371231028'  ,	'allison.taylor@gmail.com	 ' , '1998/10/28' , 'TRUE' , 'FALSE', 'FALSE', 'FALSE', 'TRUE'  , 'TRUE'    , 'abCD!12372', 'GOOD')
    INTO users_library VALUES ( '20000029' , 'Marge'     ,	'Simpson'   , '4371471029'  ,	'marge.simpson@gmail.com	 ' , '2997/10/29' , 'TRUE' , 'TRUE' , 'TRUE' , 'FALSE', 'FALSE' , 'FALSE'   , 'abCD!12373', 'DISABLE' )
    INTO users_library VALUES ( '20000030' , 'Martin'    ,	'Prince'    , '4372581030'  ,	'martin.prince@gmail.com	 ' , '1978/10/30' , 'TRUE' , 'TRUE'	, 'TRUE' , 'TRUE' , 'TRUE'  , 'FALSE'	,' abCD!12374', 'GOOD' )
    INTO users_library VALUES ( '20000031' , 'Sarah'     ,	'Wiggum'    , '4373691031'  ,	'sarah.wiggum@gmail.com	     ' , '2002/10/31' , 'TRUE' , 'TRUE'	, 'TRUE' , 'TRUE' , 'FALSE' , 'TRUE'	,' abCD!12375', 'LATE' )
    INTO users_library VALUES ( '20000032' , 'Uter'      ,	'Zorker'    , '4168841032'  ,	'uter.zorker@gmail.com	     ' , '1979/11/01' , 'TRUE' , 'TRUE'	, 'TRUE' , 'FALSE', 'TRUE'	, 'TRUE'	,' abCD!12376', 'GOOD' )
    INTO users_library VALUES ( '20000033' , 'Hans'      ,	'Moleman'	, '4166841033'  ,	'hans.moleman@gmail.com	     ' , '2001/11/02' , 'TRUE' , 'TRUE'	, 'FALSE', 'TRUE' , 'TRUE'	, 'TRUE'	,' abCD!12377', 'GOOD' )
    INTO users_library VALUES ( '20000034' , 'Jimbo'     ,	'Jones'     , '6174311034'  ,	'jimbo.jones@gmail.com	     ' , '1989/11/03' , 'TRUE' , 'FALSE', 'TRUE' , 'TRUE' , 'TRUE'	, 'TRUE'	,' abCD!12378', 'GOOD' )
    INTO users_library VALUES ( '20000035' , 'Elizabeth' ,	'Hoover'    , '6174561035'  ,	'elizabeth.hoover@gmail.com	 ' , '1994/11/04' , 'TRUE' , 'TRUE'	, 'TRUE' , 'TRUE' , 'TRUE'	, 'TRUE'	,' abCD!12379', 'GOOD' )
    INTO users_library VALUES ( '20000036' , 'Patty'     ,	'Bouvier'	, '6477651036'  ,	'patty.bouvier@gmail.com	 ' , '1998/11/05' , 'FALSE', 'FALSE', 'TRUE' , 'TRUE' , 'TRUE'	, 'TRUE'	,' abCD!12380', 'BAD' )
    INTO users_library VALUES ( '20000037' , 'Troy'      ,	'McClure'	, '6474321037'  ,	'troy.mcclure@gmail.com	     ' , '2003/11/06' , 'TRUE' , 'TRUE' , 'FALSE', 'FALSE', 'TRUE'	, 'TRUE'	,' abCD!12381', 'BAD' )
    INTO users_library VALUES ( '20000038' , 'Alice'     ,	'Glick'     , '4013371038'  ,	'alice.glick@gmail.com	     ' , '2004/11/07' , 'TRUE' , 'TRUE'	, 'TRUE' , 'TRUE' , 'FALSE' , 'FALSE'	,' abCD!12382', 'GOOD' )
    INTO users_library VALUES ( '20000039' , 'Ruth'      ,	'Powers'    , '6472321039'  ,	'ruth.powers@gmail.com	     ' , '1978/11/08' , 'TRUE' , 'TRUE'	, 'TRUE' , 'TRUE' , 'FALSE' , 'FALSE'	,' abCD!12383', 'GOOD' )
    INTO users_library VALUES ( '20000040' , 'Chris'     ,	'Griffin'	, '6478851040'  ,	'chris.griffin@gmail.com	 ' , '2001/11/09' , 'FALSE', 'FALSE', 'FALSE', 'TRUE' , 'TRUE'	, 'TRUE'	,' abCD!12384', 'GOOD' )
SELECT * FROM DUAL
COMMIT;

/*DATA TABLE books_library*/
INSERT ALL
    INTO book_library VALUES (	'997286',	'Atomic Habit',	'Penguin Random House',	'2021',	'James Clear',	'50',	'15',	'10')
    INTO book_library VALUES (	'74728',	'Good-Bye Jim',	'Grosset & Dunlap',	'1913',	'James Whitcomb Riley',	'2',	'5',	'100')
    INTO book_library VALUES (	'936301',	'Calculus',	'CENGAGE Learning',	'2006',	'James Stewart',	'40',	'20',	'2')
    INTO book_library VALUES (	'514560',	'the theory',	'harlem',	'1999',	'River s',	'1',	'3',	'500')
    INTO book_library VALUES (	'30334',	'ABSALOM, ABSALOM!',	'pinguin',	'2000',	'WILLIAM FAULKNER',	'38',	'3',	'9')
    INTO book_library VALUES (	'962595',	'A TIME TO KILL',	'lards ',	'2008',	'JOHN GRISHAM',	'33',	'20',	'5')
    INTO book_library VALUES (	'678926',	'THE HOUSE OF MIRTH',	'df',	'1976',	'EDITH WHARTON',	'19',	'16',	'1')
    INTO book_library VALUES (	'419781',	'EAST OF EDEN',	'TouchWood Editions',	'1992',	'JOHN STEINBECK',	'37',	'13',	'3')
    INTO book_library VALUES (	'287268',	'THE SUN ALSO RISES',	'Dundurn Press',	'2009',	'ERNEST HEMINGWAY',	'47',	'7',	'4')
    INTO book_library VALUES (	'698847',	'VILE BODIES',	'hqn',	'1979',	'EVELYN WAUGH',	'45',	'14',	'5')
    INTO book_library VALUES (	'202876',	'A SCANNER DARKLY',	'socan',	'1995',	'PHILIP K. DICK',	'20',	'19',	'8')
    INTO book_library VALUES (	'956990',	'MOAB IS MY WASHPOT',	'nelson education',	'1972',	'STEPHEN FRY',	'10',	'13',	'2')
    INTO book_library VALUES (	'783814',	'NUMBER THE STARS',	'drawn and quarterly',	'2008',	'LOIS LOWRY',	'30',	'14',	'3')
    INTO book_library VALUES (	'985780',	'NOLI ME TANGERE',	'annick press ltd',	'2014',	'JOSÉ RIZAL',	'1',	'9',	'10')
    INTO book_library VALUES (	'746394',	'BRAVE NEW WORLD',	'vancoucer sun',	'1985',	'ALDOUS HUXLEY',	'38',	'5',	'9')
    INTO book_library VALUES (	'988697',	'PALE FIRE',	'the toronto sun',	'2007',	'VLADIMIR NABOKOV',	'29',	'18',	'10')
    INTO book_library VALUES (	'540072',	'REMEMBRANCE OF THINGS PAST',	'Dundurn Press',	'2008',	'MARCEL PROUST',	'14',	'20',	'4')
    INTO book_library VALUES (	'340026',	'THE FAULT IN OUR STARS',	'socan',	'1978',	'JOHN GREEN',	'39',	'16',	'2')
    INTO book_library VALUES (	'591682',	'COLD COMFORT FARM',	'Grosset & Dunlap',	'2014',	'STELLA GIBBONS',	'18',	'13',	'9')
    INTO book_library VALUES (	'941024',	'IN COLD BLOOD',	'pinguin',	'2002',	'TRUMAN CAPOTE',	'14',	'11',	'9')
    INTO book_library VALUES (	'859110',	'THE LONG DARK TEA-TIME OF THE SOUL',	'Dundurn Press',	'2003',	'DOUGLAS ADAMS',	'12',	'17',	'7')
    INTO book_library VALUES (	'66414',	'OF HUMAN BONDAGE',	'Grosset & Dunlap',	'2005',	'W. SOMERSET MAUGHAM',	'41',	'19',	'3')
    INTO book_library VALUES (	'279749',	'VANITY FAIR',	'CENGAGE Learning',	'1974',	'WILLIAM MAKEPEACE THACKERAY',	'26',	'15',	'6')
    INTO book_library VALUES (	'157602',	'THE WASTE LAND',	'Penguin Random House',	'2020',	'T.S. ELIOT',	'46',	'8',	'7')
    INTO book_library VALUES (	'497772',	'THE CURIOUS INCIDENT OF THE DOG IN THE NIGHT-TIME',	'CENGAGE Learning',	'1997',	'MARK HADDON',	'41',	'18',	'7')
    INTO book_library VALUES (	'699779',	'A CONFEDERACY OF DUNCES',	'pinguin',	'1976',	'JOHN KENNEDY TOOLE',	'24',	'3',	'1')
    INTO book_library VALUES (	'467708',	'THE LINE OF BEAUTY',	'df',	'1990',	'ALAN HOLLINGHURST',	'24',	'5',	'6')
    INTO book_library VALUES (	'935846',	'DYING OF THE LIGHT',	'drawn and quarterly',	'2011',	'GEORGE R.R. MARTIN',	'28',	'8',	'8')
    INTO book_library VALUES (	'290429',	'THIS SIDE OF PARADISE',	'CENGAGE Learning',	'2009',	'F. SCOTT FITZGERALD',	'24',	'15',	'9')
    INTO book_library VALUES (	'700079',	'OF MICE AND MEN',	'annick press ltd',	'1987',	'JOHN STEINBECK',	'10',	'5',	'6')
    INTO book_library VALUES (	'437349',	'A THOUSAND SPLENDID SUNS',	'Dundurn Press',	'2010',	'KHALED HOSSEINI',	'44',	'15',	'7')
    INTO book_library VALUES (	'721598',	'Database Design',	'harlem',	'2004',	'Mere Mortals',	'21',	'16',	'7')
    INTO book_library VALUES (	'175775',	'Beginning Database Design Solutions',	'pinguin',	'1983',	'Rod Stephens ',	'17',	'20',	'9')
    INTO book_library VALUES (	'901390',	'Six-Step Relational Database Design',	'socan',	'1975',	'Fidel A Captain ',	'30',	'17',	'9')
    INTO book_library VALUES (	'539275',	'Pro SQL Server 2008 Relational Database Design and Implementation',	'drawn and quarterly',	'1976',	'Louis Davidson, Kevin Kline, Scott Klein',	'36',	'19',	'7')
    INTO book_library VALUES (	'235892',	'To Kill A Mockingbird',	'vancoucer sun',	'2014',	'Harper Lee',	'8',	'8',	'8')
    INTO book_library VALUES (	'727606',	'A Promised Land',	'pinguin',	'2019',	'Barack Obama',	'48',	'4',	'3')
    INTO book_library VALUES (	'745811',	'The Hunger Games',	'drawn and quarterly',	'1983',	'Suzanne Collins',	'15',	'18',	'5')
    INTO book_library VALUES (	'768186',	'The Time Machine',	'annick press ltd',	'1986',	'H.G. Wells',	'6',	'20',	'10')
    INTO book_library VALUES (	'676185',	'The Grass is Always Greener',	'pinguin',	'2004',	'Jeffrey Archer',	'31',	'17',	'2')
SELECT * FROM DUAL
COMMIT;

/* DATA TABLE librarians_library */
INSERT ALL
    INTO librarians_library VALUES ( 	'10000000',	'Juan',	'Smith',	'4375582201',	'juan.smith@gmail.com',	'03/20/1989',	'NULL',	'manager',	'1234')
    INTO librarians_library VALUES ( 	'10000001',	'John',	'Carlston',	'2235415587',	'j.carlston@hotmail.com',	'5/5/1990',	'10000000',	'employee',	'1254')
    INTO librarians_library VALUES ( 	'10000002',	'Raymond',	'Bell',	'2221540025',	'r.bell@gmail.com',	'12/5/1988',	'10000000',	'employee',	'4578')
    INTO librarians_library VALUES ( 	'10000003',	'Rose',	'Johnson',	'4245550057',	'r.johnson@outlook.com',	'1/25/1980',	'10000000',	'employee',	'6554')
    INTO librarians_library VALUES ( 	'10000004',	'Vera',	'Williams',	'4372258802',	'vera.w@gmail.com',	'2/15/1995',	'10000000',	'employee',	'1258')
    INTO librarians_library VALUES ( 	'10000005',	'Rita',	'Garcia',	'5582204408',	'rita.garcia@hotmail.com',	'5/20/2000',	'10000000',	'employee',	'8547')
SELECT * FROM DUAL
COMMIT;

/* DATA TABLE sections_library */
INSERT ALL
    INTO sections_library VALUES ( 	'A',	'Section A',	'Books about phylosophy and others',	'Phylosophy',	'10000002')
    INTO sections_library VALUES ( 	'B',	'Section B',	'Book related to horror',	'Horror',	'10000001')
    INTO sections_library VALUES ( 	'C',	'Section C',	'Science books, computer science, math, biology',	'science',	'10000002')
    INTO sections_library VALUES ( 	'D',	'Section D',	'fiction book, best sellers',	'Fiction',	'10000003')
    INTO sections_library VALUES ( 	'E',	'Section E',	'mystery book, canadian books',	'mystery',	'10000004')
    INTO sections_library VALUES ( 	'F',	'Section F',	'science fiction books, special section to anime and comic',	'science fiction',	'10000005')
SELECT * FROM DUAL
COMMIT;

/* DATA TABLE  catalogs_library */
INSERT ALL
    INTO catalogs_library VALUES ( 	'A',	'997286')
    INTO catalogs_library VALUES ( 	'B',	'74728')
    INTO catalogs_library VALUES ( 	'C',	'936301')
    INTO catalogs_library VALUES ( 	'D',	'514560')
    INTO catalogs_library VALUES ( 	'E',	'30334')
    INTO catalogs_library VALUES ( 	'F',	'962595')
    INTO catalogs_library VALUES ( 	'A',	'678926')
    INTO catalogs_library VALUES ( 	'B',	'419781')
    INTO catalogs_library VALUES ( 	'C',	'287268')
    INTO catalogs_library VALUES ( 	'D',	'698847')
    INTO catalogs_library VALUES ( 	'E',	'202876')
    INTO catalogs_library VALUES ( 	'F',	'956990')
    INTO catalogs_library VALUES ( 	'A',	'783814')
    INTO catalogs_library VALUES ( 	'B',	'985780')
    INTO catalogs_library VALUES ( 	'C',	'746394')
    INTO catalogs_library VALUES ( 	'D',	'988697')
    INTO catalogs_library VALUES ( 	'E',	'540072')
    INTO catalogs_library VALUES ( 	'F',	'340026')
    INTO catalogs_library VALUES ( 	'A',	'591682')
    INTO catalogs_library VALUES ( 	'B',	'941024')
    INTO catalogs_library VALUES ( 	'C',	'859110')
    INTO catalogs_library VALUES ( 	'D',	'66414')
    INTO catalogs_library VALUES ( 	'E',	'279749')
    INTO catalogs_library VALUES ( 	'F',	'157602')
    INTO catalogs_library VALUES ( 	'A',	'497772')
    INTO catalogs_library VALUES ( 	'B',	'699779')
    INTO catalogs_library VALUES ( 	'C',	'467708')
    INTO catalogs_library VALUES ( 	'D',	'935846')
    INTO catalogs_library VALUES ( 	'E',	'290429')
    INTO catalogs_library VALUES ( 	'F',	'700079')
    INTO catalogs_library VALUES ( 	'A',	'437349')
    INTO catalogs_library VALUES ( 	'B',	'721598')
    INTO catalogs_library VALUES ( 	'C',	'175775')
    INTO catalogs_library VALUES ( 	'D',	'901390')
    INTO catalogs_library VALUES ( 	'E',	'539275')
    INTO catalogs_library VALUES ( 	'F',	'235892')
    INTO catalogs_library VALUES ( 	'A',	'727606')
    INTO catalogs_library VALUES ( 	'B',	'745811')
    INTO catalogs_library VALUES ( 	'C',	'768186')
    INTO catalogs_library VALUES ( 	'D',	'676185')
SELECT * FROM DUAL
COMMIT;

/* DATA TABLE records_library */
INSERT ALL
    INTO records_library VALUES ( 	'30000001',	'20000001',	'997286',	'10000002',	'16-1-22',	'1-1-22',	'10-1-22')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'419781',	'10000001',	'14-1-22',	'1-1-22',	'10-1-22')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'746394',	'10000002',	'6-1-22',	'1-1-22',	'6-1-22')
    INTO records_library VALUES ( 	'NULL',	'20000003',	'997286',	'10000002',	'25-1-22',	'10-1-22',	'31-1-22')
    INTO records_library VALUES ( 	'NULL',	'20000003',	'678926',	'10000002',	'31-1-22',	'10-1-22',	'31-1-22')
    INTO records_library VALUES ( 	'NULL',	'20000010',	'962595',	'10000005',	'30-1-22',	'10-1-22',	'30-1-22')
    INTO records_library VALUES ( 	'NULL',	'20000010',	'956990',	'10000005',	'23-1-22',	'10-1-22',	'23-1-22')
    INTO records_library VALUES ( 	'NULL',	'20000029',	'591682',	'10000002',	'2-2-22',	'20-1-22',	'NULL')
    INTO records_library VALUES ( 	'NULL',	'20000029',	'941024',	'10000001',	'31-1-22',	'20-1-22',	'NULL')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'66414',	'10000003',	'29-1-22',	'10-1-22',	'25-1-22')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'290429',	'10000004',	'26-1-22',	'10-1-22',	'25-1-22')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'700079',	'10000005',	'15-1-22',	'10-1-22',	'15-1-22')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'437349',	'10000002',	'25-1-22',	'10-1-22',	'25-1-22')
    INTO records_library VALUES ( 	'NULL',	'20000037',	'74728',	'10000001',	'6-1-22',	'20-1-22',	'30-1-22')
    INTO records_library VALUES ( 	'NULL',	'20000037',	'30334',	'10000004',	'4-1-22',	'20-1-22',	'30-1-22')
    INTO records_library VALUES ( 	'NULL',	'20000002',	'936301',	'10000002',	'9-2-22',	'20-1-22',	'30-1-22')
    INTO records_library VALUES ( 	'NULL',	'20000002',	'514560',	'10000003',	'23-1-22',	'20-1-22',	'23-1-22')
    INTO records_library VALUES ( 	'NULL',	'20000004',	'30334',	'10000004',	'4-2-22',	'1-2-22',	'4-2-22')
    INTO records_library VALUES ( 	'NULL',	'20000004',	'962595',	'10000005',	'21-2-22',	'1-2-22',	'21-2-22')
    INTO records_library VALUES ( 	'NULL',	'20000006',	'175775',	'10000002',	'21-2-22',	'1-2-22',	'21-2-22')
    INTO records_library VALUES ( 	'NULL',	'20000007',	'988697',	'10000003',	'19-2-22',	'1-2-22',	'19-2-22')
    INTO records_library VALUES ( 	'NULL',	'20000003',	'783814',	'10000002',	'24-2-22',	'10-2-22',	'24-2-22')
    INTO records_library VALUES ( 	'NULL',	'20000003',	'985780',	'10000001',	'19-2-22',	'10-2-22',	'24-2-22')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'745811',	'10000001',	'19-3-22',	'1-3-22',	'15-3-22')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'768186',	'10000002',	'21-3-22',	'1-3-22',	'15-3-22')
    INTO records_library VALUES ( 	'NULL',	'20000010',	'340026',	'10000005',	'17-3-22',	'1-3-22',	'9-3-22')
    INTO records_library VALUES ( 	'NULL',	'20000010',	'157602',	'10000005',	'9-3-22',	'1-3-22',	'9-3-22')
    INTO records_library VALUES ( 	'NULL',	'20000008',	'539275',	'10000004',	'20-3-22',	'1-3-22',	'20-3-22')
    INTO records_library VALUES ( 	'NULL',	'20000009',	'467708',	'10000002',	'15-3-22',	'10-3-22',	'15-3-22')
    INTO records_library VALUES ( 	'NULL',	'20000011',	'935846',	'10000003',	'18-3-22',	'10-3-22',	'18-3-22')
    INTO records_library VALUES ( 	'NULL',	'20000015',	'74728',	'10000001',	'15-3-22',	'10-3-22',	'30-3-22')
    INTO records_library VALUES ( 	'NULL',	'20000015',	'936301',	'10000002',	'30-3-22',	'10-3-22',	'30-3-22')
    INTO records_library VALUES ( 	'NULL',	'20000012',	'514560',	'10000003',	'23-3-22',	'20-3-22',	'23-3-22')
    INTO records_library VALUES ( 	'NULL',	'20000012',	'698847',	'10000003',	'3-4-22',	'20-3-22',	'3-4-22')
    INTO records_library VALUES ( 	'NULL',	'20000013',	'279749',	'10000004',	'4-4-22',	'20-3-22',	'4-4-22')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'74728',	'10000001',	'6-4-22',	'1-4-22',	'6-4-22')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'936301',	'10000002',	'21-4-22',	'1-4-22',	'6-4-22')
    INTO records_library VALUES ( 	'NULL',	'20000014',	'997286',	'10000002',	'16-4-22',	'1-4-22',	'16-4-22')
    INTO records_library VALUES ( 	'NULL',	'20000016',	'962595',	'10000005',	'21-4-22',	'1-4-22',	'21-4-22')
    INTO records_library VALUES ( 	'NULL',	'20000016',	'956990',	'10000005',	'14-4-22',	'1-4-22',	'14-4-22')
    INTO records_library VALUES ( 	'NULL',	'20000017',	'941024',	'10000001',	'12-4-22',	'1-4-22',	'12-4-22')
    INTO records_library VALUES ( 	'NULL',	'20000017',	'859110',	'10000002',	'18-4-22',	'1-4-22',	'18-4-22')
    INTO records_library VALUES ( 	'NULL',	'20000018',	'514560',	'10000003',	'13-4-22',	'10-4-22',	'13-4-22')
    INTO records_library VALUES ( 	'NULL',	'20000019',	'985780',	'10000001',	'19-4-22',	'10-4-22',	'19-4-22')
    INTO records_library VALUES ( 	'NULL',	'20000020',	'941024',	'10000001',	'21-4-22',	'10-4-22',	'21-4-22')
    INTO records_library VALUES ( 	'NULL',	'20000020',	'157602',	'10000005',	'18-4-22',	'10-4-22',	'18-4-22')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'514560',	'10000003',	'18-4-22',	'15-4-22',	'18-4-22')
    INTO records_library VALUES ( 	'NULL',	'20000031',	'727606',	'10000002',	'24-4-22',	'20-4-22',	'30-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000031',	'745811',	'10000001',	'8-5-22',	'20-4-22',	'30-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000031',	'768186',	'10000002',	'10-5-22',	'20-4-22',	'30-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000021',	'175775',	'10000002',	'10-5-22',	'20-4-22',	'7-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000021',	'901390',	'10000003',	'7-5-22',	'20-4-22',	'7-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000022',	'997286',	'10000002',	'15-5-22',	'30-4-22',	'15-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000023',	'279749',	'10000004',	'15-5-22',	'30-4-22',	'15-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000024',	'721598',	'10000001',	'16-5-22',	'30-4-22',	'16-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000010',	'700079',	'10000005',	'6-5-22',	'1-5-22',	'5-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000010',	'235892',	'10000005',	'9-5-22',	'1-5-22',	'5-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000010',	'727606',	'10000002',	'5-5-22',	'1-5-22',	'5-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'30334',	'10000004',	'4-5-22',	'1-5-22',	'4-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'962595',	'10000005',	'21-5-22',	'1-5-22',	'20-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000015',	'419781',	'10000001',	'23-5-22',	'10-5-22',	'17-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000015',	'287268',	'10000002',	'17-5-22',	'10-5-22',	'17-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000015',	'985780',	'10000001',	'19-5-22',	'10-5-22',	'17-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000036',	'514560',	'10000003',	'13-5-22',	'10-5-22',	'30-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000036',	'30334',	'10000004',	'13-5-22',	'10-5-22',	'30-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000025',	'936301',	'10000002',	'30-5-22',	'10-5-22',	'30-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000026',	'997286',	'10000002',	'30-5-22',	'10-5-22',	'30-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000027',	'988697',	'10000003',	'2-6-22',	'15-5-22',	'2-6-22')
    INTO records_library VALUES ( 	'NULL',	'20000028',	'591682',	'10000002',	'28-5-22',	'15-5-22',	'28-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000003',	'497772',	'10000002',	'2-6-22',	'15-5-22',	'2-6-22')
    INTO records_library VALUES ( 	'NULL',	'20000003',	'437349',	'10000002',	'30-5-22',	'15-5-22',	'2-6-22')
    INTO records_library VALUES ( 	'NULL',	'20000003',	'727606',	'10000002',	'19-5-22',	'15-5-22',	'1-7-22')
    INTO records_library VALUES ( 	'NULL',	'20000037',	'9411024',	'10000001',	'31-5-22',	'20-5-22',	'30-6-22')
    INTO records_library VALUES ( 	'NULL',	'20000037',	'279749',	'10000004',	'4-6-22',	'20-5-22',	'30-6-22')
    INTO records_library VALUES ( 	'NULL',	'20000030',	'30334',	'10000004',	'23-5-22',	'20-5-22',	'23-5-22')
    INTO records_library VALUES ( 	'NULL',	'20000030',	'539275',	'10000004',	'9-6-22',	'20-5-22',	'9-6-22')
    INTO records_library VALUES ( 	'NULL',	'20000032',	'437349',	'10000002',	'4-6-22',	'20-5-22',	'4-6-22')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'859110',	'10000002',	'18-6-22',	'1-6-22',	'15-6-22')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'66414',	'10000003',	'20-6-22',	'1-6-22',	'15-6-22')
    INTO records_library VALUES ( 	'NULL',	'20000001',	'279749',	'10000004',	'16-6-22',	'1-6-22',	'15-6-22')
    INTO records_library VALUES ( 	'NULL',	'20000036',	'698847',	'10000003',	'15-6-22',	'1-6-22',	'30-7-22')
    INTO records_library VALUES ( 	'NULL',	'20000036',	'202876',	'10000004',	'20-6-22',	'1-6-22',	'30-7-22')
    INTO records_library VALUES ( 	'NULL',	'20000033',	'74728',	'10000001',	'15-6-22',	'10-6-22',	'15-6-22')
    INTO records_library VALUES ( 	'NULL',	'20000033',	'419781',	'10000001',	'23-6-22',	'10-6-22',	'23-6-22')
    INTO records_library VALUES ( 	'NULL',	'20000034',	'936301',	'10000002',	'30-6-22',	'10-6-22',	'30-6-22')
    INTO records_library VALUES ( 	'NULL',	'20000034',	'287268',	'10000002',	'17-6-22',	'10-6-22',	'17-6-22')
    INTO records_library VALUES ( 	'NULL',	'20000035',	'962595',	'10000005',	'10-7-22',	'20-6-22',	'10-7-22')
    INTO records_library VALUES ( 	'NULL',	'20000035',	'956990',	'10000005',	'3-7-22',	'20-6-22',	'3-7-22')
    INTO records_library VALUES ( 	'NULL',	'20000010',	'997286',	'10000002',	'16-7-22',	'1-7-22',	'20-7-22')
    INTO records_library VALUES ( 	'NULL',	'20000010',	'74728',	'10000001',	'6-7-22',	'1-7-22',	'20-7-22')
    INTO records_library VALUES ( 	'NULL',	'20000003',	'745811',	'10000001',	'19-7-22',	'1-7-22',	'1-9-22')
    INTO records_library VALUES ( 	'NULL',	'20000003',	'768186',	'10000002',	'21-7-22',	'1-7-22',	'1-9-22')
    INTO records_library VALUES ( 	'NULL',	'20000003',	'676185',	'10000003',	'18-7-22',	'1-7-22',	'1-9-22')
    INTO records_library VALUES ( 	'NULL',	'20000015',	'699779',	'10000001',	'4-8-22',	'1-8-22',	'6-8-22')
    INTO records_library VALUES ( 	'NULL',	'20000015',	'467708',	'10000002',	'6-8-22',	'1-8-22',	'6-8-22')
    INTO records_library VALUES ( 	'NULL',	'20000038',	'514560',	'10000003',	'4-9-22',	'1-9-22',	'4-9-22')
    INTO records_library VALUES ( 	'NULL',	'20000038',	'698847',	'10000003',	'16-9-22',	'1-9-22',	'16-9-22')
    INTO records_library VALUES ( 	'NULL',	'20000038',	'988697',	'10000003',	'19-9-22',	'1-9-22',	'19-9-22')
    INTO records_library VALUES ( 	'NULL',	'20000039',	'997286',	'10000002',	'16-9-22',	'1-9-22',	'16-9-22')
    INTO records_library VALUES ( 	'NULL',	'20000039',	'678926',	'10000002',	'17-9-22',	'1-9-22',	'17-9-22')
SELECT * FROM DUAL
COMMIT;