-- https://datalemur.com/questions/median-search-freq

select PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY searches) as median
FROM
(
select searches, GENERATE_SERIES(1, num_users)  FROM search_frequency
order by searches
) as a
