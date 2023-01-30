-- https://datalemur.com/questions/sql-average-deal-size

SELECT round(avg(num_seats*yearly_seat_cost), 2) as average_deal_size
FROM contracts
;