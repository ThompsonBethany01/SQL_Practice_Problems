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