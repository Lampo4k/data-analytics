SELECT name, rating  from pizzeria
WHERE 3.5 <= rating AND rating <= 5
ORDER BY rating DESC;

SELECT name, rating  from pizzeria
WHERE rating BETWEEN 3.5 AND 5
ORDER BY rating;