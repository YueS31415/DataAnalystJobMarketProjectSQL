/*
Question:What are the most optimal skills to learn for data analysts?
-Identify skills in high demand and associated with high average salaries
-Focus on roles with specified salaries, regardless of location
-Why? Target skills that offer job security and financial benefits
    offer strategic insights for career development in data analysis
*/

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
WHERE job_title_short='Data Analyst' 
        AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id
HAVING COUNT(skills_job_dim.job_id)>10
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 25