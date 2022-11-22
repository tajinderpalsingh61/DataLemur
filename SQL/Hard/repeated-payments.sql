-- https://datalemur.com/questions/repeated-payments

select 
count(transaction_id)
FROM
(
SELECT transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp, 
lag(transaction_timestamp) over(PARTITION BY merchant_id, credit_card_id, amount order by transaction_timestamp)
as lag_tt
FROM transactions
) as a
where lag_tt is not null
and extract(epoch from transaction_timestamp-lag_tt)/60 <= 10
;