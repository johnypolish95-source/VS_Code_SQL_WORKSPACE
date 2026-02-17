USE DataJobs_Database -- Replace with your actual database name
GO

SELECT TOP 5
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' --AND (job_location IN ('Poland'))
GROUP BY skills_dim.skills
ORDER BY demand_count DESC;