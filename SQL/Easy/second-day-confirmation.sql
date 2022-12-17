-- https://datalemur.com/questions/second-day-confirmation

SELECT a.user_id
FROM emails a
join texts b
on a.email_id = b.email_id
where (date(action_date)-date(signup_date)) =1
order by 1
;