--Q1.
SELECT COUNT(*)
FROM data_analyst_jobs;
--1793

--Q2.
SELECT *
FROM data_analyst_jobs
LIMIT 10;
--ExxonMobil

--Q3.
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN';
--21
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location IN ('TN','KY');
--27

--Q4.
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN'
	AND star_rating > 4;
--3

--Q5.
SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
--151

--Q6.
SELECT location AS state,
	AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;
--NE

--Q7.
SELECT COUNT(DISTINCT title) AS unique_job_titles
FROM data_analyst_jobs;
--881

--Q8.
SELECT COUNT(DISTINCT title) AS unique_job_titles_CA
FROM data_analyst_jobs
WHERE location = 'CA';
--230

--Q9.
SELECT DISTINCT company, 
	AVG(star_rating) as avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company;
--41, including 1 null

--Q10.
SELECT DISTINCT company, 
	AVG(star_rating) as avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY AVG(star_rating) DESC;
-- American Express, 4.20

--Q11.
SELECT count(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%';
--774

--Q12.
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' 
	AND title NOT ILIKE '%Analytics%';
--4

--BONUS
SELECT domain, COUNT(*)
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%'
	AND days_since_posting > 21
	AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(*) DESC
LIMIT 4;
-- Internet and Software, Banks and Financial Serrvices, Consulting and Business Services, Health Care
-- 62, 61, 57, 52