-- https://datalemur.com/questions/rolling-average-tweets

SELECT user_id, tweet_date,
round(avg(tweet_cnt) over(PARTITION BY user_id order by tweet_date
rows between 2 preceding and current row
), 2) as rolling_avg_3days
FROM
(
SELECT user_id , tweet_date, count(tweet_id) as tweet_cnt
FROM tweets
group by user_id , tweet_date
) as a
order by user_id, tweet_date
;


-- aother solution

SELECT    
  user_id,    
  tweet_date,   
  ROUND(AVG(tweet_count) OVER (
    PARTITION BY user_id     
    ORDER BY tweet_date     
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
  ,2) AS rolling_avg_3d
FROM tweets;