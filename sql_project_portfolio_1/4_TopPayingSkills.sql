SELECT skills,
    round(avg(salary_year_avg)) as avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst'
    and salary_year_avg is not null
GROUP BY skills
order BY avg_salary