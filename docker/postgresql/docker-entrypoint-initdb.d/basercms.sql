--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-2.pgdg90+1)
-- Dumped by pg_dump version 10.5 (Debian 10.5-2.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: content_folders; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.content_folders (
    id integer NOT NULL,
    folder_template character varying(255) DEFAULT NULL::character varying,
    page_template character varying(255) DEFAULT NULL::character varying,
    created timestamp without time zone,
    modified timestamp without time zone
);


ALTER TABLE public.content_folders OWNER TO root;

--
-- Name: contents; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.contents (
    id integer NOT NULL,
    name text,
    plugin character varying(255) DEFAULT NULL::character varying,
    type character varying(255) DEFAULT NULL::character varying,
    entity_id integer,
    url character varying(255) DEFAULT NULL::character varying,
    site_id integer DEFAULT 0,
    alias_id integer,
    main_site_content_id integer,
    parent_id integer,
    lft integer,
    rght integer,
    level integer,
    title character varying(255) DEFAULT NULL::character varying,
    description text,
    eyecatch character varying(255) DEFAULT NULL::character varying,
    author_id integer,
    layout_template character varying(50) DEFAULT NULL::character varying,
    status boolean,
    publish_begin timestamp without time zone,
    publish_end timestamp without time zone,
    self_status boolean,
    self_publish_begin timestamp without time zone,
    self_publish_end timestamp without time zone,
    exclude_search boolean,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    site_root boolean,
    deleted_date timestamp without time zone,
    deleted boolean,
    exclude_menu boolean DEFAULT false,
    blank_link boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone
);


ALTER TABLE public.contents OWNER TO root;

--
-- Name: pages; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    contents text,
    draft text,
    page_template character varying(255) DEFAULT NULL::character varying,
    code text,
    modified timestamp without time zone,
    created timestamp without time zone
);


ALTER TABLE public.pages OWNER TO root;

--
-- Name: password_requests; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.password_requests (
    id integer NOT NULL,
    user_id integer,
    request_key character varying(255) DEFAULT NULL::character varying,
    used smallint DEFAULT '0'::smallint,
    created timestamp without time zone,
    modified timestamp without time zone
);


ALTER TABLE public.password_requests OWNER TO root;

--
-- Name: plugins; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.plugins (
    id integer NOT NULL,
    name character varying(50) DEFAULT NULL::character varying,
    title character varying(50) DEFAULT NULL::character varying,
    version character varying(100) DEFAULT NULL::character varying,
    status boolean,
    db_init boolean,
    priority integer DEFAULT 0,
    created timestamp without time zone,
    modified timestamp without time zone
);


ALTER TABLE public.plugins OWNER TO root;

--
-- Name: user_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_groups (
    id integer NOT NULL,
    name character varying(50) DEFAULT NULL::character varying,
    title character varying(50) DEFAULT NULL::character varying,
    auth_prefix character varying(20) DEFAULT NULL::character varying,
    default_favorites text,
    use_move_contents boolean DEFAULT false,
    modified timestamp without time zone,
    created timestamp without time zone
);


ALTER TABLE public.user_groups OWNER TO root;

--
-- Name: users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    password character varying(255) DEFAULT NULL::character varying,
    real_name_1 character varying(50) DEFAULT NULL::character varying,
    real_name_2 character varying(50) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    nickname character varying(255) DEFAULT NULL::character varying,
    created timestamp without time zone,
    modified timestamp without time zone
);


ALTER TABLE public.users OWNER TO root;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer,
    user_group_id integer,
    created timestamp without time zone,
    modified timestamp without time zone
);


ALTER TABLE public.users_user_groups OWNER TO root;

--
-- Data for Name: content_folders; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.content_folders (id, folder_template, page_template, created, modified) FROM stdin;
1			2017-05-03 14:21:45	2017-05-03 14:51:52
\.


--
-- Data for Name: contents; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.contents (id, name, plugin, type, entity_id, url, site_id, alias_id, main_site_content_id, parent_id, lft, rght, level, title, description, eyecatch, author_id, layout_template, status, publish_begin, publish_end, self_status, self_publish_begin, self_publish_end, exclude_search, created_date, modified_date, site_root, deleted_date, deleted, exclude_menu, blank_link, created, modified) FROM stdin;
1		Core	ContentFolder	1	/	0	\N	\N	\N	1	18	0	ryuring.com			1	default	t	\N	\N	t	\N	\N	f	2017-05-03 14:22:08	2017-05-03 14:22:08	t	\N	f	f	f	2016-07-29 18:02:53	2017-05-03 14:51:52
2	index	Core	Page	1	/index	0	\N	\N	1	14	15	1	トップページ			1		t	\N	\N	t	\N	\N	f	2017-05-03 14:22:08	2017-05-03 14:22:08	f	\N	f	f	f	2016-07-29 18:13:03	2017-05-03 15:12:27
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.pages (id, contents, draft, page_template, code, modified, created) FROM stdin;
1	<p>座右の銘「やるときゃやる」</p>\\r\\n				2017-05-03 15:12:27	2015-06-26 20:34:06
\.


--
-- Data for Name: password_requests; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.password_requests (id, user_id, request_key, used, created, modified) FROM stdin;
\.


--
-- Data for Name: plugins; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.plugins (id, name, title, version, status, db_init, priority, created, modified) FROM stdin;
\.


