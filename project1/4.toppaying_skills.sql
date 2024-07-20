/*
Question:What are the top skills based on salary for data analysts?
-Look at the average salary associated with each skill for data analyst positions
-Focus on roles with specified salaries, regardless of location
-Why? It reveals how different skills impact salary levels for data analysts and
    help identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
WHERE job_title_short='Data Analyst' 
    AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 15