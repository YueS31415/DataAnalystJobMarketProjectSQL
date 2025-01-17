/*
Question:What are the most in-demand skills for data analysts?
-Identify the top 10 most in-demand skills for a data analyst
-Why? Retrieve the top 10 skills with the highest demand in the job market,
    provide insights into the most valuable skills for job seekers
*/

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
WHERE job_title_short='Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 10;