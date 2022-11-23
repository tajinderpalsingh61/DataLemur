-- https://datalemur.com/questions/tesla-unfinished-parts

SELECT distinct part
FROM parts_assembly
where finish_date is null
order by 1
;