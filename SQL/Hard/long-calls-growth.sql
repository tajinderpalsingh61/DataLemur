-- https://datalemur.com/questions/long-calls-growth

SELECT yr, mth, round(((long_call_cnt-lag_long_call_cnt)::numeric/lag_long_call_cnt)*100, 1) as growth_pct
FROM
(
SELECT yr, mth, long_call_cnt,
lag(long_call_cnt) over(order by yr, mth) as lag_long_call_cnt
FROM
(
SELECT 
extract(year from call_received) as yr,
extract(month from call_received) as mth,
count(case when call_duration_secs > 300 then 1 end) as long_call_cnt
FROM callers
group by yr, mth
) as a
) as a
order by 1, 2
;