-- https://datalemur.com/questions/prime-warehouse-storage

with item_type_agg as
(
SELECT item_type , sum(square_footage) sum_sq_footage , count(item_id) as item_id_cnt
FROM inventory
group by item_type
),
--------------------
prime_elig_data AS
(
select item_type, items, items*sum_sq_footage as prime_sq_footage_used, items*item_id_cnt as item_count
FROM
(
select item_type, sum_sq_footage, floor(500000/sum_sq_footage) as items, item_id_cnt
from item_type_agg
where item_type = 'prime_eligible'
) as a
)
--------------------
--------------------
--------------------
select item_type, item_count
from prime_elig_data
UNION ALL
select item_type, items*item_id_cnt as item_count
FROM
(
select a.item_type, floor((500000-b.prime_sq_footage_used)/a.sum_sq_footage) as items, a.item_id_cnt
from item_type_agg a join prime_elig_data b
on 1 = 1
where a.item_type = 'not_prime'
) as a
;
