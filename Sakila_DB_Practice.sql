-- Select Columns from Actors Table
USE sakila;
SELECT actor_id, first_name, last_name
FROM actor; 
-- Can use SELECT * to pull entire table
SELECT *
FROM actor;

-- ________________________________________ -- 
-- WHERE Clause
SELECT *
FROM country
WHERE country_id = 100;

-- Or

SELECT *
FROM country;

-- _____________--
-- Comparison Operators

SELECT *
FROM film
WHERE rating <> 'G';
#WHERE replacement_cost <= 12.99;

-- ________________________________________--
-- Between Operator
SELECT *
FROM payment
#WHERE amount BETWEEN 0.99 AND 2.99;
WHERE payment_date
BETWEEN '2005-03-02' AND '2005-06-02';
-- __________________- --
-- Like Operator
SELECT * 
FROM customer
WHERE first_name;

-- DML - Data Manipulation Language
-- INSERT
-- syntax INSERT INTO table_name VALUES ()

SELECT * FROM actor;
INSERT INTO actor(first_name, last_name) VALUES('CHUCK', 'NORRIS');
-- Foreign Key
SELECT * FROM country
WHERE country = 'United States';
SELECT * FROM city
WHERE city_id = 103;
INSERT INTO city(country_id, city) VALUES(103, 'Charlotte');

-- ____________________ --
-- UPDATE
SELECT * FROM payment;

UPDATE payment
SET amount = 5.99
WHERE payment_id BETWEEN 10 and 45;

-- _________________________ --
-- DELETE
SELECT * FROM rental;

DELETE FROM rental WHERE rental_id = 1;
ROLLBACK;

-- --------------------------------------- --
-- Cross Join (Cartesian Product)
SELECT *
FROM film, actor;

SELECT COUNT(*) FROM film;
SELECT COUNT(*) FROM actor;

SELECT COUNT(*) FROM film CROSS JOIN actor;

-- _________________________________________ --
-- Inner Join
SELECT * FROM city
INNER JOIN country
ON city.country_id = country.country_id;

SELECT *
FROM address
INNER JOIN city
ON city.city_id = address.city_id
INNER JOIN country
ON city.country_id = country.country_id;
SELECT * FROM customer;
-- ----------------------------- --
-- LEFT JOIN and RIGHT JOIN
SELECT * 
FROM customer RIGHT JOIN rental
ON customer.customer_id = rental.customer_id 
WHERE customer.first_name = 'ROCKY';

INSERT INTO customer(first_name, last_name, email, store_id, address_id) 
VALUES('ROCKY', 'BALBOA', 'rocky@gmail.com', 1, 5);

-- _____________________________________---
-- Data Definition Langauge
-- CREATE TABLE
CREATE TABLE hero(
	hero_id SMALLINT AUTO_INCREMENT ,
    hero_name VARCHAR(45) ,
    hit_points SMALLINT,
    attack SMALLINT,
    defense SMALLINT,
    PRIMARY KEY(hero_id)
);
ALTER TABLE hero
MODIFY hero_name VARCHAR(45) NOT NULL UNIQUE;

ALTER TABLE hero
ADD COLUMN customer_id SMALLINT UNSIGNED;

ALTER TABLE hero
ADD FOREIGN KEY (customer_id)
REFERENCES customer(customer_id);

