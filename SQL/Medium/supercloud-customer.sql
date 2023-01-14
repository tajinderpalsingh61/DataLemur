-- https://datalemur.com/questions/supercloud-customer

select customer_id
FROM
(
SELECT customer_id , count(distinct a.customer_id) as categ_cnt
FROM customer_contracts a join products b
on a.product_id = b.product_id
group by customer_id
having count(distinct product_category) = 3
) as a
;