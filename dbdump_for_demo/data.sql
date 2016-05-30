--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: dbadmin; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO dbadmin;

--
-- Name: url_clicks; Type: TABLE; Schema: public; Owner: dbadmin; Tablespace: 
--

CREATE TABLE url_clicks (
    id integer NOT NULL,
    url_id integer NOT NULL,
    ip inet,
    occurred_at timestamp without time zone NOT NULL
);


ALTER TABLE url_clicks OWNER TO dbadmin;

--
-- Name: url_clicks_id_seq; Type: SEQUENCE; Schema: public; Owner: dbadmin
--

CREATE SEQUENCE url_clicks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE url_clicks_id_seq OWNER TO dbadmin;

--
-- Name: url_clicks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbadmin
--

ALTER SEQUENCE url_clicks_id_seq OWNED BY url_clicks.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: dbadmin; Tablespace: 
--

CREATE TABLE urls (
    id integer NOT NULL,
    long_url character varying,
    short_url character varying,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    utm_source character varying,
    utm_medium character varying,
    utm_campaign character varying,
    utm_term character varying,
    utm_content character varying
);


ALTER TABLE urls OWNER TO dbadmin;

--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: dbadmin
--

CREATE SEQUENCE urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE urls_id_seq OWNER TO dbadmin;

--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbadmin
--

ALTER SEQUENCE urls_id_seq OWNED BY urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: dbadmin; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO dbadmin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dbadmin
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO dbadmin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbadmin
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dbadmin
--

