-- https://datalemur.com/questions/sql-highest-grossing

select category, product, total_spend
FROM
(
SELECT category, product, total_spend,
row_number() over(PARTITION BY category order by total_spend desc) as rn
FROM
(
SELECT category, product, sum(spend) as total_spend
FROM product_spend
where EXTRACT(year from transaction_date) = 2022
group by category, product
) as a
) as a
where rn <= 2
order by 1, 3 desc
;