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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    link_id integer,
    body text,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: impressions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE impressions (
    id integer NOT NULL,
    impressionable_type character varying,
    impressionable_id integer,
    user_id integer,
    controller_name character varying,
    action_name character varying,
    view_name character varying,
    request_hash character varying,
    ip_address character varying,
    session_hash character varying,
    message text,
    referrer text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: impressions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE impressions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: impressions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE impressions_id_seq OWNED BY impressions.id;


--
-- Name: links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE links (
    id integer NOT NULL,
    title character varying,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE links_id_seq OWNED BY links.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying,
    resource_type character varying,
    resource_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    gender character varying,
    admin boolean,
    provider character varying,
    uid character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users_roles (
    user_id integer,
    role_id integer
);


--
-- Name: votes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE votes (
    id integer NOT NULL,
    votable_type character varying,
    votable_id integer,
    voter_type character varying,
    voter_id integer,
    vote_flag boolean,
    vote_scope character varying,
    vote_weight integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE votes_id_seq OWNED BY votes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY impressions ALTER COLUMN id SET DEFAULT nextval('impressions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY links ALTER COLUMN id SET DEFAULT nextval('links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY votes ALTER COLUMN id SET DEFAULT nextval('votes_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2016-08-01 05:26:01.959286	2016-08-01 05:26:01.959286
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comments (id, link_id, body, user_id, created_at, updated_at) FROM stdin;
1	8	jhvg	1	2016-08-04 17:15:15.977815	2016-08-04 17:15:15.977815
2	8	kjhgb	1	2016-08-06 19:36:10.614223	2016-08-06 19:36:10.614223
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('comments_id_seq', 2, true);


--
-- Data for Name: impressions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY impressions (id, impressionable_type, impressionable_id, user_id, controller_name, action_name, view_name, request_hash, ip_address, session_hash, message, referrer, created_at, updated_at) FROM stdin;
66	Link	1	2	links	show	\N	92c87269210e8f3d4788a0c7ff6e62a98ebf2484b83f934a311d1130af1ecbbe	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-01 08:06:50.163421	2016-08-01 08:06:50.163421
67	Link	1	\N	links	show	\N	011b8bcf5ec60128dbe68700cbb6f3bba1a2a7a62f2202f21245af2d392fb8fb	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-01 08:20:37.943098	2016-08-01 08:20:37.943098
68	Link	3	\N	links	show	\N	f46471bde57911ad906c037feded16531225d882b76c3092fdd1575d1dd760e6	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-01 08:20:59.932272	2016-08-01 08:20:59.932272
69	Link	3	\N	links	show	\N	0e9f2b1e2799c2dea8d2032906e929bbbec52bcd13c451973c6782ac69134383	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-01 08:22:22.2949	2016-08-01 08:22:22.2949
70	Link	3	\N	links	show	\N	d6a077e78a7ca5f6c05d74655e277b7efbef46e438cbf0e9ae01d0354789fab4	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-01 08:22:34.003397	2016-08-01 08:22:34.003397
71	Link	1	\N	links	show	\N	f5056246ba4870233425dd6ee9c652c81da7d09ac5a3ce7b73af032fd4f3a7d8	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-01 08:22:43.491771	2016-08-01 08:22:43.491771
72	Link	1	\N	links	show	\N	7684f91f7995bdd572820b758b7c308282d3707c569292902b6e4a4fdc98e962	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-01 08:24:13.386254	2016-08-01 08:24:13.386254
73	Link	1	\N	links	show	\N	473cdbd4198783778562be33850c8d4d4a6319e053f4abbc6433e1b2bcd8a5ad	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-01 08:24:19.163146	2016-08-01 08:24:19.163146
74	Link	2	\N	links	show	\N	59b05cc5dc182fbd46c5eaceb69c735c2d256f45a4099bf10d07b066cf8e01c5	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-01 08:24:25.598197	2016-08-01 08:24:25.598197
75	Link	2	\N	links	show	\N	d0797f449ea479395918152d390dc71ef8acddfdb9ac7aaa08f5711ad371c35b	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-01 08:24:29.675687	2016-08-01 08:24:29.675687
76	Link	1	\N	links	show	\N	a8c3b57ccea4ad41d1c0c9a6659a53e4d3dd9fd910beb5bb6a629d8a73f5b07c	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-01 20:59:16.245241	2016-08-01 20:59:16.245241
77	Link	4	3	links	show	\N	95cda8bbfe4cfa17c43a4fa40c2effeaf837b4e540804e0f501457e96239558d	127.0.0.1	\N	\N	http://localhost:3000/links/new	2016-08-01 21:03:04.784583	2016-08-01 21:03:04.784583
78	Link	5	3	links	show	\N	7296efbf214d287a065db32b5b0a5417858dcca9003351955311b67803d9ad57	127.0.0.1	\N	\N	http://localhost:3000/links	2016-08-01 21:03:23.155998	2016-08-01 21:03:23.155998
79	Link	4	3	links	show	\N	15d56772309cbcd8816a78a68b0acf49469a35d2aab54c49f2d0164d5ff227f5	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-01 21:03:28.065274	2016-08-01 21:03:28.065274
80	Link	4	3	links	show	\N	f27745e3df905a53b8b94b785af09449743cd9a9ec4f4d21f947f8e992210c2a	127.0.0.1	\N	\N	http://localhost:3000/links	2016-08-01 21:05:24.449779	2016-08-01 21:05:24.449779
81	Link	4	3	links	show	\N	4c818f4ddbb127c02a0b36be95514e7f9deb14f699eb4a27db0eddcfc932c756	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-02 03:42:01.595558	2016-08-02 03:42:01.595558
82	Link	4	\N	links	show	\N	cb04b3a69c8677c810c657301b8a976c08c82a4358c130045e92d30b587a116a	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-02 03:42:47.589488	2016-08-02 03:42:47.589488
83	Link	5	\N	links	show	\N	f5a5288e608ca1d9e20fe53f97489c16b43c4113b8d38e42e21240c6ada60643	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-02 03:42:57.383844	2016-08-02 03:42:57.383844
84	Link	4	\N	links	show	\N	25fa085eac1dbc76ab26b92e6e6ad96952e7c54e2a75ea731b47866221a8b6a6	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-02 06:26:42.190861	2016-08-02 06:26:42.190861
85	Link	4	\N	links	show	\N	56174575a47e7ae4727281fc8a7abd4d1e8ea878a29074fb4d0baa89595cabdc	127.0.0.1	\N	\N	\N	2016-08-02 06:28:09.701583	2016-08-02 06:28:09.701583
86	Link	4	\N	links	show	\N	8aa1528d8ccce67218cebc9f1ac95cf9224396b7559259f615e5b11cb51129a1	127.0.0.1	\N	\N	\N	2016-08-02 06:52:00.666606	2016-08-02 06:52:00.666606
87	Link	4	\N	links	show	\N	23a04a01c43f7b1a13e0c1893840dd6af170a4a02e6c1570b011d6df4326acd0	127.0.0.1	\N	\N	\N	2016-08-02 06:53:49.811133	2016-08-02 06:53:49.811133
88	Link	4	\N	links	show	\N	39707741c831694bdf104e3ad076d291671e67ee3c67b9b6eb8bd74c00a816f0	127.0.0.1	\N	\N	\N	2016-08-02 06:54:50.548278	2016-08-02 06:54:50.548278
89	Link	4	\N	links	show	\N	874e5d61dc15a43bb05bf88a0f1a3d7463c52845e6e29ea883ed9ab77c78cde3	127.0.0.1	\N	\N	\N	2016-08-02 06:56:27.080266	2016-08-02 06:56:27.080266
90	Link	4	\N	links	show	\N	831423706280fd098426219b06e16762785866ea046a785abcf570f1845cbf45	127.0.0.1	\N	\N	\N	2016-08-02 06:57:50.244086	2016-08-02 06:57:50.244086
91	Link	4	\N	links	show	\N	e8c058334da557fe93f81d91a12db3e71cd3367a2f924242631d0862395df093	127.0.0.1	\N	\N	\N	2016-08-02 06:58:29.214285	2016-08-02 06:58:29.214285
92	Link	4	\N	links	show	\N	2b071acae2c037cf55230c9946ffc3d8414fdd79395ac283d5a6694d41844abc	127.0.0.1	\N	\N	\N	2016-08-02 06:58:52.917841	2016-08-02 06:58:52.917841
93	Link	4	\N	links	show	\N	2b78fc0c053ffa4e3b255027bbde73eb07e7a72c172f91f737719fdc04c11fa7	127.0.0.1	\N	\N	\N	2016-08-02 06:59:05.588275	2016-08-02 06:59:05.588275
94	Link	4	\N	links	show	\N	100c0dc37a37fa434c7135c1092b5d5216089b5205c087c09741c77d25483686	127.0.0.1	\N	\N	\N	2016-08-02 06:59:57.230048	2016-08-02 06:59:57.230048
95	Link	4	\N	links	show	\N	2d1aad0303aedccbc438618b0df589fe83d161a18df6222d92aab8629f8078b8	127.0.0.1	\N	\N	\N	2016-08-02 07:00:10.131345	2016-08-02 07:00:10.131345
96	Link	4	\N	links	show	\N	7baa277cdb66fac5d871eecd977d2c830209d6031d9e05408fdc3d5e0cbf9e54	127.0.0.1	\N	\N	\N	2016-08-02 07:00:57.565696	2016-08-02 07:00:57.565696
97	Link	4	\N	links	show	\N	bd4161e2a33471d770886edc0c03633aac50ccdb477a0d443b87bc87d5e8318d	127.0.0.1	\N	\N	\N	2016-08-02 07:03:29.626075	2016-08-02 07:03:29.626075
98	Link	4	\N	links	show	\N	465e692d5af564d99cea27586d24384ca8ad58ab5270bb1bb7e818c698c5a726	127.0.0.1	\N	\N	\N	2016-08-02 07:05:38.429924	2016-08-02 07:05:38.429924
99	Link	4	\N	links	show	\N	938d1f68604465b72e34e38480f36e1f8bd427b1c82489c7dae6c87a1a925b8d	127.0.0.1	\N	\N	\N	2016-08-02 07:07:55.622015	2016-08-02 07:07:55.622015
100	Link	4	\N	links	show	\N	ac048c54d0115dce1f44efaee1ed3eb38ba74605f340985287a8839f984f1ba7	127.0.0.1	\N	\N	\N	2016-08-02 07:10:25.643686	2016-08-02 07:10:25.643686
101	Link	4	\N	links	show	\N	eee04116fd95e33d828c6215a21d4d0ba6348dc34be689dfc5ec956690776c05	127.0.0.1	\N	\N	\N	2016-08-02 07:11:09.118454	2016-08-02 07:11:09.118454
102	Link	4	\N	links	show	\N	53f655c6ec561bb54af26ed3697ed952188e840536d01e5e73c983c67ad854e6	127.0.0.1	\N	\N	\N	2016-08-02 07:11:32.155581	2016-08-02 07:11:32.155581
103	Link	4	\N	links	show	\N	590e3df94a99b11b7dbb84299b312ebdd85e730376dc53857c3b161ce10355e3	127.0.0.1	\N	\N	\N	2016-08-02 07:11:50.250332	2016-08-02 07:11:50.250332
104	Link	4	\N	links	show	\N	b80ddc46367efee3f6849819218e26876d6c06b6d61e2dd69cd731a53cc6087b	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-02 07:23:44.479446	2016-08-02 07:23:44.479446
105	Link	4	\N	links	show	\N	4c744fff4666ac59a84da37259dc4664b8ec2bf9bd6e271485b9da2d03215df8	127.0.0.1	\N	\N	\N	2016-08-02 07:24:05.902916	2016-08-02 07:24:05.902916
106	Link	5	\N	links	show	\N	96bfd10c3c8819fa96cb161f9678ae2f8ec504c6b62664e5ad0bea5829c63696	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-02 21:22:18.641104	2016-08-02 21:22:18.641104
107	Link	5	\N	links	show	\N	c2e9ce008cbb2bafc085319b265f5c92f066d9409e19c00c775c286d6f15be45	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-02 21:22:23.02752	2016-08-02 21:22:23.02752
108	Link	4	\N	links	show	\N	11605373c074ec7ddccd4703d9c6068f9a18dee18102d57ea72518604d93a1d3	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-02 21:22:31.709156	2016-08-02 21:22:31.709156
109	Link	5	\N	links	show	\N	2f990c7b6329fb5805ee48ebb36270fb558c7e565c08f8fcd6a05b6c026f938b	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-03 02:51:31.008137	2016-08-03 02:51:31.008137
110	Link	5	\N	links	show	\N	3e0b4d5fda011ae92da0e8668933df54249047b96493666f1bd4ee738d108ec9	127.0.0.1	\N	\N	\N	2016-08-03 02:51:36.190501	2016-08-03 02:51:36.190501
111	Link	5	\N	links	show	\N	a360efd207cd878e73bbfde31418261c50d6275cd45c3723d9fbff1bce5b29c9	127.0.0.1	\N	\N	\N	2016-08-03 02:51:38.934873	2016-08-03 02:51:38.934873
112	Link	4	\N	links	show	\N	ec5164da5c575aa7a01cef839dda88b15cdd9abb3d0a31ccafd9e1f373dea160	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-03 02:51:42.967174	2016-08-03 02:51:42.967174
113	Link	4	\N	links	show	\N	58c12ff10cc27b540be26bb63d88a9005cf90905a12789ac9054ca2dbe614ff2	127.0.0.1	\N	\N	\N	2016-08-03 02:51:48.319995	2016-08-03 02:51:48.319995
114	Link	4	\N	links	show	\N	85ccbf5b09e0922bb58aaf0817e74536df0494d9dbe503d11b411dd144d4103e	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-03 02:51:59.377323	2016-08-03 02:51:59.377323
118	Link	5	\N	links	show	\N	696367bbb9d5d809d6435a55d8b8de6510f301fe5bf51b487a1ef6b530618560	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-03 02:53:10.368799	2016-08-03 02:53:10.368799
115	Link	4	\N	links	show	\N	87a34cab422bd0cf79d48e37bab3d56aaeea45f9f2f40e92b9fe0dd20b8a7044	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-03 02:52:03.863395	2016-08-03 02:52:03.863395
116	Link	4	\N	links	show	\N	db702723e401d6a01d72a930e3945a7725ad57aa8bc867ccf2100ac1c3aa03ce	127.0.0.1	\N	\N	\N	2016-08-03 02:53:03.432966	2016-08-03 02:53:03.432966
117	Link	4	\N	links	show	\N	36b282d043e36bc9545763488b84e0a5a889bbeae19089deb27c9b6e0d65f0f6	127.0.0.1	\N	\N	\N	2016-08-03 02:53:06.022482	2016-08-03 02:53:06.022482
119	Link	5	\N	links	show	\N	5171d60cec03e0aa08c87bdb773bc5461da374da3a61e51fc4d38e41b08cabcf	127.0.0.1	\N	\N	\N	2016-08-03 02:53:12.247022	2016-08-03 02:53:12.247022
120	Link	5	\N	links	show	\N	41a382bed88b51e67a10365c50b803bdb70ea7b34a1767851ab5881d5b8382e3	127.0.0.1	\N	\N	\N	2016-08-03 02:57:20.860126	2016-08-03 02:57:20.860126
121	Link	5	\N	links	show	\N	a7ff8b0697d00a773b869d2b8dcc3cc3e2defdfe41d0bb3f8e966ccae5ecc69a	127.0.0.1	\N	\N	\N	2016-08-03 02:57:37.034272	2016-08-03 02:57:37.034272
122	Link	5	\N	links	show	\N	187ef11f4113f351b1b57316318444727117d6415844d9e9856db376c47f6ab8	127.0.0.1	\N	\N	\N	2016-08-03 03:03:35.935884	2016-08-03 03:03:35.935884
123	Link	5	\N	links	show	\N	68817040bf04c2654ea4edaed60024ac3c71b6b07d16e73ea82760f773550305	127.0.0.1	\N	\N	\N	2016-08-03 03:06:40.118697	2016-08-03 03:06:40.118697
124	Link	5	\N	links	show	\N	34977cd473a0b799af057505b5fd79d5a7d1b899be093c0663f467ebbd33b11d	127.0.0.1	\N	\N	\N	2016-08-03 03:10:38.048869	2016-08-03 03:10:38.048869
125	Link	5	\N	links	show	\N	28c901e7558bd6a97dfaf5a8552ae23448acc30e1b829f0a841bc22cfd17e903	127.0.0.1	\N	\N	\N	2016-08-03 05:33:21.813993	2016-08-03 05:33:21.813993
126	Link	5	\N	links	show	\N	449c3949f3b2915daa0d6dafd401e7c11de0f7ae67196a233eeee66d71354064	127.0.0.1	\N	\N	\N	2016-08-03 05:44:32.238405	2016-08-03 05:44:32.238405
127	Link	5	\N	links	show	\N	c71724f383ed8e817447cbfe8eed8e9fff6b83592118b4c77d55893f610d4336	127.0.0.1	\N	\N	\N	2016-08-03 05:51:49.434906	2016-08-03 05:51:49.434906
128	Link	5	\N	links	show	\N	854558ff833ef1d9177dbc32fe56da6a0f1a8dc106322096dd3cfee600b3642b	127.0.0.1	\N	\N	\N	2016-08-03 05:54:10.031422	2016-08-03 05:54:10.031422
129	Link	5	\N	links	show	\N	19878e1b4531ac1491a2a1ebd956a3a7f069bb8f4b4a7020d6ea79db7b76dc01	127.0.0.1	\N	\N	\N	2016-08-03 05:55:22.849618	2016-08-03 05:55:22.849618
130	Link	5	\N	links	show	\N	0bb8cd2de720e4d705a7409f76bc50454e8b0319646fa68ee0da301f02cf2e75	127.0.0.1	\N	\N	\N	2016-08-03 05:59:04.821658	2016-08-03 05:59:04.821658
131	Link	5	\N	links	show	\N	e52c8c2e19cbd37fafcf5225edc905112dc8737869afa0c2ced2301028dc4cdd	127.0.0.1	\N	\N	\N	2016-08-03 06:00:13.062763	2016-08-03 06:00:13.062763
132	Link	5	\N	links	show	\N	a0d29bbc36ada9952ed158595cb357a8e74268c17235c7afa46c27c50c957bac	127.0.0.1	\N	\N	\N	2016-08-03 06:00:48.514321	2016-08-03 06:00:48.514321
133	Link	5	\N	links	show	\N	bd76c9df5040741c52662bff59e50218d95c40a8fd4d3f0028189270be514be5	127.0.0.1	\N	\N	\N	2016-08-03 06:01:04.38943	2016-08-03 06:01:04.38943
134	Link	5	\N	links	show	\N	68a65019326b4e548905b3def155c62ff6d7558908deb8119a48034835c9243f	127.0.0.1	\N	\N	\N	2016-08-03 06:01:16.51489	2016-08-03 06:01:16.51489
135	Link	5	\N	links	show	\N	2435e059c23f05fbe3584addc0b5a0ae6ae7e7931c6fa1bdc8fa590320c29926	127.0.0.1	\N	\N	\N	2016-08-03 06:02:08.814506	2016-08-03 06:02:08.814506
136	Link	5	\N	links	show	\N	6e3eb2f66eae3a664a986885752540b1a0e863a11b98226e1693abec3fb97f0f	127.0.0.1	\N	\N	\N	2016-08-03 06:02:31.28067	2016-08-03 06:02:31.28067
137	Link	5	\N	links	show	\N	1ff3fa3228cc18f8b673016a3395770ec53ea083bd1621f26c1dc620192e6485	127.0.0.1	\N	\N	\N	2016-08-03 06:02:46.07338	2016-08-03 06:02:46.07338
138	Link	4	\N	links	show	\N	70d07c3c80fe0a58d5efcce4eb20a86504fc9c23b856c4a942a2e808aa843426	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-03 06:09:55.50551	2016-08-03 06:09:55.50551
139	Link	4	\N	links	show	\N	421e7b6e415a09e5083408dbe45a7869d31c8f66fe8ed090b987e13ab709b830	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-03 06:25:57.032838	2016-08-03 06:25:57.032838
140	Link	5	\N	links	show	\N	5823155096cd00f6632acaf5cbea927b234de4804afb9a6e3e21edf3c9503a86	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-03 06:26:03.54219	2016-08-03 06:26:03.54219
141	Link	5	\N	links	show	\N	ca6fe377e7e0d7cea706241f778f04a221e8374016ccd3aa0d0cd9755a345c5e	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-03 17:45:54.601869	2016-08-03 17:45:54.601869
142	Link	5	\N	links	show	\N	796cc2f3622df502ab3c0403ff18f16d08d23cbde0a5a3997c204d83b0520788	127.0.0.1	\N	\N	\N	2016-08-03 17:45:59.594278	2016-08-03 17:45:59.594278
143	Link	4	\N	links	show	\N	43a8c29abd1e6b6e96905529e89917a5267cd79ab661aba261be205c9a28e42b	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-03 17:46:07.30284	2016-08-03 17:46:07.30284
144	Link	4	1	links	show	\N	b9b2d938e9991cdb286c6338c72a638912503642458d3fe9a37748e7aeae1240	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-04 14:01:51.208617	2016-08-04 14:01:51.208617
145	Link	4	1	links	show	\N	847cfa24323386b24c4e30e0f01ed0829b0c797caf365d9e293b6d5fe39acd25	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-04 14:01:57.255928	2016-08-04 14:01:57.255928
146	Link	5	1	links	show	\N	73a0a59fba4f4f54a2307f309bea032a11f25faba4890254b1f61f30ade0c584	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-04 14:02:01.163682	2016-08-04 14:02:01.163682
147	Link	6	1	links	show	\N	d7babeab98b03a42aeaa0d0a53c19816f032520cc6a24644ed429618ebbfabd3	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-04 14:02:05.755688	2016-08-04 14:02:05.755688
148	Link	6	1	links	show	\N	7fa187aa6932935006db1a9f49e54bca840815c39b034522f1ce97254e6f993d	127.0.0.1	\N	\N	http://localhost:3000/users/edit	2016-08-04 14:03:20.154856	2016-08-04 14:03:20.154856
149	Link	6	1	links	show	\N	1f7801a88b3f9f1dae8b84a0c93d14c175c8cbb6d3b500f996bd74acc3f1dc7d	127.0.0.1	\N	\N	http://localhost:3000/users/edit	2016-08-04 14:03:28.345239	2016-08-04 14:03:28.345239
150	Link	6	1	links	show	\N	767a5d0228d326a2a35317c4b737996bcd248d385911617de7fb78a298c57cce	127.0.0.1	\N	\N	http://localhost:3000/users/edit	2016-08-04 14:03:49.267853	2016-08-04 14:03:49.267853
151	Link	6	1	links	show	\N	845f70f14362687ab7aa6faf8f75e643d29ba4f38aa8bf75fd8a7f9e6baeacdb	127.0.0.1	\N	\N	http://localhost:3000/users/edit	2016-08-04 14:04:54.029917	2016-08-04 14:04:54.029917
152	Link	6	1	links	show	\N	c1cfa7a9e6e30e58da71098131f460dcba722d21ce4cd1991088915c52a79144	127.0.0.1	\N	\N	http://localhost:3000/users/edit	2016-08-04 14:05:16.65929	2016-08-04 14:05:16.65929
153	Link	4	1	links	show	\N	19b5437985e12a3e2052244852795b2a83728047f20457256f9d80fa28745fe6	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-04 14:05:21.492286	2016-08-04 14:05:21.492286
154	Link	5	1	links	show	\N	fa327e3e182a28f366f9ba369a380faf51627ea807c7ddd3b510c1f5b3993dbb	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-04 14:05:23.713683	2016-08-04 14:05:23.713683
155	Link	6	1	links	show	\N	56bc8046702d0a482b6815fdf409daa339cb000960c5b1f44773a9a1ed8b30e5	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-04 14:05:26.509125	2016-08-04 14:05:26.509125
156	Link	7	1	links	show	\N	0ec6e89278e059229aadb7ed2ef30f0de6a8ec9018a8d9528958ee35fe4c2758	127.0.0.1	\N	\N	http://localhost:3000/links/new	2016-08-04 14:05:35.113083	2016-08-04 14:05:35.113083
157	Link	8	1	links	show	\N	375956f7d3b8e6af498282dba335d627aa3e9bbaa0b51f803cebab64a1e4f0dd	127.0.0.1	\N	\N	http://localhost:3000/links/new	2016-08-04 15:36:16.019077	2016-08-04 15:36:16.019077
158	Link	9	1	links	show	\N	0f08d020de02b59d8a4a47867935135afd7eca2bfc18aacdd5b0def1ad6324ae	127.0.0.1	\N	\N	http://localhost:3000/links/new	2016-08-04 15:36:44.631728	2016-08-04 15:36:44.631728
159	Link	8	\N	links	show	\N	0f344e999a2343f41f6802f0621494d7edc8dffae7d17f3221e678518b9a2c51	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-04 17:14:44.085403	2016-08-04 17:14:44.085403
160	Link	8	\N	links	show	\N	90f3c6624a7e001bcd5826e1f00c93744e7164e448dfe59e691c7a4d934f4efb	127.0.0.1	\N	\N	http://localhost:3000/links/8	2016-08-04 17:14:47.679248	2016-08-04 17:14:47.679248
161	Link	8	\N	links	show	\N	1a52ef3a0b565dc5f12c8302fca33290f061e10452ccfdb75321f1e30bf3de26	127.0.0.1	\N	\N	http://localhost:3000/links/8	2016-08-04 17:14:50.622503	2016-08-04 17:14:50.622503
162	Link	8	1	links	show	\N	ce87d5ac81f63eea9316809cc05bf265ef3d9db20df856ad3932fb3df07cd532	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-04 17:15:12.202152	2016-08-04 17:15:12.202152
163	Link	8	1	links	show	\N	d143dfc3896bcd4f359d55fdb1dbc5ca3e756dfbc0db77ad1b2e7432607843a1	127.0.0.1	\N	\N	http://localhost:3000/links/8	2016-08-04 17:15:16.032852	2016-08-04 17:15:16.032852
164	Link	8	4	links	show	\N	06ee2a5f0a7fbe3a560628ca4f1e5dc6587285201d5ab2c086d03fe9b954d707	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-04 17:16:06.646787	2016-08-04 17:16:06.646787
165	Link	8	4	links	show	\N	73b8371458b7787302a6f60afd86e90be813df12cf2a9ac6c1b02d3654b911aa	127.0.0.1	\N	\N	http://localhost:3000/links/8	2016-08-04 17:16:08.124108	2016-08-04 17:16:08.124108
166	Link	9	\N	links	show	\N	fcc2edf9d0749f43a37ccf6448997e4bdea61b1a684ecc8efd2b076af5ef7d4c	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-06 17:55:40.341513	2016-08-06 17:55:40.341513
167	Link	9	\N	links	show	\N	72cbaf0114ede9b457d40e7617515d334972c60324e74e00504151a5fa2f806d	127.0.0.1	\N	\N	\N	2016-08-06 17:55:44.09113	2016-08-06 17:55:44.09113
168	Link	8	\N	links	show	\N	db7a60b43b37419464729204d075a36aa9a67b22cfa2bab07afd980cc0b90c64	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-06 18:30:45.879399	2016-08-06 18:30:45.879399
169	Link	8	\N	links	show	\N	328f86fd485d14d113f7c218cc90047a22c1404703523395bce27d07916e2a90	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-06 18:48:53.684912	2016-08-06 18:48:53.684912
170	Link	8	\N	links	show	\N	7fb19ceb0904f91a9f538e35c1960a834365f090d6e43b8977583660e4fc33ab	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-06 18:49:01.403046	2016-08-06 18:49:01.403046
171	Link	8	\N	links	show	\N	2062277d910ff48aa34a1c0b7338ecd89fa7b063476f349e53f8cd5da12535ff	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-06 18:50:18.594035	2016-08-06 18:50:18.594035
172	Link	8	\N	links	show	\N	10a9dcbdb864b1743f0e7a2a81c5bb06e69228097ed7acb936d3395e3c7bce22	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-06 18:50:45.141478	2016-08-06 18:50:45.141478
173	Link	8	1	links	show	\N	ee68742d472645854675f06468bd68a830f0b21813bbbdff5f6aef127d2e86c8	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-06 19:35:47.294698	2016-08-06 19:35:47.294698
174	Link	8	1	links	show	\N	d9193d7b8e899515ecb6ae141c51c1bb086c0be773734d3162559ccdc7d14e34	127.0.0.1	\N	\N	http://localhost:3000/links/8	2016-08-06 19:36:10.676114	2016-08-06 19:36:10.676114
175	Link	8	1	links	show	\N	8d149348e93eb4494b5a43e59fc2478b73753bd2231504e5b12922670413f0ec	127.0.0.1	\N	\N	http://localhost:3000/links/8	2016-08-06 19:38:42.355877	2016-08-06 19:38:42.355877
176	Link	8	1	links	show	\N	b525ae30de3575bab1c2d2fb9cc1b068a16c4bc4047f26eb550606830364c251	127.0.0.1	\N	\N	http://localhost:3000/links/8	2016-08-06 19:38:52.917905	2016-08-06 19:38:52.917905
177	Link	8	\N	links	show	\N	c294fd981ca139f21875bc751df9f8d99c01fc35e9b52f073d7848195727f922	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-06 19:39:36.938615	2016-08-06 19:39:36.938615
178	Link	9	\N	links	show	\N	e064871d2d44203758f43c3135c041ba42160185803e96946d65917e7313c583	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-06 19:40:18.157518	2016-08-06 19:40:18.157518
179	Link	8	\N	links	show	\N	a05a288a5d6bd93ab99ec7b4875145f1676b5eac9eee195acfd5e1b5cf102bdd	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-06 19:48:18.957568	2016-08-06 19:48:18.957568
180	Link	9	\N	links	show	\N	93e273d588c2802df6e280469bae7a30240ba82dbc3f3cadc411ef91a538a150	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-12 17:28:48.749561	2016-08-12 17:28:48.749561
181	Link	8	\N	links	show	\N	5cacea5368214e959f5c77f103853bba436518f182e92e6934e795e72a412bcf	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-12 17:29:01.45082	2016-08-12 17:29:01.45082
182	Link	8	\N	links	show	\N	407986199fb6f0b4603d2b68ca69c7ba0768a237dbf94b8bc92bd2c46eecbce3	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-18 20:37:36.50452	2016-08-18 20:37:36.50452
183	Link	9	\N	links	show	\N	9a7f48b26a49dcf1783707d15f5979560215d592c67d639a85e6373be2c1f308	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-18 20:37:44.889811	2016-08-18 20:37:44.889811
184	Link	9	\N	links	show	\N	232095c12155946cdf8904ac15848e9978dde90e6abf9ea1c32250ec1d67feac	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-31 06:59:14.360128	2016-08-31 06:59:14.360128
185	Link	8	\N	links	show	\N	7291d56d03836776c374acef7a16a98e43b147a1798e34d8dd8ad235851ca3f4	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-31 06:59:19.799808	2016-08-31 06:59:19.799808
186	Link	8	1	links	show	\N	f414a669635980d02bcb6ea537c804726280c3cb4f4c015e851c86e623c5d5a2	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-31 07:05:59.918972	2016-08-31 07:05:59.918972
187	Link	9	1	links	show	\N	8b981d1807735c7a78028224f387e284099727f749e33741db0f3de07ee26afe	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-31 07:06:13.912032	2016-08-31 07:06:13.912032
188	Link	9	1	links	show	\N	8f09db5418cbab375cadd2a74ed7ea74920240da7111bf90d2cb85fa2d095504	127.0.0.1	\N	\N	http://localhost:3000/links/9/edit	2016-08-31 07:06:21.354743	2016-08-31 07:06:21.354743
189	Link	9	1	links	show	\N	da9bf134d1aa417f26462b89567790d7b2a016fb622fd0d6de55efff47a911ff	127.0.0.1	\N	\N	http://localhost:3000/links/9/edit	2016-08-31 07:06:25.678684	2016-08-31 07:06:25.678684
190	Link	8	4	links	show	\N	68ed7c84651d23e17c875b43c304802c8243bc4087ec1303c3bf921e3c4f460d	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-31 07:13:06.568497	2016-08-31 07:13:06.568497
191	Link	8	4	links	show	\N	fad2fea43a3013a159f07f18319276854689678492040bc9cdd4bf6887ddced8	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-31 07:14:04.483393	2016-08-31 07:14:04.483393
192	Link	8	4	links	show	\N	422c018c96679262531c1d1cb09d5635f117d1226bebb267a49ff4521c2e1165	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-31 07:17:33.694584	2016-08-31 07:17:33.694584
193	Link	8	1	links	show	\N	d128c41d41076c0ebbf8081b6449f912d32ac789731d2f8ad5cab7a59911493a	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-31 07:23:25.376733	2016-08-31 07:23:25.376733
194	Link	8	1	links	show	\N	7d836cee7da3b944faa1a6696b033765a8ae9fb4054010d34e5a8ca04b78a482	127.0.0.1	\N	\N	http://localhost:3000/links	2016-08-31 07:23:33.679231	2016-08-31 07:23:33.679231
195	Link	8	4	links	show	\N	0cc75bd418e4e54a8b4022d1e311aa609f1d588b123694925a1bacf2b0ecf2ff	127.0.0.1	\N	\N	http://localhost:3000/	2016-08-31 07:24:10.727085	2016-08-31 07:24:10.727085
196	Link	8	4	links	show	\N	445cdf6563c0488b6815a2f78dd6331078415e3e80f36746a36226f1c15ba9fb	127.0.0.1	\N	\N	\N	2016-08-31 07:35:42.807648	2016-08-31 07:35:42.807648
197	Link	8	4	links	show	\N	dd7acfd7ec87d3e00c0fa2b2545324c6a3bc44d001d27db2e013570e930e3f50	127.0.0.1	\N	\N	\N	2016-08-31 07:38:43.960955	2016-08-31 07:38:43.960955
198	Link	9	\N	links	show	\N	e850299c16dc34945b800db8999176c6267be9f91cd1d8118fefd5c4544c0012	127.0.0.1	\N	\N	http://localhost:3000/	2016-09-01 01:04:04.162617	2016-09-01 01:04:04.162617
199	Link	8	\N	links	show	\N	753e2dabd7f7075e0cbf8ee6976c372dcf498be889571ece595725de33bc083d	127.0.0.1	\N	\N	http://localhost:3000/	2016-09-01 01:04:10.365452	2016-09-01 01:04:10.365452
200	Link	8	\N	links	show	\N	95bbb702e5a4fa93d937d554cc992969bdbf266b56bf3c3179132ff238e2415f	127.0.0.1	\N	\N	http://localhost:3000/	2016-09-01 01:45:00.337487	2016-09-01 01:45:00.337487
201	Link	8	\N	links	show	\N	b185516edbde2fa5703345a0e8fac296b8e715c22321c8272c58642dd5e6be81	127.0.0.1	\N	\N	http://localhost:3000/	2016-09-01 01:46:48.312048	2016-09-01 01:46:48.312048
202	Link	8	\N	links	show	\N	20ea4308bc7a62bd265819133600b86d5bab421cfb3f8277c8f1a742516831f6	127.0.0.1	\N	\N	http://localhost:3000/	2016-09-01 01:46:52.250576	2016-09-01 01:46:52.250576
203	Link	9	\N	links	show	\N	c2d50e67ad7876f7d9114451b443957572b65ea03a73029da53a116818cf20d5	127.0.0.1	\N	\N	http://localhost:3000/	2016-09-13 17:19:56.493027	2016-09-13 17:19:56.493027
204	Link	8	\N	links	show	\N	c12d59569eed5f9de63032079316fbacae77130bd19667450173b0113b047557	127.0.0.1	\N	\N	http://localhost:3000/	2016-09-13 17:21:30.334059	2016-09-13 17:21:30.334059
205	Link	8	\N	links	show	\N	4d8108cfec6a5fa149a75474697259fd8b8b7bb8e1881bddf5a616cdd1ff83b2	127.0.0.1	\N	\N	http://localhost:3000/	2016-09-14 00:45:38.774491	2016-09-14 00:45:38.774491
206	Link	8	\N	links	show	\N	5138fb79233b5b356567247a2c4195cc778555d51b94fb7d98b7da3a0a426112	127.0.0.1	\N	\N	http://localhost:3000/links/8	2016-09-14 00:45:44.189244	2016-09-14 00:45:44.189244
207	Link	8	\N	links	show	\N	ef08d89ae3e72c3e9f070c92ece5541711cf40e63c482f206d75bba1bad1c599	127.0.0.1	\N	\N	http://localhost:3000/links/8	2016-09-14 00:45:45.98332	2016-09-14 00:45:45.98332
208	Link	8	\N	links	show	\N	f5a6e1f4832a203025d8ffbdd48ced324f9f51745fccd6fa5c18d199506f2011	127.0.0.1	\N	\N	http://localhost:3000/links/8	2016-09-14 00:45:47.657219	2016-09-14 00:45:47.657219
209	Link	9	\N	links	show	\N	54848fa14952897257c3f7b867e11b5a75d1f4cff0a7cf53e390fd9391f429a2	127.0.0.1	\N	\N	http://localhost:3000/	2016-09-14 00:46:00.722996	2016-09-14 00:46:00.722996
210	Link	8	\N	links	show	\N	7cfc6d069f16087afff5f6e68335cba4c749e44d1a609fdf4201e028d4f01ef8	127.0.0.1	\N	\N	http://localhost:3000/	2016-09-14 00:46:29.178418	2016-09-14 00:46:29.178418
211	Link	8	\N	links	show	\N	e937a0f58a637ef7f6c5fde115f75773b2b53e42fcc0f7b2999d499e35a0b5ea	127.0.0.1	\N	\N	http://localhost:3000/links/8	2016-09-14 00:46:30.846078	2016-09-14 00:46:30.846078
212	Link	8	\N	links	show	\N	7118f3d2f31412e5c34cb18b9556907de69780c81f6c9155f346c32b5dfc52a3	127.0.0.1	\N	\N	http://localhost:3000/	2016-09-14 00:49:35.901196	2016-09-14 00:49:35.901196
213	Link	8	\N	links	show	\N	7ecf47069ae92fe441fbffdd4288be6065950caeeff0b6750dec8979e8b155f5	127.0.0.1	\N	\N	http://localhost:3000/	2016-09-14 01:05:11.768664	2016-09-14 01:05:11.768664
\.


--
-- Name: impressions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('impressions_id_seq', 213, true);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY links (id, title, url, created_at, updated_at, user_id) FROM stdin;
8	Telangana	jhgfjkhhkj	2016-08-04 15:36:15.945122	2016-08-04 15:36:15.945122	1
9	Andhra Pradesh	kygkhff	2016-08-04 15:36:44.537715	2016-08-31 07:06:25.588563	1
\.


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('links_id_seq', 9, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY roles (id, name, resource_type, resource_id, created_at, updated_at) FROM stdin;
1	admin	\N	\N	2016-08-04 17:12:40.667713	2016-08-04 17:12:40.667713
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('roles_id_seq', 1, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY schema_migrations (version) FROM stdin;
20160726014126
20160726042850
20160726060351
20160726062942
20160727052554
20160727175149
20160728151028
20160729060805
20160801055021
20160804170157
20160831090009
20160913221558
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, gender, admin, provider, uid) FROM stdin;
4	gskrishna44@gmail.com	$2a$11$kkzzahckrF9hdEerv52R4uzsPQbKBWYgBM5SqTJ0j1GTIKHbSu0LO	\N	\N	\N	4	2016-08-31 09:10:45.058196	2016-08-31 07:24:08.412894	127.0.0.1	127.0.0.1	2016-08-04 17:11:53.525227	2016-08-31 09:10:45.060768	\N	\N	\N	\N	\N
1	gskrishna55@gmail.com	$2a$11$kTg/JjRKYZMWBkzF1EpJqeYXO.lNpaN8p9FElcuQSvnfNWPwj7/gm	\N	\N	\N	16	2016-09-14 01:37:59.624176	2016-09-01 01:04:28.189252	127.0.0.1	127.0.0.1	2016-08-01 06:33:08.433971	2016-09-14 01:37:59.626617	krishna22	male	t	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users_roles (user_id, role_id) FROM stdin;
4	1
\.


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY votes (id, votable_type, votable_id, voter_type, voter_id, vote_flag, vote_scope, vote_weight, created_at, updated_at) FROM stdin;
1	Link	8	User	1	t	\N	1	2016-08-04 17:15:07.85856	2016-08-04 17:15:07.85856
2	Link	9	User	1	f	\N	1	2016-08-04 17:15:09.586718	2016-08-04 17:15:09.586718
4	Link	9	User	4	t	\N	1	2016-08-04 17:16:13.019366	2016-08-04 17:16:17.011799
3	Link	8	User	4	f	\N	1	2016-08-04 17:16:08.053528	2016-08-04 17:16:18.688737
\.


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('votes_id_seq', 4, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: impressions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY impressions
    ADD CONSTRAINT impressions_pkey PRIMARY KEY (id);


--
-- Name: links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: controlleraction_ip_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX controlleraction_ip_index ON impressions USING btree (controller_name, action_name, ip_address);


--
-- Name: controlleraction_request_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX controlleraction_request_index ON impressions USING btree (controller_name, action_name, request_hash);


--
-- Name: controlleraction_session_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX controlleraction_session_index ON impressions USING btree (controller_name, action_name, session_hash);


--
-- Name: impressionable_type_message_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX impressionable_type_message_index ON impressions USING btree (impressionable_type, message, impressionable_id);


--
-- Name: index_comments_on_link_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comments_on_link_id ON comments USING btree (link_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_impressions_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_impressions_on_user_id ON impressions USING btree (user_id);


--
-- Name: index_links_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_links_on_user_id ON links USING btree (user_id);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_on_name ON roles USING btree (name);


--
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON roles USING btree (name, resource_type, resource_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_roles_on_user_id_and_role_id ON users_roles USING btree (user_id, role_id);


--
-- Name: index_votes_on_votable_id_and_votable_type_and_vote_scope; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_votes_on_votable_id_and_votable_type_and_vote_scope ON votes USING btree (votable_id, votable_type, vote_scope);


--
-- Name: index_votes_on_voter_id_and_voter_type_and_vote_scope; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_votes_on_voter_id_and_voter_type_and_vote_scope ON votes USING btree (voter_id, voter_type, vote_scope);


--
-- Name: poly_ip_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX poly_ip_index ON impressions USING btree (impressionable_type, impressionable_id, ip_address);


--
-- Name: poly_request_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX poly_request_index ON impressions USING btree (impressionable_type, impressionable_id, request_hash);


--
-- Name: poly_session_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX poly_session_index ON impressions USING btree (impressionable_type, impressionable_id, session_hash);


--
-- Name: fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

