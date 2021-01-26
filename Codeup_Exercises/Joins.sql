# Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;

SELECT *
FROM users
JOIN roles ON users.id = roles.id;

# Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
-- selects every item from the left (first) table, whether therre is a value for it in the right
SELECT *
FROM users
LEFT JOIN roles ON users.id = roles.id;

-- selects every item from the right (joined) table, whether therre is a value for it in the right
SELECT *
FROM users
RIGHT JOIN roles ON users.id = roles.id;

# Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
SELECT COUNT(roles.name), roles.name
FROM users
LEFT JOIN roles ON users.id = roles.id
GROUP BY roles.id;