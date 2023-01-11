-- https://datalemur.com/questions/signup-confirmation-rate

SELECT round(count(b.email_id)::numeric/count(a.email_id)::numeric, 2)
FROM emails a left outer join texts b
on a.email_id = b.email_id
and b.signup_action = 'Confirmed'
;