-- https://datalemur.com/questions/histogram-users-purchases

select transaction_date, user_id, count(product_id) as purchase_count
FROM
(
SELECT product_id, user_id, spend,	transaction_date, 
dense_rank() over(PARTITION BY user_id order by transaction_date desc) as d_rank
FROM user_transactions
) as a
where d_rank = 1
group by transaction_date, user_id
order by transaction_date, user_id
;