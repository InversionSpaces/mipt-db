INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Death\'s-Head Buzzard', E'Flying
When Death\'s-Head Buzzard dies, all creatures get -1/-1 until end of turn.'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (2, 1) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Death\'s-Head Buzzard'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Bird') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Death\'s-Head Buzzard'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Bird')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Death\'s-Head Buzzard'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'B'), 
2); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Death\'s-Head Buzzard'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/8/a/8a8d4fd9-1f9e-41f0-9114-d1a698506ad9.jpg?1562531685', 'Marcelo Vignali', E'Infested with vermin, ever hungering, dropping from night\'s sky.', 
(SELECT id FROM mtg.cards WHERE name = E'Death\'s-Head Buzzard'), 
(SELECT id FROM mtg.sets WHERE code = 'scg'), 
'common'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/f/5/f507174c-6e8c-4711-9ce7-680413af99f6.jpg?1562944334', 'Marcelo Vignali', E'Infested with vermin, ever hungering, dropping from night\'s sky.', 
(SELECT id FROM mtg.cards WHERE name = E'Death\'s-Head Buzzard'), 
(SELECT id FROM mtg.sets WHERE code = 'vma'), 
'common'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/4/2/426aeebc-3ff5-411d-b123-49a42e57e9de.jpg?1562434970', 'Marcelo Vignali', E'Infested with vermin, ever hungering, dropping from night\'s sky.', 
(SELECT id FROM mtg.cards WHERE name = E'Death\'s-Head Buzzard'), 
(SELECT id FROM mtg.sets WHERE code = 'a25'), 
'common'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Vessel of Volatility', E'{1}{R}, Sacrifice Vessel of Volatility: Add {R}{R}{R}{R}.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Vessel of Volatility'), 
(SELECT id FROM mtg.types WHERE name = 'Enchantment')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Vessel of Volatility'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'R'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Vessel of Volatility'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/8/1/81647b86-2c84-4a14-8d5a-919f7a5b8bc7.jpg?1576384955', 'Kieran Yanner', E'"To be honest, I\'m not quite sure what\'s going to happen."
—Renna, Selhoff alchemist', 
(SELECT id FROM mtg.cards WHERE name = E'Vessel of Volatility'), 
(SELECT id FROM mtg.sets WHERE code = 'soi'), 
'common'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/e/6/e6a554ac-da71-4bff-bd26-417c4c89ce61.jpg?1573512844', 'Kieran Yanner', E'"To be honest, I\'m not quite sure what\'s going to happen."
—Renna, Selhoff alchemist', 
(SELECT id FROM mtg.cards WHERE name = E'Vessel of Volatility'), 
(SELECT id FROM mtg.sets WHERE code = 'mb1'), 
'common'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Dimir Guildgate', E'Dimir Guildgate enters the battlefield tapped.
{T}: Add {U} or {B}.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Dimir Guildgate'), 
(SELECT id FROM mtg.types WHERE name = 'Land')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Gate') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Dimir Guildgate'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Gate')); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/b/7/b7129bdf-de02-4ed2-b5de-f774b8a7d302.jpg?1572894125', 'Cliff Childs', E'"Every guild dreads infiltration. I should know—I\'ve been a member of all of them."
—Lazav', 
(SELECT id FROM mtg.cards WHERE name = E'Dimir Guildgate'), 
(SELECT id FROM mtg.sets WHERE code = 'grn'), 
'common'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/3/a/3a31b8f9-5e12-4aa2-ab2c-84ad30315e8b.jpg?1593815016', 'Cliff Childs', E'In the cold corridors of the undercity, misinformation unfurls from Duskmantle like a spreading stain.', 
(SELECT id FROM mtg.cards WHERE name = E'Dimir Guildgate'), 
(SELECT id FROM mtg.sets WHERE code = 'mm3'), 
'common'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Hunting Cheetah', E'Whenever Hunting Cheetah deals damage to an opponent, you may search your library for a Forest card, reveal that card, put it into your hand, then shuffle your library.'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (2, 3) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Hunting Cheetah'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Cat') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Hunting Cheetah'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Cat')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Hunting Cheetah'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'G'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Hunting Cheetah'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/9/9/99030058-283a-4888-8bfe-1bfab946fc98.jpg?1562927351', 'Fang Yue', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Hunting Cheetah'), 
(SELECT id FROM mtg.sets WHERE code = 'me3'), 
'common'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/5/6/56a63628-17e6-4845-96b4-c82c3e7e8fb5.jpg?1562256538', 'Fang Yue', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Hunting Cheetah'), 
(SELECT id FROM mtg.sets WHERE code = 'ptk'), 
'uncommon'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Carpet of Flowers', E'At the beginning of each of your main phases, if you haven\'t added mana with this ability this turn, you may add X mana of any one color, where X is the number of Islands target opponent controls.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Carpet of Flowers'), 
(SELECT id FROM mtg.types WHERE name = 'Enchantment')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Carpet of Flowers'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'G'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/f/f/ff76c732-2eec-4836-9230-22e2680e98ec.jpg?1573513284', 'Rebecca Guay', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Carpet of Flowers'), 
(SELECT id FROM mtg.sets WHERE code = 'mb1'), 
'uncommon'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Inspirit', E'Untap target creature. It gets +2/+4 until end of turn.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Inspirit'), 
(SELECT id FROM mtg.types WHERE name = 'Instant')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Inspirit'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'W'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Inspirit'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/5/d/5d30356b-ab7b-4366-9f90-15703d5c3d10.jpg?1562735851', 'Simon Bisley', E'"The hour of your redemption is here. . . . Rally to me. . . . rise and strike. Strike at every favorable opportunity. For your homes and hearths, strike!"
—General Douglas MacArthur, to the people of the Philippines', 
(SELECT id FROM mtg.cards WHERE name = E'Inspirit'), 
(SELECT id FROM mtg.sets WHERE code = '9ed'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/5/5/55e0e300-db79-4328-ba1d-9c3910e47f52.jpg?1595099724', 'Keith Garletts', E'"We will force the Cabal into their own pits!"', 
(SELECT id FROM mtg.cards WHERE name = E'Inspirit'), 
(SELECT id FROM mtg.sets WHERE code = 'ons'), 
'uncommon'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Valakut Predator', E'Landfall — Whenever a land enters the battlefield under your control, Valakut Predator gets +2/+2 until end of turn.'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (2, 2) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Valakut Predator'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Elemental') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Valakut Predator'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Elemental')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Valakut Predator'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'R'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Valakut Predator'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/d/f/dfd2bacb-3ada-4952-889b-da325d7a0990.jpg?1573512812', 'Kev Walker', E'"Whatever volcanoes dream of, it seems like they always wake up grumpy."
—Raff Slugeater, goblin shortcutter', 
(SELECT id FROM mtg.cards WHERE name = E'Valakut Predator'), 
(SELECT id FROM mtg.sets WHERE code = 'mb1'), 
'common'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/8/8/88318272-8192-4d6d-a22a-eca87abb480d.jpg?1562927148', 'Kev Walker', E'"Whatever volcanoes dream of, it seems like they always wake up grumpy."
—Raff Slugeater, goblin shortcutter', 
(SELECT id FROM mtg.cards WHERE name = E'Valakut Predator'), 
(SELECT id FROM mtg.sets WHERE code = 'bfz'), 
'common'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Loyal Sentry', E'When Loyal Sentry blocks a creature, destroy that creature and Loyal Sentry.'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (1, 1) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Loyal Sentry'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Human') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Loyal Sentry'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Human')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Soldier') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Loyal Sentry'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Soldier')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Loyal Sentry'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'W'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/b/f/bf02b5fa-8589-462e-90f5-552c8f28a22f.jpg?1562554465', 'Michael Sutfin', E'"My cause is simple: To stop you, at any cost, from ever seeing the inside of this keep."', 
(SELECT id FROM mtg.cards WHERE name = E'Loyal Sentry'), 
(SELECT id FROM mtg.sets WHERE code = '10e'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/e/5/e50b20e6-5853-405e-b2f5-3e302dc7103f.jpg?1562875297', 'Ron Spears', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Loyal Sentry'), 
(SELECT id FROM mtg.sets WHERE code = 's99'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/7/7/7736c041-d333-4748-8045-79d42aba6e05.jpg?1562270239', 'Michael Sutfin', E'"My cause is simple: To stop you, at any cost, from ever seeing the inside of this keep."', 
(SELECT id FROM mtg.cards WHERE name = E'Loyal Sentry'), 
(SELECT id FROM mtg.sets WHERE code = 'ddf'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/8/7/879b6bc4-51c8-48a0-8de4-1b3be5b6dd22.jpg?1573505933', 'Sara Winters', E'His watch ends only when he does.', 
(SELECT id FROM mtg.cards WHERE name = E'Loyal Sentry'), 
(SELECT id FROM mtg.sets WHERE code = 'mb1'), 
'common'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Disposal Mummy', E'When Disposal Mummy enters the battlefield, exile target card from an opponent\'s graveyard.'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (2, 3) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Disposal Mummy'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Zombie') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Disposal Mummy'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Zombie')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Jackal') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Disposal Mummy'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Jackal')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Disposal Mummy'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'W'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Disposal Mummy'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/a/d/ad806d67-4c98-438b-859f-b1358281e09d.jpg?1562810537', 'Gabor Szikszai', E'Without the viziers to oversee their actions, some anointed went to extreme lengths to fulfill their directives.', 
(SELECT id FROM mtg.cards WHERE name = E'Disposal Mummy'), 
(SELECT id FROM mtg.sets WHERE code = 'hou'), 
'common'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/b/4/b446e445-5305-4c3d-a146-caeafb26beca.jpg?1597076527', 'Gabor Szikszai', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Disposal Mummy'), 
(SELECT id FROM mtg.sets WHERE code = 'akr'), 
'common'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/0/8/08c1ed4b-b9e0-43ba-a9e0-e836cb5f6dcc.jpg?1573505243', 'Gabor Szikszai', E'Without the viziers to oversee their actions, some anointed went to extreme lengths to fulfill their directives.', 
(SELECT id FROM mtg.cards WHERE name = E'Disposal Mummy'), 
(SELECT id FROM mtg.sets WHERE code = 'mb1'), 
'common'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Benediction of Moons', E'You gain 1 life for each player.
Haunt (When this spell card is put into a graveyard after resolving, exile it haunting target creature.)
When the creature Benediction of Moons haunts dies, you gain 1 life for each player.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Benediction of Moons'), 
(SELECT id FROM mtg.types WHERE name = 'Sorcery')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Benediction of Moons'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'W'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/d/8/d8ea99d1-9e88-4b14-b0b3-39bcd8191eab.jpg?1593271827', 'Matt Cavotta', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Benediction of Moons'), 
(SELECT id FROM mtg.sets WHERE code = 'gpt'), 
'common'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Rakshasa Debaser', E'Whenever Rakshasa Debaser attacks, put target creature card from defending player\'s graveyard onto the battlefield under your control.
Encore {6}{B}{B} ({6}{B}{B}, Exile this card from your graveyard: For each opponent, create a token copy that attacks that opponent this turn if able. They gain haste. Sacrifice them at the beginning of the next end step. Activate only as a sorcery.)'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (6, 6) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Rakshasa Debaser'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Cat') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Rakshasa Debaser'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Cat')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Demon') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Rakshasa Debaser'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Demon')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Rakshasa Debaser'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'B'), 
2); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Rakshasa Debaser'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
4); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/e/3/e31fd23d-e6b2-412b-b2ff-c99812365001.jpg?1616447038', 'Yigit Koroglu', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Rakshasa Debaser'), 
(SELECT id FROM mtg.sets WHERE code = 'cmr'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text, super_type_fk) 
VALUES(E'Plains', E'({T}: Add {W}.)', 
(SELECT id FROM mtg.super_types WHERE name = 'Basic')); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Plains'), 
(SELECT id FROM mtg.types WHERE name = 'Land')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Plains') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Plains'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Plains')); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/7/0/707c5467-2a54-4f77-a845-b50c9f5fc041.jpg?1562705705', 'Howard Lyon', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Plains'), 
(SELECT id FROM mtg.sets WHERE code = 'c15'), 
'common'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/2/f/2f6778ff-6c1c-498a-bbfa-46c35b77a72a.jpg?1594266485', 'Jonas De Ro', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Plains'), 
(SELECT id FROM mtg.sets WHERE code = 'm21'), 
'common'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/e/0/e0f829da-09a2-4482-8b04-1b63d3a037ee.jpg?1538790841', 'Alayna Danner', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Plains'), 
(SELECT id FROM mtg.sets WHERE code = 'pss3'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Fires of Yavimaya', E'Creatures you control have haste.
Sacrifice Fires of Yavimaya: Target creature gets +2/+2 until end of turn.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Fires of Yavimaya'), 
(SELECT id FROM mtg.types WHERE name = 'Enchantment')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Fires of Yavimaya'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'R'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Fires of Yavimaya'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'G'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Fires of Yavimaya'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/3/3/33283200-3d1a-41be-ad22-9fc7d56cff66.jpg?1562864949', 'Izzy', E'Yavimaya lights the quickest path to battle.', 
(SELECT id FROM mtg.cards WHERE name = E'Fires of Yavimaya'), 
(SELECT id FROM mtg.sets WHERE code = 'cns'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/4/f/4fddd715-5321-4eee-b743-d0697a8c8dd6.jpg?1592752279', 'Izzy', E'Yavimaya lights the quickest path to battle.', 
(SELECT id FROM mtg.cards WHERE name = E'Fires of Yavimaya'), 
(SELECT id FROM mtg.sets WHERE code = 'ddl'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/2/a/2a42096d-b5f3-4be7-bc66-e6adf64ea6c4.jpg?1575572059', 'Val Mayerik', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Fires of Yavimaya'), 
(SELECT id FROM mtg.sets WHERE code = 'pc2'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/0/d/0d4d0211-136e-4362-bf7c-b7e9499584bf.jpg?1562897706', 'Val Mayerik', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Fires of Yavimaya'), 
(SELECT id FROM mtg.sets WHERE code = 'arc'), 
'uncommon'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Bottle of Suleiman', E'{1}, Sacrifice Bottle of Suleiman: Flip a coin. If you win the flip, create a 5/5 colorless Djinn artifact creature token with flying. If you lose the flip, Bottle of Suleiman deals 5 damage to you.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Bottle of Suleiman'), 
(SELECT id FROM mtg.types WHERE name = 'Artifact')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Bottle of Suleiman'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
4); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/6/c/6c1c2ea2-09ba-4a0e-b5b6-c06068f0da75.jpg?1559596870', 'Jesper Myrfors', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Bottle of Suleiman'), 
(SELECT id FROM mtg.sets WHERE code = '3ed'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Dross Ripper', E'{2}{B}: Dross Ripper gets +1/+1 until end of turn.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Dross Ripper'), 
(SELECT id FROM mtg.types WHERE name = 'Artifact')); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (3, 3) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Dross Ripper'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Dog') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Dross Ripper'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Dog')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Dross Ripper'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
4); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/5/5/55d54f08-53f0-41b2-8b86-8244515224eb.jpg?1562611427', 'David Rapoza', E'"Such a creation serves no purpose other than exterminating every one of us."
—Sadra Alic, Neurok strategist', 
(SELECT id FROM mtg.cards WHERE name = E'Dross Ripper'), 
(SELECT id FROM mtg.sets WHERE code = 'mbs'), 
'common'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Anurid Brushhopper', E'Discard two cards: Exile Anurid Brushhopper. Return it to the battlefield under its owner\'s control at the beginning of the next end step.'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (3, 4) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Anurid Brushhopper'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Frog') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Anurid Brushhopper'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Frog')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Beast') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Anurid Brushhopper'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Beast')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Anurid Brushhopper'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'G'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Anurid Brushhopper'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'W'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Anurid Brushhopper'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/b/0/b09204c7-3e3d-484a-a4f7-da1b818e3884.jpg?1562631503', 'Arnie Swekel', E'It\'s so tough it can frighten *itself* into hiding.', 
(SELECT id FROM mtg.cards WHERE name = E'Anurid Brushhopper'), 
(SELECT id FROM mtg.sets WHERE code = 'jud'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/0/9/097c7637-ab37-4d99-9828-d53bdd849924.jpg?1610234757', 'Arnie Swekel', E'It\'s so tough it can frighten *itself* into hiding.', 
(SELECT id FROM mtg.cards WHERE name = E'Anurid Brushhopper'), 
(SELECT id FROM mtg.sets WHERE code = 'wc02'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/d/e/de9e4439-16f7-47d5-a4ff-1e104ec05344.jpg?1562541901', 'Arnie Swekel', E'It\'s so tough it can frighten itself into hiding.', 
(SELECT id FROM mtg.cards WHERE name = E'Anurid Brushhopper'), 
(SELECT id FROM mtg.sets WHERE code = 'wc03'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Militia Bugler', E'Vigilance (Attacking doesn\'t cause this creature to tap.)
When Militia Bugler enters the battlefield, look at the top four cards of your library. You may reveal a creature card with power 2 or less from among them and put it into your hand. Put the rest on the bottom of your library in a random order.'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (2, 3) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Militia Bugler'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Human') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Militia Bugler'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Human')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Soldier') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Militia Bugler'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Soldier')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Militia Bugler'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'W'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Militia Bugler'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/f/6/f6893437-775f-439d-9ffc-64b2ea8544d4.jpg?1570573724', 'David Gaillet', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Militia Bugler'), 
(SELECT id FROM mtg.sets WHERE code = 'pm19'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/5/2/52b079b6-3ff8-4194-ac23-cc7dfb6b6839.jpg?1562544777', 'David Gaillet', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Militia Bugler'), 
(SELECT id FROM mtg.sets WHERE code = 'prm'), 
'uncommon'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Lord of Atlantis', E'Other Merfolk get +1/+1 and have islandwalk. (They can\'t be blocked as long as defending player controls an Island.)'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (2, 2) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Lord of Atlantis'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Merfolk') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Lord of Atlantis'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Merfolk')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Lord of Atlantis'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'U'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/f/d/fd87fd5b-5b6a-48bc-9b65-7c78c867728d.jpg?1559591525', 'Melissa A. Benson', E'A master of tactics, the Lord of Atlantis makes his people bold in battle merely by arriving to lead them.', 
(SELECT id FROM mtg.cards WHERE name = E'Lord of Atlantis'), 
(SELECT id FROM mtg.sets WHERE code = 'cei'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/a/9/a9407b60-8921-4531-bdbe-9a82aaa38d28.jpg?1562781744', 'Melissa A. Benson', E'A master of tactics, the Lord of Atlantis makes his people bold in battle merely by arriving to lead them.', 
(SELECT id FROM mtg.cards WHERE name = E'Lord of Atlantis'), 
(SELECT id FROM mtg.sets WHERE code = 'tsb'), 
'special'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/d/d/dd370ce8-8e0c-4147-a044-a70bfabf0a4f.jpg?1559592957', 'Melissa A. Benson', E'A master of tactics, the Lord of Atlantis makes his people bold in battle merely by arriving to lead them.', 
(SELECT id FROM mtg.cards WHERE name = E'Lord of Atlantis'), 
(SELECT id FROM mtg.sets WHERE code = 'sum'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/4/5/45066539-6bc2-467f-acfb-00938ba837ef.jpg?1559596662', 'Melissa A. Benson', E'A master of tactics, the Lord of Atlantis makes his people bold in battle merely by arriving to lead them.', 
(SELECT id FROM mtg.cards WHERE name = E'Lord of Atlantis'), 
(SELECT id FROM mtg.sets WHERE code = '3ed'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Armageddon', E'Destroy all lands.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Armageddon'), 
(SELECT id FROM mtg.types WHERE name = 'Sorcery')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Armageddon'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'W'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Armageddon'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
3); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/f/1/f11679b6-d2a4-4201-862a-524e28959391.jpg?1562875744', 'Rob Alexander', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Armageddon'), 
(SELECT id FROM mtg.sets WHERE code = 's99'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/c/c/ccf3abe6-0b86-4010-8fc6-616af77b4ace.jpg?1562822842', 'Rob Alexander', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Armageddon'), 
(SELECT id FROM mtg.sets WHERE code = '6ed'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Sunbond', E'Enchant creature
Enchanted creature has "Whenever you gain life, put that many +1/+1 counters on this creature."'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Sunbond'), 
(SELECT id FROM mtg.types WHERE name = 'Enchantment')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Aura') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Sunbond'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Aura')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Sunbond'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'W'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Sunbond'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
3); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/9/f/9f14bbff-8a3c-4aa0-a5aa-0dd6cb23b2a3.jpg?1593091578', 'Noah Bradley', E'"I was not chosen for my faith in the gods. Sometimes the gods must put their faith in us."
—Elspeth', 
(SELECT id FROM mtg.cards WHERE name = E'Sunbond'), 
(SELECT id FROM mtg.sets WHERE code = 'bng'), 
'uncommon'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Channeled Force', E'As an additional cost to cast this spell, discard X cards.
Target player draws X cards. Channeled Force deals X damage to up to one target creature or planeswalker.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Channeled Force'), 
(SELECT id FROM mtg.types WHERE name = 'Instant')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Channeled Force'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'U'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Channeled Force'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'R'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Channeled Force'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/8/9/8918d24e-8ae8-4028-9f06-ba6fafcc717e.jpg?1591227972', 'Randy Vargas', E'Few monsters challenged Narset after they sensed her power.', 
(SELECT id FROM mtg.cards WHERE name = E'Channeled Force'), 
(SELECT id FROM mtg.sets WHERE code = 'iko'), 
'uncommon'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Phyrexian Metamorph', E'({U/P} can be paid with either {U} or 2 life.)
You may have Phyrexian Metamorph enter the battlefield as a copy of any artifact or creature on the battlefield, except it\'s an artifact in addition to its other types.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Phyrexian Metamorph'), 
(SELECT id FROM mtg.types WHERE name = 'Artifact')); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (0, 0) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Phyrexian Metamorph'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Shapeshifter') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Phyrexian Metamorph'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Shapeshifter')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Phyrexian Metamorph'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
3); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/c/a/cacaf5ec-6745-4584-9175-36c98742958f.jpg?1599710964', 'Thomas M. Baxa', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Phyrexian Metamorph'), 
(SELECT id FROM mtg.sets WHERE code = '2xm'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/d/6/d6afeb07-ed44-4e15-99b6-436f8365326f.jpg?1598304141', 'Jana Schirmer & Johannes Voss', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Phyrexian Metamorph'), 
(SELECT id FROM mtg.sets WHERE code = '2xm'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/d/2/d2e27911-87cb-49a0-a34f-6afe4bddd592.jpg?1562881786', 'Jana Schirmer & Johannes Voss', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Phyrexian Metamorph'), 
(SELECT id FROM mtg.sets WHERE code = 'nph'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/7/2/72e300dc-672f-4317-b8d5-11fccf9608c7.jpg?1562545686', 'Jung Park', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Phyrexian Metamorph'), 
(SELECT id FROM mtg.sets WHERE code = 'prm'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Stifle', E'Counter target activated or triggered ability. (Mana abilities can\'t be targeted.)'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Stifle'), 
(SELECT id FROM mtg.types WHERE name = 'Instant')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Stifle'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'U'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/6/1/616d1b20-61c1-4d39-a9b5-ad9fd61699e4.jpg?1562865442', 'Eric Fortune', E'"Superior force meets woefully inadequate object. What paradox were you expecting?"
—Azguri, archmage of Evos Isle', 
(SELECT id FROM mtg.cards WHERE name = E'Stifle'), 
(SELECT id FROM mtg.sets WHERE code = 'cns'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/e/a/ea24228f-da16-46eb-9dcf-a377286b6168.jpg?1562942013', 'Cliff Childs', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Stifle'), 
(SELECT id FROM mtg.sets WHERE code = 'mp2'), 
'mythic'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/8/8/88e5ddfe-e39a-4f93-b7ad-80a1de078e4b.jpg?1562546271', 'Eric Fortune', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Stifle'), 
(SELECT id FROM mtg.sets WHERE code = 'prm'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Illusionary Mask', E'{X}: You may choose a creature card in your hand whose mana cost could be paid by some amount of, or all of, the mana you spent on {X}. If you do, you may cast that card face down as a 2/2 creature spell without paying its mana cost. If the creature that spell becomes as it resolves has not been turned face up and would assign or deal damage, be dealt damage, or become tapped, instead it\'s turned face up and assigns or deals damage, is dealt damage, or becomes tapped. Activate this ability only any time you could cast a sorcery.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Illusionary Mask'), 
(SELECT id FROM mtg.types WHERE name = 'Artifact')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Illusionary Mask'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/a/2/a274a381-4eb0-4e27-aff4-4d94e61b726a.jpg?1559591826', 'Amy Weber', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Illusionary Mask'), 
(SELECT id FROM mtg.sets WHERE code = '2ed'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/7/7/77ccbbcb-6895-49bc-8353-66deec99db16.jpg?1559591885', 'Amy Weber', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Illusionary Mask'), 
(SELECT id FROM mtg.sets WHERE code = 'cei'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Conservator', E'{3}, {T}: Prevent the next 2 damage that would be dealt to you this turn.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Conservator'), 
(SELECT id FROM mtg.types WHERE name = 'Artifact')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Conservator'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
4); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/6/4/64692a57-da55-412f-bae6-fbb11883de1d.jpg?1539999682', 'Amy Weber', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Conservator'), 
(SELECT id FROM mtg.sets WHERE code = 'fbb'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/7/a/7acd7b94-6363-4032-bd73-03b9cde7923e.jpg?1559591614', 'Amy Weber', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Conservator'), 
(SELECT id FROM mtg.sets WHERE code = 'cei'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/a/f/af638210-0125-4540-9328-c6ae0de580a0.jpg?1559591779', 'Amy Weber', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Conservator'), 
(SELECT id FROM mtg.sets WHERE code = 'ced'), 
'uncommon'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Genesis Hydra', E'When you cast this spell, reveal the top X cards of your library. You may put a nonland permanent card with converted mana cost X or less from among them onto the battlefield. Then shuffle the rest into your library.
Genesis Hydra enters the battlefield with X +1/+1 counters on it.'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (0, 0) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Genesis Hydra'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Plant') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Genesis Hydra'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Plant')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Hydra') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Genesis Hydra'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Hydra')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Genesis Hydra'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'X'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Genesis Hydra'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'G'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/b/b/bb008ff0-d66d-4c54-9905-4c4307f5e4d1.jpg?1591320825', 'Peter Mohrbacher', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Genesis Hydra'), 
(SELECT id FROM mtg.sets WHERE code = 'c20'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/4/6/46f57176-a0ee-4772-9231-7ea0a016de73.jpg?1562909699', 'Peter Mohrbacher', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Genesis Hydra'), 
(SELECT id FROM mtg.sets WHERE code = 'pres'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/4/9/49f0118e-4449-4394-b4c1-5b4f83d7bc4a.jpg?1562848462', 'Peter Mohrbacher', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Genesis Hydra'), 
(SELECT id FROM mtg.sets WHERE code = 'ima'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/e/2/e27ccba5-470f-4c78-90de-5e7d327691ff.jpg?1562548691', 'Peter Mohrbacher', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Genesis Hydra'), 
(SELECT id FROM mtg.sets WHERE code = 'prm'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Fin-Clade Fugitives', E'Fin-Clade Fugitives can\'t be blocked by creatures with power 2 or less.
Encore {4}{G} ({4}{G}, Exile this card from your graveyard: For each opponent, create a token copy that attacks that opponent this turn if able. They gain haste. Sacrifice them at the beginning of the next end step. Activate only as a sorcery.)'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (7, 4) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Fin-Clade Fugitives'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Elf') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Fin-Clade Fugitives'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Elf')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Salamander') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Fin-Clade Fugitives'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Salamander')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Rogue') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Fin-Clade Fugitives'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Rogue')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Fin-Clade Fugitives'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'G'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Fin-Clade Fugitives'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
5); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/3/e/3eb7af70-e024-44bf-a52b-209074b005a3.jpg?1616447019', 'Simon Dominic', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Fin-Clade Fugitives'), 
(SELECT id FROM mtg.sets WHERE code = 'cmr'), 
'common'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Glorious Charge', E'Creatures you control get +1/+1 until end of turn.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Glorious Charge'), 
(SELECT id FROM mtg.types WHERE name = 'Instant')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Glorious Charge'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'W'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Glorious Charge'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/f/8/f8672cfd-e34b-4587-9e24-015e03c7574d.jpg?1562562109', 'Izzy', E'"One\'s blade is only as sharp as one\'s conviction."
—Ajani Goldmane', 
(SELECT id FROM mtg.cards WHERE name = E'Glorious Charge'), 
(SELECT id FROM mtg.sets WHERE code = 'm13'), 
'common'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Entomber Exarch', E'When Entomber Exarch enters the battlefield, choose one —
• Return target creature card from your graveyard to your hand.
• Target opponent reveals their hand. You choose a noncreature card from it. That player discards that card.'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (2, 2) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Entomber Exarch'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Cleric') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Entomber Exarch'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Cleric')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Entomber Exarch'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'B'), 
2); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Entomber Exarch'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/e/3/e39498cd-9b44-4563-b0fd-9258a52a85b2.jpg?1600700126', 'Svetlin Velinov', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Entomber Exarch'), 
(SELECT id FROM mtg.sets WHERE code = 'jmp'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/3/7/379c81d8-804b-4fe6-80df-8a4246fbf695.jpg?1593813267', 'Svetlin Velinov', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Entomber Exarch'), 
(SELECT id FROM mtg.sets WHERE code = 'mm3'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/7/f/7f58020e-6d4d-474d-8d4b-cfb7d5a5e9a8.jpg?1562879110', 'Svetlin Velinov', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Entomber Exarch'), 
(SELECT id FROM mtg.sets WHERE code = 'nph'), 
'uncommon'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Infernal Plunge', E'As an additional cost to cast this spell, sacrifice a creature.
Add {R}{R}{R}.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Infernal Plunge'), 
(SELECT id FROM mtg.types WHERE name = 'Sorcery')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Infernal Plunge'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'R'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/b/3/b3f50e17-c29c-4d2c-b3e7-45d1216b81ea.jpg?1562835822', 'Daarken', E'"Oh mighty Griselbrand, Scourge of the Heedless World, gladly I consume myself for thee!"', 
(SELECT id FROM mtg.cards WHERE name = E'Infernal Plunge'), 
(SELECT id FROM mtg.sets WHERE code = 'isd'), 
'common'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'The Eldest Reborn', E'(As this Saga enters and after your draw step, add a lore counter. Sacrifice after III.)
I — Each opponent sacrifices a creature or planeswalker.
II — Each opponent discards a card.
III — Put target creature or planeswalker card from a graveyard onto the battlefield under your control.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'The Eldest Reborn'), 
(SELECT id FROM mtg.types WHERE name = 'Enchantment')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Saga') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'The Eldest Reborn'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Saga')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'The Eldest Reborn'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'B'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'The Eldest Reborn'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
4); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/7/a/7a188d4c-ce2a-4ec7-8ea7-980f85f639da.jpg?1568004316', 'Jenn Ravenna Tran', E'', 
(SELECT id FROM mtg.cards WHERE name = E'The Eldest Reborn'), 
(SELECT id FROM mtg.sets WHERE code = 'c19'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/c/8/c8318f40-ecd5-429e-8fe2-febf31f64841.jpg?1562742744', 'Jenn Ravenna Tran', E'', 
(SELECT id FROM mtg.cards WHERE name = E'The Eldest Reborn'), 
(SELECT id FROM mtg.sets WHERE code = 'dom'), 
'uncommon'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Runesword', E'{3}, {T}: Target attacking creature gets +2/+0 until end of turn. When that creature leaves the battlefield this turn, sacrifice Runesword. If the creature deals damage to a creature this turn, the creature dealt damage can\'t be regenerated this turn. If a creature dealt damage by the targeted creature would die this turn, exile that creature instead.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Runesword'), 
(SELECT id FROM mtg.types WHERE name = 'Artifact')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Runesword'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
6); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/a/1/a11ec2f6-a0c7-4164-a562-fab7aab7d211.jpg?1562927570', 'Christopher Rush', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Runesword'), 
(SELECT id FROM mtg.sets WHERE code = 'chr'), 
'common'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/7/4/741dbcf2-3372-45a8-b66f-d2ae12b4aac6.jpg?1562922434', 'Christopher Rush', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Runesword'), 
(SELECT id FROM mtg.sets WHERE code = 'drk'), 
'uncommon'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Sylvan Safekeeper', E'Sacrifice a land: Target creature you control gains shroud until end of turn. (It can\'t be the target of spells or abilities.)'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (1, 1) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Sylvan Safekeeper'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Human') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Sylvan Safekeeper'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Human')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Wizard') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Sylvan Safekeeper'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Wizard')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Sylvan Safekeeper'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'G'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/f/1/f1b8413f-c9fc-4cea-b416-a1fcf651b009.jpg?1562632623', 'Pete Venters', E'"How could someone so small cause so much trouble?"
—Nomad sentry', 
(SELECT id FROM mtg.cards WHERE name = E'Sylvan Safekeeper'), 
(SELECT id FROM mtg.sets WHERE code = 'jud'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/6/6/6652d9bc-4916-4b90-9c6b-55dc382e7ee3.jpg?1561895825', 'Pete Venters', E'"How could someone so small cause so much trouble?"
—Nomad sentry', 
(SELECT id FROM mtg.cards WHERE name = E'Sylvan Safekeeper'), 
(SELECT id FROM mtg.sets WHERE code = 'wc02'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/c/1/c16b4eff-47fb-4643-b73c-edb55451b02e.jpg?1561957330', 'Magali Villeneuve', E'"He has been to the heart of the wood. Did you truly expect to wield power over him?"
—Oakhide druid', 
(SELECT id FROM mtg.cards WHERE name = E'Sylvan Safekeeper'), 
(SELECT id FROM mtg.sets WHERE code = 'c14'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Tolarian Scholar', E''); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (2, 3) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Tolarian Scholar'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Human') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Tolarian Scholar'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Human')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Wizard') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Tolarian Scholar'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Wizard')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Tolarian Scholar'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'U'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Tolarian Scholar'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/0/0/00d89839-60d7-4de2-a78a-1afdcc21c053.jpg?1562730535', 'Sara Winters', E'The Tolarian Academies embrace a tradition of study and research while discouraging the kinds of experiments that ruined the original island of Tolaria.', 
(SELECT id FROM mtg.cards WHERE name = E'Tolarian Scholar'), 
(SELECT id FROM mtg.sets WHERE code = 'dom'), 
'common'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Entirely Normal Armchair', E'During your turn, if Entirely Normal Armchair is in your hand, you may hide it on the battlefield.
{0}: Return Entirely Normal Armchair to its owner\'s hand. Only any opponent may activate this ability and only if they see Entirely Normal Armchair.
{2}, Sacrifice Entirely Normal Armchair: Destroy target attacking creature.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Entirely Normal Armchair'), 
(SELECT id FROM mtg.types WHERE name = 'Artifact')); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/e/e/eef04b83-c11a-498f-ab5e-5f05a97b7c98.jpg?1562945330', 'Tom Babbey', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Entirely Normal Armchair'), 
(SELECT id FROM mtg.sets WHERE code = 'ust'), 
'uncommon'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Lord of the Undead', E'Other Zombie creatures get +1/+1.
{1}{B}, {T}: Return target Zombie card from your graveyard to your hand.'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (2, 2) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Lord of the Undead'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Zombie') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Lord of the Undead'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Zombie')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Lord of the Undead'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'B'), 
2); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Lord of the Undead'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/d/e/de29133d-74e5-4631-a283-22aa3c848d96.jpg?1562742777', 'Brom', E'"I confer with Death itself. What could you possibly do to injure me?"', 
(SELECT id FROM mtg.cards WHERE name = E'Lord of the Undead'), 
(SELECT id FROM mtg.sets WHERE code = '9ed'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/7/9/792e773b-5feb-407f-a162-f35d6e693cca.jpg?1562550141', 'Brom', E'"Do not weep at your defeat, my dear. In death, you will serve a greater purpose—mine."', 
(SELECT id FROM mtg.cards WHERE name = E'Lord of the Undead'), 
(SELECT id FROM mtg.sets WHERE code = '10e'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/c/9/c95bacfd-e766-4e94-a22c-1996fdb11062.jpg?1599764449', 'Brom', E'"I confer with Death itself. What could you possibly do to injure me?"
—Lord Dralnu', 
(SELECT id FROM mtg.cards WHERE name = E'Lord of the Undead'), 
(SELECT id FROM mtg.sets WHERE code = 'plist'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Relentless Assault', E'Untap all creatures that attacked this turn. After this main phase, there is an additional combat phase followed by an additional main phase.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Relentless Assault'), 
(SELECT id FROM mtg.types WHERE name = 'Sorcery')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Relentless Assault'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'R'), 
2); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Relentless Assault'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/5/7/57f23cc3-da79-4e08-964f-b52815c40990.jpg?1562256541', 'He Jiancheng', E'With only 70,000 men under his command at the battle of Guandu, Cao Cao was able to defeat Yuan Shao and his 700,000.', 
(SELECT id FROM mtg.cards WHERE name = E'Relentless Assault'), 
(SELECT id FROM mtg.sets WHERE code = 'ptk'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/d/0/d00c810c-7d92-484b-9bed-deae5f29582b.jpg?1562555540', 'Greg Hildebrandt', E'"Mercy? Mercy is for the playground, not the battleground."', 
(SELECT id FROM mtg.cards WHERE name = E'Relentless Assault'), 
(SELECT id FROM mtg.sets WHERE code = '10e'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/c/6/c641c3d6-0364-4209-b908-1717e5e612ad.jpg?1562941813', 'Tom Wänerstrand', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Relentless Assault'), 
(SELECT id FROM mtg.sets WHERE code = 'p02'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Leyline of Vitality', E'If Leyline of Vitality is in your opening hand, you may begin the game with it on the battlefield.
Creatures you control get +0/+1.
Whenever a creature enters the battlefield under your control, you may gain 1 life.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Leyline of Vitality'), 
(SELECT id FROM mtg.types WHERE name = 'Enchantment')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Leyline of Vitality'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'G'), 
2); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Leyline of Vitality'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/f/5/f5318113-9dfb-492c-9151-de90951d881e.jpg?1562481236', 'Jim Nelson', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Leyline of Vitality'), 
(SELECT id FROM mtg.sets WHERE code = 'm11'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Adarkar Wastes', E'{T}: Add {C}.
{T}: Add {W} or {U}. Adarkar Wastes deals 1 damage to you.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Adarkar Wastes'), 
(SELECT id FROM mtg.types WHERE name = 'Land')); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/7/6/764eff32-466f-4443-a3db-1007f446980b.jpg?1562819157', 'Gary Leach', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Adarkar Wastes'), 
(SELECT id FROM mtg.sets WHERE code = '6ed'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/9/b/9bd991b2-8c18-4c5f-9b70-461012fee61e.jpg?1562244085', 'John Avon', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Adarkar Wastes'), 
(SELECT id FROM mtg.sets WHERE code = '7ed'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/e/6/e653b15a-8ed8-4f80-a8a1-a669c948d5d6.jpg?1562767745', 'Gary Leach', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Adarkar Wastes'), 
(SELECT id FROM mtg.sets WHERE code = 'wc00'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/5/6/56c1e5f1-4665-4afc-83e4-4968df72eb8f.jpg?1562590871', 'Gary Leach', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Adarkar Wastes'), 
(SELECT id FROM mtg.sets WHERE code = '5ed'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/d/8/d8bea7e5-3993-4e7f-a9bb-79a73ea8224e.jpg?1562935531', 'Mike Raabe', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Adarkar Wastes'), 
(SELECT id FROM mtg.sets WHERE code = 'ptc'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Furnace Whelp', E'Flying (This creature can\'t be blocked except by creatures with flying or reach.)
{R}: Furnace Whelp gets +1/+0 until end of turn.'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (2, 2) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Furnace Whelp'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Dragon') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Furnace Whelp'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Dragon')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Furnace Whelp'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'R'), 
2); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Furnace Whelp'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/4/1/41e73d9c-8c17-4c3c-b535-e21f03e577bc.jpg?1562552944', 'Matt Cavotta', E'Baby dragons can\'t figure out humans—if they didn\'t want to be killed, why were they made of meat and treasure?', 
(SELECT id FROM mtg.cards WHERE name = E'Furnace Whelp'), 
(SELECT id FROM mtg.sets WHERE code = 'm13'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/b/4/b4b6a111-90fe-492a-8548-d7749d60e30e.jpg?1562378479', 'Matt Cavotta', E'Baby dragons can\'t figure out humans—if they didn\'t want to be killed, why were they made of meat and treasure?', 
(SELECT id FROM mtg.cards WHERE name = E'Furnace Whelp'), 
(SELECT id FROM mtg.sets WHERE code = 'jvc'), 
'uncommon'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Pulse of Murasa', E'Return target creature or land card from a graveyard to its owner\'s hand. You gain 6 life.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Pulse of Murasa'), 
(SELECT id FROM mtg.types WHERE name = 'Instant')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Pulse of Murasa'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'G'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Pulse of Murasa'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/9/9/99851c1b-8878-4c1e-906b-f6b70e53d714.jpg?1592517343', 'Matt Stewart', E'"Little flower twirl and bloom, arise from this your rocky tomb. Little warrior slash and brawl, be born again to free us all."', 
(SELECT id FROM mtg.cards WHERE name = E'Pulse of Murasa'), 
(SELECT id FROM mtg.sets WHERE code = 'm20'), 
'uncommon'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Whispersilk Cloak', E'Equipped creature can\'t be blocked and has shroud. (It can\'t be the target of spells or abilities.)
Equip {2}'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Whispersilk Cloak'), 
(SELECT id FROM mtg.types WHERE name = 'Artifact')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Equipment') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Whispersilk Cloak'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Equipment')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Whispersilk Cloak'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
3); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/c/b/cbb9465c-cea2-491f-a6d6-9022cb3e969d.jpg?1561995655', 'Daren Bader', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Whispersilk Cloak'), 
(SELECT id FROM mtg.sets WHERE code = 'm10'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/8/d/8d08b6b7-50dc-432d-afcc-03bbab4a03f4.jpg?1575572218', 'Daren Bader', E'Such cloaks are in high demand both by assassins and by those who fear them.', 
(SELECT id FROM mtg.cards WHERE name = E'Whispersilk Cloak'), 
(SELECT id FROM mtg.sets WHERE code = 'pc2'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/e/3/e3a8c29d-a950-4c17-9e67-394cfe431c09.jpg?1562556780', 'Luca Zontini', E'Such cloaks are in high demand both by assassins and by those who fear them.', 
(SELECT id FROM mtg.cards WHERE name = E'Whispersilk Cloak'), 
(SELECT id FROM mtg.sets WHERE code = '10e'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/7/4/7485dde2-ee5a-4c5e-a969-354a7b3f7936.jpg?1573517595', 'Daren Bader', E'Such cloaks are in high demand both by assassins and by those who fear them.', 
(SELECT id FROM mtg.cards WHERE name = E'Whispersilk Cloak'), 
(SELECT id FROM mtg.sets WHERE code = 'mb1'), 
'uncommon'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Desert of the Fervent', E'Desert of the Fervent enters the battlefield tapped.
{T}: Add {R}.
Cycling {1}{R} ({1}{R}, Discard this card: Draw a card.)'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Desert of the Fervent'), 
(SELECT id FROM mtg.types WHERE name = 'Land')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Desert') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Desert of the Fervent'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Desert')); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/0/f/0f80b293-e586-4d0d-9387-1c497ae8e5a0.jpg?1591321920', 'Titus Lunter', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Desert of the Fervent'), 
(SELECT id FROM mtg.sets WHERE code = 'c20'), 
'common'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/6/7/6795edf2-3134-45d1-87bf-d96213c37c89.jpg?1597252269', 'Titus Lunter', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Desert of the Fervent'), 
(SELECT id FROM mtg.sets WHERE code = 'akr'), 
'common'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/8/7/873ed0cd-60ea-4869-b794-e626f0058871.jpg?1617911467', 'Titus Lunter', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Desert of the Fervent'), 
(SELECT id FROM mtg.sets WHERE code = 'c21'), 
'common'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/f/5/f547d664-25ce-4a24-b3ae-7bf3cbdf4703.jpg?1562820130', 'Titus Lunter', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Desert of the Fervent'), 
(SELECT id FROM mtg.sets WHERE code = 'hou'), 
'common'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text, super_type_fk) 
VALUES(E'Thraximundar', E'Haste
Whenever Thraximundar attacks, defending player sacrifices a creature.
Whenever a player sacrifices a creature, you may put a +1/+1 counter on Thraximundar.', 
(SELECT id FROM mtg.super_types WHERE name = 'Legendary')); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (6, 6) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Thraximundar'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Zombie') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Thraximundar'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Zombie')); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Assassin') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Thraximundar'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Assassin')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Thraximundar'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'U'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Thraximundar'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'B'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Thraximundar'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'R'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Thraximundar'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
4); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/1/9/199d862e-d043-47f1-b097-76877b260608.jpg?1562900373', 'Raymond Swanland', E'His name means "he who paints the earth red."', 
(SELECT id FROM mtg.cards WHERE name = E'Thraximundar'), 
(SELECT id FROM mtg.sets WHERE code = 'c13'), 
'mythic'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/7/5/7574ea35-6bd8-4615-b42a-6d90408aba23.jpg?1561813353', 'Raymond Swanland', E'His name means "he who paints the earth red."', 
(SELECT id FROM mtg.cards WHERE name = E'Thraximundar'), 
(SELECT id FROM mtg.sets WHERE code = 'oc13'), 
'mythic'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Fireball', E'This spell costs {1} more to cast for each target beyond the first.
Fireball deals X damage divided evenly, rounded down, among any number of targets.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Fireball'), 
(SELECT id FROM mtg.types WHERE name = 'Sorcery')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Fireball'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'X'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Fireball'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'R'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/7/2/7220aaa0-c457-4067-b1ff-360b161c34e5.jpg?1562850134', 'Dave Dorman', E'The spell fell upon the crowd like a dragon, ancient and full of death.', 
(SELECT id FROM mtg.cards WHERE name = E'Fireball'), 
(SELECT id FROM mtg.sets WHERE code = 'ima'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/5/1/51a242c2-58bf-457b-b5ad-83e85b08ddd1.jpg?1557432092', 'Mark Tedin', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Fireball'), 
(SELECT id FROM mtg.sets WHERE code = '4bb'), 
'common'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Duress', E'Target opponent reveals their hand. You choose a noncreature, nonland card from it. That player discards that card.'); 

