--- Название и сетов и сколько в них было выпущено карт перманентных типов,
--- если их было выпущено больше двух
SELECT sets.name, count(*) AS count FROM mtg.cards
JOIN mtg.representations ON cards.id = representations.card_id
JOIN mtg.sets ON representations.set_id = sets.id
JOIN mtg.card_types ON cards.id = card_types.card_fk
JOIN mtg.types ON card_types.type_fk = types.id
WHERE types.is_permanent = TRUE
GROUP BY sets.name
HAVING count(*) > 2
ORDER BY count DESC;

--- Разница в выпущенном количестве карт между соседними по дате сетами
--- (сеты без выпущенных карт отбрасываются)
SELECT sets.name, release_date,
COALESCE(count - LAG(count) OVER(ORDER BY release_date ASC), 0) AS diff
FROM (
    SELECT name, count(*) AS count
    FROM mtg.sets
    JOIN mtg.representations ON sets.id = representations.set_id
    GROUP BY name
) AS counts
JOIN mtg.sets ON sets.name = counts.name
ORDER BY release_date ASC;

--- Для каждого уровня редкости сколько карточек,
--- имеющих его было напечатано к дате
SELECT rarity, release_date,
count(*) OVER (PARTITION BY rarity ORDER BY release_date)
FROM mtg.representations
JOIN mtg.sets ON representations.set_id = sets.id;

--- Средняя мощь существа по каждому подтипу существа
SELECT DISTINCT sub_types.name,
avg(creatures.power) OVER (PARTITION BY sub_types.name)
FROM (
    SELECT cards.id, card_types.creature_fk
    FROM mtg.cards
    JOIN mtg.card_types ON cards.id = card_types.card_fk
    JOIN mtg.types ON card_types.type_fk = types.id
    WHERE types.name = 'Creature'
) AS creature_cards
JOIN mtg.creatures ON creature_cards.creature_fk = creatures.id
JOIN mtg.card_subtypes ON creature_cards.id = card_subtypes.card_fk
JOIN mtg.sub_types ON card_subtypes.sub_type_fk = sub_types.id;

--- Конвертированный манакост для карт
--- (карты без манакоста игнорируются)
SELECT DISTINCT cards.name,
sum(CASE abbr WHEN 'X' THEN 0 ELSE amount END) OVER (PARTITION BY cards.name)
FROM mtg.cards
JOIN mtg.mana_cost ON cards.id = mana_cost.card_fk
JOIN mtg.mana_types ON mana_cost.mana_type_fk = mana_types.id;