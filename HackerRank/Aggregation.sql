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