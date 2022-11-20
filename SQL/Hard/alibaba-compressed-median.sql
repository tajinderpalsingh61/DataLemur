-- https://datalemur.com/questions/alibaba-compressed-median

select round(item_count, 1) as median
FROM
(
select item_count, order_occurrences, total_sum_order_occurrences, cum_sum_order_occurrences,
coalesce(lag(cum_sum_order_occurrences) over(PARTITION BY 1 order by item_count), 0) as lag_cum_sum_order_occurrences
FROM
(
select item_count, order_occurrences, 
sum(order_occurrences) over(PARTITION BY 1 order by item_count 
rows between unbounded preceding and unbounded following) as total_sum_order_occurrences,
sum(order_occurrences) over(PARTITION BY 1 order by item_count) as cum_sum_order_occurrences
from items_per_order
) as a
) as a
where total_sum_order_occurrences/2 between lag_cum_sum_order_occurrences and cum_sum_order_occurrences
;