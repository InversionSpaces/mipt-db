DELETE FROM mtg.types
WHERE name = 'Creature';

DELETE FROM mtg.sub_types
WHERE name = 'Human';

DELETE FROM mtg.sets
WHERE name = 'Mystery Booster';

INSERT INTO mtg.card_types (type_fk)
VALUES(0);

INSERT INTO mtg.card_subtypes (card_fk)
VALUES(-1);

INSERT INTO mtg.cards (name, oracle_text, super_type_fk)
VALUES ('Random', 'Text', 100500);

UPDATE mtg.cards
SET super_type_fk = 100500
WHERE name = 'Lord of the Undead';

UPDATE mtg.creatures
SET power = -100
WHERE power >= 0;

UPDATE mtg.planeswalkers
SET starting_loyalty = -100
WHERE starting_loyalty >= 0;

UPDATE mtg.types
SET name = null
WHERE is_permanent = TRUE;