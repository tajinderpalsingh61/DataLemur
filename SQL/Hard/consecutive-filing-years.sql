-- https://datalemur.com/questions/consecutive-filing-years

select 
distinct user_id
FROM
(
select user_id , rn_diff, count(rn) as cnt
FROM
(
select user_id,  year,	filing_date, product, rn,
year-rn as rn_diff
from
(
select user_id,  year,	filing_date, product,
row_number() over(partition by user_id order by year) as rn
FROM
(
SELECT user_id, extract(year from filing_date) as year,	filing_date, product
FROM filed_taxes
where product like 'TurboTax%'
order by user_id, filing_date, product
) as a
) as a
) as a
group by  user_id , rn_diff
) as a
where cnt >=3
order by 1
;