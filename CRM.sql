-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: "CRM" | type: DATABASE --
-- -- DROP DATABASE IF EXISTS "CRM";
-- CREATE DATABASE "CRM";
-- -- ddl-end --
-- 

-- object: crm_core | type: SCHEMA --
-- DROP SCHEMA IF EXISTS crm_core CASCADE;
CREATE SCHEMA crm_core;
-- ddl-end --
-- ALTER SCHEMA crm_core OWNER TO postgres;
-- ddl-end --

-- object: library | type: SCHEMA --
-- DROP SCHEMA IF EXISTS library CASCADE;
CREATE SCHEMA library;
-- ddl-end --
-- ALTER SCHEMA library OWNER TO postgres;
-- ddl-end --

-- object: company | type: SCHEMA --
-- DROP SCHEMA IF EXISTS company CASCADE;
CREATE SCHEMA company;
-- ddl-end --
-- ALTER SCHEMA company OWNER TO postgres;
-- ddl-end --

-- object: project | type: SCHEMA --
-- DROP SCHEMA IF EXISTS project CASCADE;
CREATE SCHEMA project;
-- ddl-end --
-- ALTER SCHEMA project OWNER TO postgres;
-- ddl-end --

-- object: education | type: SCHEMA --
-- DROP SCHEMA IF EXISTS education CASCADE;
CREATE SCHEMA education;
-- ddl-end --
-- ALTER SCHEMA education OWNER TO postgres;
-- ddl-end --

-- object: contacts | type: SCHEMA --
-- DROP SCHEMA IF EXISTS contacts CASCADE;
CREATE SCHEMA contacts;
-- ddl-end --
-- ALTER SCHEMA contacts OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,crm_core,library,company,project,education,contacts;
-- ddl-end --

-- object: crm_core.staff | type: TABLE --
-- DROP TABLE IF EXISTS crm_core.staff CASCADE;
CREATE TABLE crm_core.staff (
	person_id integer NOT NULL,
	first_name varchar(100) NOT NULL,
	last_name varchar(255) NOT NULL,
	middle_name varchar(110) NOT NULL,
	birthday date,
	type_education_id smallint,
	date_employment date,
	salary money,
	staff_status_id_status smallint,
	marital_status_id_status smallint,
	CONSTRAINT person_id_pk PRIMARY KEY (person_id)

);
-- ddl-end --
-- ALTER TABLE crm_core.staff OWNER TO postgres;
-- ddl-end --

-- object: crm_core.staff_status | type: TABLE --
-- DROP TABLE IF EXISTS crm_core.staff_status CASCADE;
CREATE TABLE crm_core.staff_status (
	id_status smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	staff_status_description varchar(15) NOT NULL,
	CONSTRAINT id_status PRIMARY KEY (id_status)

);
-- ddl-end --
-- ALTER TABLE crm_core.staff_status OWNER TO postgres;
-- ddl-end --

-- object: crm_core.marital_status | type: TABLE --
-- DROP TABLE IF EXISTS crm_core.marital_status CASCADE;
CREATE TABLE crm_core.marital_status (
	id_statys smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	merital_status_description varchar(15) NOT NULL,
	CONSTRAINT id_statys PRIMARY KEY (id_statys)

);
-- ddl-end --
-- ALTER TABLE crm_core.marital_status OWNER TO postgres;
-- ddl-end --

-- object: library.books | type: TABLE --
-- DROP TABLE IF EXISTS library.books CASCADE;
CREATE TABLE library.books (
	id_books smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name varchar(100) NOT NULL,
	autor varchar(100) NOT NULL,
	year date,
	accessibility boolean NOT NULL,
	CONSTRAINT id_books PRIMARY KEY (id_books)

);
-- ddl-end --
-- ALTER TABLE library.books OWNER TO postgres;
-- ddl-end --

-- object: library.reading_history | type: TABLE --
-- DROP TABLE IF EXISTS library.reading_history CASCADE;
CREATE TABLE library.reading_history (
	namber_read_hist smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	person_id integer NOT NULL,
	books_id_books smallint NOT NULL,
	start_reading date,
	end_reading date,
	CONSTRAINT namber_read_hist PRIMARY KEY (namber_read_hist)

);
-- ddl-end --
-- ALTER TABLE library.reading_history OWNER TO postgres;
-- ddl-end --

-- object: crm_core.family_member | type: TABLE --
-- DROP TABLE IF EXISTS crm_core.family_member CASCADE;
CREATE TABLE crm_core.family_member (
	id_family_member integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	person_id_family integer NOT NULL,
	first_name varchar(100) NOT NULL,
	last_name varchar(255) NOT NULL,
	maddle_name varchar(110) NOT NULL,
	birthday date,
	CONSTRAINT id_family_member PRIMARY KEY (id_family_member)

);
-- ddl-end --
-- ALTER TABLE crm_core.family_member OWNER TO postgres;
-- ddl-end --

