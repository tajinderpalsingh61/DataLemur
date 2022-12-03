-- https://datalemur.com/questions/updated-status

SELECT coalesce(a.user_id, b.user_id) as user_id , 
case 
when a.user_id is null and b.user_id is not null then 'NEW'
when b.paid is null then 'CHURN'
when a.status in ('NEW', 'EXISTING', 'RESURRECT') then 'EXISTING'
when a.status = 'CHURN' then 'RESURRECT'
end as new_status
FROM 
advertiser a 
full outer join daily_pay b
on a.user_id = b.user_id
order by 1
;