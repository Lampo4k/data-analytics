SELECT pizza_name, price, pizzeria.name AS pizzeria_name
FROM (
    SELECT id AS menu_id FROM menu
    EXCEPT
    SELECT menu_id
    FROM person_order
     ) AS po INNER JOIN menu on po.menu_id = menu.id
    INNER JOIN pizzeria on pizzeria.id = menu.pizzeria_id
    ORDER BY 1,2
