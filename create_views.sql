--- Карты с укороченным oracle_text
CREATE OR REPLACE VIEW mtg.cards_view AS
SELECT name, substring(oracle_text for 10) || '...' AS short_text
FROM mtg.cards;

--- Сконкатенированные типы карты
CREATE OR REPLACE VIEW mtg.typelines AS
SELECT cards.name, coalesce(string_agg(types.name, ', ') || '.', '') AS typeline
FROM mtg.cards
LEFT JOIN mtg.card_types ON cards.id = card_types.card_fk
JOIN mtg.types ON card_types.type_fk = types.id
GROUP BY cards.name;

--- Строковое представление манакоста карты
CREATE OR REPLACE VIEW mtg.manalines AS
SELECT cards.name,
       coalesce(string_agg(
           CASE amount
           WHEN 1 THEN '{' || abbr || '}'
           ELSE '{' || amount || abbr || '}'
           END, ''), '') AS manaline
FROM mtg.cards
LEFT JOIN mtg.mana_cost ON cards.id = mana_cost.card_fk
LEFT JOIN mtg.mana_types ON mana_cost.mana_type_fk = mana_types.id
GROUP BY cards.name;

--- Все репринты карт
CREATE OR REPLACE VIEW mtg.prints_view AS
SELECT sets.name AS set_name, sets.id AS set_id,
       cards.name, cards.id AS card_id,
       flavor_text, image_artist AS artist
FROM mtg.cards
JOIN mtg.representations on cards.id = representations.card_id
JOIN mtg.sets ON representations.set_id = sets.id;

--- Все существа
CREATE OR REPLACE VIEW mtg.creatures_view AS
SELECT cards.id, cards.name, power, toughness
FROM mtg.cards
JOIN mtg.card_types ON cards.id = card_types.card_fk
JOIN mtg.types ON card_types.type_fk = types.id
JOIN mtg.creatures ON card_types.creature_fk = creatures.id
WHERE types.name = 'Creature';

--- Карты со своими подтипами
CREATE OR REPLACE VIEW mtg.cards_subtypes_view AS
SELECT cards.id, cards.name, sub_types.id AS subtype_id, sub_types.name AS subtype_name
FROM mtg.cards
LEFT JOIN mtg.card_subtypes ON cards.id = card_subtypes.card_fk
JOIN mtg.sub_types ON card_subtypes.sub_type_fk = sub_types.id;





