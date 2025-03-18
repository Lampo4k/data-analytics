CREATE VIEW v_price_with_discount AS
SELECT name, pizza_name, price, round(price - price * 0.1) as discount_price
FROM person_order INNER JOIN person ON person.id = person_order.person_id
                  INNER JOIN menu ON menu.id = person_order.menu_id
ORDER BY person.name, menu.pizza_name;

