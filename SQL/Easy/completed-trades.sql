-- https://datalemur.com/questions/completed-trades

SELECT b.city, count(order_id) as total_orders
FROM trades a join users b
on a.user_id = b.user_id
where a.status = 'Completed'
group by b.city
order by 2 DESC
limit 3
;