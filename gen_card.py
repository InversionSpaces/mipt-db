import requests

result = ""

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

def prepare(string):
    return string.replace("'", "\\'")


name = prepare(card["name"])
oracle_text = prepare(card.get("oracle_text") or "")

type_line = card["type_line"]
super_type, types, subtypes = parse_type_line(type_line)

if (super_type):
    result += (f"INSERT INTO mtg.cards (name, oracle_text, super_type_fk) \n"
            f"VALUES(E'{name}', E'{oracle_text}', \n"
            f"(SELECT id FROM mtg.super_types WHERE name = '{super_type}')); \n\n" )
else:
    result += (  f"INSERT INTO mtg.cards (name, oracle_text) \n"
            f"VALUES(E'{name}', E'{oracle_text}'); \n\n" )

if "Token" in types:
    exit(0)

for card_type in types:
    if card_type == "Creature":
        power = card["power"]
        toughness = card["toughness"]
        result += (  f"WITH returns(id) AS (\n"
                f"INSERT INTO mtg.creatures (power, toughness) \n"
                f"VALUES ({power}, {toughness}) \n"
                f"RETURNING id\n"
                f") \n"
                f"INSERT INTO mtg.card_types (card_fk, type_fk, creature_fk) \n"
                f"VALUES( \n"
                f"(SELECT id FROM mtg.cards WHERE name = E'{name}'), \n"
                f"(SELECT id FROM mtg.types WHERE name = '{card_type}'), \n"
                f"(SELECT id FROM returns)); \n\n" )
    elif card_type == "Planeswalker":
        loyalty = card["loyalty"]
        result += (  f"WITH returns(id) AS (\n"
                f"INSERT INTO mtg.planeswalkers (starting_loyalty) \n"
                f"VALUES ({loyalty}) \n"
                f"RETURNING id\n"
                f") \n"
                f"INSERT INTO mtg.card_types (card_fk, type_fk, planeswalker_fk) \n"
                f"VALUES( \n"
                f"(SELECT id FROM mtg.cards WHERE name = E'{name}'), \n"
                f"(SELECT id FROM mtg.types WHERE name = '{card_type}'), \n"
                f"(SELECT id FROM returns)); \n\n" )
    else:
        result += (  f"INSERT INTO mtg.card_types (card_fk, type_fk) \n"
                f"VALUES( \n"
                f"(SELECT id FROM mtg.cards WHERE name = E'{name}'), \n"
                f"(SELECT id FROM mtg.types WHERE name = '{card_type}')); \n\n" )

for sub_type in subtypes:
    result += (  f"INSERT INTO mtg.sub_types (name) \n"
            f"VALUES ('{sub_type}') \n"
            f"ON CONFLICT DO NOTHING; \n\n"
            f"INSERT INTO mtg.card_subtypes (card_fk, sub_type_fk) \n"
            f"VALUES( \n"
            f"(SELECT id FROM mtg.cards WHERE name = E'{name}'), \n"
            f"(SELECT id FROM mtg.sub_types WHERE name = '{sub_type}')); \n\n" )

mana_cost = card["mana_cost"]

import re
from collections import Counter

def parse_mana_cost(mana_cost):
    if (not mana_cost):
        return []
    r = re.compile("{(\d*|[WUBGRX])}")
    parsed = r.findall(mana_cost)
    symbols = [s for s in parsed if s.isalpha()]
    numbers = [int(s) for s in parsed if s.isdigit()]
    counted = list(Counter(symbols).items())
    if not numbers:
        return counted
    else:
        return counted + [('A', sum(numbers))]


for (abbr, cnt) in parse_mana_cost(mana_cost):
    result += (  f"INSERT INTO mtg.mana_cost (card_fk, mana_type_fk, amount) \n"
            f"VALUES( \n"
            f"(SELECT id FROM mtg.cards WHERE name = E'{name}'), \n"
            f"(SELECT id FROM mtg.mana_types WHERE abbr = '{abbr}'), \n"
            f"{cnt}); \n\n")

resp = requests.get(card["prints_search_uri"])
prints = resp.json()["data"]

from random import randint, sample

for print_ in sample(prints, min(randint(1, 5), len(prints))):
    flavor_text = prepare(print_.get("flavor_text") or "")
    artist = print_.get("artist") or ""
    rarity = print_["rarity"]
    set_code = print_["set"]
    image_url = print_["image_uris"]["normal"]

    result += (  f"INSERT INTO mtg.representations (image_url, image_artist, flavor_text, \n"
            f"card_id, set_id, rarity) \n"
            f"VALUES('{image_url}', '{artist}', E'{flavor_text}', \n"
            f"(SELECT id FROM mtg.cards WHERE name = E'{name}'), \n"
            f"(SELECT id FROM mtg.sets WHERE code = '{set_code}'), \n"
            f"'{rarity}'); \n\n" )

result += "\n" + "-" * 60 + "\n"
print(result)
