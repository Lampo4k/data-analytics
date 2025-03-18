SELECT id, person_id, menu_id, order_date from person_order
WHERE id % 2 = 0
ORDER BY ID;