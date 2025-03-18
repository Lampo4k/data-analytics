SELECT name
FROM person INNER JOIN person_order ON person_order.person_id = person.id
            INNER JOIN menu ON person_order.menu_id = menu.id
WHERE address IN ('Moscow', 'Samara')
  AND menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
  AND gender = 'male'
ORDER BY name DESC;

