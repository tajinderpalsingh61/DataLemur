-- https://datalemur.com/questions/alibaba-compressed-mean

SELECT 
round(sum(item_count*order_occurrences)::Decimal/sum(order_occurrences), 1) as mean
FROM items_per_order;