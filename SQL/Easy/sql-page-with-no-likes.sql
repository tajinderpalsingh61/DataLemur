-- https://datalemur.com/questions/sql-page-with-no-likes

SELECT a.page_id
FROM pages a  
left outer join page_likes b
on a.page_id = b.page_id
where b.page_id is NULL
order by 1;