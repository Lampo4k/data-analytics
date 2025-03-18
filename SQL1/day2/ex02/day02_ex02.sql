SELECT DISTINCT COALESCE(person.name, '-') AS person_name,
                q.visit_date,
                COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM person FULL JOIN (SELECT * FROM person_visits
                      WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') q
                        ON person.id = q.person_id
                        FULL JOIN pizzeria ON pizzeria.id = q.pizzeria_id
ORDER BY 1, 2, 3;