ALTER TABLE ONLY url_clicks ALTER COLUMN id SET DEFAULT nextval('url_clicks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dbadmin
--

ALTER TABLE ONLY urls ALTER COLUMN id SET DEFAULT nextval('urls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dbadmin
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: dbadmin
--

COPY schema_migrations (version) FROM stdin;
20160528034750
20160528070701
20160528081432
20160530074242
20160530074344
\.


--
-- Data for Name: url_clicks; Type: TABLE DATA; Schema: public; Owner: dbadmin
--

COPY url_clicks (id, url_id, ip, occurred_at) FROM stdin;
9	7	192.168.1.109	2016-05-29 16:37:00
10	7	192.168.1.109	2016-05-29 16:37:00
11	7	127.0.0.1	2016-05-30 01:44:33
12	7	127.0.0.1	2016-05-30 01:51:50
13	7	127.0.0.1	2016-05-30 01:55:54
14	7	127.0.0.1	2016-05-30 01:56:09
15	7	127.0.0.1	2016-05-30 02:02:37
16	7	192.168.1.138	2016-05-30 03:34:26
17	7	192.168.1.138	2016-05-30 04:58:47
18	8	192.168.1.138	2016-05-30 05:01:29
19	2	192.168.1.138	2016-05-30 05:01:52
20	3	192.168.1.138	2016-05-30 05:04:40
21	5	192.168.1.138	2016-05-30 05:05:34
22	9	192.168.1.138	2016-05-30 05:05:51
23	2	192.168.1.138	2016-05-30 05:07:37
24	2	192.168.1.138	2016-05-30 05:08:54
25	2	192.168.1.138	2016-05-30 05:09:02
26	7	127.0.0.1	2016-05-30 05:42:46
27	10	127.0.0.1	2016-05-30 05:48:39
28	10	127.0.0.1	2016-05-30 05:48:58
29	7	127.0.0.1	2016-05-30 05:51:11
\.


--
-- Name: url_clicks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbadmin
--

SELECT pg_catalog.setval('url_clicks_id_seq', 29, true);


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: dbadmin
--

COPY urls (id, long_url, short_url, user_id, created_at, updated_at, utm_source, utm_medium, utm_campaign, utm_term, utm_content) FROM stdin;
2	http://bit.ly	s	1	2016-05-29 07:02:13.475726	2016-05-29 07:02:13.475726	\N	\N	\N	\N	\N
3	http://bita.lya	b	3	2016-05-29 07:24:27.754044	2016-05-30 11:02:48.964788	\N	\N	\N	\N	\N
4	http://asdfg.com	x	3	2016-05-29 07:25:59.097277	2016-05-29 07:25:59.097277	\N	\N	\N	\N	\N
5	http://asdf.com	r	3	2016-05-29 07:44:07.744306	2016-05-29 07:44:45.284623	\N	\N	\N	\N	\N
6	http://asdf.com2	p	3	2016-05-29 07:47:32.959314	2016-05-29 07:47:32.9648	\N	\N	\N	\N	\N
14	http://careers.carousell.com	t	1	2016-05-30 11:03:42.88352	2016-05-30 11:03:42.89718	\N	\N	\N	\N	\N
9	http://sstest	w	1	2016-05-29 08:25:02.157527	2016-05-30 11:05:41.787886	\N	\N	\N	\N	\N
8	http://www.carousell.com	k	1	2016-05-29 08:23:03.218941	2016-05-30 11:05:52.717495	\N	\N	\N	\N	\N
7	http://careers.carousell.com/#7	8	1	2016-05-29 08:21:09.63117	2016-05-29 08:21:09.638951	\N	\N	\N	\N	\N
12	https://carousell.com/p/54849508?utm_source=facebook	o	1	2016-05-30 09:00:20.911582	2016-05-30 09:00:20.929371	facebook	\N	\N	\N	\N
13	https://carousell.com/p/54849508?utm_source=google	O	1	2016-05-30 09:00:52.778759	2016-05-30 09:00:52.783294	google	\N	\N	\N	\N
10	https://carousell.com/p/54849508?utm_term=headset	y	1	2016-05-30 05:33:39.304195	2016-05-30 09:17:41.734303	\N	\N	\N	headset	\N
\.


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbadmin
--

SELECT pg_catalog.setval('urls_id_seq', 14, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dbadmin
--

COPY users (id, name, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
3	abraham	abraham@watchovermeapp.com	$2a$10$h1cTEszCBX1DmB7pF850jOupiGn8gpUY.wlqUNjf9HQxJyhWqSMSa	\N	\N	\N	1	2016-05-29 07:19:00.320035	2016-05-29 07:19:00.320035	::1	::1	2016-05-29 07:19:00.315199	2016-05-29 07:19:00.321021
1	bram gmail	abraham.krisnanda@gmail.com	$2a$10$/OvOZPgJ5xoobBq9FZhV5ecHjK0u6IZI32hztRm4uWhMTgyNCObD2	\N	\N	\N	8	2016-05-30 09:26:08.092323	2016-05-30 05:35:52.355362	127.0.0.1	127.0.0.1	2016-05-28 06:39:12.422445	2016-05-30 09:26:08.093854
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbadmin
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: url_clicks_pkey; Type: CONSTRAINT; Schema: public; Owner: dbadmin; Tablespace: 
--

ALTER TABLE ONLY url_clicks
    ADD CONSTRAINT url_clicks_pkey PRIMARY KEY (id);


--
-- Name: urls_pkey; Type: CONSTRAINT; Schema: public; Owner: dbadmin; Tablespace: 
--

ALTER TABLE ONLY urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: dbadmin; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_url_clicks_on_url_id; Type: INDEX; Schema: public; Owner: dbadmin; Tablespace: 
--

CREATE INDEX index_url_clicks_on_url_id ON url_clicks USING btree (url_id);


--
-- Name: index_urls_on_short_url; Type: INDEX; Schema: public; Owner: dbadmin; Tablespace: 
--

CREATE INDEX index_urls_on_short_url ON urls USING btree (short_url);


--
-- Name: index_urls_on_user_id; Type: INDEX; Schema: public; Owner: dbadmin; Tablespace: 
--

CREATE INDEX index_urls_on_user_id ON urls USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: dbadmin; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: dbadmin; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: dbadmin; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_1a5fd994db; Type: FK CONSTRAINT; Schema: public; Owner: dbadmin
--

ALTER TABLE ONLY url_clicks
    ADD CONSTRAINT fk_rails_1a5fd994db FOREIGN KEY (url_id) REFERENCES urls(id);


--
-- Name: fk_rails_f4ba35baaf; Type: FK CONSTRAINT; Schema: public; Owner: dbadmin
--

ALTER TABLE ONLY urls
    ADD CONSTRAINT fk_rails_f4ba35baaf FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: abrahamks
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM abrahamks;
GRANT ALL ON SCHEMA public TO abrahamks;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

