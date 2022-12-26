-- https://datalemur.com/questions/non-profitable-drugs


SELECT manufacturer, count(product_id) as drug_count , abs(sum(loss)) as total_loss
FROM
(
SELECT manufacturer, product_id, total_sales-cogs as loss
FROM pharmacy_sales
where total_sales-cogs < 0
) as a
group by manufacturer
order by 3 desc
;