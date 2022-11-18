--https://datalemur.com/questions/sales-team-compensation

with total_deal_size_data AS
(
SELECT employee_id, sum(deal_size) as total_deal_size
FROM deals
group by employee_id
)
--------
--------
--------
select a.employee_id, base+
case when total_deal_size>=quota then commission*quota else commission*total_deal_size end+ 
case when total_deal_size>=quota then (total_deal_size-quota)*commission*accelerator else 0 end
as total_compensation
from employee_contract a join total_deal_size_data b
on a.employee_id = b.employee_id
order by total_compensation desc, employee_id asc
;