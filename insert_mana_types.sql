INSERT INTO mtg.mana_types (color, basic_land, abbr)
VALUES ('White', 'Plains', 'W')
ON CONFLICT DO NOTHING;

INSERT INTO mtg.mana_types (color, basic_land, abbr)
VALUES ('Blue', 'Island', 'U')
ON CONFLICT DO NOTHING;

INSERT INTO mtg.mana_types (color, basic_land, abbr)
VALUES ('Black', 'Swamp', 'B')
ON CONFLICT DO NOTHING;

INSERT INTO mtg.mana_types (color, basic_land, abbr)
VALUES ('Red', 'Mountain', 'R')
ON CONFLICT DO NOTHING;

INSERT INTO mtg.mana_types (color, basic_land, abbr)
VALUES ('Green', 'Forest', 'G')
ON CONFLICT DO NOTHING;