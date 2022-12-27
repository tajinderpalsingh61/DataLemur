-- https://datalemur.com/questions/total-drugs-sales

select manufacturer, sale
FROM
(
SELECT manufacturer, sum(total_sales) as total_sales, 
'$'||round(sum(total_sales)/1000000)||' million' as sale
FROM pharmacy_sales
group by manufacturer
) as a
order by total_sales desc
;