-- https://datalemur.com/questions/marketing-touch-streak

select distinct email
from
(
select email , 
diff_rn ,
count(diff_rn) diff_rn_cnt , count(case when event_type = 'trial_request' then  diff_rn end) as trial_request_cnt
from
(
select email, event_type, event_date, week_no, rn,
week_no-rn as diff_rn
from
(
SELECT b.email, event_type, event_date,
row_number() over(PARTITION BY email order by event_date) as rn,
extract(week from event_date) as week_no
FROM marketing_touches a join crm_contacts b
on a.contact_id = b.contact_id
) as a
) as a
group by  email , diff_rn 
) as a
where diff_rn_cnt>=3 and trial_request_cnt>=1
order by 1
;