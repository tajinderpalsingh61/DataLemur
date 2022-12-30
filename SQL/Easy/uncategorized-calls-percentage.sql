-- https://datalemur.com/questions/uncategorized-calls-percentage

select 
round((count(case when coalesce(call_category, 'n/a')  in ('', 'n/a') then case_id end)::numeric/
count(case_id)::numeric)*100, 1) as call_percentage
FROM callers
;

