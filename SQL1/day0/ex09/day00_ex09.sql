SELECT (SELECT name FROM person WHERE person_id = person.id) AS person_name,
       (SELECT name FROM pizzeria WHERE pizzeria_id = pizzeria.id) AS  pizzeria_name
FROM (select * from person_visits where visit_date between '2022-01-07' and '2022-01-09') AS pv
ORDER BY person_name,
pizzeria_name DESC;