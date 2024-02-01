USE sakila;
SELECT * from rental
ORDER BY rental_date ASC;

SELECT
    f.film_id, f.title, f.release_year, f.rental_duration, f.rental_rate, f.length, f.rating,
    f.special_features, r.rental_date, r.return_date, r.customer_id, r.inventory_id,
    CASE WHEN r.rental_date BETWEEN '2005-05-01' AND '2005-05-31' THEN 1 ELSE 0 END AS rented_in_may
FROM
    sakila.film f
JOIN
    sakila.inventory i USING (film_id)
JOIN
    sakila.rental r USING (inventory_id)
WHERE
    r.rental_date >= '2005-05-01' AND r.rental_date < '2005-06-01';
    
    
SELECT
    DISTINCT f.title,
    MAX(CASE WHEN r.rental_date BETWEEN '2005-05-01' AND '2005-05-31' THEN 1 ELSE 0 END) AS rented_in_may
FROM
    sakila.film f
LEFT JOIN
    sakila.inventory i USING (film_id)
LEFT JOIN
    sakila.rental r USING (inventory_id)
GROUP BY
    f.title;

