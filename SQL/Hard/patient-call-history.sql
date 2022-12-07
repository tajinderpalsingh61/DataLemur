-- --https://datalemur.com/questions/patient-call-history

select count(distinct policy_holder_id) as patient_count
FROM
(
SELECT policy_holder_id, call_received, 
count(case_id) 
over(PARTITION BY policy_holder_id order by call_received range between interval '7 days' preceding and  current row) as case_cnt_7_days
FROM callers
) as a
where case_cnt_7_days = 2
;
