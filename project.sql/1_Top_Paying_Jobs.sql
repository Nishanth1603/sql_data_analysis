/* Question: what are the top paying Data analyst jobs?
identify the top 10  hightest-paying Data analyst roles that are availably  remote.
Focuses on job postings wiith sprecified salaries (remove nulls).
why? highlight the top paying opportunities  for data analyst, offerring insights into emplyment.
*/

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
from 
    job_postings_fact
left JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short= 'Data Analyst' AND
    job_location = 'Anywhere'AND
    salary_year_avg is NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10 ;