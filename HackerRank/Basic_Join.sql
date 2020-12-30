# SQL Basic JOIN - HackerRank Star 3

/*
The Report
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

Write a query to help Eve.
*/
SELECT IF(grade < 8, NULL, name), grade, marks
FROM students
JOIN grades
WHERE marks BETWEEN min_mark AND max_mark
ORDER BY grade DESC, name, marks;

/*
Top Competitors
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.
*/
# in progress
SELECT perfect_scores.hacker_id, hackers.name
FROM(
SELECT COUNT(challenges.hacker_id) AS score_count, challenges.hacker_id
FROM challenges
JOIN difficulty ON difficulty.difficulty_level = challenges.difficulty_level
JOIN submissions ON submissions.hacker_id = challenges.hacker_id
WHERE difficulty.score = submissions.score
GROUP BY challenges.hacker_id
ORDER BY score_count desc, challenges.hacker_id
    ) AS perfect_scores
JOIN hackers ON hackers.hacker_id = perfect_scores.hacker_id
WHERE perfect_scores.score_count > 1;

/*
Asian Population
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT SUM(city.population)
FROM city
JOIN country ON city.countrycode = country.code
WHERE country.continent = 'ASIA';

/*
African Cities
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
*/
SELECT city.name
FROM city
JOIN country ON city.countrycode = country.code
WHERE country.continent = 'AFRICA';

/*
Average Population of Each Continent
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
*/
SELECT country.continent, FLOOR(AVG(city.population))
FROM city
JOIN country ON city.countrycode = country.code
GROUP BY country.continent;

/*
Ollivander's Inventory
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.
*/
# in progress
SELECT w.id, wp.age, w.coins_needed, w.power
FROM wands AS w
JOIN wands_property AS wp ON wp.code = w.code
WHERE wp.is_evil = 0
ORDER BY w.power desc, wp.age;

/*
Challenges
Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
*/
# in progress
SELECT hackers.hacker_id, hackers.name, counts.challenge_count
FROM (
SELECT COUNT(challenges.hacker_id) AS challenge_count, challenges.hacker_id
FROM challenges
JOIN hackers ON hackers.hacker_id = challenges.hacker_id
GROUP BY challenges.hacker_id
ORDER BY challenge_count desc, challenges.hacker_id
    ) as counts
JOIN hackers ON hackers.hacker_id = counts.hacker_id;