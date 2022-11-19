-- https://datalemur.com/questions/sql-average-post-hiatus-2

select user_id,  avg(DATE_PART('day', post_date-lag_post_date))
FROM
(
SELECT user_id, post_date, 
lag(post_date) over(PARTITION BY user_id order by post_date) as lag_post_date
FROM posts
) as a
where lag_post_date is not null
and extract(year from post_date) = 2021
group by user_id
order by 1
;