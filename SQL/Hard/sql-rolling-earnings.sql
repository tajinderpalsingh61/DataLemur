-- https://datalemur.com/questions/sql-rolling-earnings

SELECT user_id, transaction_date, amount,
sum(amount) over(PARTITION BY user_id order by transaction_date
range BETWEEN interval '2 days' preceding and current row) as rolling_earnings_3d
from
(
select user_id, transaction_date, sum(amount) as amount
FROM user_transactions
group by user_id, transaction_date
) as a
order by 1, 2
;