-- object: company.company | type: TABLE --
-- DROP TABLE IF EXISTS company.company CASCADE;
CREATE TABLE company.company (
	id_company integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	person_id integer NOT NULL,
	name_long varchar(150) NOT NULL,
	name_short varchar(30),
	CONSTRAINT id_company PRIMARY KEY (id_company)

);
-- ddl-end --
-- ALTER TABLE company.company OWNER TO postgres;
-- ddl-end --

-- object: company.role_staff_unit | type: TABLE --
-- DROP TABLE IF EXISTS company.role_staff_unit CASCADE;
CREATE TABLE company.role_staff_unit (
	id_role smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	rele_description varchar(100) NOT NULL,
	CONSTRAINT id_role PRIMARY KEY (id_role)

);
-- ddl-end --
-- ALTER TABLE company.role_staff_unit OWNER TO postgres;
-- ddl-end --

-- object: company.units_type | type: TABLE --
-- DROP TABLE IF EXISTS company.units_type CASCADE;
CREATE TABLE company.units_type (
	id_unit smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name_unit varchar(50) NOT NULL,
	company_id integer NOT NULL,
	CONSTRAINT id_unit PRIMARY KEY (id_unit)

);
-- ddl-end --
-- ALTER TABLE company.units_type OWNER TO postgres;
-- ddl-end --

-- object: project.project | type: TABLE --
-- DROP TABLE IF EXISTS project.project CASCADE;
CREATE TABLE project.project (
	id_project smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	customer_id integer NOT NULL,
	"person_id_PM" integer NOT NULL,
	start_project date,
	end_project date,
	person_id_contact_person integer NOT NULL,
	status_project_id smallint NOT NULL,
	CONSTRAINT id_project PRIMARY KEY (id_project)

);
-- ddl-end --
-- ALTER TABLE project.project OWNER TO postgres;
-- ddl-end --

-- object: project.project_role | type: TABLE --
-- DROP TABLE IF EXISTS project.project_role CASCADE;
CREATE TABLE project.project_role (
	id_project_role smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	role_description varchar(50) NOT NULL,
	CONSTRAINT id_project_role PRIMARY KEY (id_project_role)

);
-- ddl-end --
-- ALTER TABLE project.project_role OWNER TO postgres;
-- ddl-end --

-- object: project.project_perticipants | type: TABLE --
-- DROP TABLE IF EXISTS project.project_perticipants CASCADE;
CREATE TABLE project.project_perticipants (
	namber_particip smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	person_id integer,
	project_id smallint,
	project_role_id smallint,
	function text,
	CONSTRAINT namber_particip PRIMARY KEY (namber_particip)

);
-- ddl-end --
-- ALTER TABLE project.project_perticipants OWNER TO postgres;
-- ddl-end --

-- object: contacts.phone | type: TABLE --
-- DROP TABLE IF EXISTS contacts.phone CASCADE;
CREATE TABLE contacts.phone (
	nember_row_phone smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	person_id integer NOT NULL,
	phone numeric(12) NOT NULL,
	status boolean NOT NULL,
	CONSTRAINT nember_row_phone PRIMARY KEY (nember_row_phone)

);
-- ddl-end --
-- ALTER TABLE contacts.phone OWNER TO postgres;
-- ddl-end --

-- object: contacts.email | type: TABLE --
-- DROP TABLE IF EXISTS contacts.email CASCADE;
CREATE TABLE contacts.email (
	number_row_email smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	person_id integer NOT NULL,
	email varchar(100) NOT NULL,
	CONSTRAINT number_row_email PRIMARY KEY (number_row_email)

);
-- ddl-end --
-- ALTER TABLE contacts.email OWNER TO postgres;
-- ddl-end --

-- object: contacts.messenger | type: TABLE --
-- DROP TABLE IF EXISTS contacts.messenger CASCADE;
CREATE TABLE contacts.messenger (
	number_row_messenger smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	person_id integer NOT NULL,
	messenger_type_id smallint NOT NULL,
	messenger_address varchar(50) NOT NULL,
	CONSTRAINT number_row_messenger PRIMARY KEY (number_row_messenger)

);
-- ddl-end --
-- ALTER TABLE contacts.messenger OWNER TO postgres;
-- ddl-end --

-- object: crm_core.person | type: TABLE --
-- DROP TABLE IF EXISTS crm_core.person CASCADE;
CREATE TABLE crm_core.person (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 MINVALUE 0 MAXVALUE 9223372036854775807 START WITH 1 CACHE 1 ),
	type_person_id smallint NOT NULL,
	CONSTRAINT id PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE crm_core.person OWNER TO postgres;
-- ddl-end --

-- object: contacts.address | type: TABLE --
-- DROP TABLE IF EXISTS contacts.address CASCADE;
CREATE TABLE contacts.address (
	number_row_address smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	person_id integer NOT NULL,
	type_address_id smallint NOT NULL,
	postal_code numeric(5),
	country_id smallint NOT NULL,
	region_id smallint,
	district_id smallint,
	city_id smallint NOT NULL,
	street varchar(50),
	hous_number smallint,
	apartment_number smallint,
	CONSTRAINT number_row_address PRIMARY KEY (number_row_address)

);
-- ddl-end --
-- ALTER TABLE contacts.address OWNER TO postgres;
-- ddl-end --

