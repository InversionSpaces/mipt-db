create table super_types
(
    id   serial not null
        constraint super_types_pk
            primary key,
    name text   not null
);

alter table super_types
    owner to postgres;

create unique index super_types_name_uindex
    on super_types (name);

create table cards
(
    id            serial not null
        constraint cards_pk
            primary key,
    name          text   not null,
    super_type_fk integer
        constraint cards_super_types_id_fk
            references super_types
            on delete restrict,
    oracle_text   text   not null
);

alter table cards
    owner to postgres;

create unique index cards_name_uindex
    on cards (name);

create table mana_types
(
    id         serial not null
        constraint mana_types_pk
            primary key,
    color      text   not null,
    basic_land text   not null,
    abbr       char   not null
);

alter table mana_types
    owner to postgres;

create unique index mana_types_abbr_uindex
    on mana_types (abbr);

create unique index mana_types_basic_land_uindex
    on mana_types (basic_land);

create unique index mana_types_color_uindex
    on mana_types (color);

create table types
(
    id           serial  not null
        constraint types_pk
            primary key,
    name         text    not null,
    is_permanent boolean not null
);

alter table types
    owner to postgres;

create unique index types_name_uindex
    on types (name);

create table sub_types
(
    id   serial not null
        constraint sub_types_pk
            primary key,
    name text   not null
);

alter table sub_types
    owner to postgres;

create unique index sub_types_name_uindex
    on sub_types (name);

create table creatures
(
    id        serial  not null
        constraint creatures_pk
            primary key,
    power     integer not null,
    toughness integer not null
);

alter table creatures
    owner to postgres;

create table planeswalkers
(
    id               serial  not null
        constraint planeswalkers_pk
            primary key,
    starting_loyalty integer not null
);

alter table planeswalkers
    owner to postgres;

create table sets
(
    id           serial not null
        constraint sets_pk
            primary key,
    type         text   not null,
    name         text   not null,
    code         text   not null,
    release_date date   not null
);

alter table sets
    owner to postgres;

create unique index sets_code_uindex
    on sets (code);

create unique index sets_name_uindex
    on sets (name);

create table representations
(
    id           serial  not null
        constraint representations_pk
            primary key,
    image_url    text,
    image_artist text,
    flavor_text  text,
    card_id      integer not null
        constraint representations_cards_id_fk
            references cards
            on delete restrict,
    set_id       integer not null
        constraint representations_sets_id_fk
            references sets
            on delete restrict,
    rarity       text    not null
);

alter table representations
    owner to postgres;

create table mana_cost
(
    id           serial  not null
        constraint mana_cost_pk
            primary key,
    card_fk      integer not null
        constraint mana_cost_cards_id_fk
            references cards
            on delete restrict,
    mana_type_fk integer not null
        constraint mana_cost_mana_types_id_fk
            references mana_types
            on delete restrict,
    amount       integer not null
);

alter table mana_cost
    owner to postgres;

create table card_types
(
    id              serial  not null
        constraint card_types_pk
            primary key,
    card_fk         integer not null
        constraint card_types_cards_id_fk
            references cards
            on delete restrict,
    type_fk         integer not null
        constraint card_types_types_id_fk
            references types
            on delete restrict,
    creature_fk     integer
        constraint card_types_creatures_id_fk
            references creatures
            on delete set null,
    planeswalker_fk integer
        constraint card_types_planeswalkers_id_fk
            references planeswalkers
            on delete set null
);

alter table card_types
    owner to postgres;

create table card_subtypes
(
    id          serial  not null
        constraint card_subtypes_pk
            primary key,
    card_fk     integer not null
        constraint card_sub_types_cards_id_fk
            references cards
            on delete restrict,
    sub_type_fk integer not null
        constraint card_sub_types_sub_types_id_fk
            references sub_types
            on delete restrict
);

alter table card_subtypes
    owner to postgres;

