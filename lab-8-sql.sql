USE sakila;
SELECT title, length, RANK() OVER (ORDER BY length DESC) AS film_rank
FROM film
WHERE length IS NOT NULL AND length > 0
ORDER BY length DESC;


SELECT title, length, rating, RANK() OVER 
(PARTITION BY rating ORDER BY length DESC) AS film_rank
FROM film
WHERE length IS NOT NULL AND length > 0
ORDER BY rating, length DESC;

SELECT category_id, COUNT(film_category.film_id) AS num_films
FROM category
JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.name;

SELECT category.name, COUNT(film.film_id) AS num_films
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category.name;

SELECT actor.first_name, actor.last_name, COUNT(film_actor.film_id) AS num_films
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY num_films DESC
LIMIT 1;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(*) AS num_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY num_rentals DESC
LIMIT 1;
