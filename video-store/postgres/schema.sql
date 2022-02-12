-- # pg_dump --host=localhost --port=5432 --username=postgres -n "video_store"
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: video_store; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA video_store;


ALTER SCHEMA video_store OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customer; Type: TABLE; Schema: video_store; Owner: postgres
--

CREATE TABLE video_store.customer (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE video_store.customer OWNER TO postgres;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: video_store; Owner: postgres
--

CREATE SEQUENCE video_store.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE video_store.customer_id_seq OWNER TO postgres;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: video_store; Owner: postgres
--

ALTER SEQUENCE video_store.customer_id_seq OWNED BY video_store.customer.id;


--
-- Name: inventory; Type: TABLE; Schema: video_store; Owner: postgres
--

CREATE TABLE video_store.inventory (
    id integer NOT NULL,
    movie_id integer NOT NULL,
    isbn character varying NOT NULL,
    note character varying
);


ALTER TABLE video_store.inventory OWNER TO postgres;

--
-- Name: inventory_id_seq; Type: SEQUENCE; Schema: video_store; Owner: postgres
--

CREATE SEQUENCE video_store.inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE video_store.inventory_id_seq OWNER TO postgres;

--
-- Name: inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: video_store; Owner: postgres
--

ALTER SEQUENCE video_store.inventory_id_seq OWNED BY video_store.inventory.id;


--
-- Name: movie; Type: TABLE; Schema: video_store; Owner: postgres
--

CREATE TABLE video_store.movie (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE video_store.movie OWNER TO postgres;

--
-- Name: movie_id_seq; Type: SEQUENCE; Schema: video_store; Owner: postgres
--

CREATE SEQUENCE video_store.movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE video_store.movie_id_seq OWNER TO postgres;

--
-- Name: movie_id_seq; Type: SEQUENCE OWNED BY; Schema: video_store; Owner: postgres
--

ALTER SEQUENCE video_store.movie_id_seq OWNED BY video_store.movie.id;


--
-- Name: rental; Type: TABLE; Schema: video_store; Owner: postgres
--

CREATE TABLE video_store.rental (
    id integer NOT NULL,
    inventory_id integer NOT NULL,
    customer_id integer NOT NULL,
    date_out timestamp with time zone NOT NULL,
    date_due timestamp with time zone NOT NULL,
    date_returned timestamp with time zone NULL,
    late_fee money NULL
);


ALTER TABLE video_store.rental OWNER TO postgres;

--
-- Name: rental_id_seq; Type: SEQUENCE; Schema: video_store; Owner: postgres
--

CREATE SEQUENCE video_store.rental_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE video_store.rental_id_seq OWNER TO postgres;

--
-- Name: rental_id_seq; Type: SEQUENCE OWNED BY; Schema: video_store; Owner: postgres
--

ALTER SEQUENCE video_store.rental_id_seq OWNED BY video_store.rental.id;


--
-- Name: customer id; Type: DEFAULT; Schema: video_store; Owner: postgres
--

ALTER TABLE ONLY video_store.customer ALTER COLUMN id SET DEFAULT nextval('video_store.customer_id_seq'::regclass);


--
-- Name: inventory id; Type: DEFAULT; Schema: video_store; Owner: postgres
--

ALTER TABLE ONLY video_store.inventory ALTER COLUMN id SET DEFAULT nextval('video_store.inventory_id_seq'::regclass);


--
-- Name: movie id; Type: DEFAULT; Schema: video_store; Owner: postgres
--

ALTER TABLE ONLY video_store.movie ALTER COLUMN id SET DEFAULT nextval('video_store.movie_id_seq'::regclass);


--
-- Name: rental id; Type: DEFAULT; Schema: video_store; Owner: postgres
--

ALTER TABLE ONLY video_store.rental ALTER COLUMN id SET DEFAULT nextval('video_store.rental_id_seq'::regclass);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: video_store; Owner: postgres
--

COPY video_store.customer (id, name) FROM stdin;
\.


--
-- Data for Name: inventory; Type: TABLE DATA; Schema: video_store; Owner: postgres
--

COPY video_store.inventory (id, movie_id, isbn, note) FROM stdin;
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: video_store; Owner: postgres
--

COPY video_store.movie (id, name) FROM stdin;
\.


--
-- Data for Name: rental; Type: TABLE DATA; Schema: video_store; Owner: postgres
--

COPY video_store.rental (id, inventory_id, customer_id, date_out, date_due) FROM stdin;
\.


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: video_store; Owner: postgres
--

SELECT pg_catalog.setval('video_store.customer_id_seq', 1, false);


--
-- Name: inventory_id_seq; Type: SEQUENCE SET; Schema: video_store; Owner: postgres
--

SELECT pg_catalog.setval('video_store.inventory_id_seq', 1, false);


--
-- Name: movie_id_seq; Type: SEQUENCE SET; Schema: video_store; Owner: postgres
--

SELECT pg_catalog.setval('video_store.movie_id_seq', 1, false);


--
-- Name: rental_id_seq; Type: SEQUENCE SET; Schema: video_store; Owner: postgres
--

SELECT pg_catalog.setval('video_store.rental_id_seq', 1, false);


--
-- Name: customer customer_pk; Type: CONSTRAINT; Schema: video_store; Owner: postgres
--

ALTER TABLE ONLY video_store.customer
    ADD CONSTRAINT customer_pk PRIMARY KEY (id);


--
-- Name: inventory inventory_pk; Type: CONSTRAINT; Schema: video_store; Owner: postgres
--

ALTER TABLE ONLY video_store.inventory
    ADD CONSTRAINT inventory_pk PRIMARY KEY (id);


--
-- Name: movie movie_pk; Type: CONSTRAINT; Schema: video_store; Owner: postgres
--

ALTER TABLE ONLY video_store.movie
    ADD CONSTRAINT movie_pk PRIMARY KEY (id);


--
-- Name: rental rental_pk; Type: CONSTRAINT; Schema: video_store; Owner: postgres
--

ALTER TABLE ONLY video_store.rental
    ADD CONSTRAINT rental_pk PRIMARY KEY (id);


--
-- Name: inventory inventory_movie_fk; Type: FK CONSTRAINT; Schema: video_store; Owner: postgres
--

ALTER TABLE ONLY video_store.inventory
    ADD CONSTRAINT inventory_movie_fk FOREIGN KEY (movie_id) REFERENCES video_store.movie(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: rental rental_customer_fk; Type: FK CONSTRAINT; Schema: video_store; Owner: postgres
--

ALTER TABLE ONLY video_store.rental
    ADD CONSTRAINT rental_customer_fk FOREIGN KEY (customer_id) REFERENCES video_store.customer(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: rental rental_inventory_fk; Type: FK CONSTRAINT; Schema: video_store; Owner: postgres
--

ALTER TABLE ONLY video_store.rental
    ADD CONSTRAINT rental_inventory_fk FOREIGN KEY (inventory_id) REFERENCES video_store.inventory(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

-- #