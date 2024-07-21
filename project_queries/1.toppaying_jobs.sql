/*
Question:What are the top-paying data analyst jobs?
-Identify the top 10 highest-paying Data Analyst roles that are available remotely.
*/

SELECT 
    job_title,  
    salary_year_avg,
    name AS company_name,
    job_location,
    job_schedule_type
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id=job_postings_fact.company_id
WHERE job_title_short='Data Analyst' 
    AND job_location='Anywhere' 
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
