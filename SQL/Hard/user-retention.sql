-- https://datalemur.com/questions/user-retention

select 7 as month, count(user_id) as monthly_active_users
FROM
(
SELECT user_id , 
--event_date , date_trunc('month', event_date)
count(case when date_trunc('month', event_date) = '2022-07-01' then 1 end) as jul_22_cnt,
count(case when date_trunc('month', event_date) = '2022-06-01' then 1 end) as jun_22_cnt
FROM user_actions
where event_type in ('sign-in', 'like', 'comment')
group by user_id
) as a
where jul_22_cnt>0 and jun_22_cnt>0
;

