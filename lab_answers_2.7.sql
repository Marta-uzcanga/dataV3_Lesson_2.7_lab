-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
use sakila;

select name, count(film_id) as number_films 
from category as c 
join film_category as f
on c.category_id = f.category_id 
group by name;

-- 2. Display the total amount rung up by each staff member in August of 2005.

select p.staff_id, count(amount) as total 
from payment as p 
join staff as s
on p.staff_id = s.staff_id
group by p.staff_id;

-- 3. Which actor has appeared in the most films?
select a.actor_id, count(film_id) as total_films, first_name, last_name
from actor as a 
join film_actor as f
on a.actor_id = f.actor_id
group by a.actor_id
order by count(film_id) DESC
limit 1;

-- 4. Most active customer (the customer that has rented the most number of films)
select c.customer_id, count(rental_id) as total_rented, first_name, last_name
from customer as c 
join rental as r
on c.customer_id = r.customer_id
group by c.customer_id
order by count(rental_id) DESC
limit 1;

-- 5. Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address
from staff as s 
join address as a
on s.address_id = a.address_id
group by first_name;

-- 6. List each film and the number of actors who are listed for that film.
select count(actor_id) as total_actors, title
from film_actor as a 
join film as f
on a.film_id = f.film_id
group by a.actor_id
order by count(actor_id) DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select last_name, first_name, count(amount) as total_payed
from customer as c 
join payment as p
on c.customer_id = p.customer_id
group by last_name
order by last_name asc;

-- 8. List number of films per category.
select count(film_id) as number_films, name 
from category as c 
join film_category as f
on c.category_id = f.category_id 
group by name;