-- object: name_indexes | type: INDEX --
-- DROP INDEX IF EXISTS crm_core.name_indexes CASCADE;
CREATE INDEX name_indexes ON crm_core.staff
	USING btree
	(
	  first_name,
	  last_name,
	  middle_name
	);
-- ddl-end --

-- object: contacts.messenger_type | type: TABLE --
-- DROP TABLE IF EXISTS contacts.messenger_type CASCADE;
CREATE TABLE contacts.messenger_type (
	id_messenger smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name_messenger varchar(20) NOT NULL,
	CONSTRAINT id_messenger PRIMARY KEY (id_messenger)

);
-- ddl-end --
-- ALTER TABLE contacts.messenger_type OWNER TO postgres;
-- ddl-end --

-- object: education.professional_development | type: TABLE --
-- DROP TABLE IF EXISTS education.professional_development CASCADE;
CREATE TABLE education.professional_development (
	namber_prof_develop smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	discipline_id smallint NOT NULL,
	start_period date,
	end_period date,
	hours numeric(3),
	person_id integer NOT NULL,
	person_id_mentor integer,
	course_catalog_id smallint NOT NULL,
	CONSTRAINT namber_prof_develop PRIMARY KEY (namber_prof_develop)

);
-- ddl-end --
-- ALTER TABLE education.professional_development OWNER TO postgres;
-- ddl-end --

-- object: education.discipline | type: TABLE --
-- DROP TABLE IF EXISTS education.discipline CASCADE;
CREATE TABLE education.discipline (
	id_discipline smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	type_discipline_id smallint NOT NULL,
	name_discipline varchar(30) NOT NULL,
	CONSTRAINT id_discipline PRIMARY KEY (id_discipline)

);
-- ddl-end --
-- ALTER TABLE education.discipline OWNER TO postgres;
-- ddl-end --

-- object: education.type_discipline | type: TABLE --
-- DROP TABLE IF EXISTS education.type_discipline CASCADE;
CREATE TABLE education.type_discipline (
	id_type_descipline smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	type_discipline_name varchar(30) NOT NULL,
	CONSTRAINT id_type_descipline PRIMARY KEY (id_type_descipline)

);
-- ddl-end --
-- ALTER TABLE education.type_discipline OWNER TO postgres;
-- ddl-end --

-- object: education.mastered_discipline | type: TABLE --
-- DROP TABLE IF EXISTS education.mastered_discipline CASCADE;
CREATE TABLE education.mastered_discipline (
	number_row_mastered integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	person_id integer NOT NULL,
	type_discipline_id smallint NOT NULL,
	discipline_id smallint NOT NULL,
	CONSTRAINT number_row_mastered PRIMARY KEY (number_row_mastered)

);
-- ddl-end --
-- ALTER TABLE education.mastered_discipline OWNER TO postgres;
-- ddl-end --

-- object: company.units_history | type: TABLE --
-- DROP TABLE IF EXISTS company.units_history CASCADE;
CREATE TABLE company.units_history (
	number_row_history integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	person_id integer NOT NULL,
	unit_id smallint NOT NULL,
	role_id smallint NOT NULL,
	date_errollment date NOT NULL,
	status boolean NOT NULL,
	CONSTRAINT number_row_history PRIMARY KEY (number_row_history)

);
-- ddl-end --
-- ALTER TABLE company.units_history OWNER TO postgres;
-- ddl-end --

-- object: contacts.type_address | type: TABLE --
-- DROP TABLE IF EXISTS contacts.type_address CASCADE;
CREATE TABLE contacts.type_address (
	id_address smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name_type_address varchar(20) NOT NULL,
	CONSTRAINT id_address PRIMARY KEY (id_address)

);
-- ddl-end --
-- ALTER TABLE contacts.type_address OWNER TO postgres;
-- ddl-end --

-- object: "crm-test" | type: Generic SQL Object --
create database
-- ddl-end --

-- object: crm_core.family_relation | type: TABLE --
-- DROP TABLE IF EXISTS crm_core.family_relation CASCADE;
CREATE TABLE crm_core.family_relation (
	number_row_relation integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	person_id integer NOT NULL,
	type_family_relationship_id smallint NOT NULL,
	person_id_family_member integer NOT NULL,
	CONSTRAINT number_row_relation PRIMARY KEY (number_row_relation)

);
-- ddl-end --
-- ALTER TABLE crm_core.family_relation OWNER TO postgres;
-- ddl-end --

-- object: crm_core.type_family_relationship | type: TABLE --
-- DROP TABLE IF EXISTS crm_core.type_family_relationship CASCADE;
CREATE TABLE crm_core.type_family_relationship (
	id_type_relationship smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	type_name varchar(10) NOT NULL,
	CONSTRAINT id_type_relationship PRIMARY KEY (id_type_relationship)

);
-- ddl-end --
-- ALTER TABLE crm_core.type_family_relationship OWNER TO postgres;
-- ddl-end --

