create table if not exists super_types
(
	id serial not null
		constraint super_types_pk
			primary key,
	name text not null
);

alter table super_types owner to postgres;

create table if not exists cards
(
	id serial not null
		constraint cards_pk
			primary key,
	name text not null,
	rarity text not null,
	super_type_fk integer
		constraint cards_super_types_id_fk
			references super_types
);

alter table cards owner to postgres;

create table if not exists mana_types
(
	id serial not null
		constraint mana_types_pk
			primary key,
	name text not null
);

alter table mana_types owner to postgres;

create table if not exists sub_types
(
	id serial not null
		constraint sub_types_pk
			primary key,
	name text not null
);

alter table sub_types owner to postgres;

create table if not exists creatures
(
	id serial not null
		constraint creatures_pk
			primary key,
	power integer not null,
	toughness integer not null
);

alter table creatures owner to postgres;

create table if not exists planeswalkers
(
	id serial not null
		constraint planeswalkers_pk
			primary key,
	starting_loyalty integer not null
);

alter table planeswalkers owner to postgres;

create table if not exists types
(
	id serial not null
		constraint types_pk
			primary key,
	name text not null,
	is_permanent boolean not null,
	creature_fk integer
		constraint types_creatures_id_fk
			references creatures,
	planeswalker_fk integer
		constraint types_planeswalkers_id_fk
			references planeswalkers
);

alter table types owner to postgres;

create table if not exists sets
(
	id serial not null
		constraint sets_pk
			primary key,
	type text not null,
	name text not null,
	code text not null,
	symbol text,
	release_date date not null
);

alter table sets owner to postgres;

create table if not exists representations
(
	id serial not null
		constraint representations_pk
			primary key,
	image_url text,
	image_artist text,
	flavor_text text,
	card_id integer not null
		constraint representations_cards_id_fk
			references cards
);

alter table representations owner to postgres;

create table if not exists rules
(
	id serial not null
		constraint rules_pk
			primary key,
	cost text not null,
	effect text not null,
	is_triggerable boolean not null
);

alter table rules owner to postgres;

create table if not exists mana_cost
(
	id serial not null
		constraint mana_cost_pk
			primary key,
	card_fk integer not null
		constraint mana_cost_cards_id_fk
			references cards,
	mana_type_fk integer not null
		constraint mana_cost_mana_types_id_fk
			references mana_types,
	amount integer not null
);

alter table mana_cost owner to postgres;

create table if not exists card_types
(
	id serial not null
		constraint card_types_pk
			primary key,
	card_fk integer not null
		constraint card_types_cards_id_fk
			references cards,
	type_fk integer not null
		constraint card_types_types_id_fk
			references types
);

alter table card_types owner to postgres;

create table if not exists card_subtypes
(
	id serial not null
		constraint card_subtypes_pk
			primary key,
	card_fk integer not null
		constraint card_sub_types_cards_id_fk
			references cards,
	sub_type_fk integer not null
		constraint card_sub_types_sub_types_id_fk
			references sub_types
);

alter table card_subtypes owner to postgres;

create table if not exists card_sets
(
	id serial not null
		constraint card_sets_pk
			primary key,
	card_fk integer not null
		constraint card_sets_cards_id_fk
			references cards,
	set_fk integer not null
		constraint card_sets_sets_id_fk
			references sets
);

alter table card_sets owner to postgres;

create table if not exists card_rules
(
	id serial not null
		constraint card_rules_pk
			primary key,
	card_fk integer not null
		constraint card_rules_cards_id_fk
			references cards,
	rule_fk integer not null
		constraint card_rules_rules_id_fk
			references rules
);

alter table card_rules owner to postgres;