INSERT INTO mtg.card_types (card_fk, type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Duress'), 
(SELECT id FROM mtg.types WHERE name = 'Sorcery')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Duress'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'B'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/5/f/5fd00745-d8ab-4af2-b0cf-0afab496d177.jpg?1561895816', 'Pete Venters', E'"Change your mind, or I\'ll change it for you."', 
(SELECT id FROM mtg.cards WHERE name = E'Duress'), 
(SELECT id FROM mtg.sets WHERE code = 'wc02'), 
'common'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/a/7/a7da9157-fdb6-477f-a605-5ee325410fda.jpg?1562636808', 'Lawrence Snelly', E'"We decide who is worthy of our works."
—Gix, Yawgmoth praetor', 
(SELECT id FROM mtg.cards WHERE name = E'Duress'), 
(SELECT id FROM mtg.sets WHERE code = 'pal00'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Angler Turtle', E'Hexproof
Creatures your opponents control attack each combat if able.'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (5, 7) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Angler Turtle'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Turtle') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Angler Turtle'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Turtle')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Angler Turtle'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'U'), 
2); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Angler Turtle'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
5); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/f/2/f23899be-5551-4690-ac29-8f382484c227.jpg?1545872827', 'Alex Konstad', E'It is ancient, immense, and irresistible.', 
(SELECT id FROM mtg.cards WHERE name = E'Angler Turtle'), 
(SELECT id FROM mtg.sets WHERE code = 'pz2'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/8/6/86caf85d-7fb3-4e28-b8ba-a8857f0268a4.jpg?1547672407', 'Alex Konstad', E'It is ancient, immense, and irresistible.', 
(SELECT id FROM mtg.cards WHERE name = E'Angler Turtle'), 
(SELECT id FROM mtg.sets WHERE code = 'g18'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text) 
VALUES(E'Sigiled Starfish', E'{T}: Scry 1. (Look at the top card of your library. You may put that card on the bottom of your library.)'); 

WITH returns(id) AS (
INSERT INTO mtg.creatures (power, toughness) 
VALUES (0, 3) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Sigiled Starfish'), 
(SELECT id FROM mtg.types WHERE name = 'Creature'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Starfish') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Sigiled Starfish'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Starfish')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Sigiled Starfish'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'U'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Sigiled Starfish'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/6/9/69b3df55-f664-4922-9bc8-ab227d87da53.jpg?1592710643', 'Nils Hamm', E'Kruphix hid the most dire prophecies about humankind where humans would never find them and tritons wouldn\'t care to read them.', 
(SELECT id FROM mtg.cards WHERE name = E'Sigiled Starfish'), 
(SELECT id FROM mtg.sets WHERE code = 'c18'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/7/a/7a1a93c3-8561-4c65-bea8-a9c3a898a48c.jpg?1600698677', 'Nils Hamm', E'Kruphix hid the most dire prophecies about humankind where humans would never find them and tritons wouldn\'t care to read them.', 
(SELECT id FROM mtg.cards WHERE name = E'Sigiled Starfish'), 
(SELECT id FROM mtg.sets WHERE code = 'jmp'), 
'uncommon'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/8/5/85a61f99-44f8-4a2b-b7f2-7899a694552d.jpg?1593095551', 'Nils Hamm', E'Kruphix hid the most dire prophecies about humankind where humans would never find them and tritons wouldn\'t care to read them.', 
(SELECT id FROM mtg.cards WHERE name = E'Sigiled Starfish'), 
(SELECT id FROM mtg.sets WHERE code = 'jou'), 
'common'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text, super_type_fk) 
VALUES(E'Ajani, Caller of the Pride', E'+1: Put a +1/+1 counter on up to one target creature.
−3: Target creature gains flying and double strike until end of turn.
−8: Create X 2/2 white Cat creature tokens, where X is your life total.', 
(SELECT id FROM mtg.super_types WHERE name = 'Legendary')); 

WITH returns(id) AS (
INSERT INTO mtg.planeswalkers (starting_loyalty) 
VALUES (4) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, planeswalker_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Ajani, Caller of the Pride'), 
(SELECT id FROM mtg.types WHERE name = 'Planeswalker'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Ajani') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Ajani, Caller of the Pride'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Ajani')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Ajani, Caller of the Pride'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'W'), 
2); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Ajani, Caller of the Pride'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
1); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/a/2/a2ff8a87-b07d-436f-9e0b-86ef6aa918d2.jpg?1605371033', 'Steve Prescott', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Ajani, Caller of the Pride'), 
(SELECT id FROM mtg.sets WHERE code = 'psdc'), 
'mythic'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text, super_type_fk) 
VALUES(E'Chandra, Fire Artisan', E'Whenever one or more loyalty counters are removed from Chandra, Fire Artisan, she deals that much damage to target opponent or planeswalker.
+1: Exile the top card of your library. You may play it this turn.
−7: Exile the top seven cards of your library. You may play them this turn.', 
(SELECT id FROM mtg.super_types WHERE name = 'Legendary')); 

