-- https://datalemur.com/questions/duplicate-job-listings

-- solution 1
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

-- solution 2

SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM (
  SELECT 
  COUNT(job_id) AS job_count,
    company_id, 
    title, 
    description
  FROM job_listings
  GROUP BY company_id, title, description
) AS job_count_cte
WHERE job_count > 1;