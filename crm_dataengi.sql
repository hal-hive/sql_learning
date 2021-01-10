-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 9.6
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: crm | type: DATABASE --
-- -- DROP DATABASE IF EXISTS crm;
-- CREATE DATABASE crm
-- 	ENCODING = 'UTF8'
-- 	LC_COLLATE = 'en_US.utf8'
-- 	LC_CTYPE = 'en_US.utf8'
-- 	TABLESPACE = pg_default
-- 	OWNER = postgres;
-- -- ddl-end --
-- 

-- object: public.play_evolutions | type: TABLE --
-- DROP TABLE IF EXISTS public.play_evolutions CASCADE;
CREATE TABLE public.play_evolutions (
	id integer NOT NULL,
	hash character varying(255) NOT NULL,
	applied_at timestamp NOT NULL,
	apply_script text,
	revert_script text,
	state character varying(255),
	last_problem text,
	CONSTRAINT play_evolutions_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.play_evolutions OWNER TO postgres;
-- ddl-end --

-- object: public.address_contact_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.address_contact_id_seq CASCADE;
CREATE SEQUENCE public.address_contact_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
-- ALTER SEQUENCE public.address_contact_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.address_contact | type: TABLE --
-- DROP TABLE IF EXISTS public.address_contact CASCADE;
CREATE TABLE public.address_contact (
	id bigint NOT NULL DEFAULT nextval('public.address_contact_id_seq'::regclass),
	street character varying,
	state character varying,
	country character varying,
	city character varying,
	"zipCode" character varying,
	CONSTRAINT address_contact_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.address_contact OWNER TO postgres;
-- ddl-end --

-- object: public.contacts_book_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.contacts_book_id_seq CASCADE;
CREATE SEQUENCE public.contacts_book_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
-- ALTER SEQUENCE public.contacts_book_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.contacts_book | type: TABLE --
-- DROP TABLE IF EXISTS public.contacts_book CASCADE;
CREATE TABLE public.contacts_book (
	id bigint NOT NULL DEFAULT nextval('public.contacts_book_id_seq'::regclass),
	owner_id bigint NOT NULL,
	create_date bigint NOT NULL,
	CONSTRAINT contacts_book_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.contacts_book OWNER TO postgres;
-- ddl-end --

-- object: public.contacts_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.contacts_id_seq CASCADE;
CREATE SEQUENCE public.contacts_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
-- ALTER SEQUENCE public.contacts_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.contacts | type: TABLE --
-- DROP TABLE IF EXISTS public.contacts CASCADE;
CREATE TABLE public.contacts (
	id bigint NOT NULL DEFAULT nextval('public.contacts_id_seq'::regclass),
	name character varying NOT NULL,
	contacts_book_id bigint NOT NULL,
	create_date bigint NOT NULL,
	skype_id character varying,
	fax character varying,
	company character varying,
	job_position character varying,
	address_id bigint,
	time_zone character varying,
	language character varying,
	contact_type integer,
	note character varying,
	advertiser bigint,
	CONSTRAINT contacts_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.contacts OWNER TO postgres;
-- ddl-end --

-- object: public.phone_contact_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.phone_contact_id_seq CASCADE;
CREATE SEQUENCE public.phone_contact_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
-- ALTER SEQUENCE public.phone_contact_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.phone_contact | type: TABLE --
-- DROP TABLE IF EXISTS public.phone_contact CASCADE;
CREATE TABLE public.phone_contact (
	id bigint NOT NULL DEFAULT nextval('public.phone_contact_id_seq'::regclass),
	type integer NOT NULL,
	phone character varying NOT NULL,
	contact_id bigint NOT NULL,
	CONSTRAINT phone_contact_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.phone_contact OWNER TO postgres;
-- ddl-end --

-- object: public.email_contact_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.email_contact_id_seq CASCADE;
CREATE SEQUENCE public.email_contact_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
-- ALTER SEQUENCE public.email_contact_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.email_contact | type: TABLE --
-- DROP TABLE IF EXISTS public.email_contact CASCADE;
CREATE TABLE public.email_contact (
	id bigint NOT NULL DEFAULT nextval('public.email_contact_id_seq'::regclass),
	type integer NOT NULL,
	email character varying NOT NULL,
	contact_id bigint NOT NULL,
	CONSTRAINT email_contact_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.email_contact OWNER TO postgres;
-- ddl-end --

-- object: public.groups_contact_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.groups_contact_id_seq CASCADE;
CREATE SEQUENCE public.groups_contact_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
-- ALTER SEQUENCE public.groups_contact_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.groups_contact | type: TABLE --
-- DROP TABLE IF EXISTS public.groups_contact CASCADE;
CREATE TABLE public.groups_contact (
	id bigint NOT NULL DEFAULT nextval('public.groups_contact_id_seq'::regclass),
	name character varying NOT NULL,
	contacts_book_id bigint NOT NULL,
	create_date bigint NOT NULL,
	CONSTRAINT groups_contact_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.groups_contact OWNER TO postgres;
-- ddl-end --

-- object: public.group_to_contacts | type: TABLE --
-- DROP TABLE IF EXISTS public.group_to_contacts CASCADE;
CREATE TABLE public.group_to_contacts (
	group_id bigint NOT NULL,
	contact_id bigint NOT NULL,
	CONSTRAINT pk PRIMARY KEY (group_id,contact_id)

);
-- ddl-end --
-- ALTER TABLE public.group_to_contacts OWNER TO postgres;
-- ddl-end --

-- object: public.profiles_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.profiles_id_seq CASCADE;
CREATE SEQUENCE public.profiles_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
-- ALTER SEQUENCE public.profiles_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.profiles | type: TABLE --
-- DROP TABLE IF EXISTS public.profiles CASCADE;
CREATE TABLE public.profiles (
	user_id bigint NOT NULL,
	nickname character varying NOT NULL,
	email character varying NOT NULL,
	first_name character varying,
	last_name character varying,
	avatar_url character varying,
	id bigint NOT NULL DEFAULT nextval('public.profiles_id_seq'::regclass),
	CONSTRAINT profiles_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.profiles OWNER TO postgres;
-- ddl-end --

-- object: public.login_info_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.login_info_id_seq CASCADE;
CREATE SEQUENCE public.login_info_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
-- ALTER SEQUENCE public.login_info_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.login_info | type: TABLE --
-- DROP TABLE IF EXISTS public.login_info CASCADE;
CREATE TABLE public.login_info (
	"providerID" character varying NOT NULL,
	"providerKey" character varying NOT NULL,
	id bigint NOT NULL DEFAULT nextval('public.login_info_id_seq'::regclass),
	CONSTRAINT login_info_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.login_info OWNER TO postgres;
-- ddl-end --

-- object: public.password_info | type: TABLE --
-- DROP TABLE IF EXISTS public.password_info CASCADE;
CREATE TABLE public.password_info (
	hasher character varying NOT NULL,
	password character varying NOT NULL,
	salt character varying,
	login_info_id bigint NOT NULL
);
-- ddl-end --
-- ALTER TABLE public.password_info OWNER TO postgres;
-- ddl-end --

-- object: public.recover_password_info_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.recover_password_info_id_seq CASCADE;
CREATE SEQUENCE public.recover_password_info_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
-- ALTER SEQUENCE public.recover_password_info_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.recover_password_info | type: TABLE --
-- DROP TABLE IF EXISTS public.recover_password_info CASCADE;
CREATE TABLE public.recover_password_info (
	email character varying NOT NULL,
	host character varying NOT NULL,
	user_id bigint NOT NULL,
	expired_date bigint NOT NULL,
	recover_id character varying NOT NULL,
	status integer NOT NULL,
	id bigint NOT NULL DEFAULT nextval('public.recover_password_info_id_seq'::regclass),
	CONSTRAINT recover_password_info_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.recover_password_info OWNER TO postgres;
-- ddl-end --

-- object: public.users_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.users_id_seq CASCADE;
CREATE SEQUENCE public.users_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
-- ALTER SEQUENCE public.users_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.users | type: TABLE --
-- DROP TABLE IF EXISTS public.users CASCADE;
CREATE TABLE public.users (
	login_info_id bigint NOT NULL,
	company_id bigint NOT NULL,
	role_id bigint NOT NULL,
	state integer NOT NULL,
	id bigint NOT NULL DEFAULT nextval('public.users_id_seq'::regclass),
	CONSTRAINT users_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.users OWNER TO postgres;
-- ddl-end --

-- object: public.companies_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.companies_id_seq CASCADE;
CREATE SEQUENCE public.companies_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
-- ALTER SEQUENCE public.companies_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.companies | type: TABLE --
-- DROP TABLE IF EXISTS public.companies CASCADE;
CREATE TABLE public.companies (
	name character varying NOT NULL,
	id bigint NOT NULL DEFAULT nextval('public.companies_id_seq'::regclass),
	CONSTRAINT companies_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.companies OWNER TO postgres;
-- ddl-end --

-- object: public.permissions_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.permissions_id_seq CASCADE;
CREATE SEQUENCE public.permissions_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
-- ALTER SEQUENCE public.permissions_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.permissions | type: TABLE --
-- DROP TABLE IF EXISTS public.permissions CASCADE;
CREATE TABLE public.permissions (
	action character varying NOT NULL,
	permission_state integer NOT NULL,
	role_id bigint NOT NULL,
	id bigint NOT NULL DEFAULT nextval('public.permissions_id_seq'::regclass),
	CONSTRAINT permissions_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.permissions OWNER TO postgres;
-- ddl-end --

-- object: public.roles_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.roles_id_seq CASCADE;
CREATE SEQUENCE public.roles_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
-- ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.roles | type: TABLE --
-- DROP TABLE IF EXISTS public.roles CASCADE;
CREATE TABLE public.roles (
	name character varying NOT NULL,
	id bigint NOT NULL DEFAULT nextval('public.roles_id_seq'::regclass),
	CONSTRAINT roles_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.roles OWNER TO postgres;
-- ddl-end --

-- object: public.invite_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.invite_id_seq CASCADE;
CREATE SEQUENCE public.invite_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
-- ALTER SEQUENCE public.invite_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.invite | type: TABLE --
-- DROP TABLE IF EXISTS public.invite CASCADE;
CREATE TABLE public.invite (
	id bigint NOT NULL DEFAULT nextval('public.invite_id_seq'::regclass),
	email character varying NOT NULL,
	"roleId" bigint NOT NULL,
	"companyId" bigint NOT NULL,
	"expiredDate" bigint NOT NULL,
	status integer NOT NULL,
	hash character varying NOT NULL,
	"invitedBy" bigint NOT NULL,
	CONSTRAINT invite_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.invite OWNER TO postgres;
-- ddl-end --

-- object: public.jwt_authenticators_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.jwt_authenticators_id_seq CASCADE;
CREATE SEQUENCE public.jwt_authenticators_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
-- ALTER SEQUENCE public.jwt_authenticators_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.jwt_authenticators | type: TABLE --
-- DROP TABLE IF EXISTS public.jwt_authenticators CASCADE;
CREATE TABLE public.jwt_authenticators (
	authenticator character varying NOT NULL,
	identifier character varying NOT NULL,
	id bigint NOT NULL DEFAULT nextval('public.jwt_authenticators_id_seq'::regclass),
	CONSTRAINT jwt_authenticators_pkey PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.jwt_authenticators OWNER TO postgres;
-- ddl-end --

-- object: login_info | type: CONSTRAINT --
-- ALTER TABLE public.users DROP CONSTRAINT IF EXISTS login_info CASCADE;
ALTER TABLE public.users ADD CONSTRAINT login_info FOREIGN KEY (login_info_id)
REFERENCES public.login_info (id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --


