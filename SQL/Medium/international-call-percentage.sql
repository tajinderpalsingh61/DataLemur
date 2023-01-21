-- https://datalemur.com/questions/international-call-percentage

SELECT round(count(case when b.country_id != c.country_id then 1 end)::numeric/count(1)::numeric*100, 1) as international_calls_pct
FROM phone_calls a 
join phone_info b
on a.caller_id = b.caller_id 
join phone_info c
on a.receiver_id = c.caller_id
;