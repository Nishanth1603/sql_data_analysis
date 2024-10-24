/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

-- Identifies skills in high demand for Data Analyst roles
-- Use Query #3

WITH demand_skills as (
        select 
            skills_job_dim.skill_id,
            skills_dim.skills,
            count(skills_job_dim.job_id) as skills_count
        from 
            job_postings_fact
        INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
        WHERE
            salary_year_avg IS NOT NULL AND
            job_title_short = 'Data Analyst' AND
            job_work_from_home = True

        GROUP BY 
            skills_dim.skills,
            skills_job_dim.skill_id
),
average_salary as (
SELECT
        skills_job_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg),0) as avg_salary

        from 
        job_postings_fact
        inner JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
        WHERE 
            salary_year_avg IS NOT NULL AND
            job_title_short = 'Data Analyst' AND
            job_work_from_home = True

        GROUP BY 
            skills_dim.skills,
            skills_job_dim.skill_id
)

SELECT 
demand_skills.skills,
average_salary.avg_salary
from demand_skills
INNER JOIN average_salary on demand_skills.skill_id = average_salary.skill_id
ORDER BY avg_salary DESC;

