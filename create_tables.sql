create table mtg.super_types
(
	id serial not null
		constraint super_types_pk
			primary key,
	name text not null
);

alter table mtg.super_types owner to postgres;

create table mtg.cards
(
	id serial not null
		constraint cards_pk
			primary key,
	name text not null,
	rarity text not null,
	super_type_fk integer
		constraint cards_super_types_id_fk
			references mtg.super_types
);

alter table mtg.cards owner to postgres;

create table mtg.mana_types
(
	id serial not null
		constraint mana_types_pk
			primary key,
	color text not null,
	basic_land text not null,
	abbr char not null
);

alter table mtg.mana_types owner to postgres;

create unique index mana_types_abbr_uindex
	on mtg.mana_types (abbr);

create unique index mana_types_basic_land_uindex
	on mtg.mana_types (basic_land);

create unique index mana_types_color_uindex
	on mtg.mana_types (color);

create table mtg.types
(
	id serial not null
		constraint types_pk
			primary key,
	name text not null,
	is_permanent boolean not null
);

alter table mtg.types owner to postgres;

create table mtg.sub_types
(
	id serial not null
		constraint sub_types_pk
			primary key,
	name text not null
);

alter table mtg.sub_types owner to postgres;

create table mtg.creatures
(
	id serial not null
		constraint creatures_pk
			primary key,
	power integer not null,
	toughness integer not null
);

alter table mtg.creatures owner to postgres;

create table mtg.planeswalkers
(
	id serial not null
		constraint planeswalkers_pk
			primary key,
	starting_loyalty integer not null
);

alter table mtg.planeswalkers owner to postgres;

create table mtg.sets
(
	id serial not null
		constraint sets_pk
			primary key,
	type text not null,
	name text not null,
	code text not null,
	release_date date not null
);

alter table mtg.sets owner to postgres;

create unique index sets_code_uindex
	on mtg.sets (code);

create unique index sets_name_uindex
	on mtg.sets (name);

create table mtg.representations
(
	id serial not null
		constraint representations_pk
			primary key,
	image_url text,
	image_artist text,
	flavor_text text,
	card_id integer not null
		constraint representations_cards_id_fk
			references mtg.cards
);

alter table mtg.representations owner to postgres;

create table mtg.rules
(
	id serial not null
		constraint rules_pk
			primary key,
	cost text not null,
	effect text not null,
	is_triggerable boolean not null
);

alter table mtg.rules owner to postgres;

create table mtg.mana_cost
(
	id serial not null
		constraint mana_cost_pk
			primary key,
	card_fk integer not null
		constraint mana_cost_cards_id_fk
			references mtg.cards,
	mana_type_fk integer not null
		constraint mana_cost_mana_types_id_fk
			references mtg.mana_types,
	amount integer not null
);

alter table mtg.mana_cost owner to postgres;

create table mtg.card_types
(
	id serial not null
		constraint card_types_pk
			primary key,
	card_fk integer not null
		constraint card_types_cards_id_fk
			references mtg.cards,
	type_fk integer not null
		constraint card_types_types_id_fk
			references mtg.types,
	creature_fk integer
		constraint card_types_creatures_id_fk
			references mtg.creatures,
	planeswalker_fk integer
		constraint card_types_planeswalkers_id_fk
			references mtg.planeswalkers
);

alter table mtg.card_types owner to postgres;

create table mtg.card_subtypes
(
	id serial not null
		constraint card_subtypes_pk
			primary key,
	card_fk integer not null
		constraint card_sub_types_cards_id_fk
			references mtg.cards,
	sub_type_fk integer not null
		constraint card_sub_types_sub_types_id_fk
			references mtg.sub_types
);

alter table mtg.card_subtypes owner to postgres;

create table mtg.card_sets
(
	id serial not null
		constraint card_sets_pk
			primary key,
	card_fk integer not null
		constraint card_sets_cards_id_fk
			references mtg.cards,
	set_fk integer not null
		constraint card_sets_sets_id_fk
			references mtg.sets
);

alter table mtg.card_sets owner to postgres;

create table mtg.card_rules
(
	id serial not null
		constraint card_rules_pk
			primary key,
	card_fk integer not null
		constraint card_rules_cards_id_fk
			references mtg.cards,
	rule_fk integer not null
		constraint card_rules_rules_id_fk
			references mtg.rules
);

alter table mtg.card_rules owner to postgres;

