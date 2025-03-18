COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор записи';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор клиента';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Скидка клиента';
COMMENT ON TABLE person_discounts IS 'Расчет персональной скидки для клиентов: клиент-пиццерия-скидка';