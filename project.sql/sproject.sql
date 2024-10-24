
select SUM(salary_year_avg)
from job_postings_fact;


SELECT  CD.name as company_name,JB.job_title AS roles,MAX(JB.salary_year_avg)  AS MAX_SALARY
FROM job_postings_fact AS JB
LEFT JOIN company_dim AS CD ON JB.company_id=CD.company_id
WHERE JB.salary_year_avg IS NOT NULL
GROUP BY  CD.name, JB.job_title;
