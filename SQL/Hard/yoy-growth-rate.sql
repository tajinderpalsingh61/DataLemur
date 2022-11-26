-- https://datalemur.com/questions/yoy-growth-rate

select year, product_id, curr_year_spend, prev_year_spend,
round(((curr_year_spend-prev_year_spend)/prev_year_spend)*100, 2) as yoy_rate
FROM
(
select year, product_id, curr_year_spend, 
lag(curr_year_spend) over(PARTITION BY product_id order by year) as prev_year_spend
FROM
(
SELECT extract(year from transaction_date) as year, product_id, sum(spend) as curr_year_spend
FROM user_transactions
group by year, product_id
) as a
) as a
order by 2, 1
;