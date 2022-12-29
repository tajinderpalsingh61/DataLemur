--https://datalemur.com/questions/frequent-callers

select count(policy_holder_id) as member_count
FROM(
SELECT policy_holder_id, count(case_id) as cnt
FROM callers
group by policy_holder_id
having count(case_id) >= 3
) as a
;