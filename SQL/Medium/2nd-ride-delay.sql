-- https://datalemur.com/questions/2nd-ride-delay

select 
round(avg(ride_date-registration_date), 2) as average_delay
from
(
SELECT a.user_id, a.registration_date, b.ride_date,
min(ride_date) over(PARTITION BY a.user_id order by b.ride_date) as min_ride_date,
row_number() over(PARTITION BY a.user_id order by b.ride_date) as rn
FROM users a join rides b
on a.user_id = b.user_id
) as a
where registration_date = min_ride_date
and rn = 2
;