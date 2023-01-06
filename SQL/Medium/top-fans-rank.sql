-- https://datalemur.com/questions/top-fans-rank

select artist_name, artist_rank
FROM
(
select artist_name , cnt, 
dense_rank() over(order by cnt desc) as artist_rank
FROM
(
SELECT a.artist_name , count(c.song_id) as cnt
FROM artists a join songs b 
on a.artist_id= b.artist_id
join global_song_rank c
on b.song_id = c.song_id
where c.rank between 1 and 10
group by a.artist_name
) as a
) as a
where artist_rank <= 5
order by 2
;