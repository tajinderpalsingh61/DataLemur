-- https://datalemur.com/questions/trade-in-payouts

SELECT a.store_id , sum(payout_amount) as payout_total
FROM trade_in_transactions a join trade_in_payouts b
on a.model_id = b.model_id
group by a.store_id
order by 2 desc
;