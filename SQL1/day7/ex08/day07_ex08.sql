SELECT person.address, pizzeria.name, COUNT(*) count_of_orders
FROM person_order INNER JOIN person ON person_order.person_id = person.id
                  INNER JOIN menu ON menu.id = person_order.menu_id
                  INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY person.address, pizzeria.name
ORDER BY 1, 2;