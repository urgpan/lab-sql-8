-- 1
select title, length, rank() over (order by length asc) as my_rank from film
where length <> '' or length <> '0';

-- 2
select title, length,rating, rank() over (partition by rating order by length desc) as my_rank from film
having length <> '' or length <> '0';

-- 3
select cy.name, c.category_id, count(f.film_id) from sakila.film_category as c
join sakila.film as f
on c.film_id = f.film_id
join sakila.category as cy
on cy.category_id = c.category_id
group by c.category_id;

-- 4
select a.first_name, a.last_name, count(fa.actor_id) from film_actor as fa
join actor as a
on fa.actor_id = a.actor_id
group by fa.actor_id
order by count(fa.actor_id) desc;

-- 5
select c.first_name, c.last_name,r.customer_id, count(r.rental_id) from rental as r
join customer as c
on r.customer_id = c.customer_id
group by r.customer_id
order by count(r.rental_id) desc;