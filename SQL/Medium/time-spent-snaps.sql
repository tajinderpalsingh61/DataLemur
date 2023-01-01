-- https://datalemur.com/questions/time-spent-snaps

SELECT age_bucket,
round((send/(send+open)) * 100.0, 2) as send_perc,
round((open/(send+open)) * 100.0, 2) as open_perc
FROM(
SELECT b.age_bucket,
sum(case when activity_type = 'open' then time_spent end) as open,
sum(case when activity_type = 'send' then time_spent end) as send
FROM activities a
JOIN age_breakdown b
on a.user_id = b.user_id
GROUP BY b.age_bucket
) as a
order by 1
;