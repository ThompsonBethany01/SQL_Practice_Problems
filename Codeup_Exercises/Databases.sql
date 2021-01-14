# Connect to the database server, List all the databases
SHOW DATABASES;

# Switch to a database using the USE statement
USE chipotle;

# Show the currently selected database
SELECT database();

# Switch to a different database
USE fruits_db;

# Show the currently selected database
SELECT database();

# Show query used to create the dataset
SHOW CREATE DATABASE fruits_db;

/*
Commands
SHOW DATABASES - see a list of the databases in the MySQL server
USE database_name - select a database
SELECT database() - show what database you currently have selected
SHOW CREATE DATABASE database_name - show query to create database
*/