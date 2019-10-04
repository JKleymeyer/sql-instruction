select * from Movie;
select * from Actor;
select * from Credit;

select * from actor
where gender = 'male';

select * from actor
where birthDate < '1986-04-09';

select * from actor a
join credit c
on c.actorid = a.id
where movieid = 1;

-- list of actors from a movie add subselect
select * from actor a
join credit c
on c.actorid = a.id
where movieid = (select id from movie 
where title = 'Halloween');


-- three table joins below
select * from credit c
inner join actor a on a.id = c.actorID
inner join movie m on m.id = c.movieID;

select m.title 'Movie', a.firstName 'First Name', a.lastName 'Last Name', c.role 'Role'
from credit c
inner join actor a on a.id = c.actorID
inner join movie m on m.id = c.movieID
group by firstName;

-- list specific movie with associated actors
select m.title 'Movie', a.firstName 'First Name', a.lastName 'Last Name'
from credit c
join actor a on a.id = c.actorID
join movie m on m.id = c.movieID
where movieid = 1
group by firstName;

-- another way to do a join. Not really used
select * from actor, credit
where actor.id = credit.actorID;

-- example of unique constraint violation
insert into movie (title, year, rating, director)
values ('Halloween', 2010, 'g', 'adf');

-- example of FK violation
insert into credit (movieid, actorid, role)
values (99,99, 'test');

-- select all PG movies
select * from movie
where rating = 'PG';

-- number of ratings from movies
select rating as 'Ratings', count(rating) as 'Amount'
  from movie
group by rating;

-- all actors named tim born before 1960
select * from actor
where firstname = 'Tim'
and birthdate < '1960-01-01';

-- all actors born before 1960 or after 1980
select * from actor
where birthdate < '1960-01-01'
or birthdate > '1979-12-31'
order by birthdate asc;

-- and/or example
select * from actor
where firstname like 'c%'
and (lastname = 'Sarandon'
or lastname = 'Shea');


