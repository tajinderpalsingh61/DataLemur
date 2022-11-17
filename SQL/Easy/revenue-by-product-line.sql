-- https://datalemur.com/questions/revenue-by-product-line

SELECT a.product_line, sum(amount) as total_revenue
FROM product_info a
join transactions b
on a.product_id = b.product_id
group by a.product_line
order by 2 desc
;