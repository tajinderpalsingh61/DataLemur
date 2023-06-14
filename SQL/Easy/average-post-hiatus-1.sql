-- https://datalemur.com/questions/sql-average-post-hiatus-1

SELECT user_id, extract(days from (max(post_date)-min(post_date))) as days_between
FROM posts
where extract(year from post_date) = 2021
group by user_id
having  count(post_id) >= 2
order by 1
;