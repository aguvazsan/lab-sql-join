# Lab | SQL Join

### Instructions

USE sakila;

-- 1. List the number of films per `category`.

SELECT c.category_id AS Category, COUNT(f.film_id) AS Amount_Films
FROM sakila.film_category c 
JOIN sakila.film f ON c.film_id= f.film_id
GROUP BY c.category_id
ORDER BY Amount_Films ASC;

SELECT c.name AS Category, COUNT(f.film_id) AS Amount_Films
FROM sakila.category c
JOIN sakila.film_category g ON c.category_id = g.category_id
JOIN sakila.film f ON g.film_id = f.film_id
GROUP BY c.category_id
ORDER BY Amount_Films ASC;


-- 2. Display the first and the last names, as well as the address, of each staff member.

SELECT s.first_name AS Name, s.last_name AS Surname, a.address AS Address
FROM sakila.staff s 
JOIN sakila.address a ON s.address_id= a.address_id;

-- 3. Display the total amount rung up by each staff member in August 2005.

SELECT s.first_name AS Name, s.last_name AS Surname, COUNT(p.amount) AS TOTAL_AMOUNT
FROM sakila.staff s  
JOIN sakila.payment p ON s.staff_id = p.staff_id
GROUP BY s.staff_id, s.first_name, s.last_name
ORDER BY TOTAL_AMOUNT;

-- 4. List all films and the number of actors who are listed for each film.

SELECT f.film_id, COUNT(a.film_id) AS Amount_Actors
FROM sakila.film f 
JOIN sakila.film_actor a ON f.film_id= a.film_id
GROUP BY f.film_id
ORDER BY Amount_Actors desc;

-- 5. Using the `payment` and the `customer` tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.

SELECT c.first_name AS Name, c.last_name AS Surname, COUNT(p.amount) AS TOTAL_AMOUNT
FROM sakila.customer c  
JOIN sakila.payment p ON c.customer_id = p.customer_id
GROUP BY c.last_name, c.first_name
ORDER BY surname;