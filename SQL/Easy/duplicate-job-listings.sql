-- https://datalemur.com/questions/duplicate-job-listings

select count(distinct company_id) as co_w_duplicate_jobs
FROM
(
SELECT company_id, title, description,
count(company_id) over(PARTITION BY company_id, lower(title), loweR(description) order by 1
rows BETWEEN unbounded preceding and unbounded following) as job_cnt
FROM job_listings
) as a
where job_cnt > 1
;