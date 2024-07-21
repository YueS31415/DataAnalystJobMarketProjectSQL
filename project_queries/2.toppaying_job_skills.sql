/*
Question:What are the skills required for these top-paying roles?
-Use the top 10 highest-paying Data Analyst jobs from the first query
-Add specific skills required for each roles
-Why? It provides a detailed look at which high-paying jobs demand certain skills,
 helping job seekers understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs AS(
    SELECT 
        job_id,
        job_title,  
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id=job_postings_fact.company_id
    WHERE job_title_short='Data Analyst' 
        AND job_location='Anywhere' 
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
JOIN skills_job_dim ON skills_job_dim.job_id=top_paying_jobs.job_id
JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
