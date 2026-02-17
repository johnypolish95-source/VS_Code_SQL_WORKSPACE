USE DataJobs_Database -- Replace with your actual database name
GO


WITH top_paying_jobs AS (
    SELECT TOP 10
        job_id,
        job_title,
        salary_year_avg,
        company_dim.name AS company_name

        --RANK() OVER (PARTITION BY job_location ORDER BY salary_year_avg DESC) AS job_rank

    FROM
        job_postings_fact

    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

    WHERE job_title_short = 'Data Analyst' AND (job_location IN ('Poland', 'Anywhere')) AND salary_year_avg IS NOT NULL


    ORDER BY salary_year_avg DESC
)


SELECT
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;