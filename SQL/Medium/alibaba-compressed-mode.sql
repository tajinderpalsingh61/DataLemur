-- https://datalemur.com/questions/alibaba-compressed-mode

select item_count as mode
FROM
(
SELECT item_count, order_occurrences,
dense_rank() over(order by order_occurrences desc) as d_rank
FROM items_per_order
) as a
where d_rank = 1
order by item_count
;