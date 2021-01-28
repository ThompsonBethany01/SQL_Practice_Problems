# Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT *
FROM employees
WHERE hire_date IN 
(
	SELECT hire_date
	FROM employees
	WHERE emp_no = 101010
);

# Find all the titles ever held by all current employees with the first name Aamod.
SELECT title, COUNT(title) as 'Current_Aamods'
FROM titles
WHERE emp_no IN 
(
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod'
)
AND to_date > CURDATE()
GROUP BY title;

# How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT COUNT(DISTINCT(emp_no))
FROM
(
	SELECT emp_no, MAX(to_date) AS current
	FROM titles
	GROUP BY emp_no
) AS latest_date
WHERE current < CURDATE();


# Find all the current department managers that are female. List their names in a comment in your code.
SELECT CONCAT(first_name, ' ', last_name) AS manager_name, gender, to_date
FROM dept_manager
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date > CURDATE() AND gender = 'F';

# Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT DISTINCT(employees.emp_no)
FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no
WHERE salaries.salary > 
(
SELECT AVG(salary)
FROM salaries
);

# How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

-- BONUS

# Find all the department names that currently have female managers.

# Find the first and last name of the employee with the highest salary.

# Find the department name that the employee with the highest salary works in.