-- object: crm_core.type_education | type: TABLE --
-- DROP TABLE IF EXISTS crm_core.type_education CASCADE;
CREATE TABLE crm_core.type_education (
	id_education smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	type_education_description varchar(20) NOT NULL,
	CONSTRAINT id_education PRIMARY KEY (id_education)

);
-- ddl-end --
-- ALTER TABLE crm_core.type_education OWNER TO postgres;
-- ddl-end --

-- object: crm_core.type_premium | type: TABLE --
-- DROP TABLE IF EXISTS crm_core.type_premium CASCADE;
CREATE TABLE crm_core.type_premium (
	id_premium smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	type_premium_description varchar(50) NOT NULL,
	CONSTRAINT id_premium PRIMARY KEY (id_premium)

);
-- ddl-end --
-- ALTER TABLE crm_core.type_premium OWNER TO postgres;
-- ddl-end --

-- object: crm_core.premium | type: TABLE --
-- DROP TABLE IF EXISTS crm_core.premium CASCADE;
CREATE TABLE crm_core.premium (
	number_row_premium smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	person_id integer NOT NULL,
	type_premium_id smallint NOT NULL,
	CONSTRAINT number_row_premium PRIMARY KEY (number_row_premium)

);
-- ddl-end --
-- ALTER TABLE crm_core.premium OWNER TO postgres;
-- ddl-end --

-- object: education.course_catalog | type: TABLE --
-- DROP TABLE IF EXISTS education.course_catalog CASCADE;
CREATE TABLE education.course_catalog (
	id_course smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	discipline_id smallint NOT NULL,
	course_name text NOT NULL,
	CONSTRAINT id_course PRIMARY KEY (id_course)

);
-- ddl-end --
-- ALTER TABLE education.course_catalog OWNER TO postgres;
-- ddl-end --

-- object: project.customer_contact | type: TABLE --
-- DROP TABLE IF EXISTS project.customer_contact CASCADE;
CREATE TABLE project.customer_contact (
	id_customer_contact integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	person_id integer NOT NULL,
	first_name varchar(100) NOT NULL,
	last_name varchar(255) NOT NULL,
	middle_name varchar(110),
	customer_id integer NOT NULL,
	CONSTRAINT id_customer_contact PRIMARY KEY (id_customer_contact)

);
-- ddl-end --
-- ALTER TABLE project.customer_contact OWNER TO postgres;
-- ddl-end --

-- object: project.customer | type: TABLE --
-- DROP TABLE IF EXISTS project.customer CASCADE;
CREATE TABLE project.customer (
	id_customer integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	person_id integer NOT NULL,
	name_customer varchar(300) NOT NULL,
	CONSTRAINT id_customer PRIMARY KEY (id_customer)

);
-- ddl-end --
-- ALTER TABLE project.customer OWNER TO postgres;
-- ddl-end --

-- object: project.status_project | type: TABLE --
-- DROP TABLE IF EXISTS project.status_project CASCADE;
CREATE TABLE project.status_project (
	id_status_project smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	status_project_description varchar(50) NOT NULL,
	CONSTRAINT id_status_project PRIMARY KEY (id_status_project)

);
-- ddl-end --
-- ALTER TABLE project.status_project OWNER TO postgres;
-- ddl-end --

-- object: contacts.country | type: TABLE --
-- DROP TABLE IF EXISTS contacts.country CASCADE;
CREATE TABLE contacts.country (
	id_country smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	country_name varchar(30) NOT NULL,
	CONSTRAINT id_country PRIMARY KEY (id_country)

);
-- ddl-end --
-- ALTER TABLE contacts.country OWNER TO postgres;
-- ddl-end --

-- object: contacts.region | type: TABLE --
-- DROP TABLE IF EXISTS contacts.region CASCADE;
CREATE TABLE contacts.region (
	id_region smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	region_name varchar(30) NOT NULL,
	CONSTRAINT id_region PRIMARY KEY (id_region)

);
-- ddl-end --
-- ALTER TABLE contacts.region OWNER TO postgres;
-- ddl-end --

-- object: crm_core.type_person | type: TABLE --
-- DROP TABLE IF EXISTS crm_core.type_person CASCADE;
CREATE TABLE crm_core.type_person (
	id_type smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	type_person_description varchar(50) NOT NULL,
	CONSTRAINT id_type PRIMARY KEY (id_type)

);
-- ddl-end --
-- ALTER TABLE crm_core.type_person OWNER TO postgres;
-- ddl-end --

-- object: contacts.district | type: TABLE --
-- DROP TABLE IF EXISTS contacts.district CASCADE;
CREATE TABLE contacts.district (
	id_district smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	district_name varchar(30) NOT NULL,
	CONSTRAINT id_district PRIMARY KEY (id_district)

);
-- ddl-end --
-- ALTER TABLE contacts.district OWNER TO postgres;
-- ddl-end --

