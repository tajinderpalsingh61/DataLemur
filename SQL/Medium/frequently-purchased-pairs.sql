-- https://datalemur.com/questions/frequently-purchased-pairs

select 
--a.transaction_id, c.transaction_id,b.product_name, d.product_name
count(0)
FROM transactions a join products b
on a.product_id = b.product_id
join transactions c
on a.transaction_id = c.transaction_id
join products d
on c.product_id = d.product_id
where b.product_name < d.product_name
;