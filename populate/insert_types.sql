INSERT INTO mtg.types (name, is_permanent)
VALUES ('Creature', TRUE)
ON CONFLICT (name) DO UPDATE SET is_permanent = TRUE;

INSERT INTO mtg.types (name, is_permanent)
VALUES ('Land', TRUE)
ON CONFLICT (name) DO UPDATE SET is_permanent = TRUE;

INSERT INTO mtg.types (name, is_permanent)
VALUES ('Artifact', TRUE)
ON CONFLICT (name) DO UPDATE SET is_permanent = TRUE;

INSERT INTO mtg.types (name, is_permanent)
VALUES ('Enchantment', TRUE)
ON CONFLICT (name) DO UPDATE SET is_permanent = TRUE;

INSERT INTO mtg.types (name, is_permanent)
VALUES ('Planeswalker', TRUE)
ON CONFLICT (name) DO UPDATE SET is_permanent = TRUE;

INSERT INTO mtg.types (name, is_permanent)
VALUES ('Instant', FALSE)
ON CONFLICT (name) DO UPDATE SET is_permanent = FALSE;

INSERT INTO mtg.types (name, is_permanent)
VALUES ('Sorcery', False)
ON CONFLICT (name) DO UPDATE SET is_permanent = FALSE;