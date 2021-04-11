--- Сколько карт требуют красную ману
SELECT count(*) FROM mtg.cards
WHERE id in (SELECT card_fk FROM mtg.mana_cost
WHERE mana_type_fk = (
    SELECT id FROM mtg.mana_types
    WHERE abbr = 'R'
));

--- Существо с максимальной power
WITH power(maximum) AS (
    SELECT max(power) FROM mtg.creatures
)
SELECT name, power.maximum FROM mtg.cards, power
WHERE id in (
    SELECT (card_fk) FROM mtg.card_types
    WHERE creature_fk = (
        SELECT id FROM mtg.creatures
        WHERE power = power.maximum
    )
);

--- Сколько карт имеют перманентный тип
SELECT count(*) FROM mtg.cards
JOIN mtg.card_types ON card_types.card_fk = cards.id
JOIN mtg.types ON card_types.type_fk = types.id
WHERE types.is_permanent = FALSE;

--- Сколько карт с подтипом Beast требуют зеленую ману
SELECT count(*) FROM mtg.cards
WHERE id in (
    SELECT card_fk FROM mtg.mana_cost
    WHERE mana_type_fk = (
        SELECT id FROM mtg.mana_types
        WHERE abbr = 'G'
    )
    INTERSECT
    SELECT card_fk FROM mtg.card_subtypes
    WHERE sub_type_fk in (
        SELECT id FROM mtg.sub_types
        WHERE name = 'Beast'
    )
);

--- Сколько карт имеют супертип 'Legendary'
SELECT count(*) FROM mtg.cards
WHERE super_type_fk in (
    SELECT id FROM mtg.super_types
    WHERE name = 'Legendary'
);


--- Средняя длина текста на карте
SELECT avg(length(oracle_text)) FROM mtg.cards;

--- Уникальные не пустые flavor_text для карт
WITH repr(card_id, flavor_text) AS (
    SELECT card_id, flavor_text FROM mtg.representations
    WHERE length(flavor_text) > 0
)
SELECT DISTINCT name, flavor_text FROM mtg.cards, repr
WHERE id IN (
    SELECT card_id FROM repr
);

--- Сколько сетов типа masters было выпущено после некоторой даты
SELECT count(*) FROM mtg.sets
WHERE type = 'masters' AND release_date > '2010-05-01';

--- Когда был выпущен последний промо сет
SELECT max(release_date) FROM mtg.sets
WHERE type = 'promo';

--- Наименования сетов, в которых были выпущены существа с силой больше 2
SELECT sets.name FROM mtg.sets
JOIN mtg.representations ON sets.id = representations.set_id
JOIN mtg.cards ON representations.card_id = cards.id
JOIN mtg.card_types ON cards.id = card_types.card_fk
WHERE creature_fk IN (
    SELECT id FROM mtg.creatures
    WHERE power > 2
);








