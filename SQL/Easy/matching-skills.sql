-- https://datalemur.com/questions/matching-skills

select candidate_id
FROM
(
SELECT candidate_id,
count(case when skill = 'Python' then 1 end) as python_cnt,
count(case when skill = 'Tableau' then 1 end) as tableau_cnt,
count(case when skill = 'PostgreSQL' then 1 end) as pgsql_cnt
FROM candidates
group by candidate_id
) as a
where python_cnt>0 and tableau_cnt>0 and pgsql_cnt>0
ORDER BY candidate_id
;