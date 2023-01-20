-- https://datalemur.com/questions/card-launch-success

select card_name	, issued_amount
FROM
(
SELECT card_name,	issued_amount,
row_number() over(PARTITION BY card_name order by issue_year, issue_month) as rn
FROM monthly_cards_issued
) as a
where rn = 1
order by issued_amount desc
;