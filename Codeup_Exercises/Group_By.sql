# In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
SELECT COUNT(DISTINCT(title))
FROM titles;
# 7 unique titles

# Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT last_name, COUNT(last_name) AS name_count
FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY last_name;

# Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT CONCAT(first_name, ' ', last_name) AS emp_name
FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY emp_name;

# Finding Counts of Each Unique first and last name combinations of employees whose last name starts and ends with 'E'
SELECT CONCAT(first_name, ' ', last_name) AS emp_name, COUNT(CONCAT(first_name, ' ', last_name)) as name_count
FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY emp_name
ORDER BY name_count DESC;

# Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT DISTINCT(last_name)
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
# Chleq, Lindqvist, Qiwen

# Add a COUNT() to your results (the query above) and use ORDER BY to make it easier to find employees whose unusual name is shared with others.
SELECT last_name, COUNT(last_name) AS name_count
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY last_name DESC;

# Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT first_name, gender, COUNT(first_name) AS emp_count
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;

# Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
SELECT username, COUNT(username) AS username_count
FROM
	(
	SELECT LOWER( CONCAT( SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS username
	FROM employees
	) AS usernames
GROUP BY username
;
## duplicates in usernames
SELECT COUNT(*)
FROM
	(
	SELECT username, COUNT(username) AS username_count
	FROM
		(
		SELECT LOWER( CONCAT( SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS username
		FROM employees
		) AS usernames
	GROUP BY username
	) as counts
WHERE username_count > 1
;
# there are 13,251 duplicate usernames