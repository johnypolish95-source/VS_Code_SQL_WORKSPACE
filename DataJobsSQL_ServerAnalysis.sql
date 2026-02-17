USE DataJobs_Database;
GO

SELECT 
	skills.skills AS skill_name,
	COUNT(skills_job_dim.job_id) AS number_of_jobs_postings,
	ROUND(AVG(job_postings.salary_year_avg), 0) AS avg_salary_year
	FROM dbo.skills_dim AS skills
	LEFT JOIN dbo.skills_job_dim ON skills.skill_id = skills_job_dim.skill_id
	LEFT JOIN dbo.job_postings_fact AS job_postings ON skills_job_dim.job_id = job_postings.job_id
	WHERE job_postings.job_title_short = 'Data Analyst'
	GROUP BY skills.skills
	ORDER BY number_of_jobs_postings DESC;