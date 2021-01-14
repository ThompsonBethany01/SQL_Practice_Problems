# Open Sequel Pro and login to the database server, Save your work in a file named tables_exercises.sql, Use the employees database
USE employees;

# List all the tables in the database
SHOW tables;

# Explore the employees table. What different data types are present on this table?
DESCRIBE employees;
/*
employee number as an integer and the primary key
birth date and hire date as date in year-month-day format
first name is a string with a maximum of 14
last name is a string with a maximum of 16
gender is a 'M' or 'F' character
*/

# Which table(s) do you think contain a numeric type column? emp_no
# Which table(s) do you think contain a string type column? first and last name
# Which table(s) do you think contain a date type column? hire and birth date

# What is the relationship between the employees and the departments tables?
/*
employees has the primary key of emp_no
dept_emp and employees_with_departments have emp_no and dept_no
departments has the foriegn key dept_no
employees -> dept_emp -> departments
*/

# Show the SQL that created the dept_manager table.
SHOW CREATE TABLE dept_manager;

/*
Commands
DESCRIBE table_name - show data type, null count, etc. of each column in the table
SHOW CREATE TABLE table_name - show original command to create the table
*/