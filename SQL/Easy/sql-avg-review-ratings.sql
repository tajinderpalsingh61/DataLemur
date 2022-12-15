-- https://datalemur.com/questions/sql-avg-review-ratings

SELECT extract(month from submit_date) as mth,
product_id as product, round(AVG(stars), 2) as avg_stars
FROM reviews
group by mth, product
order by 1, 2
;