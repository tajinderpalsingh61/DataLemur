-- https://datalemur.com/questions/booking-referral-source

select channel , 
round((booking_cnt::decimal/sum(booking_cnt) over(PARTITION BY 1 order by 1)) * 100.0) as first_booking_pct
FROM
(
SELECT channel , count(booking_id) as booking_cnt
FROM
(
SELECT a.user_id, a.booking_id, a.booking_date , b.channel , 
row_number() over(PARTITION BY a.user_id order by a.booking_date) as rn
FROM bookings a join booking_attribution b
on a.booking_id = b.booking_id
) as a
where rn = 1
group by channel
) as a
order by booking_cnt desc nulls last
limit 1
;