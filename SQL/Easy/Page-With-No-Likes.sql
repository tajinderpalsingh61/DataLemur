-- https://datalemur.com/questions/sql-page-with-no-likes

-- Solution
SELECT pages.page_id FROM 
pages LEFT OUTER JOIN page_likes on 
pages.page_id= page_likes.page_id
where page_likes.page_id is null
order by pages.page_id;