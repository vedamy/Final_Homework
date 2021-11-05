-- 1.Show all customers whose last names start with T.
-- Order them by first name from A-Z.

SELECT *
FROM customer
WHERE last_name LIKE 'T%'
ORDER BY first_name ASC;

-- 2.Show all rentals returned from 5/28/2005 to 6/1/2005

SELECT *
FROM rental
WHERE return_date BETWEEN '2005-05-28' AND '2005-06-01';

--3.How would you determine which movies are rented the most? 
CREATE TABLE HW_3 as
SELECT inventory.inventory_id, film_id, rental.rental_id
FROM inventory
  INNER JOIN rental
    ON inventory.inventory_id = rental.inventory_id;
  
CREATE TABLE movies AS
SELECT HW_3.rental_id, film.film_id, film.title
FROM HW_3
  INNER JOIN film
    ON Amulya.film_id = film.film_id
	ORDER BY title, rental_id ASC;
	
SELECT COUNT(DISTINCT rental_id) AS rental_freq, title
FROM movies
GROUP BY title
ORDER BY rental_freq DESC;

CREATE TABLE HW_4 AS
SELECT c.first_name, c.last_name, c.customer_id, SUM(p.amount) AS Amt_spent_on_movies
FROM customer AS c
  INNER JOIN payment AS p
    ON c.customer_id = p.customer_id
  GROUP BY c.customer_id
    ORDER BY Amt_spent_on_movies ASC;
	
--5.Which actor was in the most movies in 2006 (based on this dataset)? Be sure to alias the actor name and count 
--as a more descriptive name. Order the results from most to least.

CREATE TABLE HW_5 AS
SELECT concat(a.first_name, ' ', a.last_name) AS actor_name, actor_id, release_year, COUNT(DISTINCT film_id) AS movie_count
  FROM film AS f
  INNER JOIN film_actor AS fa
    USING(film_id)
	INNER JOIN actor AS a
	USING(actor_id)
	WHERE f.release_year = 2006
	GROUP BY actor_name, actor_id, release_year
	ORDER BY movie_count DESC;
	
SELECT COUNT(DISTINCT film_id) AS movie_count, actor_id
FROM film AS f
INNER JOIN film_actor AS fa
  USING(film_id)
  WHERE release_year = 2006
  GROUP BY actor_id
  ORDER BY movie_count DESC;


CREATE TABLE HW_7 AS
SELECT c.name AS category_name, AVG(rental_rate) AS Avg_rental_rate
FROM category AS c
INNER JOIN film_category AS fc
USING (category_id)
INNER JOIN film AS f
USING (film_id)
GROUP BY category_name
ORDER BY Avg_rental_rate DESC;

CREATE TABLE HW_9 AS
SELECT c.name AS genre, SUM(amount) AS total_sales
FROM category AS c
INNER JOIN film_category AS fc
USING (category_id)
INNER JOIN inventory AS i
USING (film_id)
INNER JOIN rental AS r
USING (inventory_id)
INNER JOIN payment AS p
USING (rental_id)
GROUP BY genre
ORDER BY total_sales DESC;

SELECT title, rental_duration, return_date - rental_date AS time_owned
FROM film AS f
INNER JOIN inventory AS i
USING (film_id)
INNER JOIN rental as r
USING (inventory_id);




















