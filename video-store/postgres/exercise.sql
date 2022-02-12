-- how many copies of <chosen_movie> do we have in-stock right now?
-- excludes "rentals"
select 
	m.id,
	m.name,
	count(i.movie_id)
from movie m
inner join inventory i on (m.id = i.movie_id)
group by m.id


select 
	c.name as customer_name,
	r.customer_id,
	r.date_out,
	r.date_due,
	r.date_returned,
	m.id as movie_id,
	m.name movie_name,
	i.id as inventory_id,
	i.isbn
	-- i.is_available,
from inventory i 
inner join movie m on (m.id = i.movie_id)
left join rental r on (r.date_returned is null and r.inventory_id = i.id)
left join customer c on (c.id = r.customer_id)
where 
	r.id is null -- if a movie doesn't have a rental record, its in stock
-- order by r.date_out desc
-- concern: what happens about rental history? same movie shows up many times

select * from movie m where id=1;
select * from inventory i where i.id in (select i.id from inventory i where i.movie_id=1);
select * from rental r where r.inventory_id in (select i.id from inventory i where i.movie_id=1); -- this includes every rental record for all inventory of jurassic park

-- what movies are in stock
-- what does in stock mean
-- it means not on the shelf
-- how does a physical copy of a movie get off the shelf? `inventory` `movie`
-- someone rents it
-- how do we know when someone rented it
-- we save a record into `rental` for the `inventory` and `customer`
-- what do we do when the customer returns it?
-- we update the rental record with date_returned, movie is available to rent now
-- conditions move availability:
-- inventory record exists for movie
-- either:
--   no rental record for the inventory record
--   the last created rental for inventory has a date_returned <-- window function? how do i take many rental records and condense to 1 record with the highest id & a value in date_returned

select 
	m.id movie_id,
	m.name,
	i.isbn,
	r.id rental_id,
	r.date_out,
	r.date_returned 
from inventory i 
left join movie m on (m.id = i.movie_id)
left join rental r on (r.inventory_id = i.id)
where 
	-- i.movie_id=1
	m.id=1
	

-- this might be the secret sauce
-- https://stackoverflow.com/a/19630361/261272 window function, pls try
	
with latest_rental as (
	select 
		max(r.id) as latest_rental_id, 
		r.inventory_id 
	from rental r 
	where r.inventory_id in (select id from inventory i where i.movie_id=2)
	group by r.inventory_id 
)
select 
	* 
from inventory i2 
left join latest_rental on (latest_rental.inventory_id = i2.id)
left join rental r on (r.id = latest_rental.latest_rental_id)
where 
	i2.movie_id=2
	and (
		r.id is null or -- no rental means its avail
		r.date_returned is not null -- rental has been returned
	);

-- select * from inventory i where i.movie_id=1 = [1,2]
select * from rental where inventory_id in (1,2)

select id, inventory_id, date_out, date_returned, max(id) over (partition by inventory_id order by id desc) from rental;
select r.inventory_id , max(r.id) from rental r group by r.inventory_id;


-- find movies without a rental record 
-- OR movies that have a date_returned



-- available inventory based on rental dates
select
	i.*,
	r.*
from inventory i 
left join rental r on (r.date_returned is null and i.id = r.inventory_id)
where r.id is null
order by r.date_out desc

select
	i.*,
	r.*
from inventory i 
left join rental r on (i.id = r.inventory_id)




-- pg doesnt have variables?
with vars as (
	select NOW() + interval '2 day' as due_date
)
select
	NOW(),
	(select due_date from vars) as due_date;


-- test data
insert into rental
(inventory_id, customer_id, date_out, date_due)
values
(8, 1, NOW() - interval '28 day', NOW() - interval '26 day'), -- historical rental
(8, 1, NOW(), NOW() + interval '2 day'), -- eric rented jurassic park
(10, 1, NOW(), NOW() + interval '2 day'), -- eric rented tron
(11, 1, NOW(), NOW() + interval '2 day') -- pooh rented tron