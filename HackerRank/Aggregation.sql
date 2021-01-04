# SQL Aggregation - HackerRank

/*
Revising Aggregations - The Sum Function
Query the total population of all cities in CITY where District is California.
*/
SELECT SUM(population)
FROM city
WHERE district = 'California';

/*
Revising Aggregations - Averages
Query the average population of all cities in CITY where District is California.
*/
SELECT AVG(population)
FROM city
WHERE district = 'California';

/*
Average Population
Query the average population for all cities in CITY, rounded down to the nearest integer.
*/
SELECT FLOOR(AVG(population))
FROM city;

/*
Japan Population
Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
*/
SELECT SUM(population)
FROM city
WHERE countrycode = 'JPN';

/*
Population Density Difference
Query the difference between the maximum and minimum populations in CITY.
*/
SELECT MAX(population) - MIN(population)
FROM city;

/*
The Blunder
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), and the actual average salary.
Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.
*/
SELECT CEIL(AVG(salary) - AVG(REPLACE(salary, 0, '')))
FROM employees;

/*
Top Earners
We define an employee's total earnings to be their monthly salary X months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.
*/
SELECT (salary * months) AS earnings, COUNT(*) 
FROM employee 
GROUP BY 1 
ORDER BY earnings DESC
LIMIT 1;

/*
Weather Observation Station 2
Query the following two values from the STATION table:
The sum of all values in LAT_N rounded to a scale of 2 decimal places.
The sum of all values in LONG_W rounded to a scale of 2 decimal places.
*/
SELECT ROUND(SUM(lat_n), 2) as lat, ROUND(SUM(long_w), 2) as lon
FROM station;

/*
Weather Observation Station 3
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to  decimal places.
*/
SELECT TRUNCATE(SUM(lat_n), 4)
FROM station
WHERE lat_n > 38.7880 AND lat_n < 137.2345;

/*
Weather Observation Station 14
Query the greatest value of Northern Latitudes (LAT_N) from STATION having values less than 137.2345. Truncate your answer to  decimal places.
*/
SELECT TRUNCATE(MAX(lat_n), 4)
FROM station
WHERE lat_n < 137.2345;

/*
Weather Observation Station 15
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places.
*/
SELECT ROUND(long_w, 4)
FROM station
WHERE lat_n =
(
    SELECT MAX(lat_n)
    FROM station
    WHERE lat_n < 137.2345
    )
;

/*
Weather Observation Station 16
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.
*/
SELECT ROUND(MIN(lat_n), 4)
FROM station
WHERE lat_n > 38.7780;