--- Валидирует URL перед вставкой в representations
CREATE OR REPLACE FUNCTION repr_url() RETURNS trigger AS $repr_url$
BEGIN
    IF NOT validate_url(NEW.image_url) THEN
        RAISE EXCEPTION 'Invalid url: %', NEW.image_url;
    END IF;
    RETURN NEW;
END;
$repr_url$ LANGUAGE plpgsql;

CREATE TRIGGER repr_url BEFORE INSERT OR UPDATE ON mtg.representations
FOR EACH ROW EXECUTE PROCEDURE repr_url();

--- Тест
-- INSERT INTO mtg.representations (image_url, image_artist, flavor_text, card_id, set_id, rarity)
-- VALUES ('Invalid', 'Artist', 'Text', 80, 80, 'uncommon');

--- Удаляет записи в creatures и planeswalkers
--- при удалении ссылавшейся на них записи card_types
CREATE OR REPLACE FUNCTION del_planes_creats() RETURNS trigger AS $del_planes_creats$
BEGIN
    DELETE FROM mtg.creatures
    WHERE creatures.id = OLD.creature_fk;

    DELETE FROM mtg.planeswalkers
    WHERE planeswalkers.id = OLD.planeswalker_fk;

    RETURN NEW;
END;
$del_planes_creats$ LANGUAGE plpgsql;

CREATE TRIGGER del_planes_creats AFTER DELETE ON mtg.card_types
FOR EACH ROW EXECUTE PROCEDURE del_planes_creats();

--- Тест
-- INSERT INTO mtg.creatures(power, toughness)
-- VALUES (4, 2);
-- INSERT INTO mtg.card_types(card_fk, type_fk, creature_fk)
-- VALUES (80, 5, 48);
-- DELETE FROM mtg.card_types
-- WHERE id = 129;
