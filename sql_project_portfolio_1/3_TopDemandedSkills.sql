SELECT skills,
    count(*) as demand_count
from job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
where job_title_short = 'Data Analyst'
    and job_work_from_home = true
group by skills
order by demand_count desc
limit 10