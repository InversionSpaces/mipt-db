import requests

resp = requests.get("https://api.scryfall.com/cards/random")
card = resp.json()

super_types = ["Basic", "Elite", "Host", "Legendary", "Ongoing", "Snow", "World"]

def parse_type_line(type_line):
    types, subtypes = (type_line.split("—") + [""])[:2]
    types = types.strip().split(" ")
    subtypes = subtypes.strip().split(" ") if subtypes else []
    if (types[0] in super_types):
        return (types[0], types[1:], subtypes)
    else:
        return ("", types, subtypes)

name = card["name"]
rarity = card["rarity"]
set_code = card["set"]
type_line = card["type_line"]

super_type, types, subtypes = parse_type_line(type_line)

print(name, rarity, set_code, type_line, sep="\n")
print(super_type, types, subtypes)

if (super_type):
    print(	f"INSERT INTO mtg.cards (name, rarity, super_type_fk, set_fk) \n"
	        f"VALUES('{name}', '{rarity}', \n"
            f"(SELECT id FROM mtg.super_types WHERE name = '{super_type}'), \n"
            f"(SELECT id FROM mtg.sets WHERE code = '{set_code}')); \n" )
else:
    print(	f"INSERT INTO mtg.cards (name, rarity, set_fk) \n"
	        f"VALUES('{name}', '{rarity}', \n"
            f"(SELECT id FROM mtg.sets WHERE code = '{set_code}')); \n" )

for card_type in types:
    if card_type == "Creature":
        power = card["power"]
        toughness = card["toughness"]
        print(  f"WITH creature_id AS (\n"
                f"INSERT INTO mtg.creatures (power, toughness) \n"
                f"VALUES ({power}, {toughness}) \n"
                f"RETURNING id\n"
                f") \n"
                f"INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) \n"
                f"VALUES( \n"
                f"(SELECT id FROM mtg.cards WHERE name = '{name}'), \n"
                f"(SELECT id FROM mtg.types WHERE name = '{card_type}'), \n"
                f"creature_id); \n" )
    elif card_type == "Planeswalker":
        loyalty = card["loyalty"]
        print(  f"WITH planeswalker_id AS (\n"
                f"INSERT INTO mtg.planeswalkers (starting_loyalty) \n"
                f"VALUES ({loyalty}) \n"
                f"RETURNING id\n"
                f") \n"
                f"INSERT INTO mtg.card_types (card_fk, type_fk, planeswalker_fk) \n"
                f"VALUES( \n"
                f"(SELECT id FROM mtg.cards WHERE name = '{name}'), \n"
                f"(SELECT id FROM mtg.types WHERE name = '{card_type}'), \n"
                f"planeswalker_id); \n" )
    else:
        print(  f"INSERT INTO mtg.card_types (card_fk, type_fk) \n"
                f"VALUES( \n"
                f"(SELECT id FROM mtg.cards WHERE name = '{name}'), \n"
                f"(SELECT id FROM mtg.types WHERE name = '{card_type}')); \n" )

for sub_type in subtypes:
    print(  f"WITH sub_type_id AS (\n"
            f"INSERT INTO mtg.sub_types (name) \n"
            f"VALUES ('{sub_type}') \n"
            f"ON CONFLICT DO NOTHING \n"
            f"RETURNING id\n"
            f") \n"
            f"INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) \n"
            f"VALUES( \n"
            f"(SELECT id FROM mtg.cards WHERE name = '{name}'), \n"
            f"sub_type_id); \n" )

mana_cost = card["mana_cost"]
cmc = card["cmc"]

import re

def parse_mana_cost(mana_cost, cmc):
    r = re.compile("(?:{(\d)}){0,1}{([WUBRG])}")
    print(mana_cost, r.findall(mana_cost))
    mana_costs = [  (int(count) if count else 1, abbr) 
                    for (count, abbr) in r.findall(mana_cost)]
    any_count = int(cmc) - sum([c[0] for c in mana_costs])
    return mana_costs + [(any_count, 'A')]

print(parse_mana_cost(mana_cost, cmc))
        
