--- Валидация URL
CREATE OR REPLACE FUNCTION validate_url(url text) RETURNS BOOL AS $validate_url$
DECLARE
    https constant text := 'https://';
    http constant text := 'http://';
    qpos int;
BEGIN
    IF url = NULL THEN RETURN FALSE; END IF;

    IF position(https in url) = 1 THEN
        url := substring(url from (length(https) + 1));
    ELSEIF position(http in url) = 1 THEN
        url := substring(url from (length(http) + 1));
    ELSE
        RETURN FALSE;
    END IF;

    qpos := position('/' in url);
    IF qpos = 0 THEN RETURN FALSE; END IF;

    url := substring(url for (qpos - 1));

    RETURN url LIKE '%.com' OR url LIKE '%.ru';
END;
$validate_url$ LANGUAGE plpgsql
CALLED ON NULL INPUT;

--- Конвертирует манакост {4A}{5B} -> 9
CREATE OR REPLACE FUNCTION convert_manacost(manaline text, ignore text DEFAULT '') RETURNS INT AS $convert_manacost$
DECLARE
    cmc int := 0;

    segment text;
    slen int;

    abbr char;
    count int;
BEGIN
    WHILE length(manaline) > 0
    LOOP
        segment = substring(manaline from '\{[^}]*\}');
        slen := length(segment);

        IF position(segment in manaline) != 1 OR slen < 3
           THEN RETURN NULL; END IF;

        manaline := substring(manaline from (slen + 1));

        IF slen = 3
        THEN count := 1;
        ELSE count := CAST(substring(segment from 2 for slen - 3) AS INT);
        END IF;

        abbr := substring(segment from slen - 1 for 1);

        IF position(abbr in ignore) = 0
        THEN cmc := cmc + count;
        END IF;
    END LOOP;

    RETURN cmc;
END;
$convert_manacost$ LANGUAGE plpgsql;