--
-- Data for Name: user_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_groups (id, name, title, auth_prefix, default_favorites, use_move_contents, modified, created) FROM stdin;
1	admins	システム管理	admin	YTo3OntpOjA7YToyOntzOjQ6Im5hbWUiO3M6MjE6IuOCs+ODs+ODhuODs+ODhOeuoeeQhiI7czozOiJ1cmwiO3M6MjE6Ii9hZG1pbi9jb250ZW50cy9pbmRleCI7fWk6MTthOjI6e3M6NDoibmFtZSI7czoxODoi5paw552A5oOF5aCx566h55CGIjtzOjM6InVybCI7czozMDoiL2FkbWluL2Jsb2cvYmxvZ19wb3N0cy9pbmRleC8xIjt9aToyO2E6Mjp7czo0OiJuYW1lIjtzOjMwOiLmlrDnnYDmg4XloLHjgrPjg6Hjg7Pjg4jkuIDopqciO3M6MzoidXJsIjtzOjMzOiIvYWRtaW4vYmxvZy9ibG9nX2NvbW1lbnRzL2luZGV4LzEiO31pOjM7YToyOntzOjQ6Im5hbWUiO3M6MjQ6IuOBiuWVj+OBhOWQiOOCj+OBm+ioreWumiI7czozOiJ1cmwiO3M6MzE6Ii9hZG1pbi9tYWlsL21haWxfZmllbGRzL2luZGV4LzEiO31pOjQ7YToyOntzOjQ6Im5hbWUiO3M6MjQ6IuOBiuWVj+OBhOWQiOOCj+OBm+S4gOimpyI7czozOiJ1cmwiO3M6MzM6Ii9hZG1pbi9tYWlsL21haWxfbWVzc2FnZXMvaW5kZXgvMSI7fWk6NTthOjI6e3M6NDoibmFtZSI7czoyNDoi44Ki44OD44OX44Ot44O844OJ566h55CGIjtzOjM6InVybCI7czozMToiL2FkbWluL3VwbG9hZGVyL3VwbG9hZGVyX2ZpbGVzLyI7fWk6NjthOjI6e3M6NDoibmFtZSI7czoxNToi44Kv44Os44K444OD44OIIjtzOjM6InVybCI7czoyMDoiamF2YXNjcmlwdDpjcmVkaXQoKTsiO319	t	2016-08-16 19:47:07	2015-06-26 20:34:07
2	operators	サイト運営	admin	YTo3OntpOjA7YToyOntzOjQ6Im5hbWUiO3M6MjE6IuOCs+ODs+ODhuODs+ODhOeuoeeQhiI7czozOiJ1cmwiO3M6MjE6Ii9hZG1pbi9jb250ZW50cy9pbmRleCI7fWk6MTthOjI6e3M6NDoibmFtZSI7czoxODoi5paw552A5oOF5aCx566h55CGIjtzOjM6InVybCI7czozMDoiL2FkbWluL2Jsb2cvYmxvZ19wb3N0cy9pbmRleC8xIjt9aToyO2E6Mjp7czo0OiJuYW1lIjtzOjMwOiLmlrDnnYDmg4XloLHjgrPjg6Hjg7Pjg4jkuIDopqciO3M6MzoidXJsIjtzOjMzOiIvYWRtaW4vYmxvZy9ibG9nX2NvbW1lbnRzL2luZGV4LzEiO31pOjM7YToyOntzOjQ6Im5hbWUiO3M6MjQ6IuOBiuWVj+OBhOWQiOOCj+OBm+ioreWumiI7czozOiJ1cmwiO3M6MzE6Ii9hZG1pbi9tYWlsL21haWxfZmllbGRzL2luZGV4LzEiO31pOjQ7YToyOntzOjQ6Im5hbWUiO3M6MjQ6IuOBiuWVj+OBhOWQiOOCj+OBm+S4gOimpyI7czozOiJ1cmwiO3M6MzM6Ii9hZG1pbi9tYWlsL21haWxfbWVzc2FnZXMvaW5kZXgvMSI7fWk6NTthOjI6e3M6NDoibmFtZSI7czoyNDoi44Ki44OD44OX44Ot44O844OJ566h55CGIjtzOjM6InVybCI7czozMToiL2FkbWluL3VwbG9hZGVyL3VwbG9hZGVyX2ZpbGVzLyI7fWk6NjthOjI6e3M6NDoibmFtZSI7czoxNToi44Kv44Os44K444OD44OIIjtzOjM6InVybCI7czoyMDoiamF2YXNjcmlwdDpjcmVkaXQoKTsiO319	f	\N	2015-06-26 20:34:07
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users (id, name, password, real_name_1, real_name_2, email, nickname, created, modified) FROM stdin;
1	basercake3	$2y$10$x6WQstawmuyS7XrqutyDjOSOLxJp3dv72O73B7lhqzP8XvVlmcx4G	basercake4		admin@example.com		2017-05-03 14:22:08	2020-04-22 10:24:08
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users_user_groups (id, user_id, user_group_id, created, modified) FROM stdin;
1	1	1	2020-04-01 19:28:31	2020-04-01 19:28:31
\.


--
-- Name: content_folders content_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_folders
    ADD CONSTRAINT content_folders_pkey PRIMARY KEY (id);


--
-- Name: contents contents_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.contents
    ADD CONSTRAINT contents_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: password_requests password_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.password_requests
    ADD CONSTRAINT password_requests_pkey PRIMARY KEY (id);


--
-- Name: plugins plugins_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_pkey PRIMARY KEY (id);


--
-- Name: user_groups user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