WITH returns(id) AS (
INSERT INTO mtg.planeswalkers (starting_loyalty) 
VALUES (4) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, planeswalker_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Chandra, Fire Artisan'), 
(SELECT id FROM mtg.types WHERE name = 'Planeswalker'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Chandra') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Chandra, Fire Artisan'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Chandra')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Chandra, Fire Artisan'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'R'), 
2); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Chandra, Fire Artisan'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
2); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/d/2/d21a7b23-8827-49f2-ade4-75a602d17743.jpg?1582053257', 'Yongjae Choi', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Chandra, Fire Artisan'), 
(SELECT id FROM mtg.sets WHERE code = 'war'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/1/1/11c5033c-3f25-4b31-8f4b-784d8aaf6150.jpg?1585400494', 'Yongjae Choi', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Chandra, Fire Artisan'), 
(SELECT id FROM mtg.sets WHERE code = 'sld'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/3/b/3b129f92-e6c4-4967-bd0c-02ff85f09636.jpg?1580443669', 'Ryota-H', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Chandra, Fire Artisan'), 
(SELECT id FROM mtg.sets WHERE code = 'war'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/c/9/c9a7e21b-d047-4878-9202-9fb278d291e0.jpg?1557640354', 'Yongjae Choi', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Chandra, Fire Artisan'), 
(SELECT id FROM mtg.sets WHERE code = 'pwar'), 
'rare'); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/1/7/1734d2d0-8068-44a6-be11-cc609b450083.jpg?1570828574', 'Yongjae Choi', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Chandra, Fire Artisan'), 
(SELECT id FROM mtg.sets WHERE code = 'pwar'), 
'rare'); 


