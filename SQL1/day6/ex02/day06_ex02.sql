SELECT person.name,
       pizza_name,
       price,
       price - (price * (discount/100)) AS discount_price,
       pizzeria.name AS pizzeria_name
FROM person_order INNER JOIN person ON person_order.person_id = person.id
                  INNER JOIN menu ON person_order.menu_id = menu.id
                  INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                  INNER JOIN person_discounts ON person.id = person_discounts.person_id
                                            AND pizzeria.id = person_discounts.pizzeria_id
ORDER BY 1, 2;