-- https://datalemur.com/questions/sql-third-transaction

SELECT user_id,	spend,	transaction_date
from
(
SELECT user_id,	spend,	transaction_date,
row_number() over(PARTITION BY user_id order by transaction_date) as rn
FROM transactions
) as a
where rn =3
order by user_id
;