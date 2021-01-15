# Create a new file called select_exercises.sql. Do your work for this exercise in that file. Use the albums_db database.
USE albums_db;
SHOW tables;

# Explore the structure of the albums table.
SELECT *
FROM albums
LIMIT 5;

DESCRIBE albums;

SHOW CREATE TABLE albums;

# Write queries to find the following information.
# The name of all albums by Pink Floyd
SELECT artist, name
FROM albums
WHERE artist = 'Pink Floyd';

# The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT name, release_date
FROM albums
WHERE name LIKE '%Lonely Hearts%';

# The genre for the album Nevermind
SELECT name, genre
FROM albums
WHERE name = 'Nevermind';

# Which albums were released in the 1990s
SELECT *
FROM albums
WHERE release_date like '199%';

# Which albums had less than 20 million certified sales
SELECT *
FROM albums
WHERE sales < 20;

# All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT *
FROM albums
WHERE genre = 'Rock';

SELECT *
FROM albums
WHERE genre LIKE '%Rock%';