------------------------------------------------------------

INSERT INTO mtg.cards (name, oracle_text, super_type_fk) 
VALUES(E'Dovin, Architect of Law', E'+1: You gain 2 life and draw a card.
−1: Tap target creature. It doesn\'t untap during its controller\'s next untap step.
−9: Tap all permanents target opponent controls. That player skips their next untap step.', 
(SELECT id FROM mtg.super_types WHERE name = 'Legendary')); 

WITH returns(id) AS (
INSERT INTO mtg.planeswalkers (starting_loyalty) 
VALUES (5) 
RETURNING id
) 
INSERT INTO mtg.card_types (card_fk, type_fk, planeswalker_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Dovin, Architect of Law'), 
(SELECT id FROM mtg.types WHERE name = 'Planeswalker'), 
(SELECT id FROM returns)); 

INSERT INTO mtg.sub_types (name) 
VALUES ('Dovin') 
ON CONFLICT DO NOTHING; 

INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Dovin, Architect of Law'), 
(SELECT id FROM mtg.sub_types WHERE name = 'Dovin')); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Dovin, Architect of Law'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'W'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Dovin, Architect of Law'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'U'), 
1); 

INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) 
VALUES( 
(SELECT id FROM mtg.cards WHERE name = E'Dovin, Architect of Law'), 
(SELECT id FROM mtg.mana_types WHERE abbr = 'A'), 
4); 

INSERT INTO mtg.representations (image_url, image_artist, flavor_text, 
card_id, set_id, rarity) 
VALUES('https://c1.scryfall.com/file/scryfall-cards/normal/front/b/0/b0c7cffe-8751-4da7-8c1c-59f472ef3735.jpg?1572828382', 'Kieran Yanner', E'', 
(SELECT id FROM mtg.cards WHERE name = E'Dovin, Architect of Law'), 
(SELECT id FROM mtg.sets WHERE code = 'rna'), 
'mythic'); 


------------------------------------------------------------

