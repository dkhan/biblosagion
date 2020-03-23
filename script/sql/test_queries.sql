select * from strongs order by strong_number;
select * from words where formatted_greek = $"τουτέστιν" order by testament_position;

SELECT * FROM words order by testament_position;

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

select * from chapters order by reference;
select count(*) from verses; -- order by reference;

SELECT * FROM WORDS;

--delete from books;
delete from criteria;