# SQL Basic Select - HackerRank Star 1

/*
Revising the Select Query I
Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
*/
SELECT *
FROM CITY
WHERE (COUNTRYCODE = 'USA') and (POPULATION > 100000);

/*
Revising the Select Query II
Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
*/
SELECT name
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;

/*
Select ALL
Query all columns (attributes) for every row in the CITY table.
*/
SELECT *
FROM city;

/*
Select BY ID
Query all columns for a city in CITY with the ID 1661.
*/
SELECT *
FROM CITY
WHERE ID = 1661;

/*
Japanese Cities' Attributes
Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
*/
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';

/*
Japanese Cities' Names
Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
*/
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';

/*
Weather Observation Station 1
Query a list of CITY and STATE from the STATION table.
*/
SELECT CITY, STATE
FROM STATION;

/*
Weather Observation Station 3
Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
*/
SELECT DISTINCT(CITY)
FROM STATION
WHERE (ID % 2) = 0;

# SQL Basic Select - HackerRank Star 2
/*
Weather Observation Station 4
Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
where LAT_N is the northern latitude and LONG_W is the western longitude.
For example, if there are three records in the table with CITY values 'New York', 'New York', 'Bengalaru', there are 2 different city names: 'New York' and 'Bengalaru'. The query returns , because total number of records - number of unique city names = 3 -2 = 1.
*/
SELECT COUNT(CITY) - COUNT(DISTINCT(CITY)) 
FROM STATION;

/*
Weather Observation Station 5
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
where LAT_N is the northern latitude and LONG_W is the western longitude.
Sample Input
For example, CITY has four entries: DEF, ABC, PQRS and WXY.
Sample Output
ABC 3
PQRS 4
Explanation
When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths  and . The longest name is PQRS, but there are  options for shortest named city. Choose ABC, because it comes first alphabetically.
Note
You can write two separate queries to get the desired output. It need not be a single query.
*/
(SELECT city, LENGTH(city) as char_length
FROM STATION
ORDER BY LENGTH(city), city
LIMIT 1)
UNION ALL
(SELECT city, LENGTH(city) as char_length
FROM STATION
ORDER BY LENGTH(city) desc, city
LIMIT 1);

/*
Weather Observation Station 6
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
*/
SELECT DISTINCT(city)
FROM station
WHERE city LIKE ('a%') or city LIKE ('e%') or city LIKE ('i%') or city LIKE ('o%') or city LIKE ('u%');

/*
Weather Observation Station 7
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
*/
SELECT DISTINCT(city)
FROM station
WHERE city LIKE ('%a') or city LIKE ('%e') or city LIKE ('%i') or city LIKE ('%o') or city LIKE ('%u');

/*
Weather Observation Station 8
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
*/
SELECT DISTINCT(city)
FROM station
WHERE city LIKE ('a%a') or city LIKE ('a%e') or city LIKE ('a%i') or city LIKE ('a%o') or city LIKE ('a%u') or city LIKE ('e%a') or city LIKE ('e%e') or city LIKE ('e%i') or city LIKE ('e%o') or city LIKE ('e%u') or city LIKE ('i%a') or city LIKE ('i%e') or city LIKE ('i%i') or city LIKE ('i%o') or city LIKE ('i%u') or city LIKE ('o%a') or city LIKE ('o%e') or city LIKE ('o%i') or city LIKE ('o%o') or city LIKE ('o%u') or city LIKE ('u%a') or city LIKE ('u%e') or city LIKE ('u%i') or city LIKE ('u%o') or city LIKE ('u%u');

/*
Weather Observation Station 9
Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT(city)
FROM station
WHERE city NOT LIKE ('a%') AND city NOT LIKE ('e%') AND city NOT LIKE ('i%') AND city NOT LIKE ('o%') AND city NOT LIKE ('u%');

/*
Weather Observation Station 10
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT(city)
FROM station
WHERE city NOT LIKE ('%a') AND city NOT LIKE ('%e') AND city NOT LIKE ('%i') AND city NOT LIKE ('%o') AND city NOT LIKE ('%u');

# SQL Basic Select - HackerRank Star 3
/*
Weather Observation Station 11
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT(city)
FROM station
WHERE city REGEXP '^[^aeiouAEIOU]' or city REGEXP '[^aeiouAEIOU]$';

/*
Weather Observation Station 12
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT(city)
FROM station
WHERE city REGEXP '^[^aeiouAEIOU]' AND city REGEXP '[^aeiouAEIOU]$';

/*
Higher Than 75 Marks
Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
*/
SELECT name
FROM students
WHERE marks > 75
ORDER BY substr(name, -3, 3), ID;

/*
Employee Names
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
*/
SELECT name
FROM employee
ORDER BY name;

/*
Employee Salaries
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.
*/
SELECT name
FROM employee
WHERE (salary > 2000) AND (months < 10)
ORDER BY employee_id;