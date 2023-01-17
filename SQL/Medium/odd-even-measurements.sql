-- https://datalemur.com/questions/odd-even-measurements

select measurement_day,
sum(case when rn%2 = 1 then measurement_value end) as odd_sum,
sum(case when rn%2 = 0 then measurement_value end) as even_sum
FROM
(
SELECT 
date(measurement_time) as measurement_day, measurement_value ,
row_number() over(PARTITION BY date(measurement_time) order by measurement_time) as rn
FROM measurements
) as a
group by measurement_day
order by 1
;