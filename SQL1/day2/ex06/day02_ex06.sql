SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM person_order INNER JOIN menu ON menu.id = person_order.menu_id
                  INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                  INNER JOIN person ON person.id = person_order.person_id
WHERE person.name IN ('Anna', 'Denis')
ORDER BY 1, 2;


