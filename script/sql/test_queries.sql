select * from strongs where normalized_greek like 'εγω%' order by greek;
select * from words where formatted_greek = 'τουτέστιν' order by testament_position;

SELECT * FROM words order by testament_position;
SELECT * FROM words where editions = 'BR' order by testament_position;

select formatted_greek, count(*) from words
where strong_id is null
group by formatted_greek; 

select reference, (array_agg(testament_position))[1] as tp
from words
group by reference
order by tp;

select substring(reference from 4 for 3) as ref, (array_agg(testament_position))[1] as tp
from words
group by ref
order by tp;

select * from books order by number;
select * from verses order by reference;
select * from chapters order by reference;
select * from paragraphs order by reference;
select * from criteria order by number;
select * from features order by reference;

select * from translations 
WHERE reference BETWEEN '41_Mrk.016.009' AND '41_Mrk.016.020'
order by reference;

select * from chapters order by reference;
select count(*) from verses; -- order by reference;

SELECT * FROM WORDS
WHERE reference BETWEEN '41_Mrk.016.009' AND '41_Mrk.016.020'
AND (editions ILIKE '%W%' OR editions = 'P') 
AND editions NOT ILIKE '%P-'
AND editions != 'IMNSW'
AND strong_id IS NOT NULL
ORDER BY testament_position;

--delete from books;
delete from criteria;
