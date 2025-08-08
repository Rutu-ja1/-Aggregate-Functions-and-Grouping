-- Enhanced SELECT Queries + Aggregate Functions & Grouping
-- Tools: DB Browser for SQLite / MySQL Workbench

/* ----------------------------------------------
   1. SELECT * and Specific Columns
---------------------------------------------- */

-- Select all columns from users
SELECT * FROM users;

-- Select specific columns from health_articles
SELECT title, category FROM health_articles;

/* ----------------------------------------------
   2. Filtering: WHERE, AND, OR, LIKE, BETWEEN
---------------------------------------------- */

-- Users who are Female and age above 20
SELECT * FROM users
WHERE gender = 'Female' AND age > 20;

-- Articles where the title contains 'stress'
SELECT * FROM health_articles
WHERE title LIKE '%stress%';

-- Consultations where diagnosis is NULL or symptoms include 'fever'
SELECT * FROM consultations
WHERE diagnosis IS NULL OR symptoms LIKE '%fever%';

-- Users whose age is between 20 and 30
SELECT * FROM users
WHERE age BETWEEN 20 AND 30;

/* ----------------------------------------------
   3. Sorting with ORDER BY
---------------------------------------------- */

-- Sort health articles alphabetically by title
SELECT * FROM health_articles
ORDER BY title ASC;

-- Sort consultations by date descending
SELECT * FROM consultations
ORDER BY consult_date DESC;

/* ----------------------------------------------
   4. Aggregate Functions & Grouping
---------------------------------------------- */

-- COUNT: Total number of users
SELECT COUNT(*) AS total_users
FROM users;

-- AVG: Average age of users (ignoring NULL values)
SELECT AVG(age) AS average_age
FROM users;

-- MIN and MAX: Youngest and oldest user ages
SELECT MIN(age) AS youngest_age, MAX(age) AS oldest_age
FROM users;

-- SUM/COUNT: Total number of articles
SELECT COUNT(article_id) AS total_articles
FROM health_articles;

-- GROUP BY: Count consultations per user
SELECT user_id, COUNT(*) AS total_consultations
FROM consultations
GROUP BY user_id;

-- GROUP BY with HAVING: Users with more than 1 consultation
SELECT user_id, COUNT(*) AS total_consultations
FROM consultations
GROUP BY user_id
HAVING COUNT(*) > 1;

-- GROUP BY on symptoms_map: Count symptoms per condition
SELECT possible_condition, COUNT(symptom) AS symptom_count
FROM symptoms_map
GROUP BY possible_condition;
