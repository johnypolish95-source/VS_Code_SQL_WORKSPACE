USE DataJobs_Database
GO

SELECT TOP 1000
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name,

    RANK() OVER (PARTITION BY job_location ORDER BY salary_year_avg DESC) AS job_rank

FROM
    job_postings_fact

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE job_title_short = 'Data Analyst' AND (job_location IN ('Poland', 'Anywhere')) AND salary_year_avg IS NOT NULL


ORDER BY salary_year_avg DESC;
