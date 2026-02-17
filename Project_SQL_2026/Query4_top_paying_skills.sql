USE DataJobs_Database -- Replace with your actual database name
GO

SELECT TOP 25
    skills_dim.skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL -- AND (job_location IN ('Poland'))
AND job_work_from_home = 1 -- Filter for remote jobs
GROUP BY skills_dim.skills
ORDER BY avg_salary DESC;