-- object: contacts.city | type: TABLE --
-- DROP TABLE IF EXISTS contacts.city CASCADE;
CREATE TABLE contacts.city (
	id_city smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	city_name varchar(30) NOT NULL,
	CONSTRAINT id_city PRIMARY KEY (id_city)

);
-- ddl-end --
-- ALTER TABLE contacts.city OWNER TO postgres;
-- ddl-end --

-- object: type_education_index | type: INDEX --
-- DROP INDEX IF EXISTS crm_core.type_education_index CASCADE;
CREATE INDEX type_education_index ON crm_core.type_education
	USING btree
	(
	  type_education_description
	);
-- ddl-end --

-- object: staff_status_index | type: INDEX --
-- DROP INDEX IF EXISTS crm_core.staff_status_index CASCADE;
CREATE INDEX staff_status_index ON crm_core.staff_status
	USING btree
	(
	  staff_status_description
	);
-- ddl-end --

-- object: merital_status_index | type: INDEX --
-- DROP INDEX IF EXISTS crm_core.merital_status_index CASCADE;
CREATE INDEX merital_status_index ON crm_core.marital_status
	USING btree
	(
	  merital_status_description
	);
-- ddl-end --

-- object: type_family_relationship_index | type: INDEX --
-- DROP INDEX IF EXISTS crm_core.type_family_relationship_index CASCADE;
CREATE INDEX type_family_relationship_index ON crm_core.type_family_relationship
	USING btree
	(
	  type_name
	);
-- ddl-end --

-- object: project_role_index | type: INDEX --
-- DROP INDEX IF EXISTS project.project_role_index CASCADE;
CREATE INDEX project_role_index ON project.project_role
	USING btree
	(
	  role_description
	);
-- ddl-end --

-- object: status_project_index | type: INDEX --
-- DROP INDEX IF EXISTS project.status_project_index CASCADE;
CREATE INDEX status_project_index ON project.status_project
	USING btree
	(
	  status_project_description
	);
-- ddl-end --

-- object: role_staff_unit_index | type: INDEX --
-- DROP INDEX IF EXISTS company.role_staff_unit_index CASCADE;
CREATE INDEX role_staff_unit_index ON company.role_staff_unit
	USING btree
	(
	  rele_description
	);
-- ddl-end --

-- object: name_unit_index | type: INDEX --
-- DROP INDEX IF EXISTS company.name_unit_index CASCADE;
CREATE INDEX name_unit_index ON company.units_type
	USING btree
	(
	  name_unit
	);
-- ddl-end --

-- object: city_name_index | type: INDEX --
-- DROP INDEX IF EXISTS contacts.city_name_index CASCADE;
CREATE INDEX city_name_index ON contacts.city
	USING btree
	(
	  city_name
	);
-- ddl-end --

-- object: district_name_index | type: INDEX --
-- DROP INDEX IF EXISTS contacts.district_name_index CASCADE;
CREATE INDEX district_name_index ON contacts.district
	USING btree
	(
	  district_name
	);
-- ddl-end --

-- object: region_name_index | type: INDEX --
-- DROP INDEX IF EXISTS contacts.region_name_index CASCADE;
CREATE INDEX region_name_index ON contacts.region
	USING btree
	(
	  region_name
	);
-- ddl-end --

-- object: country_name_index | type: INDEX --
-- DROP INDEX IF EXISTS contacts.country_name_index CASCADE;
CREATE INDEX country_name_index ON contacts.country
	USING btree
	(
	  country_name
	);
-- ddl-end --

-- object: type_address_index | type: INDEX --
-- DROP INDEX IF EXISTS contacts.type_address_index CASCADE;
CREATE INDEX type_address_index ON contacts.type_address
	USING btree
	(
	  name_type_address
	);
-- ddl-end --

-- object: name_messenger_index | type: INDEX --
-- DROP INDEX IF EXISTS contacts.name_messenger_index CASCADE;
CREATE INDEX name_messenger_index ON contacts.messenger_type
	USING btree
	(
	  name_messenger
	);
-- ddl-end --

-- object: course_name_index | type: INDEX --
-- DROP INDEX IF EXISTS education.course_name_index CASCADE;
CREATE INDEX course_name_index ON education.course_catalog
	USING btree
	(
	  course_name
	);
-- ddl-end --

-- object: name_discipline_index | type: INDEX --
-- DROP INDEX IF EXISTS education.name_discipline_index CASCADE;
CREATE INDEX name_discipline_index ON education.discipline
	USING btree
	(
	  name_discipline
	);
-- ddl-end --

-- object: type_discipline_index | type: INDEX --
-- DROP INDEX IF EXISTS education.type_discipline_index CASCADE;
CREATE INDEX type_discipline_index ON education.type_discipline
	USING btree
	(
	  type_discipline_name
	);
-- ddl-end --

