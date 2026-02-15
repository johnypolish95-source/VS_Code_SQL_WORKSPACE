USE DataJobs_Database
GO

SELECT TOP 5000 *
FROM job_postings_fact

WHERE job_title LIKE '%Data%' AND job_title LIKE '%Analyst%' AND salary_year_avg IS NOT NULL
AND job_title_short NOT LIKE '%Senior%' AND salary_year_avg >= 50000

ORDER BY salary_year_avg DESC;
