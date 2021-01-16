/*
Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.
*/
USE employees;

/*
Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
*/
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;
# first - Irean Reutenauer, last - Vidya Simmen

/*
Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
*/
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;
# first - Irena Acton, last - Vidya Zweizig

/*
Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
*/
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;
# first - Irena Acton, last - Maya Zyda

/*
Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
*/
SELECT *
FROM employees
WHERE last_name LIKE 'E%e'
ORDER BY emp_no;
# 899 observations, first - Ramzi Erde, last - Tadahiro Erde

/*
Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.
*/
SELECT *
FROM employees
WHERE last_name LIKE 'E%e'
ORDER BY hire_date;
# 899 observations, first - Sergi Erde, last - Teiji Eldridge

/*
Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.
*/
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25' AND hire_date LIKE '199%'
ORDER BY birth_date, hire_date DESC;
# 362 observations, oldest hired last - Khun Bernini, youngest hired first - Douadi Pettis

# Previous Exercises #
/*
# Create a file named where_exercises.sql. Make sure to use the employees database.
USE employees;

# Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
# 709 observations
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

# Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
SELECT *
FROM employees
WHERE first_name LIKE 'Irena' OR first_name LIKE 'Vidya' OR first_name LIKE 'Maya';

# Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
# 619 observations
SELECT *
FROM employees
WHERE first_name LIKE 'Irena' OR first_name LIKE 'Vidya' OR first_name LIKE 'Maya' AND gender = 'M';

# Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
# 7,330 observations
SELECT *
FROM employees
WHERE last_name LIKE 'E%';

# How many employees have a last name that ends with E, but does not start with E?
# 23,393 observations
SELECT COUNT(*)
FROM employees
WHERE last_name LIKE '%e' AND last_name NOT LIKE 'E%';

# Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
# 899 observations
SELECT *
FROM employees
WHERE last_name LIKE 'E%e';

# 24,292 observations
SELECT *
FROM employees
WHERE last_name LIKE '%e';

# Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
# 135,214 observations
SELECT *
FROM employees
WHERE hire_date LIKE '199%';

# Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
# 842 observations
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25';

# Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
# 362 observations
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25' AND hire_date LIKE '199%';

# Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
# 1,873 observations
SELECT *
FROM employees
WHERE last_name LIKE '%q%';

# Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
# 547 observations
SELECT *
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

*/