-- object: crm_core.people | type: TABLE --
-- DROP TABLE IF EXISTS crm_core.people CASCADE;
CREATE TABLE crm_core.people (
	id_people bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	first_name varchar(100) NOT NULL,
	last_name varchar(255) NOT NULL,
	middle_name varchar(110),
	CONSTRAINT id_people PRIMARY KEY (id_people)

);
-- ddl-end --
-- ALTER TABLE crm_core.people OWNER TO postgres;
-- ddl-end --

-- object: type_person_index | type: INDEX --
-- DROP INDEX IF EXISTS crm_core.type_person_index CASCADE;
CREATE INDEX type_person_index ON crm_core.type_person
	USING btree
	(
	  type_person_description
	);
-- ddl-end --

-- object: staff_status_id_status | type: CONSTRAINT --
-- ALTER TABLE crm_core.staff DROP CONSTRAINT IF EXISTS staff_status_id_status CASCADE;
ALTER TABLE crm_core.staff ADD CONSTRAINT staff_status_id_status FOREIGN KEY (staff_status_id_status)
REFERENCES crm_core.staff_status (id_status) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: marital_status_id_status | type: CONSTRAINT --
-- ALTER TABLE crm_core.staff DROP CONSTRAINT IF EXISTS marital_status_id_status CASCADE;
ALTER TABLE crm_core.staff ADD CONSTRAINT marital_status_id_status FOREIGN KEY (marital_status_id_status)
REFERENCES crm_core.marital_status (id_statys) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id | type: CONSTRAINT --
-- ALTER TABLE crm_core.staff DROP CONSTRAINT IF EXISTS person_id CASCADE;
ALTER TABLE crm_core.staff ADD CONSTRAINT person_id FOREIGN KEY (person_id)
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: type_education_id | type: CONSTRAINT --
-- ALTER TABLE crm_core.staff DROP CONSTRAINT IF EXISTS type_education_id CASCADE;
ALTER TABLE crm_core.staff ADD CONSTRAINT type_education_id FOREIGN KEY (type_education_id)
REFERENCES crm_core.type_education (id_education) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id | type: CONSTRAINT --
-- ALTER TABLE library.reading_history DROP CONSTRAINT IF EXISTS person_id CASCADE;
ALTER TABLE library.reading_history ADD CONSTRAINT person_id FOREIGN KEY (person_id)
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: books_id_books | type: CONSTRAINT --
-- ALTER TABLE library.reading_history DROP CONSTRAINT IF EXISTS books_id_books CASCADE;
ALTER TABLE library.reading_history ADD CONSTRAINT books_id_books FOREIGN KEY (books_id_books)
REFERENCES library.books (id_books) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id_family | type: CONSTRAINT --
-- ALTER TABLE crm_core.family_member DROP CONSTRAINT IF EXISTS person_id_family CASCADE;
ALTER TABLE crm_core.family_member ADD CONSTRAINT person_id_family FOREIGN KEY (person_id_family)
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id | type: CONSTRAINT --
-- ALTER TABLE company.company DROP CONSTRAINT IF EXISTS person_id CASCADE;
ALTER TABLE company.company ADD CONSTRAINT person_id FOREIGN KEY (person_id)
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: company_id | type: CONSTRAINT --
-- ALTER TABLE company.units_type DROP CONSTRAINT IF EXISTS company_id CASCADE;
ALTER TABLE company.units_type ADD CONSTRAINT company_id FOREIGN KEY (company_id)
REFERENCES company.company (id_company) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "person_id_PM" | type: CONSTRAINT --
-- ALTER TABLE project.project DROP CONSTRAINT IF EXISTS "person_id_PM" CASCADE;
ALTER TABLE project.project ADD CONSTRAINT "person_id_PM" FOREIGN KEY ("person_id_PM")
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id_contact_person | type: CONSTRAINT --
-- ALTER TABLE project.project DROP CONSTRAINT IF EXISTS person_id_contact_person CASCADE;
ALTER TABLE project.project ADD CONSTRAINT person_id_contact_person FOREIGN KEY (person_id_contact_person)
REFERENCES project.customer_contact (person_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: customer_id | type: CONSTRAINT --
-- ALTER TABLE project.project DROP CONSTRAINT IF EXISTS customer_id CASCADE;
ALTER TABLE project.project ADD CONSTRAINT customer_id FOREIGN KEY (customer_id)
REFERENCES project.customer (id_customer) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: status_project_id | type: CONSTRAINT --
-- ALTER TABLE project.project DROP CONSTRAINT IF EXISTS status_project_id CASCADE;
ALTER TABLE project.project ADD CONSTRAINT status_project_id FOREIGN KEY (status_project_id)
REFERENCES project.status_project (id_status_project) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id | type: CONSTRAINT --
-- ALTER TABLE project.project_perticipants DROP CONSTRAINT IF EXISTS person_id CASCADE;
ALTER TABLE project.project_perticipants ADD CONSTRAINT person_id FOREIGN KEY (person_id)
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: project_id | type: CONSTRAINT --
-- ALTER TABLE project.project_perticipants DROP CONSTRAINT IF EXISTS project_id CASCADE;
ALTER TABLE project.project_perticipants ADD CONSTRAINT project_id FOREIGN KEY (project_id)
REFERENCES project.project (id_project) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: project_role_id | type: CONSTRAINT --
-- ALTER TABLE project.project_perticipants DROP CONSTRAINT IF EXISTS project_role_id CASCADE;
ALTER TABLE project.project_perticipants ADD CONSTRAINT project_role_id FOREIGN KEY (project_role_id)
REFERENCES project.project_role (id_project_role) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id | type: CONSTRAINT --
-- ALTER TABLE contacts.phone DROP CONSTRAINT IF EXISTS person_id CASCADE;
ALTER TABLE contacts.phone ADD CONSTRAINT person_id FOREIGN KEY (person_id)
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id | type: CONSTRAINT --
-- ALTER TABLE contacts.email DROP CONSTRAINT IF EXISTS person_id CASCADE;
ALTER TABLE contacts.email ADD CONSTRAINT person_id FOREIGN KEY (person_id)
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id | type: CONSTRAINT --
-- ALTER TABLE contacts.messenger DROP CONSTRAINT IF EXISTS person_id CASCADE;
ALTER TABLE contacts.messenger ADD CONSTRAINT person_id FOREIGN KEY (person_id)
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: messenger_type_id | type: CONSTRAINT --
-- ALTER TABLE contacts.messenger DROP CONSTRAINT IF EXISTS messenger_type_id CASCADE;
ALTER TABLE contacts.messenger ADD CONSTRAINT messenger_type_id FOREIGN KEY (messenger_type_id)
REFERENCES contacts.messenger_type (id_messenger) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: type_person_id | type: CONSTRAINT --
-- ALTER TABLE crm_core.person DROP CONSTRAINT IF EXISTS type_person_id CASCADE;
ALTER TABLE crm_core.person ADD CONSTRAINT type_person_id FOREIGN KEY (type_person_id)
REFERENCES crm_core.type_person (id_type) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id | type: CONSTRAINT --
-- ALTER TABLE contacts.address DROP CONSTRAINT IF EXISTS person_id CASCADE;
ALTER TABLE contacts.address ADD CONSTRAINT person_id FOREIGN KEY (person_id)
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: type_address_id | type: CONSTRAINT --
-- ALTER TABLE contacts.address DROP CONSTRAINT IF EXISTS type_address_id CASCADE;
ALTER TABLE contacts.address ADD CONSTRAINT type_address_id FOREIGN KEY (type_address_id)
REFERENCES contacts.type_address (id_address) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: country_id | type: CONSTRAINT --
-- ALTER TABLE contacts.address DROP CONSTRAINT IF EXISTS country_id CASCADE;
ALTER TABLE contacts.address ADD CONSTRAINT country_id FOREIGN KEY (country_id)
REFERENCES contacts.country (id_country) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: region_id | type: CONSTRAINT --
-- ALTER TABLE contacts.address DROP CONSTRAINT IF EXISTS region_id CASCADE;
ALTER TABLE contacts.address ADD CONSTRAINT region_id FOREIGN KEY (region_id)
REFERENCES contacts.region (id_region) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: district_id | type: CONSTRAINT --
-- ALTER TABLE contacts.address DROP CONSTRAINT IF EXISTS district_id CASCADE;
ALTER TABLE contacts.address ADD CONSTRAINT district_id FOREIGN KEY (district_id)
REFERENCES contacts.district (id_district) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: city_id | type: CONSTRAINT --
-- ALTER TABLE contacts.address DROP CONSTRAINT IF EXISTS city_id CASCADE;
ALTER TABLE contacts.address ADD CONSTRAINT city_id FOREIGN KEY (city_id)
REFERENCES contacts.city (id_city) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id | type: CONSTRAINT --
-- ALTER TABLE education.professional_development DROP CONSTRAINT IF EXISTS person_id CASCADE;
ALTER TABLE education.professional_development ADD CONSTRAINT person_id FOREIGN KEY (person_id)
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id_mentor | type: CONSTRAINT --
-- ALTER TABLE education.professional_development DROP CONSTRAINT IF EXISTS person_id_mentor CASCADE;
ALTER TABLE education.professional_development ADD CONSTRAINT person_id_mentor FOREIGN KEY (person_id_mentor)
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: discipline_id | type: CONSTRAINT --
-- ALTER TABLE education.professional_development DROP CONSTRAINT IF EXISTS discipline_id CASCADE;
ALTER TABLE education.professional_development ADD CONSTRAINT discipline_id FOREIGN KEY (discipline_id)
REFERENCES education.discipline (id_discipline) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: course_catalog_id | type: CONSTRAINT --
-- ALTER TABLE education.professional_development DROP CONSTRAINT IF EXISTS course_catalog_id CASCADE;
ALTER TABLE education.professional_development ADD CONSTRAINT course_catalog_id FOREIGN KEY (course_catalog_id)
REFERENCES education.course_catalog (id_course) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: type_discipline_id | type: CONSTRAINT --
-- ALTER TABLE education.discipline DROP CONSTRAINT IF EXISTS type_discipline_id CASCADE;
ALTER TABLE education.discipline ADD CONSTRAINT type_discipline_id FOREIGN KEY (type_discipline_id)
REFERENCES education.type_discipline (id_type_descipline) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: type_discipline_id | type: CONSTRAINT --
-- ALTER TABLE education.mastered_discipline DROP CONSTRAINT IF EXISTS type_discipline_id CASCADE;
ALTER TABLE education.mastered_discipline ADD CONSTRAINT type_discipline_id FOREIGN KEY (type_discipline_id)
REFERENCES education.type_discipline (id_type_descipline) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: discipline_id | type: CONSTRAINT --
-- ALTER TABLE education.mastered_discipline DROP CONSTRAINT IF EXISTS discipline_id CASCADE;
ALTER TABLE education.mastered_discipline ADD CONSTRAINT discipline_id FOREIGN KEY (discipline_id)
REFERENCES education.discipline (id_discipline) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id | type: CONSTRAINT --
-- ALTER TABLE education.mastered_discipline DROP CONSTRAINT IF EXISTS person_id CASCADE;
ALTER TABLE education.mastered_discipline ADD CONSTRAINT person_id FOREIGN KEY (person_id)
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id | type: CONSTRAINT --
-- ALTER TABLE company.units_history DROP CONSTRAINT IF EXISTS person_id CASCADE;
ALTER TABLE company.units_history ADD CONSTRAINT person_id FOREIGN KEY (person_id)
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: unit_id | type: CONSTRAINT --
-- ALTER TABLE company.units_history DROP CONSTRAINT IF EXISTS unit_id CASCADE;
ALTER TABLE company.units_history ADD CONSTRAINT unit_id FOREIGN KEY (unit_id)
REFERENCES company.units_type (id_unit) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: role_id | type: CONSTRAINT --
-- ALTER TABLE company.units_history DROP CONSTRAINT IF EXISTS role_id CASCADE;
ALTER TABLE company.units_history ADD CONSTRAINT role_id FOREIGN KEY (role_id)
REFERENCES company.role_staff_unit (id_role) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id | type: CONSTRAINT --
-- ALTER TABLE crm_core.family_relation DROP CONSTRAINT IF EXISTS person_id CASCADE;
ALTER TABLE crm_core.family_relation ADD CONSTRAINT person_id FOREIGN KEY (person_id)
REFERENCES crm_core.staff (person_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: type_family_relationship_id | type: CONSTRAINT --
-- ALTER TABLE crm_core.family_relation DROP CONSTRAINT IF EXISTS type_family_relationship_id CASCADE;
ALTER TABLE crm_core.family_relation ADD CONSTRAINT type_family_relationship_id FOREIGN KEY (type_family_relationship_id)
REFERENCES crm_core.type_family_relationship (id_type_relationship) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id_family_member | type: CONSTRAINT --
-- ALTER TABLE crm_core.family_relation DROP CONSTRAINT IF EXISTS person_id_family_member CASCADE;
ALTER TABLE crm_core.family_relation ADD CONSTRAINT person_id_family_member FOREIGN KEY (person_id_family_member)
REFERENCES crm_core.family_member (person_id_family) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id | type: CONSTRAINT --
-- ALTER TABLE crm_core.premium DROP CONSTRAINT IF EXISTS person_id CASCADE;
ALTER TABLE crm_core.premium ADD CONSTRAINT person_id FOREIGN KEY (person_id)
REFERENCES crm_core.staff (person_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: type_premium_id | type: CONSTRAINT --
-- ALTER TABLE crm_core.premium DROP CONSTRAINT IF EXISTS type_premium_id CASCADE;
ALTER TABLE crm_core.premium ADD CONSTRAINT type_premium_id FOREIGN KEY (type_premium_id)
REFERENCES crm_core.type_premium (id_premium) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: discipline_id | type: CONSTRAINT --
-- ALTER TABLE education.course_catalog DROP CONSTRAINT IF EXISTS discipline_id CASCADE;
ALTER TABLE education.course_catalog ADD CONSTRAINT discipline_id FOREIGN KEY (discipline_id)
REFERENCES education.discipline (id_discipline) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id | type: CONSTRAINT --
-- ALTER TABLE project.customer_contact DROP CONSTRAINT IF EXISTS person_id CASCADE;
ALTER TABLE project.customer_contact ADD CONSTRAINT person_id FOREIGN KEY (person_id)
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: customer_id | type: CONSTRAINT --
-- ALTER TABLE project.customer_contact DROP CONSTRAINT IF EXISTS customer_id CASCADE;
ALTER TABLE project.customer_contact ADD CONSTRAINT customer_id FOREIGN KEY (customer_id)
REFERENCES project.customer (id_customer) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: person_id | type: CONSTRAINT --
-- ALTER TABLE project.customer DROP CONSTRAINT IF EXISTS person_id CASCADE;
ALTER TABLE project.customer ADD CONSTRAINT person_id FOREIGN KEY (person_id)
REFERENCES crm_core.person (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


