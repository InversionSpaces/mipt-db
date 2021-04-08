import requests

resp = requests.get("https://api.scryfall.com/sets")
sets = resp.json()["data"]

for s in sets:
    set_type, name, code, released_at = s["set_type"], s["name"], s["code"], s["released_at"]
    if "'" in name:
        name = name.replace("'", "\\'")
    print(  f"INSERT INTO mtg.sets (type, name, code, release_date) \n"
            f"VALUES ('{set_type}', E'{name}', '{code}', '{released_at}') \n"
            f"ON CONFLICT DO NOTHING; \n"
            )
