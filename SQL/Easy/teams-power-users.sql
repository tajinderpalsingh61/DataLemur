-- https://datalemur.com/questions/teams-power-users

SELECT sender_id , count(message_id) as message_count
FROM messages
where sent_date::date between '2022-08-01' and '2022-08-31'
group by sender_id 
order by 2 desc
limit 2
;