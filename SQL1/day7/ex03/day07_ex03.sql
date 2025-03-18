SELECT visits.name,
       COALESCE(visits.count, 0) + COALESCE(orders.count, 0) AS total_count
FROM (SELECT pizzeria.name,
             COUNT( * ) AS count,
             'visits' AS action_type
      FROM person_visits
           INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
      GROUP BY pizzeria.name) AS visits
FULL JOIN (SELECT pizzeria.name,
                  COUNT( * ) AS count,
                  'order' AS action_type
           FROM person_order
                  INNER JOIN menu ON person_order.menu_id = menu.id
                               INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
           GROUP BY pizzeria.name) AS orders
        ON visits.name = orders.name
ORDER BY 2 desc, 1;
