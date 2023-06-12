-- https://datalemur.com/questions/sql-histogram-tweets

select tweet_cnt as tweet_bucket, count(user_id) as users_num
FROM
(
SELECT user_id, count(tweet_id) as tweet_cnt
FROM tweets
where extract(year from tweet_date) = 2022
group by user_id
) as a 
group by tweet_cnt
order by 1
;
