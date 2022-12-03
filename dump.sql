--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
-- Dumped by pg_dump version 14.0

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth; Type: TABLE; Schema: public; Owner: brainlytic
--

CREATE TABLE public.auth (
    user_id integer NOT NULL,
    auth_type integer NOT NULL,
    login character varying(100) NOT NULL,
    hashed_pass character varying(2048)
);


ALTER TABLE public.auth OWNER TO brainlytic;

--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: brainlytic
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO brainlytic;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brainlytic
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth.user_id;


--
-- Name: author; Type: TABLE; Schema: public; Owner: brainlytic
--

CREATE TABLE public.author (
    author_id character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    image character varying(1000) NOT NULL,
    contact character varying(1000) NOT NULL
);


ALTER TABLE public.author OWNER TO brainlytic;

--
-- Name: fbcontest; Type: TABLE; Schema: public; Owner: brainlytic
--

CREATE TABLE public.fbcontest (
    sl integer NOT NULL,
    m_id character varying(100) NOT NULL,
    type integer NOT NULL,
    data json NOT NULL,
    bg character varying(10) NOT NULL
);


ALTER TABLE public.fbcontest OWNER TO brainlytic;

--
-- Name: fbcontest_sl_seq; Type: SEQUENCE; Schema: public; Owner: brainlytic
--

CREATE SEQUENCE public.fbcontest_sl_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fbcontest_sl_seq OWNER TO brainlytic;

--
-- Name: fbcontest_sl_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brainlytic
--

ALTER SEQUENCE public.fbcontest_sl_seq OWNED BY public.fbcontest.sl;


--
-- Name: feedback; Type: TABLE; Schema: public; Owner: brainlytic
--

CREATE TABLE public.feedback (
    feedback_id integer NOT NULL,
    problem_id integer NOT NULL,
    user_id integer NOT NULL,
    feedback integer NOT NULL,
    comment character varying(1000)
);


ALTER TABLE public.feedback OWNER TO brainlytic;

--
-- Name: feedback_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: brainlytic
--

CREATE SEQUENCE public.feedback_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedback_feedback_id_seq OWNER TO brainlytic;

--
-- Name: feedback_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brainlytic
--

ALTER SEQUENCE public.feedback_feedback_id_seq OWNED BY public.feedback.feedback_id;


--
-- Name: level; Type: TABLE; Schema: public; Owner: brainlytic
--

CREATE TABLE public.level (
    level_id integer NOT NULL,
    title character varying(100) NOT NULL,
    description character varying(1000)
);


ALTER TABLE public.level OWNER TO brainlytic;

--
-- Name: level_level_id_seq; Type: SEQUENCE; Schema: public; Owner: brainlytic
--

CREATE SEQUENCE public.level_level_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.level_level_id_seq OWNER TO brainlytic;

--
-- Name: level_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brainlytic
--

ALTER SEQUENCE public.level_level_id_seq OWNED BY public.level.level_id;


--
-- Name: meet; Type: TABLE; Schema: public; Owner: brainlytic
--

CREATE TABLE public.meet (
    id integer NOT NULL,
    user_id text,
    user_name text,
    key text,
    state text,
    lat double precision,
    long double precision
);


ALTER TABLE public.meet OWNER TO brainlytic;

--
-- Name: meet_id_seq; Type: SEQUENCE; Schema: public; Owner: brainlytic
--

CREATE SEQUENCE public.meet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meet_id_seq OWNER TO brainlytic;

--
-- Name: meet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brainlytic
--

ALTER SEQUENCE public.meet_id_seq OWNED BY public.meet.id;


--
-- Name: problem; Type: TABLE; Schema: public; Owner: brainlytic
--

CREATE TABLE public.problem (
    problem_id integer NOT NULL,
    series_id integer NOT NULL,
    title character varying(100) NOT NULL,
    logo character varying(1000) NOT NULL,
    islive boolean DEFAULT false,
    difficulty character varying(6) NOT NULL,
    grade integer DEFAULT 0,
    timestp bigint NOT NULL,
    serial integer NOT NULL,
    data json NOT NULL,
    doc_id character varying(100) NOT NULL,
    author_id character varying(100) NOT NULL,
    ispremium boolean DEFAULT true
);


ALTER TABLE public.problem OWNER TO brainlytic;

--
-- Name: problem_problem_id_seq; Type: SEQUENCE; Schema: public; Owner: brainlytic
--

CREATE SEQUENCE public.problem_problem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.problem_problem_id_seq OWNER TO brainlytic;

--
-- Name: problem_problem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brainlytic
--

ALTER SEQUENCE public.problem_problem_id_seq OWNED BY public.problem.problem_id;


--
-- Name: profile; Type: TABLE; Schema: public; Owner: brainlytic
--

CREATE TABLE public.profile (
    user_id integer NOT NULL,
    name character varying(40) NOT NULL,
    image character varying(1000),
    star integer,
    trophy integer,
    plan integer,
    birth_date character varying(8),
    country character varying(100)
);


ALTER TABLE public.profile OWNER TO brainlytic;

--
-- Name: series; Type: TABLE; Schema: public; Owner: brainlytic
--

CREATE TABLE public.series (
    series_id integer NOT NULL,
    topic_id integer NOT NULL,
    islive boolean DEFAULT false,
    name character varying(100) NOT NULL,
    description character varying(1000) NOT NULL,
    logo character varying(1000) NOT NULL,
    serial integer NOT NULL,
    nproblem integer NOT NULL
);


ALTER TABLE public.series OWNER TO brainlytic;

--
-- Name: series_series_id_seq; Type: SEQUENCE; Schema: public; Owner: brainlytic
--

CREATE SEQUENCE public.series_series_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.series_series_id_seq OWNER TO brainlytic;

--
-- Name: series_series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brainlytic
--

ALTER SEQUENCE public.series_series_id_seq OWNED BY public.series.series_id;


--
-- Name: submission; Type: TABLE; Schema: public; Owner: brainlytic
--

CREATE TABLE public.submission (
    submission_id integer NOT NULL,
    problem_id integer NOT NULL,
    user_id integer NOT NULL,
    sub_status integer NOT NULL,
    timestp bigint NOT NULL
);


ALTER TABLE public.submission OWNER TO brainlytic;

--
-- Name: submission_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: brainlytic
--

CREATE SEQUENCE public.submission_submission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submission_submission_id_seq OWNER TO brainlytic;

--
-- Name: submission_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brainlytic
--

ALTER SEQUENCE public.submission_submission_id_seq OWNED BY public.submission.submission_id;


--
-- Name: suggestion_suggestion_id_seq; Type: SEQUENCE; Schema: public; Owner: brainlytic
--

CREATE SEQUENCE public.suggestion_suggestion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.suggestion_suggestion_id_seq OWNER TO brainlytic;

--
-- Name: suggestion; Type: TABLE; Schema: public; Owner: brainlytic
--

CREATE TABLE public.suggestion (
    suggestion_id integer DEFAULT nextval('public.suggestion_suggestion_id_seq'::regclass) NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    problem_id integer NOT NULL,
    timestp bigint NOT NULL
);


ALTER TABLE public.suggestion OWNER TO brainlytic;

--
-- Name: topic; Type: TABLE; Schema: public; Owner: brainlytic
--

CREATE TABLE public.topic (
    topic_id integer NOT NULL,
    name character varying(100) NOT NULL,
    subject character varying(100) NOT NULL,
    islive boolean DEFAULT false,
    logo character varying(1000) NOT NULL,
    nseries integer NOT NULL,
    nproblem integer NOT NULL,
    description character varying(1000) NOT NULL,
    serial integer NOT NULL,
    lang character varying(20) DEFAULT 'en'::character varying NOT NULL,
    level_id integer,
    color character varying(10) DEFAULT '#FFFFFF'::character varying
);


ALTER TABLE public.topic OWNER TO brainlytic;

--
-- Name: topic_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: brainlytic
--

CREATE SEQUENCE public.topic_topic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topic_topic_id_seq OWNER TO brainlytic;

--
-- Name: topic_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brainlytic
--

ALTER SEQUENCE public.topic_topic_id_seq OWNED BY public.topic.topic_id;


--
-- Name: tutorial; Type: TABLE; Schema: public; Owner: brainlytic
--

CREATE TABLE public.tutorial (
    tutorial_id integer NOT NULL,
    series_id integer,
    title character varying(100),
    logo character varying(1000),
    islive boolean,
    difficulty character varying(6),
    grade integer,
    timestp bigint,
    serial integer,
    data json,
    doc_id character varying(100),
    author_id character varying(100),
    ispremium boolean
);


ALTER TABLE public.tutorial OWNER TO brainlytic;

--
-- Name: tutorial_tutorial_id_seq; Type: SEQUENCE; Schema: public; Owner: brainlytic
--

CREATE SEQUENCE public.tutorial_tutorial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tutorial_tutorial_id_seq OWNER TO brainlytic;

--
-- Name: tutorial_tutorial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brainlytic
--

ALTER SEQUENCE public.tutorial_tutorial_id_seq OWNED BY public.tutorial.tutorial_id;


--
-- Name: auth user_id; Type: DEFAULT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.auth ALTER COLUMN user_id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: fbcontest sl; Type: DEFAULT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.fbcontest ALTER COLUMN sl SET DEFAULT nextval('public.fbcontest_sl_seq'::regclass);


--
-- Name: feedback feedback_id; Type: DEFAULT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.feedback ALTER COLUMN feedback_id SET DEFAULT nextval('public.feedback_feedback_id_seq'::regclass);


--
-- Name: level level_id; Type: DEFAULT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.level ALTER COLUMN level_id SET DEFAULT nextval('public.level_level_id_seq'::regclass);


--
-- Name: meet id; Type: DEFAULT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.meet ALTER COLUMN id SET DEFAULT nextval('public.meet_id_seq'::regclass);


--
-- Name: problem problem_id; Type: DEFAULT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.problem ALTER COLUMN problem_id SET DEFAULT nextval('public.problem_problem_id_seq'::regclass);


--
-- Name: series series_id; Type: DEFAULT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.series ALTER COLUMN series_id SET DEFAULT nextval('public.series_series_id_seq'::regclass);


--
-- Name: submission submission_id; Type: DEFAULT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.submission ALTER COLUMN submission_id SET DEFAULT nextval('public.submission_submission_id_seq'::regclass);


--
-- Name: topic topic_id; Type: DEFAULT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.topic ALTER COLUMN topic_id SET DEFAULT nextval('public.topic_topic_id_seq'::regclass);


--
-- Name: tutorial tutorial_id; Type: DEFAULT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.tutorial ALTER COLUMN tutorial_id SET DEFAULT nextval('public.tutorial_tutorial_id_seq'::regclass);


--
-- Data for Name: auth; Type: TABLE DATA; Schema: public; Owner: brainlytic
--

COPY public.auth (user_id, auth_type, login, hashed_pass) FROM stdin;
33	1	1805001@ugrad.cse.buet.ac.bd	\N
34	0	01729743807	$2a$10$vNaHycWR19yg4bMKa/1O3OzBe.kyuH8dmHf/leZLgk21I7XRFKHea
35	1	buet.edu.project.1@gmail.com	\N
36	1	1805024@ugrad.cse.buet.ac.bd	\N
37	0	01521583559	$2a$10$VUiIoqxAeBS4PT6KYDdZ.OYpr0bvs.MOtSZpfGH4zsKj0JUFUqJ/G
38	1	tamimehsan99@gmail.com	\N
39	1	sabit.jehadul.karim@gmail.com	\N
40	1	shownahmed3@gmail.com	\N
41	1	rabibjahin2000@gmail.com	\N
42	0	01715053973	$2a$10$/R/l692eAsgNjomFCvQ4hOP9NXpRxYwwMuOumDKnRU6MOFZ.fRJTi
44	1	mehrab.haque.0001@gmail.com	\N
45	0	01754403237	$2a$10$FJ7UaUgDWvA6UD81sXL/8OC75tLPqOq2Y0zX9kgDsQthssJ0Kz1CK
49	1	1805022@ugrad.cse.buet.ac.bd	\N
50	1	jubairantu3413@gmail.com	\N
51	0	01777777777	$2a$10$z5eL3oZmF9JlTHC2hnihT.3LoFdgDS2T2VGUlyvC4ohv/Ogzrvi/6
52	0	01911054847	$2a$10$Gx82g8mdfh7c2KGnT3frjO1YE4GjVpOIt8cmEKNNy/SzPGyUecpry
53	0	01986283829	$2a$10$kIf9Aui3YwnrDJCiDu7ndOlc0Ix.A8JzKP/bEGgbiAph03sMxLipG
54	1	masumbuetcse18@gmail.com	\N
55	0	01628199418	$2a$10$DGZt4NTJd3Jmp3N3NLkSf.Ddib4medAT6Ytt.0POrrsMXaewkRvLq
56	1	anindya.iqbal@gmail.com	\N
57	1	rownokratul11@gmail.com	\N
58	0	11111111111	$2a$10$CjSfKYd2yOUZIfN/FEi5kOgNccBLvny1XrfGADGbYOuMiesVlkcBK
59	0	123456789	$2a$10$UMS/ShQjO5Y5xSp9cfu2aeg68XBRBZL4r1uU2kmg/BYE5LtF4N4Yq
60	0	01521572685	$2a$10$wUsFKMJq4Gl4ukwWJPhUz.5w7lDVxJEMUbMys3f0QhYfIAsOk4m9y
61	1	anupbhowmik.1998@gmail.com	\N
62	1	bhuiyan.mohammad.iklash@gmail.com	\N
63	0	01975455274	$2a$10$X8GmbE1eiNU9zSn4RJsGPO2/E6DY1veSLtt1PM2EPdjzOKbqyo8DW
64	1	azwadtanjeem@gmail.com	\N
65	0	01793510515	$2a$10$G9zrnzHZKToM1PDDRvPVaOMlsInY/rnMjSBakyql7kA4oEjBZtgoW
66	1	h.m.107332@gmail.com	\N
67	0	01313924853	$2a$10$lwofOjK0DrlbeDPXHVLQB.cyJGkaNcSGStPhWrw6ed5iyDa9a3vSe
68	1	1805047@ugrad.cse.buet.ac.bd	\N
69	1	princezarzees5075@gmail.com	\N
70	0	01917673387	$2a$10$.imMyadBM1xHCl4iRET6nO8BmMjMz4mhv0gNYcNMUS.uUyNc9PGGu
71	0	dummy	$2a$10$HurZpWQN7LMtKqMkT42hW.JqfFDPU2FprLJL95qZB7MryR9AkHFy2
72	0	01790103312	$2a$10$PGva3L8xiYMfzPHXHxuKbezntok1Hay6p11uLIDvoqzNRX0ZS3UYe
73	1	mswarna28@gmail.com	\N
74	1	maxmahmood@gmail.com	\N
75	1	1905070@ugrad.cse.buet.ac.bd	\N
76	1	hoque.anindya2@gmail.com	\N
77	0	01974166204	$2a$10$wa4QoD/3djCEB/N0HFwL8OYPCBSQfjV2KpKqiwkjCFp88ucfkcATq
78	0	01716824905	$2a$10$..11r/mW8onbRTOimTpXQubv2mjyQoWHAfhr5Y934NDB25MwUD9QO
79	0	01551061395	$2a$10$Z9DD172HoXfbYaj6uUV0tu3eTqGIkSotsgD8HZjM4vcZbeW7iJ.PC
80	1	aditto991@gmail.com	\N
81	1	lifeofsma@gmail.com	\N
82	1	farhantanvir9019@gmail.com	\N
83	0	01759830318	$2a$10$Y2r4k8FRgHAz5uQ4GPC66.zu5Xb6tACKamiFIP5bewdgWt5jqzn3e
84	0	01516156486	$2a$10$SpAcnAPkQCu1FgQnxjlTAObFeguwqJ.tq5y8OxLwoX1ugD1AyVfNG
85	0	61425156006	$2a$10$DckZaYFZG2ILEyqa5DF2MeAl/nnS9mugCHuO2NwE9gWgQC0Ji6Tke
86	1	a.ahmed80@share.epsb.ca	\N
87	1	shamim@hasnath.net	\N
88	0	01704568264	$2a$10$vwirObXDAm7pCVZPl8wMTOjcrP.X05duu3GS8gcfyzIcnkChK6STe
89	0	01684080299	$2a$10$i2xsR0V8YunjBe2vNDVW8O2c5YL.Bt0cvJ5ek24bDwHTGzScicPJi
90	0	11001001000	$2a$10$XasOixVCBlGE3DtFqkCvA.NWhp5nx2zl4pgoIfQNwoB3j9H094aom
91	0	12345678911	$2a$10$EepvVYyae8ySB1DKCMQHluh0gTIPSam4oVNEbdGJ7VkZD.msi3fae
92	0	01823812180	$2a$10$5XU3QKBNm2spe9/S3ipxPeUrABYpSEtXVOGA/Y3fwQXm7VDwo7VTm
93	1	aniruddhags3927@gmail.com	\N
94	0	14089925314	$2a$10$bIJh4I3MvJWQ5d.kPokh8eXiTFbVJGxpu0ONcD.XFvBbyErZ4tQeu
95	0	01857416888	$2a$10$ScldSNFx0EdWTyixHQAO7.bAMRHyH5tUhT0ds/IIDddQi08Fd5Hk2
96	0	01745529524	$2a$10$saY07uv16kiab8WP1mezX.uyAgVl/0uHs6IUYZSv0Hi1Ss5xNL.we
97	1	swakkhar@cse.uiu.ac.bd	\N
98	0	01689997967	$2a$10$G3HzJle9KaEze13YCgMqzeHW6xo/U7VYLys3LK6CIj0Lme1isH1/q
99	0	01918227270	$2a$10$CguQcwyPNM9FlAmaiFg3G.B799TNn318HHWkn5CaIIeN.tcXfsqty
100	1	aniksarkerbuet1997@gmail.com	\N
101	0	61431732078	$2a$10$IPeHFwGI4R5gEG60Z1zqruL60oRC/t29TxYjpXyqX/leVUE43x5.m
102	0	01857416849	$2a$10$O4DbmFoNJiFKcvlSrOSRoOOy9NtdlVRZd0UYvtj1pYyfm9DLpOvyy
103	1	kzr.buet08@gmail.com	\N
104	0	61431673863	$2a$10$V6wW5j9zhPrubvXVwPeX9OTinfPiOJP8Kyjd6GIrudAjnKyKSxIVe
105	0	+6588944220	$2a$10$8P0HCiSf66H/LaqQzIIZPOv2KysL/OzxaPKcCsTfNYw5.Y7uPUemW
108	1	mahfuzul.haque@gmail.com	\N
109	1	hasanmasum1234@gmail.com	\N
110	0	01234567891	$2a$10$Pzq5ofAvWw7GStMFv6lxw.HGpsi.Jqatn5xHzKDqAy7SKI9GdZi8e
111	0	01720018325	$2a$10$qAPWIzgZ2rIPFgvxUTz4F.z93jj.i95muVFCdYHSuXtbHfEuWEhTi
112	1	mdmehrabhaque@gmail.com	\N
113	0	01936550205	$2a$10$2F/D2iYuXCyJBOYSOn0vmOFtG82QkW0FoFwoYaKrFavupq9ppRVAS
114	0	01924856062	$2a$10$q6SdF69aRuX6a2MV4hQ/bOjbGhj0zdsWzpxL0P6JwNOxhe.DEzkKG
115	1	tareq06@gmail.com	\N
116	0	01234567890	$2a$10$7FfnhiccObANhMr9NmO9heNB8EqxmhAJ8qVgHozw.HfpYiFZHFID2
117	1	a.h.baky24@gmail.com	\N
118	1	hasantazwoar@gmail.com	\N
119	1	matimariahossain@gmail.com	\N
120	0	01819273902	$2a$10$nt/xQlCTDkz/9LixUq70VOaYKY4b3d0ykk.IZ9wRYeXT6c9LfT9Oy
121	1	abtahee16@gmail.com	\N
122	1	kamruli@gmail.com	\N
123	1	mithu.shahadat@gmail.com	\N
124	0	60189717552	$2a$10$qMCVAlQafM114.wsOeyChukSBd.SAB78vv1kZuKeP5GEnVd3YnoYq
125	0	01750246621	$2a$10$.jA2xvbq8czkVhaWwI70YuqaTprOL3LGL1YEJkjl/3Cp2yhM1yCDu
126	0	01630246627	$2a$10$705lzqlJVXQBe9UK.lmYSOXNHTFap71S2SBBmP7QBL8ZFxaj/alj2
127	0	01760313401	$2a$10$4fSULyXIP.joQMB3qbO09eA3a.MGnl2kDU3jQVKJ2nF7.tZ/vKqo6
128	1	ikram@mainframelabs.ltd	\N
129	1	raashidmahdi19@gmail.com	\N
130	1	1205001.nit@ugrad.cse.buet.ac.bd	\N
131	1	saadbinquddus@gmail.com	\N
132	1	mjksabit@gmail.com	\N
133	1	connectwithmasum@gmail.com	\N
134	1	skazizul55@gmail.com	\N
135	1	red.abiir@gmail.com	\N
136	1	mashroor184@gmail.com	\N
137	1	sadi@topofstacksoftware.com	\N
138	1	sharafat.8271@gmail.com	\N
139	0	01302690957	$2a$10$CTa1lTGxZ.rCuUkmoxoSxOSC6XWAYmi/VNpORnFzlnoI/rq.XLMz6
140	0	01706314114	$2a$10$ToBaAI9TH7faVeMs3FhGh.7Hg7y5bvrG0aWoncuKEMCi5FQg4k1Qe
141	1	ajmat.iqbal@gmail.com	\N
142	1	1705051@ugrad.cse.buet.ac.bd	\N
143	0	01863756881	$2a$10$xDRRNPqDvtrkR1OBS105KuqsIhPXsHoXmbRKX6ltQIXUMgKxbHF2S
144	0	01715458146	$2a$10$LmWMpCxdshsTpW2sXxJGWuLxYxBfWdGf9vWLk.xuGx0yD36or2X/a
145	0	01790569138	$2a$10$SeN0qZIJ9qWLSeU.kJOJX.r.8dNwCDzdxr/b5D11Ito7PMpdrNfqC
146	0	01987828801	$2a$10$L/b/dNwdg23fj08boeYcF.DoBJx81O7HjnTbj6LC7z7a2qqi8IIe.
147	0	01518409273	$2a$10$gIpU2fG.s/D897snY8P0UOh/Ie6Abdf5yTPi7HQda/Jvc.ILi7lwm
148	1	sameer.iqbal2171@gmail.com	\N
149	0	01533597617	$2a$10$RVv/qSE6ADZufBizgxNGnemsyHW3VmFEbL489BxKyynjM/H//W.Oa
150	0	01715765207	$2a$10$6zDHYqdXRQgW/93KzlcElubfKwM0bm8dVn2asGEHGSVL9051LBzpa
151	1	buetcse18a@gmail.com	\N
152	1	tanzil.ksl@gmail.com	\N
153	0	01708522770	$2a$10$tbTqEdq69H2du6SAs5Nd1uqNWGz5S3eWB485dSif3A6hDk7iwS7zi
154	0	01625152578	$2a$10$eo/NEAI0UPiH6dpwrvon4ujAgQ3Qk7LmufYt3osK0DWmddR4SHO3u
155	1	manzur.murshed71@gmail.com	\N
156	1	masud12345@gmail.com	\N
157	1	ieranikg@gmail.com	\N
158	0	01857416811	$2a$10$EjcAueLOud1u73jkPq1ca.3QAkwuhORokCzFNZt1Yt9NfO1JJBZzu
159	1	juubaerjaami@gmail.com	\N
160	1	toufik@ra.cse.buet.ac.bd	\N
161	1	rajib106@gmail.com	\N
162	0	01311505928	$2a$10$sQ62DuBLnJPyo7TyGTCVMew96Fek0Y3WHmVqyRYjkMSDW7HH1PUTe
163	0	01521101750	$2a$10$0IzIBvmIjJb6MsoHWJqjTuyYELeqJRQYR8E31heULdBMZA9KLBXuC
164	1	farzinawsaf@gmail.com	\N
165	0	01511990330	$2a$10$liU400tKBfLTT6NrTW8Nhu6rjZpLvaVyw/K3XdEjBmuHnYvjXe4kq
166	1	1805012@ugrad.cse.buet.ac.bd	\N
167	1	tanvir123liz@gmail.com	\N
168	0	85478547854	$2a$10$qiWqMum0X4mT7eGkscMXA.Tuj/nmYAYqYzj2mdJwgBclFZS7Ed/PK
169	1	nawalsazzad@gmail.com	\N
170	1	adishaishmampritha@gmail.com	\N
171	1	kalam.asaduzzaman@gmail.com	\N
172	1	mirmahathir1@gmail.com	\N
173	0	01720018324	$2a$10$OjKz8HUrgKrM.wri/727s.FvPmN8psD3SX2.cTa2mKug5fZWBQnOG
174	1	jamijubaer@gmail.com	\N
175	1	sprontu@gmail.com	\N
176	1	0smallfoot0@gmail.com	\N
177	1	mrkhamim369@gmail.com	\N
178	1	azmanamin14@gmail.com	\N
179	1	hasnathshamim@gmail.com	\N
180	1	mmprapty@gmail.com	\N
181	1	sanjanasiraj412@gmail.com	\N
182	1	wirebangladesh@gmail.com	\N
183	1	V5S42DS7W5PJEYOHYLRZKZCUWQ-00@cloudtestlabaccounts.com	\N
184	1	candynawal01@gmail.com	\N
185	1	V5S42DS7W5PJEYOHYLRZKZCUWQ-01@cloudtestlabaccounts.com	\N
186	1	V5S42DS7W5PJEYOHYLRZKZCUWQ-02@cloudtestlabaccounts.com	\N
187	1	V5S42DS7W5PJEYOHYLRZKZCUWQ-03@cloudtestlabaccounts.com	\N
\.


--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: brainlytic
--

COPY public.author (author_id, name, image, contact) FROM stdin;
0RMFi9mrPNe7mol2JwcZAf40F3n2	Md. Mehrab Haque	https://lh3.googleusercontent.com/a-/AOh14GiZMV1p5IyWrzswyypvave-gxjDyczNDHSTjTq8HA=s96-c	mehrab.haque.0001@gmail.com
8Xq06Cpjf6bingRbcoqRnNyTPdg1	Anup Bhowmik	https://lh3.googleusercontent.com/a-/AOh14Gjr523lB_RN2WkIOHWARbREFhG4cV2rEY0nkCH5Gg=s96-c	anupbhowmik.1998@gmail.com
kMaoaNQ6EgY1FfrXSnC9oq8Ulkn1	Tamim Ehsan	https://lh3.googleusercontent.com/a-/AOh14GjH-HzfS5beIuhT03W9BbQlOXGoWPLK290TDDLo2A=s96-c	tamimehsan99@gmail.com
CjGWpu5DBzdl49OJqwMplAiuhn22	K M Asifur Rahman	https://lh5.googleusercontent.com/-2bWUym-AUY4/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclOjreMcv-gvuVdh2sQj0I98_AeMA/s96-c/photo.jpg	asifurbuet98@gmail.com
mBZTh8cox5R35pOJLtOPhCwFjVD3	Anindya Iqbal	https://lh5.googleusercontent.com/-EgkKMWFT_58/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucl3Ri0fEhl0EoTYmA47SEW_IrLJDA/s96-c/photo.jpg	anindya.iqbal@gmail.com
gzbf4HV4wLZNtbE3vAaLE6VFvOZ2	Hasan Masum	https://lh3.googleusercontent.com/a-/AOh14Gjp7yKADoa70L0141Vj66Bqp9EBURBI6gRbe28q=s96-c	masumbuetcse18@gmail.com
6BNnWY2X9iW0sRmUhel1eGOGvOK2	Abdullah Al Fahad	https://lh3.googleusercontent.com/a-/AOh14Gg87UUKNssLf9iqlpOTyhd9VB7-PIQLFDmW0Gbhpg=s96-c	alfahadarc@gmail.com
bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	Tanjeem Zaman	https://lh3.googleusercontent.com/a-/AOh14Giwa29SrbuXZ80Ii04_9nbP6yu118XuHsHSNTS4=s96-c	azwadtanjeem@gmail.com
chn4mCsrRmb1P6QXHCbrEeEpDAl2	rownok ratul	https://lh3.googleusercontent.com/a-/AOh14GhEntif4oaLtZi1_Ek15edSTOtuItvp6krYkBJy=s96-c	rownokratul11@gmail.com
vh5a8EkDHUTky1xcLNZDAwEZ1ig1	Md. Jehadul Karim	https://lh3.googleusercontent.com/a-/AOh14GhjRq35rXu6OozGGkeA5x3HWf3lMPIxW7faK69vpg=s96-c	sabit.jehadul.karim@gmail.com
qvQFz1bkoHOQbf29uwCBojZjDxF3	Saira Yeasmin	https://lh5.googleusercontent.com/-P4exOauko_U/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuckgSCaLCQqYV7IuBLFaGFODKeet_Q/s96-c/photo.jpg	sairayeasminsa@gmail.com
VoTf81DreZTqGwSXurQ7g8DBnV43	Prince Zarzees	https://lh4.googleusercontent.com/-x0YZ4Z64SnI/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnuocins69nIexBqNGrF6F1_6N2dg/s96-c/photo.jpg	princezarzees5075@gmail.com
bWqV1RhStaNRdpJF2nhPlcqUwIt2	buet edu_1	https://lh3.googleusercontent.com/a-/AOh14GjT3Q1-J71qiREfqlydLtaV-WQPIX8MAc5HAPT9=s96-c	buet.edu.project.1@gmail.com
96L7jidBxJW8vTTy6WrArU2qpd63	Aditto Arif Rahman	https://lh4.googleusercontent.com/-FTlx6dPJr_Y/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucn2mQEOtQaQ-YCNMhEWbDkaxVlX9Q/s96-c/photo.jpg	aditto991@gmail.com
wKwZEsIHsZd9cPrSLSptXB6W8w22	A.K.M.ASHFAQUR RAHMAN	https://lh6.googleusercontent.com/-Ti81LuWjj_Q/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucmbJDOKuBXUxOdys7cpgjdSPXZQ6g/s96-c/photo.jpg	1805047@ugrad.cse.buet.ac.bd
RhBBTlcbaHPXWWiBxLoXjYwKt0m2	Anindya Hoque	https://lh3.googleusercontent.com/-L9jo4CyOKwA/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclqqcN0n1KxbqKrtQyXmxrhD-4vHg/s96-c/photo.jpg	hoque.anindya2@gmail.com
A3GXHDPr7BUTuaZ2yMhDlZUfeV12	Ashfaq Rahman	https://lh3.googleusercontent.com/-lH2sYZ2kvJs/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucn4EINE_Fq4jxVpX5UAtNKFApLvAA/s96-c/photo.jpg	tuluashfaq803344@gmail.com
I97my9P8SJhfh4WrtV4CTc8xNo92	Rabib Jahin	https://lh5.googleusercontent.com/-QPZ_Fyf89Yk/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucl1PplZknsM_4_7PxxOLEpX7D9Ksw/s96-c/photo.jpg	rabibjahin2000@gmail.com
Duq6BDGCyAa5rLnIXML1yOjdOQp1	Farhan Tanvir	https://lh5.googleusercontent.com/-QQrYiea3zZo/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucmmwgrS5xFu0I1gN4IFh9xEMRwKCg/s96-c/photo.jpg	farhantanvir9019@gmail.com
GOKkDYX10eZJtpQ9mYgAlBTfJOM2	MD. ROWNOK ZAHAN RATUL	https://lh3.googleusercontent.com/a-/AOh14GiBZU_y4--7ae3V_wBSSwxK4SnWQ9hEB52T2uuk=s96-c	1805019@ugrad.cse.buet.ac.bd
sDCgfAyDqYhCWzPhpyCXj8aU0b63	Saad Bin Quddus	https://lh4.googleusercontent.com/-6XAoeIQcVUA/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuck0oPBD5c7P7iMuSuAuyJ75EVvDzA/s96-c/photo.jpg	saadbinquddus@gmail.com
st1KFPBwmUNxPq6gtlcevCF7RqA3	Mashroor Hasan Bhuiyan	https://lh3.googleusercontent.com/a-/AOh14Ghvp9BAgAErsqJsb7ZKHcmyJneYMzF36Ed9P4SKVA=s96-c	mashroor184@gmail.com
Hn4jI4W0tFW6zFuXl94nd7IbieI3	Maneesha Rani Saha	https://lh3.googleusercontent.com/a-/AOh14GgDoic9lBgO_lC2GO_7q7OjP1nRzK-50u5Hbrt2mg=s96-c	mswarna28@gmail.com
3bib1lRMVAQMs5SAof3FlnYixfR2	Ahmed Mahir Sultan Rumi	https://lh3.googleusercontent.com/a/AATXAJxz6oh7P8Te2NPg4X-LhblLl4BV3WglqmcrvKGb=s96-c	amsrumi@gmail.com
\.


--
-- Data for Name: fbcontest; Type: TABLE DATA; Schema: public; Owner: brainlytic
--

COPY public.fbcontest (sl, m_id, type, data, bg) FROM stdin;
28	3757180067630026	1	{"name":"Tamim Ehsan","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3757180067630026&width=1024&ext=1601304266&hash=AeS4jHFPdmCoTA5b","timestamp":1598712340813,"age":"21","location":"Sabjibug","contact":"Habi@jabi.com","sex":"male","affected":"10"}	ab+
30	3793953883951269	1	{"name":"Md. Jehadul Sabit","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3793953883951269&width=1024&ext=1601305305&hash=AeTCd-rocyZvfxA4","timestamp":1598713378428,"age":"20","location":"Jatrabari, Dhaka","contact":"01986283829","sex":"male","affected":"40"}	a+
31	3205547892847245	0	{"name":"Hasan Masum","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3205547892847245&width=1024&ext=1601305267&hash=AeQm_K5EuuVFlQrM","timestamp":1598713576829,"age":"21","location":"ha ha ha amk khuje pabe nah🤣","contact":"01572342835\\nhaha@kop.com","sex":"male","recovered":"30"}	b+
34	3379244868781988	1	{"name":"Md. Mehrab Haque","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3379244868781988&width=1024&ext=1601305758&hash=AeSvVASJsCch2yff","timestamp":1598713818588,"age":"20","location":"Azimpur, Dhaka","contact":"01729743807","sex":"male","affected":"22"}	b+
36	3439860689368942	0	{"name":"Rabib Ibn Momin","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3439860689368942&width=1024&ext=1601306578&hash=AeQGx22v5xaNKR56","timestamp":1598714661022,"age":"20","location":"Chittagong","contact":"Abc@gmail.com","sex":"male","recovered":"15"}	b+
43	4334868939918318	1	{"name":"Shehzad Alam","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=4334868939918318&width=1024&ext=1601350065&hash=AeQQWH6UK1a-bCmg","timestamp":1598758127736,"age":"22","location":"Azimpur, Dhaka,  Bangladesh","contact":"+8801313924853","sex":"male","affected":"40"}	a+
44	3537081096315455	0	{"name":"Nolan Hardy","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3537081096315455&width=1024&ext=1601350253&hash=AeR-4Oi_cVIvyvPz","timestamp":1598758323036,"age":"26","location":"Mirpur, Dhaka, Bangladesh","contact":"+8801987170061","sex":"male","recovered":"20"}	a+
45	3071055856336211	0	{"name":"Kazi Ababil Talha","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3071055856336211&width=1024&ext=1601366766&hash=AeSjP0-SFbEUTW6k","timestamp":1598774881803,"age":"21","location":"Uttara, Dhaka","contact":"01956499982\\n1805077@ugrad.cse.buet.ac.bd","sex":"male","recovered":"30"}	b+
46	3354755007925698	1	{"name":"Dipro Tushar","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3354755007925698&width=1024&ext=1601367267&hash=AeTGZMdq06--NTw_","timestamp":1598775362912,"age":"19","location":"Lalmatia,Dhaka","contact":"01706314114\\nfarhantanvir459@gmail.com","sex":"male","affected":"8"}	b+
47	3375279169194956	0	{"name":"Asif Haider","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3375279169194956&width=1024&ext=1601370249&hash=AeQZc_1XPZjfAgrX","timestamp":1598778324871,"age":"20","location":"Khilgaon","contact":"01761995926\\nelhanasif8@gmail.com","sex":"male","recovered":"20"}	o+
48	3163091107144626	0	{"name":"Shamit Fatin","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3163091107144626&width=1024&ext=1601370252&hash=AeRYvGyleCwj_xfn","timestamp":1598778402129,"age":"21","location":"Mohammodpur","contact":"+968-1842227053","sex":"male","recovered":"365"}	o+
49	3603106716368087	0	{"name":"Muhammad Kader","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3603106716368087&width=1024&ext=1601370185&hash=AeQOIp9ZSTYq3pjq","timestamp":1598778461099,"age":"21","location":"Mirpur 2, Dhaka","contact":"1805067@ugrad.cse.buet.ac.bd","sex":"male","recovered":"32"}	b-
59	3981549275194946	1	{"name":"Rasul Hamim","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3981549275194946&width=1024&ext=1601459367&hash=AeRLH2RidhXHGdDG","timestamp":1598867464529,"age":"20","location":"Banasree, Dhaka","contact":"mrkhamim369@gmail.com","sex":"male","affected":"7"}	b-
61	3246877292064284	1	{"name":"Nazmul Ananto","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3246877292064284&width=1024&ext=1601460085&hash=AeR544MvpF9w1ggA","timestamp":1598868154071,"age":"21","location":"Jurain","contact":"nazmulislamananto@gmail.com","sex":"male","affected":"0"}	a-
62	4276826042389090	0	{"name":"Sheikh Limon","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=4276826042389090&width=1024&ext=1601460285&hash=AeTldKS3SZI752Pw","timestamp":1598868371921,"age":"20","location":"midfort dhaka","contact":"nadim.limon21@gmail.com","sex":"male","recovered":"30"}	ab+
63	3327159920681936	1	{"name":"Md. Alam","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3327159920681936&width=1024&ext=1601462903&hash=AeQPuAKYSFY63HrK","timestamp":1598871343222,"age":"20","location":"Dhaka, Bangladesh","contact":"email@gmail.com","sex":"male","affected":"7"}	o+
64	3547884821942110	1	{"name":"Jamil Ahmed","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3547884821942110&width=1024&ext=1601466331&hash=AeQIKWiZJvn4-ELF","timestamp":1598874440180,"age":"-1","location":"Buet","contact":"Get Started","sex":"male","affected":"-23"}	b-
65	3547884821942110	1	{"name":"Jamil Ahmed","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3547884821942110&width=1024&ext=1601466976&hash=AeTjYQiBCl-1lVLQ","timestamp":1598875218902,"age":"-10","location":"Nothing","contact":"No thanks","sex":"male","affected":"-100"}	b-
66	3368293563263510	1	{"name":"Shehabul Sawraz","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3368293563263510&width=1024&ext=1601467318&hash=AeSWLUh9btGqlukX","timestamp":1598875398722,"age":"20","location":"Dhaka,Bangladesh","contact":"a@gmail.com","sex":"male","affected":"10"}	o-
67	3335987979790682	0	{"name":"Sohaib Bin Musa","image":"https://platform-lookaside.fbsbx.com/platform/profilepic/?psid=3335987979790682&width=1024&ext=1601470199&hash=AeTZAN4NuzHGo2WX","timestamp":1598878274772,"age":"21","location":"Chittagong, Bangladesh","contact":"01930040408","sex":"male","recovered":"15"}	a+
\.


--
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: brainlytic
--

COPY public.feedback (feedback_id, problem_id, user_id, feedback, comment) FROM stdin;
26	34	66	3	kopkop
27	63	38	1	Awesome problem! Must try
28	33	38	3	\N
29	45	85	3	\N
30	13	85	3	\N
31	34	85	3	\N
32	43	85	3	\N
33	33	85	3	\N
35	44	85	3	\N
36	12	85	3	\N
37	16	85	3	\N
38	19	85	3	\N
39	57	85	3	\N
41	35	85	2	\N
42	41	86	3	\N
43	40	86	3	\N
44	43	87	3	\N
46	34	93	1	\N
47	43	93	1	\N
48	35	94	2	I like the interactive colors!
49	41	94	1	The problem should explain what "winning" means
50	40	94	2	I like the interaction
51	29	94	3	Great problem!
52	30	94	3	\N
53	22	94	1	\N
54	23	94	1	The answer should be 6, but is recorded as being 12
55	31	96	1	\N
56	32	96	2	\N
57	42	96	3	\N
58	33	96	2	\N
59	34	96	1	\N
60	45	96	2	\N
61	12	96	2	\N
63	34	100	2	\N
64	34	101	2	\N
65	34	84	2	\N
66	43	84	3	\N
67	33	84	1	\N
68	64	84	1	\N
69	64	102	2	\N
70	65	102	2	\N
71	34	103	2	\N
72	49	69	1	\N
73	65	110	2	\N
74	63	111	2	\N
75	34	115	3	\N
76	35	44	3	\N
78	35	34	3	\N
80	12	110	2	\N
82	12	116	2	\N
83	19	116	3	\N
84	12	118	3	\N
85	34	56	2	\N
86	35	56	2	\N
88	35	122	3	\N
89	76	122	3	\N
90	77	122	2	\N
91	76	126	2	\N
92	113	56	2	\N
93	114	56	3	\N
94	108	56	2	\N
95	31	56	2	\N
96	30	56	2	\N
97	22	56	2	\N
98	23	56	2	\N
99	24	56	2	\N
100	46	56	3	\N
101	47	56	1	\N
102	51	56	2	\N
106	115	56	3	\N
107	17	56	2	\N
108	33	56	1	\N
109	78	56	1	\N
110	79	56	2	\N
111	81	56	1	\N
112	112	56	2	\N
113	120	56	3	\N
114	130	56	3	\N
115	57	56	3	\N
116	38	56	2	\N
117	94	56	1	\N
118	48	56	1	\N
119	35	136	3	\N
120	40	136	3	\N
121	41	136	2	\N
122	119	136	3	\N
123	82	136	3	\N
124	83	136	2	\N
125	84	136	3	\N
127	43	136	2	\N
128	45	136	2	\N
129	34	136	3	\N
130	121	136	2	\N
131	63	136	3	\N
132	127	136	3	wrong ans given
133	34	142	3	\N
135	35	142	3	\N
136	151	146	3	\N
137	29	148	2	\N
143	253	54	4	shera 
144	30	54	3	GOOD
145	23	54	4	GREAT
146	149	33	2	\N
147	34	61	3	noice problem
148	34	61	4	GREAT
149	22	61	3	GOOD
150	224	61	1	This problem is goog but the language is hard to understand
151	119	164	0	This is Tanjeem. I'm on my brother's account. This problem has 2 answers. aside from the set answer, Cup+ Chocolate can replace Vanilla + Cone
152	45	169	3	GOOD
153	148	169	3	GOOD
154	148	169	3	Interactivity issue
155	224	170	2	It's showing the correct answer(The one also in the explanation) as a wrong answer
156	78	170	4	GREAT
157	79	170	4	GREAT
158	80	170	4	GREAT
159	180	170	4	GREAT
160	178	170	4	GREAT
161	179	170	4	GREAT
162	23	170	4	GREAT
163	46	170	4	GREAT
164	51	170	4	GREAT
165	42	170	4	GREAT
166	222	170	3	GOOD
167	26	170	4	GREAT
168	29	170	4	GREAT
169	30	170	4	GREAT
170	253	170	4	GREAT
171	113	170	4	GREAT
172	114	170	4	GREAT
173	115	170	4	GREAT
174	126	170	3	"Mangoes" written instead of "Oranges"
175	198	170	4	GREAT
176	199	170	4	GREAT
177	228	170	4	GREAT
178	229	170	4	GREAT
179	230	170	4	GREAT
180	263	170	4	GREAT
181	264	170	4	GREAT
182	265	170	4	GREAT
183	266	170	3	GOOD
184	267	170	4	GREAT
185	21	170	3	GOOD
186	124	170	4	GREAT
187	175	170	4	GREAT
188	49	170	3	GOOD
189	122	170	3	GOOD
190	160	170	3	GOOD
191	236	170	3	GOOD
192	237	170	3	GOOD
193	238	170	4	GREAT
194	188	170	4	GREAT
195	191	170	4	GREAT
196	131	170	3	GOOD
197	133	170	4	GREAT
198	132	170	2	Shows the correct answer as a wrong one
199	134	170	2	Shows correct as wrong
200	140	170	2	Problem with notations. There is no "e"
201	142	170	1	Options are problematic. Two are invisible.
202	221	170	2	Finch did not use green vehicle but it is written he took green boat
203	108	170	4	GREAT
204	223	170	4	GREAT
205	48	170	4	GREAT
206	94	170	4	GREAT
207	55	170	4	GREAT
208	60	170	3	GOOD
209	40	170	4	GREAT
210	119	170	4	GREAT
211	103	170	2	In question written 20 but answer is deduced taking 10
212	146	170	4	GREAT
213	196	170	4	GREAT
214	197	170	4	GREAT
215	202	170	4	GREAT
216	201	170	4	GREAT
217	89	170	4	GREAT
218	87	170	4	GREAT
219	90	170	4	GREAT
220	91	170	4	GREAT
221	154	170	4	GREAT
222	155	170	2	Explanation not clear
223	84	170	4	GREAT
224	242	170	3	GOOD
225	78	159	2	It's saying wrong... even though the answers are correct according to the explanation
226	165	138	4	GREAT
227	180	54	4	GREAT
228	57	132	3	GOOD
229	12	54	4	GREAT
\.


--
-- Data for Name: level; Type: TABLE DATA; Schema: public; Owner: brainlytic
--

COPY public.level (level_id, title, description) FROM stdin;
1	Test Level	Test Desc
5	Test Level 2	Test Description
6	Level-1	Easy and basic problems are included in level-1
7	Level-2	Medium level problems are included in level-2
8	Level-3	Hard and conceptual problems are included in this level-3
\.


--
-- Data for Name: meet; Type: TABLE DATA; Schema: public; Owner: brainlytic
--

COPY public.meet (id, user_id, user_name, key, state, lat, long) FROM stdin;
3	2963149847122757	Tamim Ehsan	VgIiOGviuy	host	23.74162	90.443144
61	3451842858197011	Ataf Ahamed	blAFHVvDuw	host	28.623522	112.666376
62	2963149847122757	Tamim Ehsan	JKxiMPFHyP	host	23.74162	90.442972
65	2963149847122757	Tamim Ehsan	FdvFrDD7zN	host	23.74162	90.442972
66	2963149847122757	Tamim Ehsan	XLxdKJ50tZ	host	23.74162	90.442972
21	4937538389604967	Hasan Masum	e21OWonYsO	joint	24.020282	88.992949
\.


--
-- Data for Name: problem; Type: TABLE DATA; Schema: public; Owner: brainlytic
--

COPY public.problem (problem_id, series_id, title, logo, islive, difficulty, grade, timestp, serial, data, doc_id, author_id, ispremium) FROM stdin;
152	61	Magic Squares Explored-4	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1623519046198.png	t	medium	3	1623519314159	5	{"version":1,"description":"We've covered a lot regarding Magic Squares. Let's finish off with a \\"fun\\" problem.","category":" Magic Squares","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"What will be the sum of each row/column/Diagonal of a 5x5 Magic Square filled with numbers between 10 to 34?","explanation":"A __\\"normal\\"__ 5x5 Magic square (filled with numbers from 1 to 25) will have row/column/diagonal sums of = 5x(5x5+1)/2 = 65 (using the formula derived in the previous problem)\\n\\nSince our given range is basically full of numbers that are 9 greater than the normal Magic square numbers, each row will have a sum greater by 9+9+9+9+9 = 45 , than the normal Magic Square. \\n\\nTherefore our answer is 45 + 65 = __110__ ","data":{"type":"text","data":{"answer":["110"]}},"width":60}	OWO0iwFiKh0KlJWKs5Rc	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
14	71	Area of Nile!	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Zarzees/Rectangle4.png	t	medium	2	1623651822095	2	{"version":1,"description":"Area of a triangle =___ ½×base×height___","category":"Area","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"__What is the area of the blue region inside the 10×7 rectangle?__   \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623351830930.png)\\n","explanation":"Total area of the four triangles ½×3×2+ ½×(10-3)×(7-3)+½×3×8+½×(10-8)×(7-2)=34  \\nSo blue area is 7×10-34=36\\n","data":{"type":"text","data":{"answer":["36"]}},"width":80}	E2d0Zy9pJesikMQHcsde	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
109	77	Build The Expression	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1617030128111.png	f	hard	3	1617033517801	3	{"version":1,"description":"In basic arithmatics, the precedence of differenct symbols follow the below order :\\n\\n1. Division : /\\n2. Multiplication : x\\n3. Addition : +\\n4. Substraction : -  \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1617030443669.png) \\n  \\nSo, **2+21/7 = 2 + 3 = 5** , and **15-10/2x3+5 = 15-5x3+5 = 15-15+5 = 0+5 = 5**","category":" Basic Operations","lang":"en","interactiveType":"rearrange","ansType":"interactive","type":"rearrange","statement":"Rearrange the following expression (the operands and the operators) such that the result of the expression is equal to **10**. \\n\\n> One more thing, in the final expression, the operands will be arranged in a decreasing order from left to right.","explanation":"=**18-16/8x5+2**  \\n=**18-2x5+2**  \\n=**18-10+2**  \\n=**18+2-10**  \\n=**20-10**  \\n=**10**","data":{"type":"interactive","fields":["18","8","5","16","2","+","-","x","/"],"data":{"answer":["18","-","16","/","8","x","5","+","2"]}},"width":60}	pD5dkUPoYDuWoyeg1V24	0RMFi9mrPNe7mol2JwcZAf40F3n2	\N
256	74	How Many? - II	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623289331896.png	t	medium	3	1623854289145	4	{"version":1,"description":"Think of a scenario. You need to make vanish __exactly __2 squares. But you also need to do that by removing matchsticks__ as few as possible__.\\n\\nPlease note the following things\\n\\n* There are 4 squares __already__. That means you need to reduce them to 2\\n* You can __neither__ rotate the matchsticks __nor__ change their size\\n* Each of the remaining matchsticks __must participate__ in forming the remaining squares i.e. __no matchsticks can be left alone__","category":" MatchSticks","lang":"en","interactiveType":"matchstick","ansType":"text","type":"matchstick","statement":"What is the __minimum__ number of matchsticks you __must__ remove without which your goal cannot be accomplished?","explanation":"__See the following two pictures__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1623657864277.png)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623355794792.png)","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":21,"y1":22,"x2":21,"y2":24,"isLocked":false},{"type":"matchstick","x1":23,"y1":22,"x2":21,"y2":22,"isLocked":false},{"type":"matchstick","x1":23,"y1":24,"x2":23,"y2":22,"isLocked":false},{"type":"matchstick","x1":21,"y1":24,"x2":23,"y2":24,"isLocked":false},{"type":"matchstick","x1":25,"y1":22,"x2":23,"y2":22,"isLocked":false},{"type":"matchstick","x1":25,"y1":24,"x2":25,"y2":22,"isLocked":false},{"type":"matchstick","x1":23,"y1":24,"x2":25,"y2":24,"isLocked":false},{"type":"matchstick","x1":23,"y1":26,"x2":23,"y2":24,"isLocked":false},{"type":"matchstick","x1":25,"y1":26,"x2":23,"y2":26,"isLocked":false},{"type":"matchstick","x1":25,"y1":24,"x2":25,"y2":26,"isLocked":false},{"type":"matchstick","x1":27,"y1":24,"x2":25,"y2":24,"isLocked":false},{"type":"matchstick","x1":27,"y1":26,"x2":27,"y2":24,"isLocked":false},{"type":"matchstick","x1":25,"y1":26,"x2":27,"y2":26,"isLocked":false}],"type":"text","data":{"answer":["5"]}},"width":60}	t0tlcXX9qOJ2NTl7ZdwI	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
132	82	Adjacency - II	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618021253868.png	t	easy	1	1627556098328	3	{"version":1,"description":"__⦟AOB & ⦟DOE are complementary angles__\\n(Two angles are said to be complementary if adding them gives __90 degrees__)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623345304851.png)","hint":["**Find out ⦟DOE first**"],"category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"__Determine y__","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623345304851.png)\\n\\n__Here,__\\n\\n__ ⦟AOB + ⦟DOE = 90 (complementary angles)__\\n\\n=> 66 + ⦟DOE = 90\\n\\n=> ⦟DOE = 90 - 66\\n\\nSo, ⦟DOE = 24\\n\\n__Now, along line AE,__\\n\\n66 + y + 78 + 24 = 180\\n\\n=> 168 + y = 180\\n\\n=> y = 180 - 168\\n\\n__So, y = 12__","data":{"type":"mcq","data":{"options":["18","12","34","24"],"answer":"12"}},"width":60}	MS3sQvWf7MJn16KzXsY6	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
15	71	Finding Area of a Distorted Rectangle	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Zarzees/Rectangle1.png	t	medium	2	1623352366673	1	{"version":1,"description":"_Area of a rectangle= base_ ×  _height_\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623346658998.png)","category":"geometry","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"__What is the area of the given figure?__\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623352328683.png)","explanation":"Upper empty space is a 2 × 2 square so  \\n Area of the figure=area of the 6×4 rectangle-area of the 2×2 square  \\n__6×4-2×2=20__","data":{"type":"text","data":{"answer":["20"]}},"width":60}	mv37WNUCfpwhjfplPByG	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
120	63	Matchsticks and numbers	https://buet-edu-1.s3.ap-south-1.amazonaws.com/mehrab/matchstick.png	t	medium	2	1617522328940	2	{"version":1,"category":" Matchstickss","lang":"en","interactiveType":"matchstick","ansType":"text","type":"matchstick","statement":"What is the largest 3 digit number you can make by moving **2 matchsticks**? Rotation is allowed.","explanation":"Move matches numbered 1 and 2 to get 999.  \\n**Before:**  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617522244460.PNG)  \\n\\n**After:**  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617522296683.PNG)\\n\\n","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":22,"y1":24,"x2":25,"y2":24,"isLocked":false},{"type":"matchstick","x1":29,"y1":24,"x2":26,"y2":24,"isLocked":false},{"type":"matchstick","x1":22,"y1":18,"x2":22,"y2":21,"isLocked":false},{"type":"matchstick","x1":22,"y1":18,"x2":25,"y2":18,"isLocked":false},{"type":"matchstick","x1":25,"y1":21,"x2":25,"y2":24,"isLocked":false},{"type":"matchstick","x1":25,"y1":21,"x2":22,"y2":21,"isLocked":false},{"type":"matchstick","x1":26,"y1":18,"x2":26,"y2":21,"isLocked":false},{"type":"matchstick","x1":26,"y1":21,"x2":26,"y2":24,"isLocked":false},{"type":"matchstick","x1":29,"y1":21,"x2":29,"y2":24,"isLocked":false},{"type":"matchstick","x1":26,"y1":18,"x2":29,"y2":18,"isLocked":false},{"type":"matchstick","x1":29,"y1":18,"x2":29,"y2":21,"isLocked":false},{"type":"matchstick","x1":30,"y1":18,"x2":30,"y2":21,"isLocked":false},{"type":"matchstick","x1":33,"y1":18,"x2":33,"y2":21,"isLocked":false},{"type":"matchstick","x1":33,"y1":18,"x2":30,"y2":18,"isLocked":false},{"type":"matchstick","x1":33,"y1":21,"x2":33,"y2":24,"isLocked":false},{"type":"matchstick","x1":30,"y1":21,"x2":33,"y2":21,"isLocked":false},{"type":"matchstick","x1":33,"y1":24,"x2":30,"y2":24,"isLocked":false},{"type":"matchstick","x1":30,"y1":24,"x2":30,"y2":21,"isLocked":false}],"type":"text","data":{"answer":["999"]}}}	YBOicewYOB8VE5mtM49C	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
131	82	Adjacency - I	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618021253868.png	t	easy	1	1627555710622	1	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623345096273.png)","category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"__Determine y__\\n","explanation":"__Along line AD,__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623345096273.png)\\n\\ny + 50 + y = 180\\n\\n=> 2y = 180 - 50\\n\\n=> 2y = 130\\n\\n__So, y = 65__","data":{"type":"mcq","data":{"options":["60","65","55","50"],"answer":"65"}},"width":60}	OS2L4f47Jxpx17hXoKMW	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
94	55	Guess The Next Triangle! 	https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1613413137921.png	t	medium	2	1623604496749	3	{"version":1,"description":"The following picture illustrates a sequence of triangles.\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1613413137921.png)","category":"series ","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"If the sequence is followed further, which one will be repeated as the __19th triangle__? ","explanation":"At each step, the triangle is rotated 90 degrees clockwise. So, after every 4th rotation, the first triangle is received again. Thus, the 17th one will be the same as the first triangle (just like the 5th one). Following this sequence, the 19th one is the yellow one.  \\n\\nIt can be formulated: \\n\\n*(4n+1)* is __red__\\n \\n*(4n+2)* is __blue__\\n \\n*(4n+3)* is __yellow__\\n\\n*(4n+4)* is __green__  \\n\\nWhere __n__ is a non-negative integer.","data":{"type":"mcq","data":{"options":["Red Triangle","Blue Triangle","Yellow Triangle","Green Triangle"],"answer":"Yellow Triangle"}},"width":100}	ZctpSMMTFasaWd9rVp6X	chn4mCsrRmb1P6QXHCbrEeEpDAl2	\N
144	94	Triangle - I	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618021253868.png	t	easy	1	1627559103143	3	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623346485435.png)\\n\\nThis is a __triangle__, a figure with 3 sides.\\nEvery triangle follows a very important property: __the summation of its three angles is 180 degrees!!!__    \\n","category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"(Note, the lower left angle is a right angle, since we use a square to mark it)\\n\\n__What is correct about x & y?__  \\n__They are :__","explanation":"__As sum of the three angles are 180,__\\n\\nx + 90 + y = 180\\n\\n=> x + y = 90\\n\\n__So, they are complementary!!!__\\n\\n__Note:__ *The solution resembles __Adjacency - III__, right?*","data":{"type":"mcq","data":{"options":["Adjacent (lie on the same straight line)","Supplementary","Vertically Opposite","Complementary"],"answer":"Complementary"}},"width":60}	hU8OTJuCb5duzLx9RSu5	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
20	69	Complex??	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Zarzees/Logo1.png	t	medium	3	1627568796418	5	{"version":1,"category":"geometry","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623351765914.png)  \\n__ABCD is a rectangle. The area of  ABCT is 45 and T is the midpoint of AD. Find the area of triangle  ACD.__","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623351765914.png)  \\n__Area of ATC + Area of DTC = Area of ACD = Area of ABC__  \\nHere, __Area of ATC = Area of DTC__,  \\n*as their base is AT=DT and height DC*  \\n\\nSo, __Area of ABCT = 3 × Area of ATC__  \\nArea of ATC = 45/3 = 15  \\nTherefore, __Area of ACD = 15+15=30__","data":{"type":"text","data":{"answer":["30"]}},"width":80}	h8Z9UpjnbXyNXGmioyy9	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
153	39	Quick Maths	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	easy	1	1619200701141	2	{"version":1,"category":"Basic Operations","lang":"en","interactiveType":"dragAndDrop-3-Grid","ansType":"interactive","type":"dragAndDrop-3-Grid","statement":"You'll have to fill in the blanks with the correct numbers, so that all the operations are correct. The operations are done **downwards** and **to the right**.","explanation":"Starting from _ x 8 = 56, we get 7\\nAnd then 21 - _ = 7 gives us 13","data":{"type":"interactive","unselected":["14","3","7","13","9"],"active":[true,false,false,false,false,false,false,false,false,false,true,false,true,false,false,false,false,false,false,false,false,false,false,false,false],"nCols":5,"nRows":5,"containers":[{"label":"21","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":"_","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":" ","items":[]},{"label":"=","items":[]},{"label":" ","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":"x","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":"8","items":[]},{"label":"=","items":[]},{"label":"56","items":[]}],"data":{"temp":["14","3","7","13","9"],"answer":[{"label":"21","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":"_","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":" ","items":["14"]},{"label":"=","items":[]},{"label":" ","items":["7"]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":"x","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":".","items":[]},{"label":"8","items":[]},{"label":"=","items":[]},{"label":"56","items":[]}]}}}	njxTtkyu1ZwSp7wtyNHl	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
21	33	Princess’ Portrait	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Anup/Wise+Pilgrim+Series/Ques_5/cover.png	t	easy	1	1627559537782	5	{"version":1,"category":"geometry","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"With the small key, a pilgrim opened the door in front of him and reaches the hallway.\\nSuddenly, he notices a broken picture of the princess. \\n\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Anup/Wise+Pilgrim+Series/Ques_5/cover.png)\\n\\nCan you count how many quadrilaterals (four-sided figures) are there in the shattered glass?\\n","explanation":"![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Anup/Wise+Pilgrim+Series/Ques_5/solve.png)","data":{"type":"text","data":{"answer":["5"]}},"width":80}	uF5CWgvBbmTuFsId6G8W	8Xq06Cpjf6bingRbcoqRnNyTPdg1	\N
223	55	I love MathnLogic! 	https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1615487289564.png	t	medium	2	1621501461985	5	{"version":1,"description":"Welcome back talented Chandler. As usual, you're pretty interested in finding patterns in everything. Moreover, you love to solve problems from  \\"**MathnLogic**\\". On a spring morning, you just solved a difficult problem and you are really happy about it. So you started writing in joy: \\"**ILoveMathnLogicILoveMathnLogic....**\\". The following illustration might help: \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1615487289564.png)\\nAgain, as you are always curious, you posed yourself a problem: ","hint":["Should I Keep it writing till 1007th letter?! Ofcourse not, does 15 divides 1007?! "],"category":"series","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"What is the **1007th** letter in the above phrase **\\"ILoveMathnLogicILoveMathnLogic....\\"** if you keep continuing the pattern? ","explanation":"As you can see, you're just creating a series of length 15 (the length of the phrase: \\"ILoveMathnLogic\\"). So on the 16th one the letter 'I', and on the 17th one the letter 'L' repeats itself and goes on like this. \\nSo after every multiple of 15, i.e. 15n (n is non-negative positive integer), the phrase repeats again.   \\n\\n15*67 = 1005 is the closest multiple of 1007. So the remainder 2 means, 1006th one is 'I' and 1007th one is 'L' of Love.   \\n\\nIt can be formulated: X (mod 15) is the index of the letter in the phrase.  \\n\\n**mod** is a function that means: *X (**mod** 15)*  gives the remainder of X after dividing it with 15.   \\nThus, ***1007 mod 15 = 2***; \\"ILove....\\" index 2 is 'L'. ","data":{"type":"mcq","data":{"options":["I","n","L","M"],"answer":"L"}}}	5UbKAnKf4ZiFJsfSD9kn	chn4mCsrRmb1P6QXHCbrEeEpDAl2	t
54	56	Unknown Digits	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	easy	2	1623653034705	1	{"version":1,"description":"This might seem a bit random at first, but there's actually a logical approach to solving these kinds of problems. That being said, tinkering around with digits can go a long way. Take your best shot.","category":" Backtracking","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"FInd out the values of X and Y  \\n(They are both between 0 and 9)  \\n  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610269408045.png)","explanation":"for Y x Y =9, there can be only 2 values of Y that make this possible: 3 or 7.\\n\\nFirst we consider 7, Thus, X7 x X7 = 5X9. Now, we try X = 1, and see that it doesn't work. Next for X =2, we see that the result is 729, which is greater than 5X9. So, we don't need to check any further, and Y is not 7.\\n\\nThen we set Y=3, and by similar approach, we find X=2.","data":{"type":"mcq","data":{"options":["X = 1, Y = 7","X = 1, Y = 3","X = 2, Y = 7","X = 2, Y = 3"],"answer":"X = 2, Y = 3"}},"width":30}	NOBJANu02ImAhC9teNoX	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
246	93	Color The Buildings 2	https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622911703071.png	t	medium	3	1623330254085	2	{"version":1,"category":" 3D Shapes","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","type":"exclusion_grid","statement":"Parash wants to color the following buildongs. Which ones need the same amount of color among them?\\n## \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622402610604.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622402627657.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622402653746.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622402675157.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622402705251.png\\n)","explanation":"Surface area in unit squares:\\n\\n__A:__ 42\\n\\n__B:__ 38\\n\\n__C:__ 40\\n\\n__D:__ 40\\n\\n__E:__ 40","data":{"type":"interactive","rowHeading":["A","B","C","D","E"],"columnHeading":[""],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"]],"initialState":[[true],[true],[true],[true],[true]],"data":{"answer":[[false],[false],[true],[true],[true]]}}}	0JBlsWTydb3dEGkzwNAi	sDCgfAyDqYhCWzPhpyCXj8aU0b63	\N
154	58	Composite Figure!!!	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Zarzees/Rectangle2.jpg	t	medium	2	1623352103881	6	{"version":1,"category":"Area","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623352031202.png)  \\n__Here length of the red rectangle is 5 and width of the yellow rectangle is 2. If the area of the latter is 6, what is the area of the blue triangle?__ ","explanation":"Length of the yellow rectangle is 6÷2=3  \\nBase of the blue triangle is 5-3=2  \\nHeight of the triangle is 2  \\nSo area of the triangle is 1/2×base×height=(1/2)×2×2=2","data":{"type":"text","data":{"answer":["2"]}},"width":60}	GSM9M8OaSmJr38q6qmMb	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
101	65	Angle Analysis - I	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1614487534755.png	t	medium	2	1627565978664	1	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623341481632.png)","hint":["**Can you determine ⦟ACB first?**\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1624536299658.png)"],"category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"__Determine ⦟DCB__","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623341481632.png)\\n__In △ABC,__\\n\\n⦟ABC + ⦟BAC + ⦟ACB = 180\\n\\n=> 45 + 40 + ⦟ACB = 180\\n\\nSo, ⦟ACB = 95\\n\\n\\n----------\\n\\n\\n__Now,__\\n\\n⦟ACD + ⦟DCB = ACB\\n\\n=> ⦟ACD + ⦟DCB = 95\\n\\n=> 35 + ⦟DCB = 95\\n\\n__So, ⦟DCB = 60__","data":{"type":"text","data":{"answer":["60"]}},"width":90}	UDnbNFeuUX3XQ1tBVoxG	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
28	38	Parity I	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	easy	1	1614956145138	1	{"version":1,"description":"Positive numbers that are divisible by 2 are known as even numbers, whereas the numbers that are not divisible by 2 are odd numbers. For example:  \\n2,10, 44, 2344 are **all even numbers**  \\n1, 3, 9, 11, 233 are **all odd numbers**  \\nDetermining whether a number is odd or even is the same as determining its **\\"Parity\\"**","category":"Parity","lang":"en","interactiveType":"dragAndDrop-1","ansType":"interactive","tags":["Basic","Arithmetic","Parity"],"type":"dragAndDrop-1","statement":"Drag the numbers into the correct box depending on their parity.","explanation":"As you can see, it is enough to consider the last digit of any number, to know its parity.  \\nIf the last digit is even (i.e 2,4,6,8,0) then the number is even.  \\nIf the last digit is odd (1,3,5,7,9), the number is odd,","data":{"type":"interactive","unselected":["8","66","79","26","34","1112","2221","767"],"containers":[{"label":"ODD","items":[]},{"label":"EVEN","items":[]}],"data":{"temp":["8","66","79","26","34","1112","2221","767"],"answer":[{"label":"ODD","items":["79","2221","767"]},{"label":"EVEN","items":["8","66","34","26","1112"]}]}}}	FFrJOiRRdxEQ3PrL3Qe0	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
34	78	Make 3 squares !!!	https://buet-edu-1.s3.ap-south-1.amazonaws.com/mehrab/matchstick.png	t	medium	1	1614959555085	1	{"version":1,"description":"In the problem figures, you can see that, there is **only 1 square** made up by **10 matchsticks**.","category":"Matchsticks","lang":"en","interactiveType":"matchstick","ansType":"interactive","type":"matchstick","statement":"Move **exactly 1 matchstick** to  create 3 squares.","explanation":"Move the **top-left** matchstick to the shown place and there you will get total 3 squares.\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/mehrab/matchstick_explanation.PNG)","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":20,"y1":17,"x2":23,"y2":17,"isLocked":false},{"type":"matchstick","x1":23,"y1":17,"x2":23,"y2":20,"isLocked":false},{"type":"matchstick","x1":26,"y1":17,"x2":23,"y2":17,"isLocked":false},{"type":"matchstick","x1":23,"y1":20,"x2":23,"y2":23,"isLocked":false},{"type":"matchstick","x1":26,"y1":20,"x2":26,"y2":17,"isLocked":false},{"type":"matchstick","x1":26,"y1":23,"x2":26,"y2":20,"isLocked":false},{"type":"matchstick","x1":23,"y1":23,"x2":26,"y2":23,"isLocked":false},{"type":"matchstick","x1":20,"y1":23,"x2":23,"y2":23,"isLocked":false},{"type":"matchstick","x1":20,"y1":20,"x2":20,"y2":23,"isLocked":false},{"type":"matchstick","x1":20,"y1":20,"x2":23,"y2":20,"isLocked":false}],"type":"interactive","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":23,"y1":20,"x2":26,"y2":20,"isLocked":false},{"type":"matchstick","x1":23,"y1":17,"x2":23,"y2":20,"isLocked":false},{"type":"matchstick","x1":26,"y1":17,"x2":23,"y2":17,"isLocked":false},{"type":"matchstick","x1":23,"y1":20,"x2":23,"y2":23,"isLocked":false},{"type":"matchstick","x1":26,"y1":20,"x2":26,"y2":17,"isLocked":false},{"type":"matchstick","x1":26,"y1":23,"x2":26,"y2":20,"isLocked":false},{"type":"matchstick","x1":23,"y1":23,"x2":26,"y2":23,"isLocked":false},{"type":"matchstick","x1":20,"y1":23,"x2":23,"y2":23,"isLocked":false},{"type":"matchstick","x1":20,"y1":20,"x2":20,"y2":23,"isLocked":false},{"type":"matchstick","x1":20,"y1":20,"x2":23,"y2":20,"isLocked":false}]}}}	oDfGOAg7fRzwhp76JNLj	0RMFi9mrPNe7mol2JwcZAf40F3n2	t
121	78	Correct The Equation	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910467394.png	t	easy	1	1617536242591	2	{"version":1,"category":"matchstick","lang":"en","interactiveType":"matchstick","ansType":"interactive","type":"matchstick","statement":"You can see a mathematical equation that is not correct.You have to correct the equation just by moving exactly one matchstick.\\n\\n**You cannot change the operator, equal sign, and the r.h.s of the equation. The right-hand side must be 3.**","restriction":["You cannot change the operator, equal sign, and the r.h.s of the equation. The right-hand side must be 3."],"explanation":"You can do it like this :\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1617531351176.PNG)","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":42,"y1":18,"x2":42,"y2":21,"isLocked":false},{"type":"matchstick","x1":42,"y1":21,"x2":39,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":18,"x2":23,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":21,"x2":26,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":21,"x2":23,"y2":24,"isLocked":false},{"type":"matchstick","x1":39,"y1":24,"x2":42,"y2":24,"isLocked":false},{"type":"matchstick","x1":26,"y1":18,"x2":26,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":18,"x2":26,"y2":18,"isLocked":false},{"type":"matchstick","x1":23,"y1":24,"x2":26,"y2":24,"isLocked":false},{"type":"matchstick","x1":26,"y1":21,"x2":26,"y2":24,"isLocked":false},{"type":"matchstick","x1":28,"y1":21,"x2":30,"y2":21,"isLocked":false},{"type":"matchstick","x1":31,"y1":18,"x2":34,"y2":18,"isLocked":false},{"type":"matchstick","x1":31,"y1":21,"x2":34,"y2":21,"isLocked":false},{"type":"matchstick","x1":42,"y1":21,"x2":42,"y2":24,"isLocked":false},{"type":"matchstick","x1":34,"y1":18,"x2":34,"y2":21,"isLocked":false},{"type":"matchstick","x1":34,"y1":21,"x2":34,"y2":24,"isLocked":false},{"type":"matchstick","x1":34,"y1":24,"x2":31,"y2":24,"isLocked":false},{"type":"matchstick","x1":38,"y1":21,"x2":36,"y2":21,"isLocked":false},{"type":"matchstick","x1":39,"y1":18,"x2":42,"y2":18,"isLocked":false},{"type":"matchstick","x1":36,"y1":22,"x2":38,"y2":22,"isLocked":false}],"type":"interactive","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":42,"y1":18,"x2":42,"y2":21,"isLocked":false},{"type":"matchstick","x1":42,"y1":21,"x2":39,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":18,"x2":23,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":21,"x2":26,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":21,"x2":23,"y2":24,"isLocked":false},{"type":"matchstick","x1":39,"y1":24,"x2":42,"y2":24,"isLocked":false},{"type":"matchstick","x1":26,"y1":18,"x2":26,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":18,"x2":26,"y2":18,"isLocked":false},{"type":"matchstick","x1":23,"y1":24,"x2":26,"y2":24,"isLocked":false},{"type":"matchstick","x1":26,"y1":21,"x2":26,"y2":24,"isLocked":false},{"type":"matchstick","x1":28,"y1":21,"x2":30,"y2":21,"isLocked":false},{"type":"matchstick","x1":31,"y1":18,"x2":34,"y2":18,"isLocked":false},{"type":"matchstick","x1":31,"y1":21,"x2":34,"y2":21,"isLocked":false},{"type":"matchstick","x1":42,"y1":21,"x2":42,"y2":24,"isLocked":false},{"type":"matchstick","x1":31,"y1":18,"x2":31,"y2":21,"isLocked":false},{"type":"matchstick","x1":34,"y1":21,"x2":34,"y2":24,"isLocked":false},{"type":"matchstick","x1":34,"y1":24,"x2":31,"y2":24,"isLocked":false},{"type":"matchstick","x1":38,"y1":21,"x2":36,"y2":21,"isLocked":false},{"type":"matchstick","x1":39,"y1":18,"x2":42,"y2":18,"isLocked":false},{"type":"matchstick","x1":36,"y1":22,"x2":38,"y2":22,"isLocked":false}]}}}	XSCpDVBCNHMvvocZSTi5	I97my9P8SJhfh4WrtV4CTc8xNo92	t
38	55	Staircase	https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/Series/staircase+with+matchstick.png	t	medium	2	1614956249444	1	{"version":1,"description":"Barbara is building a staircase for her dolls. Use the concept of series and help her find out the number of matchsticks required in the following steps.  \\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/Series/staircase+with+matchstick.png)","category":" Series","lang":"en","interactiveType":"none","ansType":"text","tags":["Basic","Arithmetic","Series"],"type":"none","statement":"Barbara made the initial staircase with 3 steps as follows, with a total of 18 match sticks.\\nHow many **ADDITIONAL** matches are required to make a staircase with 4 steps?\\n","explanation":"Step 1: 4  \\nStep 2: 6  \\nStep 3: 8  \\nSo, step 4:  10  \\nIn general,  \\nextra matches per step= 2+ 2n = 2(n+1).   \\nSo, for n=4, 10 additional matches are required. \\n","data":{"type":"text","data":{"answer":["10","Ten","ten"]}}}	5HkuaZzSRmxiN47pPgsO	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
35	62	Guard The Valley	https://buet-edu-1.s3.ap-south-1.amazonaws.com/mehrab/venn_icon.png	t	medium	2	1614959602560	1	{"version":1,"description":"**A**, **B**, **C** and **D** are 4 guards protecing the valley of Euphoria. To keep the demons away, each of them guards a corrsponding circular area of the valley which is shown by the **4 circles** in the problem figure. \\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/mehrab/Component+1+%E2%80%93+1.png)\\nNow , some parts of the valley might be guarded by more than 1 guards from among A, B, C and D which can be noticed in the figure. ","category":"venn","lang":"en","interactiveType":"venn","ansType":"interactive","type":"venn","statement":"Color the areas of the valley of Euphoria that\\n\\n-  Only **D** guards.\\n-  Only **B** guards.\\n-  Both **A** and **C** guard but **B** doesn't.\\n\\nYou can color an area by just clicking/touching on that area and de-color a colored area by touching/clicking it again.","explanation":"This solution comes from the basic concepts of set theory and venn diagrams.\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/mehrab/venn_sol.png)","data":{"sets":[{"sets":["A"],"size":12,"label":"A","id":0,"color":"#a4ee49","selected":false,"exclude":[4,5]},{"sets":["B"],"size":10,"label":"B","id":1,"color":"#dbd524","selected":false,"exclude":[4,6,7]},{"sets":["C"],"size":12,"label":"C","id":2,"color":"#ee9191","selected":false,"exclude":[5,7]},{"sets":["D"],"size":12,"label":"D","id":3,"color":"#96a1f8","selected":false,"exclude":[6]},{"sets":["A","B"],"size":2,"label":"","id":4,"color":"#7de1f2","selected":false,"exclude":[8]},{"sets":["A","C"],"size":2,"label":"","id":5,"color":"#f995e3","selected":false,"exclude":[8]},{"sets":["B","D"],"size":2,"label":"","id":6,"color":"#f28888","selected":false,"exclude":[]},{"sets":["C","B"],"size":2,"label":"","id":7,"color":"#b6aaaa","selected":false,"exclude":[8]},{"sets":["A","B","C"],"size":2,"label":"","id":8,"color":"#f9b262","selected":false,"exclude":[]}],"type":"interactive","data":{"answer":{"sets":[{"sets":["A"],"size":12,"label":"A","id":0,"color":"#a4ee49","selected":false,"exclude":[4,5]},{"sets":["B"],"size":10,"label":"B","id":1,"color":"#dbd524","selected":true,"exclude":[4,6,7]},{"sets":["C"],"size":12,"label":"C","id":2,"color":"#ee9191","selected":false,"exclude":[5,7]},{"sets":["D"],"size":12,"label":"D","id":3,"color":"#96a1f8","selected":true,"exclude":[6]},{"sets":["A","B"],"size":2,"label":"","id":4,"color":"#7de1f2","selected":false,"exclude":[8]},{"sets":["A","C"],"size":2,"label":"","id":5,"color":"#f995e3","selected":true,"exclude":[8]},{"sets":["B","D"],"size":2,"label":"","id":6,"color":"#f28888","selected":false,"exclude":[]},{"sets":["C","B"],"size":2,"label":"","id":7,"color":"#b6aaaa","selected":false,"exclude":[8]},{"sets":["A","B","C"],"size":2,"label":"","id":8,"color":"#f9b262","selected":false,"exclude":[]}]}}}}	sREAJIi3rb6MnLfWLFfn	0RMFi9mrPNe7mol2JwcZAf40F3n2	t
190	81	SpongeBob SquarePants!!!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1620210510140.png	t	medium	1	1620211037309	4	{"version":1,"category":"Perimeter","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1620210649310.png)  \\n**SpongeBob is a famous cartoon character with rectangular shape.  \\nIf the area of spongebob's face is 100 and length of one side is 10, what is the perimeter of his face?**","explanation":"Area of the rectangle is 100 and length of one side is 10.  \\nSo base×10=100  \\nbase=100÷10=10  \\nSo perimeter is 2×(10+10)=40","data":{"type":"text","data":{"answer":["40"]}}}	xsmpa5JK2CKqzoq8yPzD	VoTf81DreZTqGwSXurQ7g8DBnV43	t
155	58	Composite II	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Zarzees/Rectangle2.jpg	t	medium	2	1623352140602	7	{"version":1,"category":"Perimeter","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623352125895.png)  \\n__The shape is made up of 3 identical rectangles. What is the perimeter of this shape?__","explanation":"If you observe carefully, the shape is inscribed in a 15×15 rectangle. So the perimeter is 15+15+15+15=60","data":{"type":"text","data":{"answer":["60"]}},"width":60}	E5tzxDM8b9PeUVw35Hvk	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
31	39	Chips and Chocolates	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/Chips+and+Chocolates/chips+and+chocolate+logo-04.jpg	t	hard	1	1614959423205	3	{"version":1,"description":"John bought two packets of chips and one chocolate bar from the store. Price of one packet of chips is 10 taka and the total price is 35 taka.\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/Chips+and+Chocolates/chips+and+chocolate+ques-02.jpg)","category":"arithmetic","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"What is the price of the chocolate bar?","explanation":"Total price = 35 taka\\n\\n----------\\n\\n1 packet of chips = 10 taka\\n\\n----------\\n\\n2 packet of chips = 2*10 = 20 taka\\n\\n----------\\n\\nPrice of chocolate bar = 35-20 taka = 15 taka\\n","data":{"type":"text","data":{"answer":["15"]}},"width":60}	Ol04hnE1XqO59iSJJ76I	Hn4jI4W0tFW6zFuXl94nd7IbieI3	\N
122	79	Knowing the triangle!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1617521092974.jfif	t	easy	1	1617521526532	1	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1617521147216.png)","category":"geometry","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Which one is correct?  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1617521255278.png)\\n","explanation":"In 1 two sides are equal  \\nIn  3 every sides are equal  \\nIn  2 no sides are equal\\n","data":{"type":"mcq","data":{"options":["1->isosceles, 2->Scalene, 3->equilateral","2->isosceles, 1->Scalene, 3->equilateral","3->isosceles, 2->Scalene, 1->equilateral"],"answer":"1->isosceles, 2->Scalene, 3->equilateral"}}}	P660n3SOxhEm1fxn6IWv	VoTf81DreZTqGwSXurQ7g8DBnV43	t
224	78	Matchsticks and Numbers - I	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910467394.png	t	medium	1	1621700344186	4	{"version":1,"description":"As you can see, a 3 digit number, __536__ is made using some matchsticks","hint":["Try to **maximize the leftmost digit** since it has the **greatest value** among all digits"],"category":" MatchSticks","lang":"en","interactiveType":"matchstick","ansType":"text","type":"matchstick","statement":"Find out the __largest 3 digit number__ moving __only 1 matchstick__\\n\\nLet me give you some hints right here. You don't need to __rotate__ or __change the size__ of that matchstick. Just shift it to a new position\\n\\n__AND__ use your concept of __place value__","explanation":"Notice the __below two pictures__ to know __which matchstick to move__ and __where to move__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1621700240084.png)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1621700257764.png)","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":17,"y1":20,"x2":17,"y2":23,"isLocked":false},{"type":"matchstick","x1":20,"y1":23,"x2":17,"y2":23,"isLocked":false},{"type":"matchstick","x1":20,"y1":20,"x2":17,"y2":20,"isLocked":false},{"type":"matchstick","x1":30,"y1":26,"x2":27,"y2":26,"isLocked":false},{"type":"matchstick","x1":17,"y1":26,"x2":20,"y2":26,"isLocked":false},{"type":"matchstick","x1":20,"y1":26,"x2":20,"y2":23,"isLocked":false},{"type":"matchstick","x1":22,"y1":20,"x2":25,"y2":20,"isLocked":false},{"type":"matchstick","x1":25,"y1":20,"x2":25,"y2":23,"isLocked":false},{"type":"matchstick","x1":25,"y1":23,"x2":25,"y2":26,"isLocked":false},{"type":"matchstick","x1":22,"y1":23,"x2":25,"y2":23,"isLocked":false},{"type":"matchstick","x1":22,"y1":26,"x2":25,"y2":26,"isLocked":false},{"type":"matchstick","x1":27,"y1":20,"x2":30,"y2":20,"isLocked":false},{"type":"matchstick","x1":27,"y1":23,"x2":30,"y2":23,"isLocked":false},{"type":"matchstick","x1":27,"y1":26,"x2":27,"y2":23,"isLocked":false},{"type":"matchstick","x1":30,"y1":23,"x2":30,"y2":26,"isLocked":false},{"type":"matchstick","x1":27,"y1":23,"x2":27,"y2":20,"isLocked":false}],"type":"text","data":{"answer":["935"]}}}	d5qUlZidhoO3Ma1q8ocu	Duq6BDGCyAa5rLnIXML1yOjdOQp1	t
41	64	Tournament of Cards	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Capture3.PNG	f	hard	2	1614959978681	2	{"version":1,"description":"You have entered a tournament where you have to play a special card game to win. The cards have a value on top and a description beneath. You can only play 2 cards at once. The one with the greatest total points wins.\\n\\nYour opponent plays\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Capture32.jpg)\\n\\nYou have 5 cards in your hand\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Untitled-2.jpg)","category":"math-inequalities","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","type":"exclusion_grid","statement":"Select the 2 cards you must play to win.\\n","restriction":["Can only select maximum 2 objects at once"],"explanation":"Opponent’s total points = 1056+245=1301\\nSo, if you select the 655 card and the x2 card\\nYour total points = 655x2=1310\\n","data":{"type":"interactive","rowHeading":["Card"],"columnHeading":["256","655","x1.5","x2","-700"],"cell":[["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Untitled-21.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Untitled-22.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Untitled-23.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Untitled-24.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Untitled-25.jpg"]],"initialState":[[false,false,false,false,false]],"data":{"answer":[[false,true,false,true,false]]}},"width":60}	hwALyGsRoIYX8MhdBkwv	96L7jidBxJW8vTTy6WrArU2qpd63	\N
68	66	CircAngle - I	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1615112637266.png	t	hard	3	1627566638254	3	{"version":1,"description":"*__Property__: The angle at the center of a circle is twice the angle at the circumference.*\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623340524546.png)\\n\\n\\n----------\\n","hint":["**Can you find out ⦟ABO first?**\\n\\n----------\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623340559243.png)","\\n**See what you can achieve through the solution of previous hint**\\n\\n⦟OBA + ⦟OBC = 180\\n\\n=> ⦟OBA + 123 = 180\\n\\n=> ⦟OBA = 180 - 123\\n\\nSo, ⦟OBA = 57","**Can you now find out ⦟AOB?**\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623340482105.png)","**Here's your solution to previous hint**\\n\\n----------\\n\\n⦟OAB + ⦟OBA + ⦟AOB =  180\\n\\n=> 57 + 57 + ⦟AOB = 180\\n\\n=> 114 + ⦟AOB = 180\\n\\n=> ⦟AOB = 180 - 114\\n\\n=> ⦟AOB = 66","**Let's visit your last hint**\\n\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623340449719.png)\\n\\n\\n----------\\n\\n**Now? Go and conquer it!!!**"],"category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"__Find out ⦟ADB__","explanation":"__See the hint 1-5 for the initial part of the solution__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623340524546.png)\\n\\n\\n__Now, let's consider minor arc AB__\\n\\n__⦟AOB and ⦟ADB are respectively *central *and *inscribed *angle on it__\\n\\n__⦟AOB = 2 × ⦟ADB__\\n\\n=> ⦟ADB = 1/2 (⦟AOB)\\n\\n=> ⦟ADB = 1/2 (66)\\n\\n__So, ⦟ADB = 33!!!__","data":{"type":"text","data":{"answer":["33"]}},"width":80}	RLzvTqr7Bpy0580kgJwI	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
156	58	Tom and Jerry!!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1619029395718.png	t	easy	2	1619030108089	8	{"version":1,"category":"Perimeter","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1619029461730.png)  \\n**What distance should tom cross to catch jerry?** ","explanation":"The total horizontal distance tom will cross is 20.  \\nTotal vertical distance tom will cross is 15.  \\nSo 20+15=35. ","data":{"type":"mcq","data":{"options":["20","35","45","25"],"answer":"35"}}}	hj8YYXxOqoeJn99zA08x	VoTf81DreZTqGwSXurQ7g8DBnV43	t
123	33	Knowing the Triangle 2!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1617521672531.jfif	t	easy	1	1623518086120	2	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623346134950.png)  \\nFormula:  Area of a triangle is :  ½×base×height","category":"Area","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"What is the area of this triangle?  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623346072335.png)","explanation":"Formula is given :)","data":{"type":"text","data":{"answer":["24"]}},"width":90}	RXyPdXTxyk7GaUmhURe1	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
43	74	Change the Direction	https://firebasestorage.googleapis.com/v0/b/setter-34453.appspot.com/o/download%20(1).jpg?alt=media&token=efa00589-1534-4d98-8baf-a009a819f17e	t	hard	3	1614960357164	1	{"version":1,"description":"Logical problems basically do not follow any rules. The solution has to be reached through repeated trials and errors. Here you have to solve the problem through practice as you have to work hard. Changing the position of the matchstick, creating new structures, etc. lie in the logical problem.","category":"matchstick","lang":"en","interactiveType":"matchstick","ansType":"interactive","tags":["logic,matchstick"],"type":"matchstick","statement":"The problem is that a fish structure has been created with matchsticks. It can be seen that the fish is moving to the left. Your job is to change the position of any three sticks in such a way that the fish turns in the opposite direction, that is, it looks like the fish is moving to the right.\\n\\nDraw the figure on the figure-board and click on submit\\n\\n<b>Size of all the matchsticks must be unchanged And you can only move the lower matchsticks to the upper side</b>","restriction":["You can only move the lower matchsticks to the upper side"],"explanation":"Moving the three cross-marked sticks from their current position to the part marked in blue and red will turn the fish to the right.\\n![](https://bueteduproject1.s3.ap-south-1.amazonaws.com/problem_images/1596783651985_a_0.jpg)","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":24,"y1":18,"x2":23,"y2":19,"isLocked":false},{"type":"matchstick","x1":24,"y1":22,"x2":23,"y2":21,"isLocked":false},{"type":"matchstick","x1":22,"y1":20,"x2":23,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":22,"y2":20,"isLocked":false},{"type":"matchstick","x1":24,"y1":20,"x2":23,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":24,"y2":20,"isLocked":false},{"type":"matchstick","x1":25,"y1":19,"x2":24,"y2":20,"isLocked":false},{"type":"matchstick","x1":24,"y1":20,"x2":25,"y2":21,"isLocked":false}],"type":"interactive","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":24,"y1":18,"x2":23,"y2":19,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":22,"y2":18,"isLocked":false},{"type":"matchstick","x1":23,"y1":17,"x2":24,"y2":18,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":22,"y2":20,"isLocked":false},{"type":"matchstick","x1":24,"y1":20,"x2":23,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":24,"y2":20,"isLocked":false},{"type":"matchstick","x1":25,"y1":19,"x2":24,"y2":20,"isLocked":false},{"type":"matchstick","x1":24,"y1":18,"x2":25,"y2":19,"isLocked":false}]}},"width":50}	Kw0OEOUFBu8ZZtK1VfjY	I97my9P8SJhfh4WrtV4CTc8xNo92	\N
176	72	Open the Window!!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1619345116052.png	t	hard	3	1619345606999	3	{"version":1,"category":"Perimeter","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1619345181295.png)  \\n**The perimeter of the rectangular window when closed is 30 meter. Then it was opened by sliding it x amount. The perimeter measured then is 24 meter.\\nWhat is the value of x?**\\n","explanation":"The difference between the perimeters is 2x.  \\nSo, x=(30-24)÷2=3  :)","data":{"type":"text","data":{"answer":["3"]}}}	wSwCRVCqYiMuLH3nf4QB	VoTf81DreZTqGwSXurQ7g8DBnV43	t
44	74	Shape With Matchstick	https://firebasestorage.googleapis.com/v0/b/setter-34453.appspot.com/o/ShapeWithMatchstick.PNG?alt=media&token=20f22e8a-62fb-4199-b220-f460f8fc2d0a	f	hard	3	1614960320021	2	{"version":1,"description":"Geometric shapes like squares, rectangles etc. can be made with matchstick. This type of problem is basically solved by reasoning. Changing the position of the matchstick, changing the number of squares, changing the shape, etc. lie in this problem.","category":"matchstick","lang":"en","interactiveType":"matchstick","ansType":"interactive","tags":["matchstick,logic"],"type":"matchstick","statement":"The given problem has 5 squares. You have to change the position of any two sticks in such a way that they are 4 squares.\\n\\nDraw the figure on the figure-board and click on submit\\n\\nOne square cannot be inside another square.Most importantly, size of all the matchsticks must be unchanged.","restriction":["You must create two squares in the upper part and two in the lower part."],"explanation":"![](https://firebasestorage.googleapis.com/v0/b/setter-34453.appspot.com/o/download%20(2).png?alt=media&token=603dd227-d476-407c-8c83-a185d9c00d8e)\\n\\nIf the stick highlighted in yellow in the figure below is changed according to the arrow, 4 squares will be created.\\n\\n![](https://bueteduproject1.s3.ap-south-1.amazonaws.com/problem_images/1596781522482_a_0.jpg)","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":32,"y1":17,"x2":32,"y2":19,"isLocked":false},{"type":"matchstick","x1":32,"y1":17,"x2":30,"y2":17,"isLocked":false},{"type":"matchstick","x1":28,"y1":17,"x2":28,"y2":19,"isLocked":false},{"type":"matchstick","x1":24,"y1":19,"x2":24,"y2":21,"isLocked":false},{"type":"matchstick","x1":24,"y1":19,"x2":26,"y2":19,"isLocked":false},{"type":"matchstick","x1":24,"y1":21,"x2":26,"y2":21,"isLocked":false},{"type":"matchstick","x1":26,"y1":19,"x2":26,"y2":21,"isLocked":false},{"type":"matchstick","x1":26,"y1":19,"x2":28,"y2":19,"isLocked":false},{"type":"matchstick","x1":28,"y1":19,"x2":28,"y2":21,"isLocked":false},{"type":"matchstick","x1":26,"y1":21,"x2":28,"y2":21,"isLocked":false},{"type":"matchstick","x1":28,"y1":19,"x2":30,"y2":19,"isLocked":false},{"type":"matchstick","x1":28,"y1":21,"x2":30,"y2":21,"isLocked":false},{"type":"matchstick","x1":30,"y1":19,"x2":30,"y2":21,"isLocked":false},{"type":"matchstick","x1":28,"y1":17,"x2":30,"y2":17,"isLocked":false},{"type":"matchstick","x1":30,"y1":19,"x2":30,"y2":17,"isLocked":false},{"type":"matchstick","x1":30,"y1":19,"x2":32,"y2":19,"isLocked":false}],"type":"interactive","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":32,"y1":17,"x2":32,"y2":19,"isLocked":false},{"type":"matchstick","x1":32,"y1":17,"x2":30,"y2":17,"isLocked":false},{"type":"matchstick","x1":28,"y1":17,"x2":28,"y2":19,"isLocked":false},{"type":"matchstick","x1":24,"y1":19,"x2":24,"y2":21,"isLocked":false},{"type":"matchstick","x1":24,"y1":19,"x2":26,"y2":19,"isLocked":false},{"type":"matchstick","x1":24,"y1":21,"x2":26,"y2":21,"isLocked":false},{"type":"matchstick","x1":26,"y1":19,"x2":26,"y2":21,"isLocked":false},{"type":"matchstick","x1":26,"y1":19,"x2":28,"y2":19,"isLocked":false},{"type":"matchstick","x1":28,"y1":19,"x2":28,"y2":21,"isLocked":false},{"type":"matchstick","x1":26,"y1":19,"x2":26,"y2":17,"isLocked":false},{"type":"matchstick","x1":28,"y1":19,"x2":30,"y2":19,"isLocked":false},{"type":"matchstick","x1":28,"y1":21,"x2":30,"y2":21,"isLocked":false},{"type":"matchstick","x1":30,"y1":19,"x2":30,"y2":21,"isLocked":false},{"type":"matchstick","x1":26,"y1":17,"x2":28,"y2":17,"isLocked":false},{"type":"matchstick","x1":30,"y1":19,"x2":30,"y2":17,"isLocked":false},{"type":"matchstick","x1":30,"y1":19,"x2":32,"y2":19,"isLocked":false}]}},"width":80}	7LIw9WysnswoSwdQTwPc	I97my9P8SJhfh4WrtV4CTc8xNo92	\N
46	36	Sticks and Ends	https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/BasicArithmetic/bundle+of+sticks.png	t	easy	1	1614956234057	4	{"version":1,"category":" Unitary Method","lang":"en","interactiveType":"none","ansType":"mcq","tags":["Basic","Arithmetic","Unitary","Method"],"type":"none","statement":"Seven sticks have 14 ends. Ten sticks have 20 ends. How many ends does 15 and a half sticks have?  \\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/BasicArithmetic/bundle+of+sticks.png)\\n","explanation":"Half a stick also has 2 ends, it’s just half in length.  \\nSo, total number of ends   \\n= (15x2) for each stick + 2 for half a stick  \\n=30+2  \\n=32 \\n","data":{"type":"mcq","data":{"options":["30","31","32"],"answer":"32"}}}	CUe8mvAOwWPwsBcB9jdE	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
212	88	Hidden Treasure!	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/Temple/treasure.png	t	hard	3	1623689676811	4	{"version":1,"description":"Dr.Oliver an archeologist and his assistant Jim were exploring the ruins of an old castle. They opened a mysterious door to find a treasure chest. \\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/Temple/bg-012.png)\\n\\nDr.Oliver notices a trap. In order to remove the chest from the altar they need to replace it with someting of the same weight. The Dr.Oliver estimates that the chest weighs 48kg. Using a triangular stone block and a wooden plank they try determine Jim's weight and the weight of the bags they were carrying and that of the stone blocks. For the following cases weight on either sides of the plack were balanced:\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/Temple/eqt1.jpg)\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/Temple/eqt2.jpg)\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/Temple/eqt3.jpg)\\n","category":"weight balance","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"If Dr.Oliver weighs 80kg what __item/items__ can be used to replace the chest?","explanation":"Here from the following equations can be derived from the pictures:\\n\\n- Weight of a bag + Weight of Jim = Weight of Dr.Oliver ---- eq1\\n- Weight of Jim = Weight of a stone block + 2 x Weight of a bag ---- eq2\\n- Weight of a bag + 2 x Weight of a stone block = Weight of Dr.Oliver ---- eq3\\n\\nSince we know the weight of Dr.Oliver eq1 and eq3 can be written as:\\n\\n- Weight of a bag + Weight of Jim = 80kg ---- eq1\\n- Weight of a bag + 2 x Weight of a stone block = 80kg ---- eq3\\n\\nIf the expression for Jim's weight, eq2, is substituted in eq1:\\n\\n- Weight of a bag + Weight of a stone block + 2 x Weight of a bag = 80kg \\n- 3 x Weight of a bag + Weight of a stone block = 80kg \\n-  Weight of a stone block = 80kg - 3 x Weight of a bag ---- eq4\\n\\nIf the expression for the weight of a stone block, eq4, is substituted in eq3:\\n\\n- Weight of a bag + 2 x (80kg - 3 x Weight of a bag) = 80kg\\n- Weight of a bag + 160kg - 6 x Weight of a bag = 80kg\\n- 160kg - 5 x Weight of a bag = 80kg\\n- 5 x Weight of a bag = 80kg\\n- Weight of a bag = 16kg\\n\\nNow, if the weight of a bag is substituted in eq4:\\n\\n- Weight of a stone block = 80kg - 3 x 16kg\\n- Weight of a stone block = 80kg - 48kg\\n- Weight of a stone block = 32kg\\n\\nAgain, if the weight of a stone block and weight of a bag is substituted in eq2:\\n\\n- Weight of Jim = 32kg + 2 x 16kg\\n- Weight of Jim = 32kg + 32kg\\n- Weight of JIm = 64kg\\n\\nNow,\\n\\n- Weight of a bag + Weight of a stone block = 16kg + 32kg = 48kg\\n\\nThus the chest can be replaced by 1 Bag and ! stone Block.\\n","data":{"type":"mcq","data":{"options":["1 Bag","1 Stone Block","Jim","1 Bag and 1 Stone Block","Jim and 1 Bag"],"answer":"1 Bag and 1 Stone Block"}},"width":80}	eAATZ1uN4b7z3DgaKPt5	96L7jidBxJW8vTTy6WrArU2qpd63	\N
124	33	Knowing the Triangle 3!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1617523646509.jfif	t	medium	1	1623518110576	3	{"version":1,"category":"Area","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623345779145.png)  \\nWhat is the area of this triangle?","explanation":" Area =  \\n1/2×base×height  \\n=1/2×(10-3)×8=28","data":{"type":"text","data":{"answer":["28"]}},"width":70}	nOjtzDdJKdmY33xmEwJN	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
191	81	Perimeter from Area!!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1612274132401.png	t	medium	1	1627559360756	5	{"version":1,"category":"Perimeter","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623346601477.png)  \\nIf the area of the blue triangle is 20 and one side of the rectangle is 4 , what is the perimeter of the rectangle?    \\n\\nWe know, area of a triangle = *(1/2) x base x height*\\n\\n\\n","explanation":"Area of the triangle=1/2×base×height=1/2×base×4=20  \\nFrom here base=10  \\nSo perimeter is 10+4+10+4=28","data":{"type":"text","data":{"answer":["28"]}},"width":60}	5nRlKQsNKAeWgcirfkub	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
53	57	Scouts' Camp	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610337654461.png	t	easy	2	1614956467177	2	{"version":1,"description":"The scouts are holding a camp consisting of both boys and girls. Everyday more boys and girls join the camps. Using **Unitary Method**, try to find out **when the number of boys and girls will be equal**.\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610337654461.png)","category":" Unitary Method","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Initially, there were **18 boys** and **12 girls**. **4 new girls** and **3 new boys** join the camp **every day**. After how many days will the number of boys and girls be equal?\\n","restriction":["Arithmetic","Unitary Method","Basic"],"explanation":"Per day,  (4-3) =1 new girl joins with respect to boys.  \\nSo, the difference between boys and girls, decrease by 1 in 1 day.  \\nthe difference between boys and girls, decrease by 6 in (1x6) = 6 days","data":{"type":"mcq","data":{"options":["4","6","7","9"],"answer":"6"}}}	K2IiVo0jXOFYlpOuTQes	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
51	36	Intergalactic Classroom	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610336613535.png	t	medium	1	1614956373892	6	{"version":1,"description":"It is the year 2050. We have found life on other planets like Mercury, Venus and Mars. We co-exist together and have schools with members from all 4 planets. \\n\\nThere are :  \\n***Mercurians*** with **1 leg**;  \\n***Venusians*** with **3 legs**;  \\nand ***Martians*** with **5 legs**.   \\nAnd last but not the least, we have ***Earthlings***  with **2 legs**.\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610336613535.png)","category":" Unitary Method","lang":"en","interactiveType":"none","ansType":"text","tags":["Basic","Arithmetic","Unitary","Method"],"type":"none","statement":"In your classroom, you find that there are 9 Mercurians, 4 Earthlings (including you) and 4 Martians. There are a total of 52 legs. How many Venusians are there in your class?","explanation":"1 Mercurian has 1 leg.  \\n9 Mercurians have (1x9) = 9 legs\\n\\n1 Earthling has 2 legs.  \\n4 Earthlings have (2x4) = 8 legs.  \\n\\n1 Martian has 5 legs  \\n4 Martians have 5x4 = 20 legs  \\n\\nTotal number of legs without Venusians is (9+8+20) = 37 legs.  \\nRemaining legs belonging to Venusians  is (52-37) = 15  \\n\\n3 legs belong to 1 Venusian.  \\n15 legs belong to (15/3) = 5 Venusians  \\nThere are 5 Venusians in your class.\\n","data":{"type":"text","data":{"answer":["5","Five","five"]}}}	DDJxqVqsoe3jryEIfodF	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
55	56	Unknown Digits II	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	medium	2	1623653130017	2	{"version":1,"description":"Some digits have some special properties. In this problem, you have to play around with digits multiplied by themselves. Have fun cracking the puzzle!","category":" Backtracking","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"FInd out the values of X and Y  \\n(They are both between 0 and 9)  \\n  \\n\\n\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610265395309.png)","explanation":"Of all the digits from 0 to 9, only 0,1, 5 and 6 give the same one's digit after multiplication with themselves. For example  \\n1__0__ x 1__0__ = 10__0__ ; 3__1__ x 1__1__ = 34__1__; 1__6__ x 2__6__ = 41__6__ ; 1__5__ x __5__ = 7__5__ \\n\\nAfter playing around with the digits we find, X = 5 and Y = 6 ","data":{"type":"mcq","data":{"options":["X = 1, Y = 5","X = 5, Y = 6","X = 6, Y = 2","X = 1, Y = 2"],"answer":"X = 5, Y = 6"}},"width":60}	dqGxR3IabEEDheFRvlxJ	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
64	65	Reflex Parallelogram - II	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1610631637178.png	t	medium	2	1627566047928	6	{"version":1,"description":"*__Property:__ If two angles of a parallelogram share a common side, they are supplimentary (i.e. together equal to 180 degrees)*  \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623341199669.png)","hint":["**Can you determine ⦟ABC first?**\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623341214557.png)","\\n"],"category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"__Determine Reflex ⦟B__","explanation":"__⦟A = ⦟C and ⦟B = ⦟D__\\n\\n__Now,__\\n\\n⦟A + ⦟B + ⦟C +⦟ D = 360\\n\\n=> 2 (⦟A + ⦟B) = 360\\n\\n=> ⦟A + ⦟B = 180\\n\\n=> 110 +⦟ B = 180\\n\\nSo, B = 70\\n\\n__Finally,__\\n\\nAcute ⦟B (⦟ABC) + Reflex ⦟B = 360\\n\\n=> 70 + Reflex ⦟B = 360\\n\\n=> Reflex ⦟B = 360 - 70\\n\\n__So, Reflex ⦟B = 290__","data":{"type":"text","data":{"answer":["290"]}},"width":80}	hyhgTsCJXpDv5Wb92t1y	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
60	57	Candy Wrappers	https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/UnitaryMethod/candies.jpg	t	medium	2	1614956390629	1	{"version":1,"description":"Jack and Jill are siblings who have separate rooms with separate dustbins. They have unlimited candies in each of their rooms, and they eat these candies regularly. Since, they are good children, Jack and Jill always use the dustbin to throw away the wrappers. Their mom comes and cleans up the dustbin quite often. Help her predict how many wrappers she will find in the following scenario, using unitary method.","category":" Unitary Method","lang":"en","interactiveType":"none","ansType":"mcq","tags":["Basic","Arithmetic","Unitary","Method"],"type":"none","statement":"Mom cleaned Jack’s dustbin on Sunday morning. She cleaned Jill’s dustbin on Monday morning. When she went to clean their rooms on Tuesday morning, she saw the following:\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610337193698.png)  \\nIf she goes to clean their room again on Friday morning, how many wrappers in total would she expect to find?\\n","explanation":"**For Jack,**  \\nSunday to Tuesday is 2 days.  \\nIn 2 days he eats 6 candies.  \\nIn 1 day he eats (6/2) =  3 candies.\\n\\n**For Jill,  **  \\nMonday to Tuesday is 1 day.  \\nIn 1 day she eats 5 candies.  \\n\\nTuesday to Friday is 3 days.  \\nAgain, they both eat together in 1 day, (3+5) = 8 candies  \\nTherefore in 3 days, they eat 3*8=24 candies  \\n\\nSo, mom will expect to find **24 wrappers**\\n","data":{"type":"mcq","data":{"options":["18","20","22","24"],"answer":"24"}}}	tAZB0Q9jGrzudyGG2w8f	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
125	33	Knowing the Rectangle!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1617524174830.jfif	t	easy	1	1627559835558	4	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623345665435.png)  \\nArea of a rectangle  \\n= Area of the lower left triangle + Area of the upper right triangle  \\n= 1/2×base×height + 1/2×base×height  \\n= __base×height__","category":"Area","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"What is the area of this national flag?  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623345594952.png)","explanation":"Please follow the formula :)","data":{"type":"text","data":{"answer":["60"]}},"width":60}	3uSrs4lqWkCONOmTfI3b	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
177	58	Composite III	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Zarzees/Rectangle2.jpg	t	hard	2	1623352181288	9	{"version":1,"category":"Perimeter","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623352160951.png)  \\n__Two identical rectangles are connected by a smaller rectangle. If the numbers inside the rectangles denote area and numbers above the rectangles denote length, what is the perimeter of the shape?__","explanation":"Width of the larger rectangle is 28÷7=4  \\nWidth of the smaller rectangle is 4÷4=1  \\nSo total perimeter is 7+4+7+(4-1)+4+4+(4-1)+7+4+7=50","data":{"type":"text","data":{"answer":["50"]}},"width":60}	Z2jgmHFFz7vjPaUPdkR4	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
225	89	Secret Digits 1	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622375188545.PNG	t	easy	2	1623653535580	1	{"version":1,"category":"math - backtracking","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"The following is a valid sum where two numbers are replaced by X and Y  \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1621961984955.jpg)  \\n\\nWhat is the value of X and Y?","explanation":"If __X+Y>=10__, then the digit in the tenths place of the sum will be 3. Hence, __X+Y<10__ and __X+Y=6__. From here we get two equations __11Y=2X+1__ and __X+Y=6__, we get X=5 and Y=1.","data":{"type":"mcq","data":{"options":["X=3, Y=3","X=7, Y=9","X=0, Y=6","X=5, Y=1"],"answer":"X=5, Y=1"}},"width":50}	l66HR2vtDPOO7l9aNNJo	st1KFPBwmUNxPq6gtlcevCF7RqA3	\N
247	93	Color The Cube 1	https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622403857326.png	t	hard	3	1623656353099	3	{"version":1,"description":"This is a __3X3__ cube:\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622403857326.png\\n)\\n\\nOne needs 54g of color to paint the cube.","category":" 3D Shapes","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Shoumo has a cube-shaped structure as following. \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622403953526.png\\n)\\n\\nHow much color does he need to paint it?","explanation":"If the area of outer surface of the whole cube is __54 units__, then the area of outer surface of the incomplete cube is __52 units__.","data":{"type":"mcq","data":{"options":["54 grams","52 grams","56 grams","50 grams","60 grams"],"answer":"52 grams"}},"width":80}	0W978APeASEx1YbczCGk	sDCgfAyDqYhCWzPhpyCXj8aU0b63	\N
164	82	Adversity - III	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618021253868.png	t	easy	1	1627556545088	5	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623345679428.png)\\n\\n__Note__: *The same picture will be used in some of the upcoming problems. So, Best of Luck!!!*","category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"__Which statement is incorrect?__","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623345583092.png)\\n\\n__Look carefully. It's a different picture than the question__\\n\\n__Here, the equal vertically opposite angles are the same color__\\n","data":{"type":"mcq","data":{"options":["f = b","g = h","c = d"],"answer":"c = d"}},"width":60}	r3LEphuTjM8ai4Eoj3WD	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
45	75	Solve The Maze	https://firebasestorage.googleapis.com/v0/b/setter-34453.appspot.com/o/download%20(3).png?alt=media&token=a445abf8-2081-4802-b261-1a904f5e0532	t	medium	2	1614960345453	1	{"version":1,"description":"\\nMaze problems basically have a starting point and an ending point. Sometimes there are many paths but it is not possible to reach the destination by all the paths because sometimes there are some obstacles. Finding a way out of the problem is the solution.","category":"maze","lang":"en","interactiveType":"none","ansType":"mcq","tags":["maze,logic"],"type":"none","statement":"\\nThe given problem includes a bird and a bee. They are two friends. The bird wants to meet the bee. But the distance between them is less but there are many obstacles. However, there are ways that do not have obstacles. Your job is to find the number of ways. There are several ways in which a bird can easily meet a bee\\n\\nSelect any one of the following options\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/rabib/maze.png)","explanation":"Correct Answer: 2\\nThe blue color is shown in the image of Answer without any obstacle. That is, there are two solutions to the given problem\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/rabib/maze1.jpg)\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/rabib/maze-2.jpg)","data":{"type":"mcq","data":{"options":["1","2","3","4"],"answer":"2"}}}	GbJzyp9I7QVNMtgMckQm	I97my9P8SJhfh4WrtV4CTc8xNo92	t
178	84	Race-I	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610337282741.png	t	hard	1	1620028919821	2	{"version":1,"description":"*Amber*, *Barbara*, *Caleb*, and *Derek* are running a race. You ask your friend everyone’s positions. He tells you the following riddles. Figure out the positions of the runners with the help of the provided exclusion grid.\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610337282741.png)","category":"Exclusion Grid","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","tags":["Exclusion Grid","Logical Reasoning","Logic"],"type":"exclusion_grid","statement":"Your friend says:  \\n\\n**1.** *Caleb* is in front of* Barbara *   \\n**2.** *Derek* is in front of *Amber*  \\n**3.** *Caleb* is behind *Amber*  \\n\\nFind out the positions of the runners.\\n","explanation":"We put Caleb in front followed by Barbara. We also place   \\nDerek in front of Amber.  \\n Then we see that Caleb comes after Amber, so we move Caleb and Barbara to the back.  \\nAnd we are done!","data":{"type":"interactive","rowHeading":["Amber","Barbara","Caleb","Derek"],"columnHeading":["1st","2nd","3rd","4th"],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"]],"initialState":[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],"data":{"answer":[[false,true,false,false],[false,false,false,true],[false,false,true,false],[true,false,false,false]]}}}	ruNYgpOcmDVZPXtPbMPB	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
160	79	Shape Shift	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1610375958942.png	t	hard	1	1623654982258	2	{"version":1,"description":"A rectangle is formed using 5 sticks each on two sides, and 3 sticks each on the other two sides.","category":"Geometry","lang":"en","interactiveType":"matchstick","ansType":"text","type":"matchstick","statement":"How many sticks will be on each side if you want to make it a square?   \\nYou can move around the matchsticks to experiment. And finally submit the answer as a number.","restriction":["You cannot change the length of a stick"],"explanation":"Total sticks = 5+5+3+3 = 16\\n\\nA square has sides with equal lengths. \\n\\nTherefore for each side: 16÷4 = 4 sticks\\n","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":22,"y1":20,"x2":20,"y2":20,"isLocked":false},{"type":"matchstick","x1":20,"y1":20,"x2":20,"y2":22,"isLocked":false},{"type":"matchstick","x1":20,"y1":22,"x2":20,"y2":24,"isLocked":false},{"type":"matchstick","x1":20,"y1":24,"x2":20,"y2":26,"isLocked":false},{"type":"matchstick","x1":24,"y1":20,"x2":22,"y2":20,"isLocked":false},{"type":"matchstick","x1":26,"y1":20,"x2":24,"y2":20,"isLocked":false},{"type":"matchstick","x1":28,"y1":20,"x2":26,"y2":20,"isLocked":false},{"type":"matchstick","x1":30,"y1":20,"x2":28,"y2":20,"isLocked":false},{"type":"matchstick","x1":20,"y1":26,"x2":22,"y2":26,"isLocked":false},{"type":"matchstick","x1":22,"y1":26,"x2":24,"y2":26,"isLocked":false},{"type":"matchstick","x1":24,"y1":26,"x2":26,"y2":26,"isLocked":false},{"type":"matchstick","x1":26,"y1":26,"x2":28,"y2":26,"isLocked":false},{"type":"matchstick","x1":28,"y1":26,"x2":30,"y2":26,"isLocked":false},{"type":"matchstick","x1":30,"y1":26,"x2":30,"y2":24,"isLocked":false},{"type":"matchstick","x1":30,"y1":24,"x2":30,"y2":22,"isLocked":false},{"type":"matchstick","x1":30,"y1":22,"x2":30,"y2":20,"isLocked":false}],"type":"text","data":{"answer":["4"]}},"width":70}	Cs91Hsvk4HWsF1K0ok6P	Hn4jI4W0tFW6zFuXl94nd7IbieI3	\N
248	93	Complete The Cube	https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621031884486.png	t	hard	3	1622915878334	4	{"version":1,"description":"Rashkee has a cube like the following:\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621031884486.png\\n)\\n\\n","category":" 3D Shapes","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Saimum wants to build a cube similar to Rashkee's one. However, while doing so, he runs out of small cubes and can only build the following portion of the whole cube:\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621033185007.png\\n)\\n\\nHow many small cubes must be added to to Saimum's cube to complete the cube?","explanation":"The the total number of small cubes in a full cube is 27. And the number of cubes in the partial or incomplete cube is 20.","data":{"type":"mcq","data":{"options":["5","6","7","8","9"],"answer":"7"}}}	9OUIGXb6ZLkvy87EOP1a	sDCgfAyDqYhCWzPhpyCXj8aU0b63	t
227	89	Secret Digits 3	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622375188545.PNG	t	medium	2	1623653574895	3	{"version":1,"category":"math - backtracking","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"The following is a valid sum where the digits are replaced by A, B and C. Similar letters represent similar digits and different digits represent different digits. What is the value of A and B?  \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622016822614.jpg)","explanation":"In the Thousandth place, A+A+A~19. Hence, A=6 (since the value of the borrowed digit cannot be greater than 2). 1990-AAA-AA0-A00=B+CC=64.\\nSo the possible value of C is 5 and B is 9. Hence, __A=6, B=9, C=5__.","data":{"type":"mcq","data":{"options":["A=6 B=5","A=5 B=9","A=6 B=9","A=5 B=6"],"answer":"A=6 B=9"}},"width":50}	ZmFs9Kofp3QlJG8Oy3t7	st1KFPBwmUNxPq6gtlcevCF7RqA3	\N
192	77	Large Remainder!	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	easy	2	1614956505042	1	{"version":1,"category":" Divisibility","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"What is the remainder when 202020201971 is divided by 2020?","explanation":"By simple division, we have 202020201971 / 2020 is 100010000 and remainder is 1971","data":{"type":"text","data":{"answer":["1971"]}}}	nTfcpX4yHn3FWahMx1Jz	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
33	40	Rearrange Test	https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/TestResults.png	t	medium	1	1623335521639	1	{"version":1,"description":"Mako, Adriana, Zulfiqar and Anas scored the same marks in an exam, but teacher will rank them in the reverse of the alphabetical order of their names.","hint":"dsfgdfg","category":"rearrange","lang":"en","interactiveType":"rearrange","ansType":"interactive","type":"rearrange","statement":"Rank them according to the criteria","explanation":"Z comes first as the rank is in the reverse-alphabetical order.\\nThen comes M. And since Anas and Adriana have the same 1st letters, we go to the 2nd letter, where n comes before d in reverse alphabetical order.","data":{"type":"interactive","fields":["Mako","Adriana","Zulfiqar","Anas"],"data":{"answer":["Zulfiqar","Mako","Anas","Adriana"]}},"width":50}	MxMd3LiPFsu0fho7g6Wy	0RMFi9mrPNe7mol2JwcZAf40F3n2	\N
69	66	Complex Angle Analysis	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1610646212969.png	t	medium	3	1627566646745	1	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623339094100.png)\\n\\n__Both AB & DC ⊥ BC__\\n","hint":["**So, here's your first hint**\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623339071011.png)\\n\\n**Easy one, right? Solve it**","So, this is solution to your first hint. You sure you want to check this one?\\n\\n⦟DOC = ⦟AOB (vertically opposite angles)\\n\\n**So, ⦟DOC = 80**","**So, here's the last hint**\\n\\n**See if you can find out ⦟OCD**\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623339126263.png)\\n\\n\\n**Now you should be able to conquer it**","\\n"],"category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"__Can you find out ⦟OCB?__\\n\\n__May I help you?__\\n\\n__*Think stepwise__*","explanation":"__See the hint 1-3 for the initial part of the solution__\\n\\n__In △DOC,__\\n\\n⦟DOC + ⦟ODC + ⦟OCD = 180  \\n\\n=> 80 + 50 + ⦟OCD = 180  \\n\\n=> 130 + ⦟OCD = 180  \\n\\n=> ⦟OCD = 180 - 130\\n\\nSo, ⦟OCD = 50\\n\\n__And finally,__\\n\\n⦟DCB = 90\\n\\n=> ⦟OCD + ⦟OCB = 90\\n\\n=> 50 + ⦟OCB = 90\\n\\n=> ⦟OCB = 90 - 50\\n\\n__So, ⦟OCB = 40!!!__","data":{"type":"text","data":{"answer":["40"]}},"width":80}	yZOUYDKePRu2uevMGEwT	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
71	72	Perimeter from Area!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1612274132401.png	t	hard	3	1623351687779	2	{"version":1,"hint":["**There are 7 squares ;)**"],"category":"Area/Perimeter","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623351662132.png)  \\nThere are 7 smaller squares inside the large rectangle above. If the green square has side length 1 and the brown square has side length 2,what is the perimeter of the rectangle?","explanation":"In the bottom right we have a square of size 3×3, in the bottom left a 4×4 and in the upper left a 5×5. Thus the sides of the rectangle is  (3+4)=7 and (4+5)=9.  \\nSo perimeter=2×(7+9)=32","data":{"type":"text","data":{"answer":["32"]}},"width":60}	EhPMFIV68quCUaH669co	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
18	69	That Difficult?	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Zarzees/Rectangle2.jpg	t	medium	3	1627568612247	4	{"version":1,"description":"If a and b two sides of a rectangle,  \\n__Area of the rectangle= a×b__  \\nA square is a rectangle with all sides equal.  \\n__Area of a square = a×a__","category":"geometry","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623351662132.png)\\nThere are 7 smaller squares inside the large rectangle above.  \\nIf the green square has side length 1 and the brown square has side length 2,what is the area of the given rectangle?\\n","explanation":"In the bottom right we have a square of size 3×3, in the bottom left a 4×4 and in the upper left a 5×5. Thus the area of the rectangle is  (3+4)×(4+5)=63.","data":{"type":"text","data":{"answer":["63"]}},"width":80}	CtOO9azuTLjtRK5T7sVn	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
48	55	Christmas Tree	https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1610346492053.jpg	t	easy	2	1621501040279	4	{"version":1,"description":"The houses in your neighbourhood had christmas trees on christmas eve. You were so happy that you started drawing the pictures of the trees in your drawing book. But your mathematical mind suddenly saw a pattern in the number of leaves.\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1610346492053.jpg)","hint":["The pattern : 10 12 14 ...."],"category":"series and sequence","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"Can you guess the number of leaves of the 7th tree (if it follows the pattern)?","explanation":"The number of leaves produces a series 10 12 14 16 … Thus the 7th number in the series, happens to be 22.","data":{"type":"text","data":{"answer":["22","Twenty Two","twenty two","Twenty two"]}}}	4DGKrLxi4obpRpNQ5z1j	chn4mCsrRmb1P6QXHCbrEeEpDAl2	t
77	60	Chair arrangements II	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614434211038.PNG	t	hard	3	1614956742850	2	{"version":1,"description":"You have two types of chairs at your home: Wholesome-White and Beautiful-Blue. You want to arrange **5 chairs** around **a circular table**.   \\nNote: the following arrangements are the same, since one can be obtained from the other just by rotation:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614434192563.PNG)  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614434211038.PNG)","category":" Counting","lang":"en","interactiveType":"venn","ansType":"mcq","type":"venn","statement":"How many ***Different*** arrangements of chairs can you have?  \\nYou can use the circles to help you count.\\n\\n\\n","explanation":"5 Blue + 0 White -> 1 way  \\n4 Blue + 1 White -> 1 way  \\n3 Blue + 2 White -> 2 ways  \\n2 Blue + 3 White -> 2 ways  \\n1 Blue + 4 White -> 1 way  \\n0 Blue + 5 White -> 1 way  \\nTotal = 8 ways","data":{"sets":[{"sets":["A"],"size":402,"label":"  ","id":0,"color":"#0090ff","selected":false,"exclude":[]},{"sets":["B"],"size":400,"label":" ","id":1,"color":"#0090ff","selected":false,"exclude":[]},{"sets":["C"],"size":400,"label":" ","id":2,"color":"#0090ff","selected":false,"exclude":[]},{"sets":["D"],"size":400,"label":" ","id":3,"color":"#0090ff","selected":false,"exclude":[]},{"sets":["E"],"size":400,"label":" ","id":4,"color":"#0090ff","selected":false,"exclude":[]},{"sets":["A","B"],"size":1,"label":" ","id":5,"color":"#000000","selected":false,"exclude":[]},{"sets":["B","C"],"size":1,"label":"  ","id":6,"color":"#000000","selected":false,"exclude":[]},{"sets":["C","D"],"size":1,"label":"  ","id":7,"color":"#000000","selected":false,"exclude":[]},{"sets":["D","E"],"size":1,"label":" ","id":8,"color":"#000000","selected":false,"exclude":[]},{"sets":["E","A"],"size":1,"label":" ","id":9,"color":"#000000","selected":false,"exclude":[]}],"type":"mcq","data":{"options":["31","32","8","7","6"],"answer":"8"}}}	MMvhVDJFZH6GHD4mYUek	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
228	90	Elementary-1	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373232649.png	t	easy	2	1622377769483	1	{"version":1,"category":"math - inequality","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","type":"exclusion_grid","statement":"Click on the correct sign (greater than/ equal to/ smaller than) so that the expressions are correct.","explanation":"Simple calculation and observation!","data":{"type":"interactive","rowHeading":["","","","",""],"columnHeading":["","","","",""],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372350574.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372985567.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373006348.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373024084.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372378146.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372415226.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372985567.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373006348.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373024084.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372427074.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372439725.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372985567.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373006348.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373024084.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372451384.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372465888.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372985567.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373006348.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373024084.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372483816.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372493747.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372985567.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373006348.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373024084.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372504599.png"]],"initialState":[[true,false,false,false,true],[true,false,false,false,true],[true,false,false,false,true],[true,false,false,false,true],[true,false,false,false,true]],"data":{"answer":[[true,false,true,false,true],[true,false,false,true,true],[true,true,false,false,true],[true,false,true,false,true],[true,true,false,false,true]]}}}	O3op8C44YE2iRtmUK9to	st1KFPBwmUNxPq6gtlcevCF7RqA3	t
52	67	Bweva and Bacteria	https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1610348470002.png	t	medium	3	1614960889814	2	{"version":1,"description":"Bweva was studying bacteriology (a biological field that studies microbe). She found that bacteria proliferate themselves into two of daughter cells. That is 1 bacteria becomes 2 by dividing itself, following each of dividing them into two more of them, total of 4, and goes on.\\n\\n ![](https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1610348470002.png)","category":"series and sequence","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"What is the number of produced bacteria after 5 proliferation, if initially the number of bacteria was 1? ","explanation":"As for every proliferation, the number doubles, it can be represented as 2^n (2 to the power n, or 2 is multiplied n times. Example: 2^3 = 2*2*2); where n= number of proliferations. This problem can be considered as introduction to exponential functions. Here the power becomes variable and so, as you can guess, the number grows very fast! ","data":{"type":"text","data":{"answer":["32","Thirty Two","thirty two","Thirty two"]}}}	EoP9DDtvvhK7gQ2RkvVc	chn4mCsrRmb1P6QXHCbrEeEpDAl2	t
249	93	Match The Cuboid	https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620524921332.PNG	t	hard	3	1622915415951	5	{"version":1,"description":"Following figure shows a partially build cuboid. \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620524921332.PNG\\n)","category":" 3D Shapes","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Which of the following pieces will complete it?\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622380862556.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622380893420.png\\n)\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622380920538.png\\n)\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622380934625.png\\n)","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620524921332.PNG\\n)\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620527313287.PNG)\\n\\n","data":{"type":"mcq","data":{"options":["A","B","C","D"],"answer":"B"}}}	uoCoZgRMSTLsJkznYbH5	sDCgfAyDqYhCWzPhpyCXj8aU0b63	t
229	90	Elementary-2	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373232649.png	t	easy	2	1622377813219	2	{"version":1,"category":"math - inequality","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","type":"exclusion_grid","statement":"Click on the correct sign (greater than/ equal to/ smaller than) so that the expressions are correct.","explanation":"Simple calculation and observation!","data":{"type":"interactive","rowHeading":["","","","",""],"columnHeading":["","","","",""],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373955287.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372985567.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373006348.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373024084.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373967975.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373977642.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372985567.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373006348.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373024084.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374007655.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374022588.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372985567.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373006348.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373024084.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374034427.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374046344.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372985567.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373006348.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373024084.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374055490.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374066516.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372985567.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373006348.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373024084.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374076361.png"]],"initialState":[[true,false,false,false,true],[true,false,false,false,true],[true,false,false,false,true],[true,false,false,false,true],[true,false,false,false,true]],"data":{"answer":[[true,true,false,false,true],[true,false,true,false,true],[true,true,false,false,true],[true,false,true,false,true],[true,false,false,true,true]]}}}	lYrQFdeyFuGqGCI8XFDj	st1KFPBwmUNxPq6gtlcevCF7RqA3	t
165	65	Three Angles - I	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618883022217.png	t	medium	2	1623344570492	3	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623344554652.png)","category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"__Determine x + y + z__","explanation":"__In this triangle,__\\n\\n(x + y) + (z + x) + (y + z) = 180\\n\\n=> 2x + 2y + 2z  = 180\\n\\n=> 2 (x+ y + z) =180\\n \\n__So, x+ y + z = 90__","data":{"type":"text","data":{"answer":["90"]}},"width":60}	FDgxl7Ovn0X7npjyzQJp	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
84	59	Breaking Cubes-III	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614089999025.png	t	hard	2	1614956714578	3	{"version":1,"description":"You are given a 3x3x3 cube made out of 27 1x1x1 cubes as follows:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614089999025.png)","category":"2d-3d shapes","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Find out the ***minimum number of*** smaller (1x1x1) cubes that must be removed so that when viewed from the ***front*** you will see the following shape:   \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614090188611.png)\\n\\nand when viewed from the*** right*** you will see the following pic:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614090204484.png)","explanation":"Taking away the following 12 cubes will give the desired result:\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614090221417.png)","data":{"type":"mcq","data":{"options":["4","7","8","11","12"],"answer":"12"}}}	hinL0w94oPvm8XiQ7N8G	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
82	59	Breaking Cubes	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614089999025.png	t	easy	2	1614956690770	1	{"version":1,"description":"You are given a 3x3x3 cube made out of 27 1x1x1 cubes as follows:\\n![](\\nhttps://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614089999025.png)","category":"2d/3d-shapes","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Find out the ***minimum number of*** smaller (1x1x1) cubes that must be removed so that when viewed from ***the front*** you will see the following shape:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614090030621.png)","explanation":"You must remove all 3 cubes along a line on the top surface to get the desired result","data":{"type":"mcq","data":{"options":["1","2","3","4"],"answer":"3"}}}	oVfllahz68Smezgi691E	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
79	40	Jumbled! (2)	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	easy	3	1614956602843	3	{"version":1,"category":" Rearrange","lang":"en","interactiveType":"rearrange","ansType":"interactive","type":"rearrange","statement":"You are given the digits from 0 to 9 and the operator '-' (Subtraction).\\nRearrange the digits to form two*** 5-digit numbers*** with ***the maximum difference possible***   \\n(the '-' operator should be between the 5 digits numbers)","explanation":"The largest 5 digit number that can be formed with the digits 0 to 9 is 98765  \\nThe smallest 5 digit number that can be formed by the remaining digits is 10234  \\n\\nNote: 01234 is not a 5 digit number, rather a 4 digit number.  \\n\\nThus the solution is 98765 - 10234","data":{"type":"interactive","fields":["0","1","2","3","4","5","6","7","8","9","-"],"data":{"answer":["9","8","7","6","5","-","1","0","2","3","4"]}}}	ZDVQqcGKvtcMBtSjTgH0	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
78	40	Jumbled!	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	hard	1	1614956635256	2	{"version":1,"category":" rearrangement","lang":"en","interactiveType":"rearrange","ansType":"interactive","type":"rearrange","statement":"You are given the following numbers. Rearrange them so that the resulting number is the largest possible.","explanation":"We need only see the digit on the highest place value for each individual number. And we arrange the numbers based on the descending order of digits at their highest place value.  9>7>5>1 So, **91**, 74, 7, **55**, 19, 105 is a probable sequence. here 91 and 55 are fixed. But 74 and 7 both have '7', & 19 and 109 both have '1' at the highest place value.  \\nIf 2 digits are equal, we compare the digits at the second highest place value. Here 9>0, so 19 comes before 105.  \\nBut 7 has anly 1 digit, whereas 74 has 2 digits (with the next digit being 4). So we compare the 2 possiblities, '7','74' = 774  is greater than '74', '7' = 747  \\nThus the required sequence is 91,7,74,55,19,105 and the required number is 917745519105","data":{"type":"interactive","fields":["105","91","55","19","74","7"],"data":{"answer":["91","7","74","55","19","105"]}}}	fqos8jBki9rBmf6QgsH7	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
80	40	Jumbled! (3)	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	medium	3	1614956595173	4	{"version":1,"category":" Rearrange","lang":"en","interactiveType":"rearrange","ansType":"interactive","type":"rearrange","statement":"You are given the digits 0 to 9 and the operator '-'  \\nRearrange to form two ***5 digit*** numbers (with a '-' in the middle), so that the difference is ***positive*** and ***the smallest possible***.","explanation":"Let A be the bigger number and B be the smaller number (to be subtracted from the bigger)  \\nThe difference must be positive, so the digit at the highest place value for A must be 1 greater than that at the highest place value of B (since we want to minimize the difference)   \\nThe following place values for A must consist of the smallest digits remaining, in an ascending order.  \\nThe corresponding place values of B must consist of the largest digits remaining, in descending order.  \\nTinkering around a bit, we see that '5' can occupy the highest place value of A, and '4' can occupy the corresponding place of B, to give the least difference.\\nThus A becomes 50123 and B becomes 49876, for a smallest positive difference of 247\\n\\n","data":{"type":"interactive","fields":["0","1","2","3","4","5","6","7","8","9","-"],"data":{"answer":["5","0","1","2","3","-","4","9","8","7","6"]}}}	EKl6EmLLAod6wZg07rWX	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
87	58	Shapes on the perimeter 2	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Zarzees/Rectangle2.jpg	t	medium	2	1614956648919	2	{"version":1,"category":" Perimeter & Area","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"If the sum of the perimeters of the squares is 48, find the area of the square drawn with AB as one of its sides.\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1613749664686.png)","explanation":"Let the sides of the squares be a, b, c, d respectively.  \\nPerimeter of a square = 4 x (length of a side)  \\nPerimeters of the squares are 4a, 4b, 4c, 4d respectively  \\nSum of the perimeters are 4a + 4b + 4c + 4d = 48 (given)  \\nOr, 4(a+b+c+d) = 48;  Or, a+b+c+d = 12, which is the length of AB  \\nThus, square drawn on AB will have area = 12 x 12 = 144\\n","data":{"type":"text","data":{"answer":["144"]}}}	3qVJG9pwwSAHyOSrZMHZ	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
91	58	A Car Race??	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1613991962568.png	t	easy	2	1623351560305	5	{"version":1,"category":"Area/Perimeter","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623351245195.png)  \\nA car is racing along a rectangular track. To finish the round quick the track is cut along the broken line. Will the car get an advantage?  \\nAssume both cases the car’s speed is same.\\n","explanation":"Both cases the perimeter is same :)","data":{"type":"mcq","data":{"options":["Yes","No","Same as before"],"answer":"Same as before"}},"width":60}	rAw88MVoPzJwsPex46lh	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
89	58	Perimeter of Your House!!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1613979701160.jpg	t	medium	2	1614960629962	3	{"version":1,"category":"Area/Perimeter","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1613979845535.png)  \\nA house whose upper part is an equilateral triangle of side length 7 and lower part is a square of area 16. What is the perimeter of the house?","explanation":"Each side of the square is 4. So perimeter is  \\n7+7+(7-4)+4+4+4=29","data":{"type":"text","data":{"answer":["29"]}}}	l3o0kjRlZlALefE1AKNq	VoTf81DreZTqGwSXurQ7g8DBnV43	t
230	90	Elementary-3	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373232649.png	t	easy	2	1622377826714	3	{"version":1,"category":"math - inequality","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","type":"exclusion_grid","statement":"Click on the correct sign (greater than/ equal to/ smaller than) so that the expressions are correct.","explanation":"Simple calculation and observation!","data":{"type":"interactive","rowHeading":["","","","",""],"columnHeading":["","","","",""],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374278559.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372985567.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373006348.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373024084.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374737082.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374747195.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372985567.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373006348.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373024084.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374756819.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374768649.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372985567.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373006348.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373024084.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374782786.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374792790.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372985567.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373006348.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373024084.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374802374.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374811998.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622372985567.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373006348.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622373024084.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622374821066.png"]],"initialState":[[true,false,false,false,true],[true,false,false,false,true],[true,false,false,false,true],[true,false,false,false,true],[true,false,false,false,true]],"data":{"answer":[[true,false,true,false,true],[true,false,false,true,true],[true,true,false,false,true],[true,false,true,false,true],[true,false,false,true,true]]}}}	MT8dnlTK6Biu2uIs4TF4	st1KFPBwmUNxPq6gtlcevCF7RqA3	t
90	58	Perimeter from Perimeter??	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1613980772491.jpg	t	medium	2	1623352261114	4	{"version":1,"category":"Area/Perimeter","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623352234638.png)  \\nThere are two equilateral triangles inside an equilateral triangle. Perimeter of the red triangle is 13 and the blue one is 12. What is the perimeter of the largest triangle?","explanation":"As BCFE is a parallelogram and BC=EF and EB=FC  \\nPerimeter of the triangle is AB+BD+DE+EF+FC+CA=AB+BD+DE+BC+EB+CA  \\n =(AB+BC+CA)+(BD+DE+EB)=13+12=25","data":{"type":"text","data":{"answer":["25"]}},"width":60}	wm2XXw0JJI2EtLHBpgRV	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
250	91	Overlapping Circles	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1622905472715.PNG	t	easy	2	1622905508169	3	{"version":1,"description":"If you take only 1 circle you can get 2 different \\"Regions\\" or \\"Areas\\"! For example:  \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1622905313107.png)  \\n\\nHere for 1 circle, we get 2 distinct \\"Regions\\",  \\n1. Outside the circle  \\n2. Inside the circle\\n","category":" 2d Shapes","lang":"en","interactiveType":"dragAndDrop-2","ansType":"mcq","type":"dragAndDrop-2","statement":"What is the maximum number of unique/different regions you can obtain by overlapping __ 2 circles__?  \\nFeel free to experiment by moving the circles!\\n\\n","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1622905179230.png)\\n\\n1. The area inside only 1st Circle (Green)\\n2. The area inside only 2nd Circle (Red)\\n3. The area inside both circles\\n4. The area outside both circles","questionnaire":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1622904505577.png",40,40,null,false,47.678244972577694,4.716636197440587],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1622904535414.png",40,40,null,false,2.376599634369287,4.570383912248629]],"data":{"type":"mcq","data":{"options":["3","4","2","1"],"answer":"4"}}}	iqk1MsDGXjZv2wQYgmwp	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
138	65	Chase Parallelogram 	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618419907892.png	t	medium	2	1627566032632	4	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623341069237.png)","hint":["![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623341057012.png)"],"category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"__Determine ⦟DOC__","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623341057012.png)\\n\\n__In △AOB,__\\n\\n⦟AOB + ⦟OAB + ⦟OBA = 180\\n\\n=> ⦟AOB + 55 + 45 = 180\\n\\n=> ⦟AOB + 100 = 180\\n\\nSo, ⦟AOB = 80\\n\\n__Now,__ \\n\\n⦟COD = AOB (Vertically Opposite angles)\\n\\n__So, ⦟COD = 80__","data":{"type":"text","data":{"answer":["80"]}},"width":80}	muFQwVNDpsZpTWSq7iCi	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
47	36	Hammers and Nails	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610334948655.png	t	medium	1	1628615601246	5	{"version":1,"description":"You feel like repairing the fence around your garden. You go to buy some planks and nails. Before setting out, you hear about the prices from your friends Dan and Mark. Calculate the amount of money you need to take with you.  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610334948655.png)","category":" Unitary Method","lang":"en","interactiveType":"none","ansType":"text","tags":["Basic","Arithmetic","Unitary","Method"],"type":"none","statement":"Dan bought 15 nails for a price of 45 Taka. Mark bought 10 planks for 90 taka. You plan on buying 10 nails and 8 planks. How much money (in Taka) should you take with you? (Write only the number as the answer)","explanation":"Price of 15 nails is 45 Taka.  \\nPrice of 1 nails is (45/15) = 3Taka.        \\nPrice of 10 nails is (3x10) = 30 Taka.\\n     \\nPrice of 10 planks is 90 Taka.  \\nPrice of 1 plank is (90/10) = 9 Taka.  \\nPrice of 8 planks is (9x8) = 72 Taka.\\n                     \\nTotal money needed (30+72) = 102 Taka\\n","data":{"type":"text","data":{"answer":["102"]}},"width":80}	4EnoIciOcplvgWeKpuYD	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
129	81	Perimeter of a cricket bat!!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1617526297943.jpg	t	easy	1	1627559219463	1	{"version":1,"description":"Perimeter is the total length of the boundary of any figure.  \\nPerimeter of a rectangle is 2×(base+height)  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623350794034.png)","category":"Perimeter","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"The length and width of an average cricket bat is 80 cm and 10 cm respectively. What is the perimeter of the bat?  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1617526621881.jpg)","explanation":"2×(length+width)=2×(80+10)=180","data":{"type":"text","data":{"answer":["180"]}},"width":60}	4phylktwkpIQm8nuzHj5	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
100	65	Angle Analysis - II	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1614487534755.png	t	medium	2	1627566011685	2	{"version":1,"description":"__ABC is a right angled triangle where ⦟ABC is our right angle__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623343037628.png)","hint":["**Can you determine ⦟ABD first?**\\n\\n\\n----------\\n\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623343055354.png)"],"category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"__Can you determine ⦟ADB?__","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623343037628.png)  \\n\\n__⦟ABC = 90__\\n\\n=> ⦟ABD + ⦟DBC = 90\\n\\n=> ⦟ABD + 40 = 90\\n\\nSo, ⦟ABD = 50\\n\\n__Now, In △ABD,__\\n\\n⦟ABD + ⦟BAD + ⦟ADB = 180\\n\\n=> 50 + 50 + ⦟ADB = 180\\n\\n__So, ⦟ADB = 80__","data":{"type":"text","data":{"answer":["80"]}},"width":90}	yZAC03kV8NpeNqyI1x5L	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
194	77	Colorful Line Segments	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/Colorful+Line+segment/line+segment.+cover.png	t	easy	3	1620287824221	4	{"version":1,"description":"The line has total 6 segments. Each blue segment has length “x”, each green segment has length “y” and the length of the red segment is 10. Total length of the line is 33 unit.\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/Colorful+Line+segment/line+segment.jpg)","category":"Foundation","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"What is simplified equation of the statement?","explanation":"x + y + 10 + x + y + x = 33\\n\\n----------\\n\\n(x + x + x) + (y + y) + 10 = 33\\n\\n----------\\n\\n3*x + 2*y + 10 = 33\\n\\n----------\\n\\n","data":{"type":"mcq","data":{"options":["3x + 2y + 10 = 33","3x + 2y - 10 = 33","2x + 3y - 33 = 10","2x + 3y + 33 = -10"],"answer":"3x + 2y + 10 = 33"}}}	l9HRGwkDXTHpPdAD07F6	Hn4jI4W0tFW6zFuXl94nd7IbieI3	t
202	87	Experimenting at School - 3	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/exp.png	t	easy	2	1620307699829	2	{"version":1,"description":"At school your friends use a ruler and a prism to compare the weight of different combinations of pencils, sharpener and an eraser. While experimenting they found for the following combinations weight was equal on both sides of the ruler.\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/keyeq2.jpg)\\n\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/eq1.png)\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/eq2.png)","category":"weight balance","lang":"en","interactiveType":"none","ansType":"mcq","tags":["Simultaneous equations"],"type":"none","statement":"If the weight of the eraser was 15 grams what will be the weight of the sharpner and eraser?","explanation":"So for the 2 cases 2 equations can be formed:\\n\\n- 2 x weight of pencil + weight of sharpener = weight of eraser\\n- weight of eraser + weight of sharpener = 4 x weight of pencil\\n\\nSince weight of eraser is 15 grams\\n\\n- 2 x weight of pencil + weight of sharpener = 15 grams ---- eq1\\n- 15 grams + weight of sharpener = 4 x weight of pencil ---- eq2\\n \\nIf eq1 is simplified:\\n\\n- weight of sharpener = 15 grams - 2 x weight of pencil ---- eq3\\n\\nIf this expression, eq3, is substituted in eq2\\n\\n- 15 grams + (15 grams - 2 x weight of pencil) = 4 x weight of pencil\\n- 15 grams + 15 grams - 2 x weight of pencil = 4 x weight of pencil\\n- 6 x weight of pencil = 30 grams\\n- weight of pencil = 5 grams\\n\\nSo if we substitute this value in eq3:\\n\\n- weight of sharpener = 15 grams - 2 x 5 grams\\n- weight of sharpener = 5 grams\\n","data":{"type":"mcq","data":{"options":["Weight of sharpener = 3 grams, Weight of pencil = 6 grams","Weight of sharpener = 5 grams, Weight of pencil = 10 grams","Weight of sharpener = 5 grams, Weight of pencil = 5 grams","Weight of sharpener = 6 grams, Weight of pencil = 5 grams","Weight of sharpener = 7 grams, Weight of pencil = 4 grams"],"answer":"Weight of sharpener = 5 grams, Weight of pencil = 5 grams"}}}	GeHcfSYvO0A0MgcS5jFv	96L7jidBxJW8vTTy6WrArU2qpd63	t
268	74	Change the Direction!	https://firebasestorage.googleapis.com/v0/b/setter-34453.appspot.com/o/download%20(1).jpg?alt=media&token=efa00589-1534-4d98-8baf-a009a819f17e	f	medium	3	1623692163639	1	{"version":1,"description":"Logical problems basically do not follow any rules. The solution has to be reached through repeated trials and errors. Here you have to solve the problem through practice as you have to work hard. Changing the position of the matchstick, creating new structures, etc. lie in the logical problem.","category":"matchstick","lang":"en","interactiveType":"matchstick","ansType":"interactive","tags":["logic,matchstick"],"type":"matchstick","statement":"The problem is that a fish structure has been created with matchsticks. __It can be seen that the fish is moving to the left__. Your job is to change the position of __any three sticks__ in such a way that the fish __turns in the opposite direction__, that is, it looks like the fish is moving to the right.\\n\\nDraw the figure on the figure-board and click on submit\\n\\n<b>Size of all the matchsticks must be unchanged And you can only move the lower matchsticks to the upper side</b>","restriction":["You can only move the lower matchsticks to the upper side"],"explanation":"Moving the three cross-marked sticks from their current position to the part marked in blue and red will turn the fish to the right.\\n![](https://bueteduproject1.s3.ap-south-1.amazonaws.com/problem_images/1596783651985_a_0.jpg)","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":24,"y1":18,"x2":23,"y2":19,"isLocked":false},{"type":"matchstick","x1":24,"y1":22,"x2":23,"y2":21,"isLocked":false},{"type":"matchstick","x1":22,"y1":20,"x2":23,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":22,"y2":20,"isLocked":false},{"type":"matchstick","x1":24,"y1":20,"x2":23,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":24,"y2":20,"isLocked":false},{"type":"matchstick","x1":25,"y1":19,"x2":24,"y2":20,"isLocked":false},{"type":"matchstick","x1":24,"y1":20,"x2":25,"y2":21,"isLocked":false}],"type":"interactive","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":24,"y1":18,"x2":23,"y2":19,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":22,"y2":18,"isLocked":false},{"type":"matchstick","x1":23,"y1":17,"x2":24,"y2":18,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":22,"y2":20,"isLocked":false},{"type":"matchstick","x1":24,"y1":20,"x2":23,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":24,"y2":20,"isLocked":false},{"type":"matchstick","x1":25,"y1":19,"x2":24,"y2":20,"isLocked":false},{"type":"matchstick","x1":24,"y1":18,"x2":25,"y2":19,"isLocked":false}]}},"width":40}	Kw0OEOUFBu8ZZtK1VfjY	I97my9P8SJhfh4WrtV4CTc8xNo92	\N
231	73	Diophantus' Epitaph	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1618894906680.png	t	medium	2	1622377871562	6	{"version":1,"description":"We know very little about the life of the mathematician Diophantus (often known as the 'father of algebra') except that he came from Alexandria and he lived around the year 250 AD.\\n\\nHowever, there remains a riddle that describes the spans of Diophantus's life:  \\n__Diophantus's youth lasted 1/6 of his life. He had the first beard in the next 1/12 of his life. At the end of the following 1/7 of his life Diophantus got married. Five years from then his son was born. His son lived exactly 1/2 of Diophantus's life. Diophantus died 4 years after the death of his son.__  ","category":"math - fraction","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622377485345.jpg)\\nDiophantus's last wish was to engrave these words on his grave. How long did he live?","explanation":"(1/6)x + (1/12)x + (1/7)x + 5 + (1/2)x + 4 = x\\n\\nSolve that equation and the solution is x = 84 years.","data":{"type":"mcq","data":{"options":["48","96","84","42"],"answer":"84"}}}	ijjaRoh0afT72XrjWeTb	st1KFPBwmUNxPq6gtlcevCF7RqA3	t
130	63	Match-sticks and Numbers!	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910467394.png	t	easy	2	1617544099434	3	{"version":1,"description":"As you can see, the given equation is not correct.","category":" MatchSticks","lang":"en","interactiveType":"matchstick","ansType":"interactive","type":"matchstick","statement":"Can you Move only 1 match-stick so that the resulting equation is correct?  \\nNote: You can't rotate the match-stick","explanation":"Move the match Marked 1 to its new place:  \\nBefore:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617540779843.PNG)  \\n\\nAfter:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617540808502.PNG)\\n\\n","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":19,"y1":17,"x2":19,"y2":21,"isLocked":false},{"type":"matchstick","x1":19,"y1":21,"x2":23,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":21,"x2":23,"y2":25,"isLocked":false},{"type":"matchstick","x1":23,"y1":25,"x2":19,"y2":25,"isLocked":false},{"type":"matchstick","x1":19,"y1":25,"x2":19,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":17,"x2":23,"y2":21,"isLocked":false},{"type":"matchstick","x1":25,"y1":21,"x2":28,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":17,"x2":19,"y2":17,"isLocked":false},{"type":"matchstick","x1":30,"y1":25,"x2":34,"y2":25,"isLocked":false},{"type":"matchstick","x1":34,"y1":17,"x2":34,"y2":21,"isLocked":false},{"type":"matchstick","x1":30,"y1":17,"x2":34,"y2":17,"isLocked":false},{"type":"matchstick","x1":34,"y1":25,"x2":34,"y2":21,"isLocked":false},{"type":"matchstick","x1":36,"y1":21,"x2":39,"y2":21,"isLocked":false},{"type":"matchstick","x1":34,"y1":21,"x2":30,"y2":21,"isLocked":false},{"type":"matchstick","x1":36,"y1":22,"x2":39,"y2":22,"isLocked":false},{"type":"matchstick","x1":41,"y1":21,"x2":41,"y2":25,"isLocked":false},{"type":"matchstick","x1":45,"y1":17,"x2":41,"y2":17,"isLocked":false},{"type":"matchstick","x1":41,"y1":25,"x2":45,"y2":25,"isLocked":false},{"type":"matchstick","x1":45,"y1":25,"x2":45,"y2":21,"isLocked":false},{"type":"matchstick","x1":45,"y1":21,"x2":45,"y2":17,"isLocked":false},{"type":"matchstick","x1":41,"y1":17,"x2":41,"y2":21,"isLocked":false}],"type":"interactive","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":19,"y1":17,"x2":19,"y2":21,"isLocked":false},{"type":"matchstick","x1":19,"y1":21,"x2":23,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":21,"x2":23,"y2":25,"isLocked":false},{"type":"matchstick","x1":23,"y1":25,"x2":19,"y2":25,"isLocked":false},{"type":"matchstick","x1":30,"y1":21,"x2":30,"y2":17,"isLocked":false},{"type":"matchstick","x1":23,"y1":17,"x2":23,"y2":21,"isLocked":false},{"type":"matchstick","x1":25,"y1":21,"x2":28,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":17,"x2":19,"y2":17,"isLocked":false},{"type":"matchstick","x1":30,"y1":25,"x2":34,"y2":25,"isLocked":false},{"type":"matchstick","x1":34,"y1":17,"x2":34,"y2":21,"isLocked":false},{"type":"matchstick","x1":30,"y1":17,"x2":34,"y2":17,"isLocked":false},{"type":"matchstick","x1":34,"y1":25,"x2":34,"y2":21,"isLocked":false},{"type":"matchstick","x1":36,"y1":21,"x2":39,"y2":21,"isLocked":false},{"type":"matchstick","x1":34,"y1":21,"x2":30,"y2":21,"isLocked":false},{"type":"matchstick","x1":36,"y1":22,"x2":39,"y2":22,"isLocked":false},{"type":"matchstick","x1":41,"y1":21,"x2":41,"y2":25,"isLocked":false},{"type":"matchstick","x1":45,"y1":17,"x2":41,"y2":17,"isLocked":false},{"type":"matchstick","x1":41,"y1":25,"x2":45,"y2":25,"isLocked":false},{"type":"matchstick","x1":45,"y1":25,"x2":45,"y2":21,"isLocked":false},{"type":"matchstick","x1":45,"y1":21,"x2":45,"y2":17,"isLocked":false},{"type":"matchstick","x1":41,"y1":17,"x2":41,"y2":21,"isLocked":false}]}}}	brJVp3RfuqUzp54b36z8	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
145	94	Triangle - II	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618021253868.png	t	medium	1	1627558258245	4	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623346651560.png)\\n\\nRemember the important property mentioned in the previous problem, __Triangle - I__?\\n\\n__The summation of the three angles of a triangle is 180 degrees__","category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Is this statement true?  \\n__\\"x & y are complementary\\"__","explanation":"__As sum of the three angles are 180,__\\n\\nx + 110 + y = 180\\n\\n=> x + y = 70\\n\\n__So, they are not complementary__\\n\\n*They would have been complementary if their summation was 90. But that is not the case here*","data":{"type":"mcq","data":{"options":["True","False"],"answer":"False"}},"width":60}	tzQqlYORUSyqxLAV0Rql	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
96	67	Joey and Even-odd Numbers!	https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1614186065468.png	t	hard	3	1619107983399	3	{"version":1,"description":"Your friend Joey is fond of even numbers and you are fond of odd numbers. One morning at 10:1 am Joey asks you a question:\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1614186065468.png)","hint":["What is the difference between consecutive even and odd number?! Wow, now I think you got it!"],"category":"series","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":" “Can you tell me the difference between the sum of odd numbers and the sum of even numbers till 101(included) if we start from 1?” \\n","explanation":"Look at the series: 1 2 3 4 5 6 …. 101 \\n\\nClosely, we have to find (1+3+….+101) - (2+4+….+100) \\n\\nNow, pairing, (1-2)+(3-4)+….+(99-100) = -1-1-1 .... = -50     \\n\\n> as there are 50 pairs.  \\n\\n\\nThe last number 101 has no pair, I.e. sum = 101-50 = 51. ","data":{"type":"mcq","data":{"options":["50","-50","51","-101"],"answer":"51"}}}	hZN8i4AbXwQAD0pL1s4M	chn4mCsrRmb1P6QXHCbrEeEpDAl2	t
232	67	Diagonal Carpet	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622018727946.jpg	t	easy	3	1622377567859	5	{"version":1,"category":"math - number series","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Sasha is making matchstick carpets! So far she has made L1 carpet (with diagonal=3) and L2 carpet (with diagonal=5). Now she has two L3 carpets. How many additional matchsticks does she need in order to make one of them into L4 carpet?\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622018521685.jpg)","explanation":"In order to make the __n__th figure from the __n-1__th figure, we need to add __3+2(n-1)+3+2(n-1)+3=4n+5__ matchsticks. Hence, From L3 to L4, we need __4*4+5=21__ matchsticks.","data":{"type":"mcq","data":{"options":["16","21","18","20"],"answer":"21"}}}	3asNZBTzpssq7NL00GKx	st1KFPBwmUNxPq6gtlcevCF7RqA3	t
32	54	Box of Chocolates	https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/UnitaryMethod/box+of+chocolates.png	t	Medium	2	1614956227416	1	{"version":1,"description":"You plan on giving each of your classmates a chocolate on your birthday. The shop only sells chocolates in boxes as shown. You must buy chocolates in boxes and then divide them individually among your friends without any leftovers.  \\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/UnitaryMethod/box+of+chocolates.png)","category":" Basic Operations","lang":"en","interactiveType":"none","ansType":"text","tags":["Basic","Arithmetic","Operations"],"type":"none","statement":"You have 60 classmates. The shop sells boxes of chocolates as shown. What is the minimum number of boxes you must buy to distribute the chocolates among your friend so that,  \\n1) everyone gets exactly 1 chocolate  \\nii) no chocolates are leftover.  \\n","explanation":"We want the minimum number of boxes, so we start with the large box.  \\nFor Large boxes (with 9 chocolates),  \\n60/9 = 6, remainder 6.  \\nSo,  6 Large boxes must be bought.  \\n\\nFor small box (with 3 chocolates),  \\nRemaining chocolates are 6  \\n3 chocoates in 1 Small box.  \\n6 chocolates in (6/3) =2 boxes.  \\nSo, 2 Small Boxes must be bought  \\n\\nTotal number of boxes =6+2 = 8 boxes. \\n","data":{"type":"text","data":{"answer":["8","Eight","eight"]}}}	Lx7xVdeEgl8lB3xjL1Yr	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
39	55	Staircase 2.0	https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/Series/staircase+with+matchstick.png	t	Medium	2	1614956260019	2	{"version":1,"description":"Barbara is building a staircase for her dolls. Use the concept of series and help her find out the number of matchsticks required in the following steps.\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/Series/staircase+with+matchstick.png)","category":" Series","lang":"en","interactiveType":"none","ansType":"text","tags":["Basic","Arithmetic","Series"],"type":"none","statement":"Barbara made the initial staircase with 3 steps as follows, with a total of 18 match sticks.\\nHow many TOTAL matches are required to make a staircase with 5 steps?\\n","explanation":"Extra Matches in,  \\nStep 1: 4  \\nStep 2: 6  \\nStep 3: 8  \\nStep 4: 10  \\nStep 5: 12    \\nTotal Matches= 4+6+8+10+12=40  \\n\\nIn general,  \\nextra matches per step=  (2+ 2n) = 2(n+1).   \\nTotal in 5 steps   = (2+2x1) + (2+2x2) + … … +(2+2x5)\\n\\t= 2x5 +2x(1+2+3+4+5)\\n\\t=10+30\\n\\t=40\\n\\nSo, for n=5, 40 Total matches are required. \\n","data":{"type":"text","data":{"answer":["40"]}}}	1fDVRZS10gjYR03NynUb	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
86	58	Shapes on the Perimeter	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Zarzees/Rectangle2.jpg	t	medium	2	1614956665978	1	{"version":1,"description":"The length of the outer edge of a bounded shape is termed as its perimeter.","category":" Perimeters","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"Line AB is a straight line with length 20. If each triangle in the figure is **equilateral**, then find out the ***sum of the perimeters* of the triangles**.  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1613749243715.png)","explanation":"Let the sides of the 1st triangle be a, those of the 2nd triangle be b and those of the 3rd triangle be c.  \\nThus, length of the line AB is a+b+c = 20 (given)  \\nAgain perimeter of 1st triangle is a+a+a = 3a (Since it is equilateral)  \\nAnd perimeter of 2nd and 3rd triangles are 3b and 3c respectively.\\nThus sum of perimeters = 3a + 3b + 3c = 3(a+b+c) = 3 x 20 = 60","data":{"type":"text","data":{"answer":["60","Sixty","sixty"]}}}	4vK34pfQPUNP8yHioJEO	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
83	59	Breaking Cubes- II	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614089999025.png	t	medium	2	1614956704178	2	{"version":1,"description":"A larger (3x3x3) cube is again formed by smaller (1x1x1) cubes, as follows:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614089999025.png)","category":"2d-3d shapes","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"***At least*** how many smaller cubes must be removed so that you see the following shape when you look from the **Front**, **Back**, **Right** and **Left** :  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614090092212.png)\\n","explanation":"You must remove 5 cubes as shown to ge the desired result:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614090113811.png)","data":{"type":"mcq","data":{"options":["1","2","4","5","8"],"answer":"5"}}}	1C2pflbtpfCgqK6bEZzF	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
251	91	Overlapping Circles 2	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1622905472715.PNG	t	medium	2	1622906121045	4	{"version":1,"category":" 2D shapes","lang":"en","interactiveType":"dragAndDrop-2","ansType":"text","type":"dragAndDrop-2","statement":"What is the maximum number of unique/different regions you can obtain by overlapping __3 circles__?  \\n\\nYou can move the given circles and try to find the answer!","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1622905954426.png)  \\n\\n1. In only 1st Circle (Purple)  \\n2. In only 2nd Circle (Green)  \\n3. In only 3rd Circle (Red)  \\n4. In 1st and 2nd, but not in 3rd  \\n5. In 1st and 3rd, but not in 2nd  \\n6. In 2nd and 3rd, but not in 1st \\n7. In all 3 circles\\n8. Outside all 3 circles  ","questionnaire":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1622905701506.png",40,40,null,false,27.020109689213896,50.786106032906766],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1622905708232.png",40,40,null,false,50.786106032906766,0.8775137111517388],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1622905714143.png",40,40,null,false,1.9744058500914097,3.0712979890310805]],"data":{"type":"text","data":{"answer":["8","Eight","eight"]}}}	O8IjDraKh3wPRsC5NTZ5	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
40	64	Paying the Builders	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Paying+the+builders/Capture71.png	t	medium	2	1614959926989	1	{"version":1,"description":"You hire a company to build a kitchen cabinet for your home. The company sends 2 workers Lita and Ben. \\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Paying+the+builders/depositphotos_43909349-stock-illustration-young-couple-installing-kitchen-cabinets.jpg)\\n\\nSince Lita is a very hard worker you wish to pay her more. The manager tells you to then to pay them separately but that you must pay each of them a minimum amount of $55.","category":"math-inequalities","lang":"en","interactiveType":"dragAndDrop-1","ansType":"interactive","type":"dragAndDrop-1","statement":"Arrange the notes in such a way so that Lita is paid more but both both Lita and Ben are paid at least $55.","explanation":"If you Give Lita the $50 note and $15 note you will pay her $65 and if you give Ben the $25 note, the $20 note and $10 note you will pay him $55. Thus you are paying both of them a minimum amount of $55 as the manager instructed you and you are also paying Lita more as you had wished to.","data":{"type":"interactive","unselected":["$25","$50","$10","$20","$15"],"containers":[{"label":"Lita","items":[]},{"label":"Ben","items":[]}],"data":{"temp":["$25","$50","$10","$20","$15"],"answer":[{"label":"Lita","items":["$50","$15"]},{"label":"Ben","items":["$10","$20","$25"]}]}}}	4CrpDufwoZeNVUihLknB	96L7jidBxJW8vTTy6WrArU2qpd63	t
19	54	Chillin' at the beach	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg	t	easy	2	1614959982721	2	{"version":1,"description":"Dan, Jim and Beth are friends. They go the beach and drink a total of 7 coconuts. Jim drank a fourth(1/4) of what Dan drank. Beth drank twice (2 times) as much as Jim.","category":"math-basic algebra","lang":"en","interactiveType":"exclusion_grid","ansType":"mcq","type":"exclusion_grid","statement":"How many coconuts did each of them drink?\\n\\nYou may use the help of the exclusion grid to find the answer.\\n","explanation":"So if Jim drinks x coconuts, Dan drinks 4x coconuts and Beth drinks 2x coconuts\\n\\nTherefore,       \\n\\n- x+4x+2x=7\\n- 7x=7\\n- X=1\\n\\nThus if Jim drinks 1 coconut, Dan drinks 4 and Beth drinks 2\\n\\nIn conclusion if Dan drinks 4 a 4th of that is (4 x ¼) = 1 thus Jim drinks 1 and 2 times of that is (1 x 2) = 2 so Beth drinks 2.\\n","data":{"type":"mcq","rowHeading":["Dan","Jim","Beth"],"columnHeading":["1st coconut","2nd coconut","3rd coconut","4th coconut","5th coconut","6th coconut","7th coconut"],"cell":[["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg"],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg"],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg","https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Chill'n+at+the+beach/Coconut_Aditto.jpg"]],"initialState":[[false,false,false,false,false,false,false],[false,false,false,false,false,false,false],[false,false,false,false,false,false,false]],"data":{"options":["Dan drank 2, Jim drank 3, Beth drank 2","Dan drank 4, Jim drank 2, Beth drank 1","Dan drank 8, Jim drank 2, Beth drank 4","Dan drank 4, Jim drank 1, Beth drank 2","Dan drank 6, Jim drank 2, Beth drank 3"],"answer":"Dan drank 4, Jim drank 1, Beth drank 2"}}}	42RMTpwaRKovFDiNAkpf	96L7jidBxJW8vTTy6WrArU2qpd63	t
63	72	Wrap a Rope!	https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1610372367097.png	t	medium	3	1627568056497	4	{"version":1,"description":"You have a rope of __length 16 unit__. You perfectly wrapped it around a rectangular gift box (no excess rope was left). But then you started to think, if you could perfectly wrap rectangular gift boxes of other areas as well, with the same length of rope.   \\n\\nFor example, you can wrap a gift box of length 7, width 1 and also a gift box of length 5 and width 3 and so on. \\n\\n> The area of a rectangle is measured by multiplying its length and width.\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1610372367097.png)","hint":["When will the product of two numbers get maximized?! ","Squares are my saviors, again?!"],"category":" Optimization","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"What is maximum size (i.e., area) of the box that can be wrapped with the rope?  \\nNote: The sides of the boxes are all integers. ","explanation":"The area of a rectangle is a product of two numbers. Try and after a while you will find out,   \\n*When their sum is fixed, the product of two numbers __is maximum when they are equal.__*  \\nFor symmetry of a rectangle, 16/2 = 8 can be partitioned into (1,7), (2,6), (3,5), (4,4). The product follows 7, 12, 15, 16(maximum when the sides are equal I.e., turns into square). ","data":{"type":"mcq","data":{"options":["7 sq. unit","16 sq. unit","20 sq. unit","14.75 sq.unit"],"answer":"16 sq. unit"}},"width":80}	gNnHP694JoQmiFDZ7Rmo	chn4mCsrRmb1P6QXHCbrEeEpDAl2	\N
112	63	Create 2 Rhombuses	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1617086617451.png	t	hard	2	1623653799019	1	{"version":1,"hint":["The rhombuses will be on top of each other."],"category":"matchstick","lang":"en","interactiveType":"matchstick","ansType":"interactive","type":"matchstick","statement":" There are 7 matchsticks in the problems.You have to move 3 matchsticks in such a way that you can create two non-intersecting rhombuses.\\n\\n__In the base of the triangle, you can see two horizontal matchsticks. You cannot move the left one AND you cannot rotate ANY matchstick__","restriction":["In the base of the triangle, you can see two horizontal matchsticks.You cannot move the left one"],"explanation":"The process is shown in the image below :\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1617086045954.png)","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":22,"y1":21,"x2":21,"y2":23,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":22,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":23,"x2":25,"y2":23,"isLocked":false},{"type":"matchstick","x1":23,"y1":23,"x2":21,"y2":23,"isLocked":false},{"type":"matchstick","x1":22,"y1":21,"x2":24,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":24,"y2":21,"isLocked":false},{"type":"matchstick","x1":24,"y1":21,"x2":25,"y2":23,"isLocked":false}],"type":"interactive","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":22,"y1":21,"x2":21,"y2":23,"isLocked":false},{"type":"matchstick","x1":24,"y1":21,"x2":23,"y2":23,"isLocked":false},{"type":"matchstick","x1":21,"y1":19,"x2":23,"y2":19,"isLocked":false},{"type":"matchstick","x1":23,"y1":23,"x2":21,"y2":23,"isLocked":false},{"type":"matchstick","x1":22,"y1":21,"x2":24,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":24,"y2":21,"isLocked":false},{"type":"matchstick","x1":21,"y1":19,"x2":22,"y2":21,"isLocked":false}]}},"width":60}	gjT5dlYu4fqFo0b0qB3o	I97my9P8SJhfh4WrtV4CTc8xNo92	\N
195	71	Shade the Triangles	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1623652055126.png	t	easy	2	1623652154942	3	{"version":1,"category":"geometry","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Area of a given rectangle is 70. Point P is situated inside the rectangle. What is the area of the shaded region?\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1623652055126.png)","explanation":"(Area of ADP)+(Area of BCP)=1/2xABxCD=1/2*(Area of ABCD)","data":{"type":"mcq","data":{"options":["35","49","7","25"],"answer":"35"}},"width":60}	3QC1rUBynNkZjiS4j3fh	st1KFPBwmUNxPq6gtlcevCF7RqA3	\N
76	60	Chair Arrangements	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614433907768.PNG	t	medium	3	1620027845708	1	{"version":1,"description":"You have two types of chairs at your home: Wholesome-White and Beautiful-Blue. You want to arrange **4 chairs** around **a circular table**.   \\nNote: the following arrangements are the same, since one can be obtained from the other just by rotation:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614433891706.PNG)  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1614433907768.PNG)","category":" Counting","lang":"en","interactiveType":"venn","ansType":"mcq","type":"venn","statement":"How many ***Different*** arrangements of chairs can you have?  \\nYou can use the circles to help you count.","explanation":"4 Blue + 0 White -> 1 way  \\n3 Blue + 1 White -> 1 way  \\n2 Blue + 2 White -> 2 ways  \\n1 Blue + 3 White -> 1 way  \\n0 Blue + 4 White -> 1 way  \\nTotal: 6 Ways","data":{"sets":[{"sets":["A"],"size":400,"label":" ","id":0,"color":"#4785ff","selected":true,"exclude":[]},{"sets":["B"],"size":400,"label":" ","id":1,"color":"#4785ff","selected":false,"exclude":[]},{"sets":["C"],"size":400,"label":" ","id":2,"color":"#4785ff","selected":false,"exclude":[]},{"sets":["D"],"size":400,"label":" ","id":3,"color":"#4785ff","selected":true,"exclude":[]}],"type":"mcq","data":{"options":["4","6","12","16"],"answer":"6"}}}	0roPUc6L5wVfxtZjz9Fo	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
179	84	Race-II	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610337328375.png	t	hard	1	1621421598979	3	{"version":1,"description":"Previously you knew that *Amber*, *Barbara*, *Caleb*, and *Derek* were running a race. Well, this is the 2nd lap of the race. You again ask your friend everyone’s positions. He again replies with riddles. Figure out the positions of the runners with the help of the reliable Exclusion Grid.\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610337328375.png)","category":"logical reasoning - exclusion grid","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","tags":["Exclusion Grid","Logical Reasoning","Logic"],"type":"exclusion_grid","statement":"Your friend says:  \\n\\n**1.** *Caleb* is behind *Derek*.  \\n**2.** *Derek* is not in first nor in last.  \\n**3.** *Barbara* is not in second nor in third.  \\n**4.** *Amber* is behind *Caleb*.  \\n \\nFind out the positions of the runners.\\n","explanation":"1,2 => Derek can be 2nd and Caleb can be 3rd OR Derek can be 3rd and Caleb can be 4th --------(5)  \\n3=> Barbara must be 1st or 4th  \\n5, 4 => Amber must be 4th, Caleb 3rd, Derek 2nd. This means Barbara is 1st. \\n","data":{"type":"interactive","rowHeading":["Amber","Barbara","Caleb","Derek"],"columnHeading":["1st","2nd","3rd","4th"],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"]],"initialState":[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],"data":{"answer":[[false,false,false,true],[true,false,false,false],[false,false,true,false],[false,true,false,false]]}}}	SoaXVy62SqN7Z6dKpeY8	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
23	36	Trips to the Store II	https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/UnitaryMethod/Flour.jpg	t	easy	1	1623853859678	2	{"version":1,"description":"Remember Dan the Baker? Last time he needed your help in buying milk. This time he needs flour. The same grocery store sells flour. Help him count the number of trips to the store.  \\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/UnitaryMethod/Flour.jpg)","category":" Unitary Method","lang":"en","interactiveType":"none","ansType":"text","tags":["Basic","Arithmetic","Unitary","Method"],"type":"none","statement":"Dan needs a total of 60 kg of flour. *The shop sells flour in 5 kg sealed bags that __cannot be opened at the store__.* Dan can carry a maximum of 12 kg per trip. How many trips to the shop does he need?","explanation":"__Dan CANNOT open a bag__  \\nSo, although he can carry a maximum of 12 kg,__ he has to buy 2 bags of flour (10kg) each trip.  __  \\n*(Since 3 bags weigh 3x5=15 kg which is more than what he can carry.)*\\n\\n5 kg of flour can be obtained by buying 1 bag.  \\n60 kg can be obtained by buying (60/5) = 12 bags  \\n__So, he needs to buy a total of 12 bags__\\n\\nHe can carry 2 bags in 1 trip.  \\nSo, he can carry 12 bags in 12/2 = 6 trips.  \\n__Therefore, he needs 6 trips in total.__\\n","data":{"type":"text","data":{"answer":["6","six","Six"]}},"width":70}	43wiE3rtgmV3ZkYFf01V	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
133	82	Adversity - I	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618021253868.png	t	easy	1	1627555881150	2	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623345153678.png)","category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"__Determine y__","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623345153678.png)\\n\\n\\n__⦟BOC  = y (vertically opposite angles)__\\n\\n__Now, along line AD,__\\n\\n108 + y + 43 = 180\\n\\n=> 151 + y = 180\\n\\n=> y = 180 - 151\\n\\n__So, y = 29__","data":{"type":"mcq","data":{"options":["39","29","24","43"],"answer":"29"}},"width":60}	jz94jtPkZSAJDcL6hVlZ	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
252	92	Overlapping Circles 3	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1622905472715.PNG	t	hard	2	1622910975971	3	{"version":1,"category":" 2D shapes","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"You might have noticed a pattern by now.  \\nWhat is the maximum number of unique/different regions you can obtain by overlapping __7 circles__","explanation":"1 Circle gives 2 unique regions.  \\n2 Circles give 4 unique regions.  \\n3 Circles give 8 unique regions.  \\nSo, n circles give 2^n unique regions.  \\nThus, 7 circles give 2^7 = 128 unique regions.","data":{"type":"text","data":{"answer":["128"]}}}	KCR786JHLYvnBew8KTfm	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
197	73	A Long Day	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Currency+Confusion/curr.png	t	hard	2	1620385553555	5	{"version":1,"description":"You have Tk 3000 with you. After a meal with friends your bill was Tk 2000. You decide to split the bill and that you have to pay 30% of the bill. On the way home you see a childrens charity and decide to donate 2/3rds of what you have left.","category":"fractions","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"What amount do you have left when you arrive home if you spend no more money that day?\\n\\n**(Enter the answer in the form Tk Amount there should be a space between Tk and the amount eg. Tk 400)**","explanation":"If you pay 30% of the bill you will spend\\n\\n- 30% of Tk 2000\\n- =30/100 x Tk 2000\\n- =Tk 600\\n\\nThen you will have Tk 2400 left\\n\\n- Tk 3000 - Tk 600\\n- =Tk 2400\\n\\nIf you donate 2/3rds of what you have left you will have donated\\n\\n- 2/3 x Tk 2400\\n- =Tk 1600\\n\\nThat means you will have Tk 800 left when you get home\\n\\n- Tk 2400 - Tk 1600\\n- =Tk 800","data":{"type":"text","data":{"answer":["Tk 800"]}}}	n4EaBQnKVyGpOQuee21D	96L7jidBxJW8vTTy6WrArU2qpd63	t
201	87	Experimenting at School - 2	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/exp.png	t	easy	2	1620308485364	1	{"version":1,"description":"Your friends are again experimentiong with the ruler and the prism but this time they are using different pencils, sharpners and eraser. The following combinations the ruler is balanced.\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/keyeq2.jpg)\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/eq3.png)\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/eq2.png)","category":"weight balance","lang":"en","interactiveType":"none","ansType":"mcq","tags":["Simultaneous equations"],"type":"none","statement":"If the weight of the sharpner is 3 grams what the weight of the eraser and the pencil?","explanation":"So for the 2 cases 2 equations can be formed:\\n\\n- weight of eraser = 3 x weight of pencil + weight of sharpener\\n- weight of eraser + weight of sharpener = 4 x weight of pencil\\n\\nSince weight of sharpener is 3 grams\\n\\n- weight of eraser = 3 x weight of pencil + 3 grams ---- eq1\\n- weight of eraser + 3 grams = 4 x weight of pencil ---- eq2\\n \\nIf this expression for weight of eraser, eq1, is substituted in eq2\\n\\n- (3 x weight of pencil + 3 grams) + 3 grams = 4 x weight of pencil\\n- 3 x weight of pencil + 3 grams + 3 grams = 4 x weight of pencil\\n- weight of pencil = 6 grams\\n\\nSo if we substitute this value in eq1:\\n\\n- weight of eraser = 3 x 6 grams + 3 grams\\n- weight of eraser = 21 grams\\n","data":{"type":"mcq","data":{"options":["Weight of eraser = 21 grams, Weight of pencil = 6 grams","Weight of eraser = 20 grams, Weight of pencil = 6 grams","Weight of eraser = 21 grams, Weight of pencil = 9 grams","Weight of eraser = 24 grams, Weight of pencil = 7 grams","Weight of eraser = 24 grams, Weight of pencil = 9 grams"],"answer":"Weight of eraser = 21 grams, Weight of pencil = 6 grams"}}}	EW1ttOtfb2US8DCSu9IK	96L7jidBxJW8vTTy6WrArU2qpd63	t
103	73	Tomorrow's Portion	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Cake/Content_pastry.png	t	medium	2	1621664769913	1	{"version":1,"description":"A cake has been cut into 20 equal pieces. Your sister loves cake but she is also trying to maintain her weight. She tells you that she tells you that she can only eat upto 600 calories.","category":"fractions","lang":"en","interactiveType":"dragAndDrop-2","ansType":"mcq","type":"dragAndDrop-2","statement":"If each each piece of cake is 200 calories and you eat 3 pieces yourself; calsulate how may pieces your sister eats and hence deduce what fraction of the cake is left after you and your sister have finished eating.\\n\\n(You may move the pieces you and your sister have eaten to the tray to help deduce the answer)","explanation":"If your sister eats upto 600 calories and each piece is 200 calories she eats 3 pieces. As\\n\\n- 600/200 = 3\\n\\nIf you eat 3 more pieces that means together you and your sister has eaten 6 pieces and only 4 pieces are left.\\nSo,\\n\\n- 4/10 =2/5\\n\\nThus 2/5th of the entire cake is left.","questionnaire":[["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Cake/Tray.png",80,55,0,true,9.77848101265823,43.95569620253165],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Cake/Content_pastry.png",14,12,0,false,5.664556962025318,22.911392405063292],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Cake/Content_pastry.png",14,12,0,false,76.07594936708861,22.911392405063292],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Cake/Content_pastry.png",14,12,0,false,23.38607594936709,21.962025316455698],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Cake/Content_pastry.png",14,12,0,false,58.5126582278481,22.911392405063292],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Cake/Content_pastry.png",14,12,0,false,40.63291139240506,23.069620253164558],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Cake/Content_pastry.png",14,12,0,false,76.23417721518987,3.4493670886075964],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Cake/Content_pastry.png",14,12,0,false,5.822784810126584,3.607594936708862],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Cake/Content_pastry.png",14,12,0,false,58.67088607594937,3.9240506329113938],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Cake/Content_pastry.png",14,12,0,false,40.949367088607595,4.240506329113925],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Cake/Content_pastry.png",14,12,0,false,23.38607594936709,3.9240506329113938]],"data":{"type":"mcq","data":{"options":["Your sister ate 4 pieces and 3/10th of the cake is left.","Your sister ate 3 pieces and 3/5th of the cake is left.","Your sister ate 3 pieces and 2/5th of the cake is left.","Your sister ate 2 pieces and 1/2th of the cake is left."],"answer":"Your sister ate 3 pieces and 2/5th of the cake is left."}}}	BaUQxHE0S7bsLxKnpEHJ	96L7jidBxJW8vTTy6WrArU2qpd63	t
104	73	Sleepover	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/pizza/piece+1.png	t	easy	2	1615119282963	2	{"version":1,"description":"You are having a sleepover at your house. Your mother decides to order pizza for you and your friends. When the pizza arrives it has already been cut into 8 slices.","category":"fractions","lang":"en","interactiveType":"dragAndDrop-2","ansType":"text","type":"dragAndDrop-2","statement":"If you ate 1/4th of the entire pizza, how many slices did you have?\\n\\n(You may move the slices you have eaten to the outline below to help deduce the answer)","explanation":"There are 8 slices. If you eat 1/4 of it you will have eaten \\n8x1/4 pieces. So that means you have eaten 2 slices.\\n\\n- 8x1/4 = 2 ","questionnaire":[["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/pizza/Content_pizza+outline.jpg",65,43,0,true,15.4746835443038,48.06962025316456],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/pizza/Content_pizza+outline.jpg",65,43,0,true,15.4746835443038,2.6582278481012676],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/pizza/piece+1.png",13,18,0,false,48.54430379746835,25.917721518987346],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/pizza/piece+1.png",13,18,45,false,46.962025316455694,25.75949367088608],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/pizza/piece+1.png",13,18,90,false,46.0126582278481,24.65189873417722],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/pizza/piece+1.png",13,18,135,false,46.32911392405063,23.38607594936709],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/pizza/piece+1.png",13,18,180,false,47.436708860759495,22.436708860759495],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/pizza/piece+1.png",13,18,225,false,49.01898734177215,22.753164556962027],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/pizza/piece+1.png",13,18,270,false,49.81012658227848,23.38607594936709],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/pizza/piece+1.png",13,18,315,false,49.651898734177216,24.96835443037975]],"data":{"type":"text","data":{"answer":["2"]}}}	wWlLnzJ3OI1BBd2ncGDb	96L7jidBxJW8vTTy6WrArU2qpd63	t
17	33	Counter-Intuitive?	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1617521672531.jfif	t	medium	1	1623854522741	1	{"version":1,"description":"___Area of a triangle is =1/2___ × ___base___ × ___height___\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623346375168.png)","category":"geometry","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"__Which triangle has the largest area?__\\n\\n\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623346339930.png)","explanation":"They all have same base and height.  \\nSo all have the same area.","data":{"type":"mcq","data":{"options":["The one with pink sides","The one with red sides","The one with blue sides","All have the same area"],"answer":"All have the same area"}},"width":90}	y83bUk0dM6hPYpAnu91G	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
175	33	It's Pizza Time!!!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1619259293977.png	t	hard	1	1627559676144	6	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623346487900.png)  \\nArea of a rectangle=  __base×height__","hint":["Compare the area ;)"],"category":"Area","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1619259447519.png)  \\nYou can take only one pizza. Which one should you pick, if you want to eat more?  \\n(Hint: Greater area means more pizza for you to eat!!) ","explanation":"Area of the left one = 4×4=16  \\nArea of the right one=5×3=15  \\nSo you can eat more amount if you choose the left one :)","data":{"type":"mcq","data":{"options":["The Left One","The Right One"],"answer":"The Left One"}},"width":80}	J4BLT2Iiqjb8Akq00VMD	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
22	36	Trips to the Store	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1621447638338.png	t	easy	1	1623853971615	1	{"version":1,"description":"Dan needs milk for his bakery. The grocery shop sells milk. Using Unitary Method, help Dan figure out how many trips to the shop he needs.  \\n\\n  \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1621447638338.png)","category":" Unitary Method","lang":"en","interactiveType":"none","ansType":"text","tags":["Basic","Arithmetic","Unitary","Method"],"type":"none","statement":"Dan needs a total of 11 liters. The shop sells milk in 2 liter containers. Dan can carry 1 container at a time. At least how many trips to the shop does he need?\\n","explanation":"2 liters of milk can be obtained by buying 1 container.  \\n11 liters can be obtained by buying 11/5 containers = 5 and a half containers.\\nThere is no such thing as half a container. Thus he must buy 6 containers  \\n\\nHe can carry 1 container in 1 trip.  \\nSo, he must carry 6 containers in 6 trips.\\n","data":{"type":"text","data":{"answer":["six","Six","6"]}},"width":60}	yvm3hOMnQ3AQtLh8uoSp	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
255	74	How Many? - I	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623289331896.png	t	easy	3	1623657894979	3	{"version":1,"description":"Think of a scenario. You need to make vanish __exactly __2 squares. But you also need to do that by removing matchsticks__ as few as possible__.\\n\\nPlease note the following things\\n\\n* There are 5 squares __already__. That means you need to reduce them to 3\\n* You can __neither __rotate the matchsticks __nor __change their size\\n* Each of the remaining matchsticks __must participate__ in forming the remaining squares i.e. __no matchsticks can be left alone__","category":" MatchSticks","lang":"en","interactiveType":"matchstick","ansType":"text","type":"matchstick","statement":"What is the __minimum__ number of matchsticks you __must__ remove without which your goal cannot be accomplished?","explanation":"__See the following two pictures__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623355178356.png)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623355195279.png)","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":22,"y1":23,"x2":22,"y2":26,"isLocked":false},{"type":"matchstick","x1":25,"y1":23,"x2":22,"y2":23,"isLocked":false},{"type":"matchstick","x1":22,"y1":26,"x2":25,"y2":26,"isLocked":false},{"type":"matchstick","x1":25,"y1":26,"x2":25,"y2":23,"isLocked":false},{"type":"matchstick","x1":28,"y1":26,"x2":25,"y2":26,"isLocked":false},{"type":"matchstick","x1":28,"y1":26,"x2":28,"y2":23,"isLocked":false},{"type":"matchstick","x1":25,"y1":23,"x2":28,"y2":23,"isLocked":false},{"type":"matchstick","x1":31,"y1":23,"x2":28,"y2":23,"isLocked":false},{"type":"matchstick","x1":28,"y1":26,"x2":31,"y2":26,"isLocked":false},{"type":"matchstick","x1":31,"y1":26,"x2":31,"y2":23,"isLocked":false},{"type":"matchstick","x1":28,"y1":23,"x2":28,"y2":20,"isLocked":false},{"type":"matchstick","x1":28,"y1":20,"x2":31,"y2":20,"isLocked":false},{"type":"matchstick","x1":31,"y1":20,"x2":31,"y2":23,"isLocked":false},{"type":"matchstick","x1":22,"y1":29,"x2":22,"y2":26,"isLocked":false},{"type":"matchstick","x1":25,"y1":29,"x2":25,"y2":26,"isLocked":false},{"type":"matchstick","x1":22,"y1":29,"x2":25,"y2":29,"isLocked":false}],"type":"text","data":{"answer":["2"]}},"width":60}	pjNhFalEmlPwEDLpAZZ0	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
205	69	Easy?	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1620552171678.png	t	easy	3	1620552904065	1	{"version":1,"description":"**ABC is a right angled triangle** & **ADC is a semi-circle**\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1620552182732.png)","hint":["Find the area of **triangle** and **semi-circle** separately"],"category":" Area","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"**Find the total area**","explanation":"**Step 1 (Triangle):**\\n\\nApplying **Pythagoras's Theorem** in △ABC, AB = 6\\n\\n**So, area of *△ABC* = (1/2)×8×6 = 24**\\n\\n**Step 2 (Semi-circle):**\\n\\nIts diameter = 10\\n\\nSo, radius = 10/2 = 5\\n\\n**Thus, area of *semi-circle ADC* **\\n\\n= (1/2)×πr<sup>2</sup> \\n\\n= (1/2)×π×5<sup>2</sup> \\n\\n= 12.5π\\n\\nSo, the total area = **24 + 12.5π**\\n","data":{"type":"mcq","data":{"options":["24 + 50π","48 + 25π","48 + 12.5π","24 + 12.5π"],"answer":"24 + 12.5π"}}}	hivVDjMYoxVQSSdPfX64	Duq6BDGCyAa5rLnIXML1yOjdOQp1	t
135	78	Make 6 from 3	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1618048081295.png	f	hard	1	1618065403391	3	{"version":1,"hint":["Think of Roman numerals."],"category":"matchstick","lang":"en","interactiveType":"matchstick","ansType":"interactive","type":"matchstick","statement":"You can see three matchsticks here.You have to organize the matchsticks in such a way that it represents 6.\\n\\n","explanation":"You can easily make roman  V| (6)  by using three matchsticks .","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":20,"y1":19,"x2":20,"y2":21,"isLocked":false},{"type":"matchstick","x1":21,"y1":19,"x2":21,"y2":21,"isLocked":false},{"type":"matchstick","x1":22,"y1":19,"x2":22,"y2":21,"isLocked":false}],"type":"interactive","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":20,"y1":19,"x2":21,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":23,"y2":21,"isLocked":false},{"type":"matchstick","x1":22,"y1":19,"x2":21,"y2":21,"isLocked":false}]}},"width":80}	ddUhItWlL5AmKFQpmatI	I97my9P8SJhfh4WrtV4CTc8xNo92	\N
234	89	Secret Digits 2	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622375188545.PNG	t	easy	2	1623653557796	2	{"version":1,"category":"math - backtracking","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"The following is a valid sum where the digits are replaced by A, B and C. Similar letters represent similar digits and different digits represent different digits. What is the value of __AxBxC__?  \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622009303239.jpg)","explanation":"Value of CCC cannot be more than 9+9+99=117. Hence, C=1. Now, if B<9, then A>=11. Hence, B=9 and A=6. Therefore, __AxBxC=6x9x1=54__","data":{"type":"mcq","data":{"options":["54","48","90","63"],"answer":"54"}},"width":50}	JqFijYIKs8dxmGXiX82Q	st1KFPBwmUNxPq6gtlcevCF7RqA3	\N
259	74	Shape With Matchstick - II	https://firebasestorage.googleapis.com/v0/b/setter-34453.appspot.com/o/ShapeWithMatchstick.PNG?alt=media&token=20f22e8a-62fb-4199-b220-f460f8fc2d0a	f	medium	3	1623386063493	6	{"version":1,"hint":["2"],"category":" MatchSticks","lang":"en","interactiveType":"matchstick","ansType":"interactive","type":"matchstick","statement":"There is __only__ 1 square. Can you manage to turn them into 3 squares by moving matchsticks?\\n\\nPlease note the following things\\n\\n* You must move __exactly__ 3 matchsticks. Among these three, __2 matchsticks must be horizontal__ and __1 must be vertical__\\n* You can __neither __rotate the matchsticks __nor __change their size\\n* Each of the matchsticks __must participate__ in forming the remaining squares i.e. __no matchsticks can be left alone__","explanation":"Notice the __below two pictures__ to know __which matchstick to move__ and __where to move__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623385991508.png)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623386014782.png)\\n","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":23,"y1":23,"x2":23,"y2":26,"isLocked":false},{"type":"matchstick","x1":26,"y1":23,"x2":23,"y2":23,"isLocked":false},{"type":"matchstick","x1":26,"y1":26,"x2":26,"y2":23,"isLocked":false},{"type":"matchstick","x1":23,"y1":26,"x2":26,"y2":26,"isLocked":false},{"type":"matchstick","x1":23,"y1":20,"x2":23,"y2":23,"isLocked":false},{"type":"matchstick","x1":26,"y1":20,"x2":26,"y2":23,"isLocked":false},{"type":"matchstick","x1":29,"y1":23,"x2":26,"y2":23,"isLocked":false},{"type":"matchstick","x1":29,"y1":26,"x2":26,"y2":26,"isLocked":false},{"type":"matchstick","x1":20,"y1":23,"x2":23,"y2":23,"isLocked":false},{"type":"matchstick","x1":20,"y1":26,"x2":23,"y2":26,"isLocked":false},{"type":"matchstick","x1":23,"y1":29,"x2":23,"y2":26,"isLocked":false},{"type":"matchstick","x1":26,"y1":29,"x2":26,"y2":26,"isLocked":false}],"type":"interactive","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":20,"y1":23,"x2":20,"y2":26,"isLocked":false},{"type":"matchstick","x1":23,"y1":23,"x2":20,"y2":23,"isLocked":false},{"type":"matchstick","x1":20,"y1":26,"x2":23,"y2":26,"isLocked":false},{"type":"matchstick","x1":23,"y1":26,"x2":23,"y2":23,"isLocked":false},{"type":"matchstick","x1":23,"y1":23,"x2":26,"y2":23,"isLocked":false},{"type":"matchstick","x1":23,"y1":20,"x2":23,"y2":23,"isLocked":false},{"type":"matchstick","x1":26,"y1":23,"x2":26,"y2":20,"isLocked":false},{"type":"matchstick","x1":26,"y1":20,"x2":23,"y2":20,"isLocked":false},{"type":"matchstick","x1":23,"y1":29,"x2":23,"y2":26,"isLocked":false},{"type":"matchstick","x1":26,"y1":26,"x2":23,"y2":26,"isLocked":false},{"type":"matchstick","x1":26,"y1":29,"x2":23,"y2":29,"isLocked":false},{"type":"matchstick","x1":26,"y1":26,"x2":26,"y2":29,"isLocked":false}]}},"width":60}	JL2NiPBvQ468yWY0qPJ7	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
108	54	Game of Precedence	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1616949816774.png	t	medium	2	1621678224314	3	{"version":1,"description":"Suppose , we live in a world where the precedence of  the operator\\n__+__ and  __-__ is greater than that of __*__ and __/__.You are given a mathematical expression where some operators are missing. You are asked to find the results.Can you do that?","category":"basic operation","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"__The expression is 5?3*4-10?2=-24\\nHere missing operators are presented as '?' symbol.Choose the correct operators.__","explanation":"Correct operators are  + and /.\\nThen the expression will become :\\n= 5 + 3 __ 4 - 10 / 2 <br>\\n= (5 + 3 )__ 4 - 10 / 2 <br> (5+3 is grouped as the precedence of + is high according to the problem statement)<br>\\n= 8 * * (4 - 10) / 2 <br>\\n= 8 __ -6 / 2 <br>\\n= 8 __ - 3 <br>\\n=-24\\n\\n\\n\\n                                          \\n\\n\\n","data":{"type":"mcq","data":{"options":["/ , +","* , -","+ , /","- , /"],"answer":"+ , /"}}}	JcEd6D7kFNwickoFux7U	I97my9P8SJhfh4WrtV4CTc8xNo92	t
182	85	Sudoku!	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	easy	1	1623855712668	1	{"version":1,"description":"This is a 4x4 sudoku square:  \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1621332143214.PNG)\\n\\n\\nThis square has the numbers 1 to 4 appearing __exactly once__ \\n\\n- across each row and \\n- across each column","hint":["Extra Observation:  \\nThe numbers 1 to 4 also appear exactly once in every __quadrant__. That is, each 2x2 square in the corners also have the numbers 1 to 4 exactly once."],"category":"Sudoku","lang":"en","interactiveType":"dragAndDrop-3-Grid","ansType":"interactive","type":"dragAndDrop-3-Grid","statement":"Can you filll up the 3x3 square so that it is a sudoku square?","explanation":"As we can see, each row and each column has the numbers 1 to 3 exactly once.  \\n![](\\nhttps://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620020859318.PNG)","data":{"type":"interactive","unselected":["1","2","3"],"active":[false,false,true,false,true,false,true,false,false],"nCols":3,"nRows":3,"containers":[{"label":"1","items":[]},{"label":"3","items":[]},{"label":" ","items":[]},{"label":"2","items":[]},{"label":" ","items":[]},{"label":"3","items":[]},{"label":" ","items":[]},{"label":"2","items":[]},{"label":"1","items":[]}],"data":{"temp":["1","2","3"],"answer":[{"label":"1","items":[]},{"label":"3","items":[]},{"label":" ","items":["2"]},{"label":"2","items":[]},{"label":" ","items":["1"]},{"label":"3","items":[]},{"label":" ","items":["3"]},{"label":"2","items":[]},{"label":"1","items":[]}]}},"width":70}	9ErZjOYiteFX0k0Jv4gu	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
217	60	Chandler Collects Eggs	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1619400127057.jpg	t	medium	3	1623170425121	7	{"version":1,"category":"combinatorics","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"This time Chandler has an egg carton. He has an infinite number of 3 kinds of eggs: brown, white and spotted eggs. He wants to fill up the whole carton with eggs, but wants to know how many different ways he can fill up the carton. \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1619400127057.jpg)\\nIf the carton can hold 6 eggs, how many different ways can he do it?\\n\\n","explanation":"He can put 3 kinds of eggs in each spaces. Hence the answer is  \\n3 x 3 x 3 x 3 x 3  x 3 = 3^6 = 729.","data":{"type":"mcq","data":{"options":["18","216","729","27","486"],"answer":"729"}}}	pBfhaPGrXfXYNe1KcsSa	st1KFPBwmUNxPq6gtlcevCF7RqA3	\N
13	61	Pilgrim’s Dilemma	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Anup/Wise+Pilgrim+Series/Ques_1/1.png	t	medium	3	1623519432306	1	{"version":1,"description":"In real life, many of our problems can be easily solved if we can eliminate the wrong choices. The best approach is to assume one option to be true and then find if are any contradictions. In the case if any contradictions are found we can eliminate the option and repeat the process with the rest of the options until we are left with just one option.","category":"logical problems","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"One day, an old but wise pilgrim reaches a village on the way to an ancient temple. The village road split into two separate paths. He remembers one of them leads to a jungle and the other to the temple. His memory had grown fuzzy and he had forgotten which path led to the temple.\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Anup/Wise+Pilgrim+Series/Ques_1/1.png)\\n\\nHe asks villagers which path lead to the temple. He remembers that there was one villager who always lies but the others always speak the truth. One of the villagers answered:\\n\\n> __\\"If you ask anyone in the village they will say that the left path leads to the temple.\\"\\n__\\n\\nThe pilgrim smiled and decided which way to go without needing to ask anyone else.  \\n\\n__Can you guess which path leads to the temple?__\\n","explanation":"Let us first assume that the person isn’t the liar. Therefore, his statement must be true. But we know that someone must lie, so, if everyone but the liar tells the truth, they all cannot agree on the same answer. For example, if the left path actually leads to the temple, then the liar would show the right path and the rest of the villagers would show the left path. Hence, the person cannot be telling the truth. So, the pilgrim should take the right path to reach the temple.","data":{"type":"mcq","data":{"options":["Left","Right"],"answer":"Right"}},"width":80}	igMiw4326dRNMBpXEa5k	8Xq06Cpjf6bingRbcoqRnNyTPdg1	\N
42	39	Currency Confusion	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Currency+Confusion/curr.png	t	hard	1	1614959957875	4	{"version":1,"description":"During her trip in Singapore a girl decides to buy a Nintendo Switch.\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Currency+Confusion/BWMVOAMJ4VB4POY5JPXRA2IYZA.jpg)\\n\\nAfter the purchase she has S$(Singapore dollar) 75 left. She had converted Tk 30000 to Singapore dollars before the trip. The conversion rate is such that S$ 1 is Tk 60.","category":"math-basic algebra","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"What was the price of the Switch in Singapore dollars?\\n","explanation":"If price of the Switch in Singapore dollars is X  \\n\\nThen,    \\n\\n- 60* (X + 75) = 30000\\n- (60 * (X + 75))/60 = 30000/60\\n- X + 75 = 500\\n- X +75 – 75 = 500 - 75\\n- X = 425\\n\\nShe converted Tk 30000 so she had S$ (30000/60) = S$ 500. If she has S$ 75 left after buying the Switch then the price of the Switch is S$ 500 – S$ 75 = S$ 425.","data":{"type":"mcq","data":{"options":["S$ 500","S$ 475","S$ 400","S$ 425","S$ 350"],"answer":"S$ 425"}},"width":60}	vrvkMQxTK67ibRWtQrmA	96L7jidBxJW8vTTy6WrArU2qpd63	\N
111	69	Find the area !!	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1617082566115.png	t	hard	3	1617082588753	7	{"version":1,"category":"area/volume","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1617081198550.PNG)\\n\\nAs you can see in the picture , there is a triangle and inside the triangle, there is some portion of three circles coloured in red.You have to find the area of the blue part. Can you do it?","explanation":"We can solve the problem by finding the whole area of the triangle and three red-colored parts of the circles. And finally, if we subtract the area of the red-colored circles from the whole area, we will find the area of the blue-colored part.\\n\\nThe area of the triangle is : √3/4 * (8 * * 8) = 27.71\\n\\nAs it is an equilateral triangle, every angle is 60 degrees.The radius of each of the circles is 4. The red-colored circle is 60/360 =1/6 part of the full circle.\\nSo the area of each red-colored circle is 1/6 x 3.1416 x 4^2=8.3776\\n\\nFinally , the area of the blue colored oart is =27.71 - 3 x 8.3776 =2.58","data":{"type":"mcq","data":{"options":["2.33","2.55","2.58","2.93","3.11"],"answer":"2.58"}}}	QhXozMUw1jyLVMc22mBZ	I97my9P8SJhfh4WrtV4CTc8xNo92	t
114	76	Beginner's Dart II	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617082081848.png	t	medium	1	1620121726890	2	{"version":1,"description":"You are new to the game of Darts. You know that, if a dart hits   \\nthe **Yellow** region, its worth **1 point**  \\nthe **Orange** region, its worth  **2 points**  \\nthe **Red** regions, its worth **3 points**  \\n**outside the board** (that is, a miss), its worth **0 points**  \\nThough you're a beginner at darts, you're good at maths and problem solving","category":" Counting - ","lang":"en","interactiveType":"dragAndDrop-2","ansType":"mcq","type":"dragAndDrop-2","statement":"You have 3 different colored darts. You throw the first dart (colored red) and it lands on the **Yellow** region. Lets say you throw the blue dart 2nd, and the green dart last. You haven't practiced for quite some time and you **CAN MISS** your next two throws. In how many ways can your score be 4 at the end of your 3 throws?","explanation":"Your 1st red dart landed on the yellow region, so you have 1 points and 2 darts left.  **You need to score exactly 3 in the next 2 throws to end up with a TOTAL score of 4.** This can be done in the following ways:  \\n2nd Dart - 3rd Dart  \\n0 points  + 3 points  = 3  \\n1 point + 2 points  = 3  \\n2 points + 1 point = 3  \\n3 points + 0 point = 3  \\nresulting in **4 different ways,** to score 3 points from your 2 throws. ","questionnaire":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617082081848.png",110,90,null,true,0.32906764168190333,9.287020109689216],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620121605072.png",20,20,null,false,59.56124314442413,0.8775137111517388],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620121614303.png",20,20,null,false,37.25776965265082,0.32906764168190333],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620121623181.png",20,20,null,true,19.195612431444243,14.259597806215723]],"data":{"type":"mcq","data":{"options":["2","3","4"],"answer":"4"}}}	Kenoj2MrOJUdoVFUPky4	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
235	51	Hangout	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610337408207.png	t	medium	3	1621309248089	5	{"version":1,"description":"Jamal will meet with five of his friends today, *Danny*, *Moris*, *Ehab*, *Bill* and *Rajesh*. They will arrive at different locations of the city at different\\ntimes. However, he did not note down the locations and the times in an orderly manner, but only wrote little logical sentences.\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610337408207.png)","category":"logical reasoning- exclusion grid","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","tags":["Exclusion Grid","Logical Reasoning","Logic"],"type":"exclusion_grid","statement":"From the clues in his notes, can you determine the name of his friends,\\ntheir destination and arrival times?\\n\\n1. Ehab (arriving at Adabar), arrives before only one other friend.\\n2. Rajesh (arriving before at least 3 other friends) will not arrive at Adabar.\\n3. Moris (not arriving at 12:15) arrives sometime after Danny, who arrives before Rajesh.\\n4. The earliest person comes at Mirpur, but is not Bill, nor Ehab.\\n5. The person to arrive at Gulshan, is at least 10 minutes later than the person planned to arrive at Banani.\\n6. Moris is coming at Lalbagh sometime after 12:01.","explanation":"1-> Ehab arrives Adabar at 12:10\\n\\n3 & 6-> Moris arrives Lalbagh at 12:05\\n\\n3 & 2-> Rajesh arrives at 12:01, Danny arrives at 12:00. Therefore, Bill arrives at 12:15\\n\\n4-> Danny arrives Mirpur.\\n\\n5-> Rajesh arrives Banani, Bill Gulshan.","data":{"type":"interactive","rowHeading":["Adabar","Banani","Mirpur","Gulshan","Lalbagh","12:00","12:01","12:05","12:10","12:15"],"columnHeading":["Danny","Moris","Ehab","Bill","Rajesh","12:00","12:01","12:05","12:10","12:15"],"cell":[["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png"],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png"],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png"],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png"],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png"],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","","","","",""],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","","","","",""],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","","","","",""],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","","","","",""],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","","","","",""]],"initialState":[[false,false,false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false,false,false],[false,false,false,false,false,true,true,true,true,true],[false,false,false,false,false,true,true,true,true,true],[false,false,false,false,false,true,true,true,true,true],[false,false,false,false,false,true,true,true,true,true],[false,false,false,false,false,true,true,true,true,true]],"data":{"answer":[[false,false,true,false,false,false,false,false,true,false],[false,false,false,false,true,false,true,false,false,false],[true,false,false,false,false,true,false,false,false,false],[false,false,false,true,false,false,false,false,false,true],[false,true,false,false,false,false,false,true,false,false],[true,false,false,false,false,true,true,true,true,true],[false,false,false,false,true,true,true,true,true,true],[false,true,false,false,false,true,true,true,true,true],[false,false,true,false,false,true,true,true,true,true],[false,false,false,true,false,true,true,true,true,true]]}},"width":50}	TD4k1HTYy3Hg2Pt4KORr	st1KFPBwmUNxPq6gtlcevCF7RqA3	\N
142	82	Adversity - VI	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618021253868.png	t	hard	1	1619257695446	8	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618884551945.png)\\n\\n**Words from question setter :**\\n\\n*The picture looks familliar, right? It is the same picture as the previous problem, **Adversity - III** & **Adversity - V**. Though it is maybe a bit difficult than those two, do not get motivated right now. You have to solve this problem exactly the same way. **My suggestion**: use a pen and paper to write things down to make it easy. Go for it*","category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"**In which option summation of angles is not equal to 180?**","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618884507426.png)\\n\\n**Look carefully. It's a different picture than the question**\\n\\n**Here the equal adverse angles are colored the same color**\\n\\n**Now check both adjacency and adversity for the angles present in the options. You can do it!!!**","data":{"type":"mcq","data":{"options":["40","⦟A/2 - 90","",""],"answer":""}}}	TMj6ZC7WAkaTwhMF9qGp	Duq6BDGCyAa5rLnIXML1yOjdOQp1	t
115	76	Beginner's Dart III	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617082081848.png	t	medium	1	1620122613886	3	{"version":1,"description":"You are new to the game of Darts. Your friend, Dimitri is quite experienced. He's practicing by himself and you're watching him. You know that, if a dart hits   \\nthe **Yellow** region, its worth **1 point**  \\nthe **Orange** region, its worth  **2 points**  \\nthe **Red** regions, its worth **3 points**  \\n**outside the board** (that is, he misses), its worth **0 points**  \\nThough you're a beginner at darts, you're good at maths and problem solving","hint":["If Dimitri lands 1 dart in the yellow, 2 in the orange, he will end up with 1 + 2 + 2 = 5 total points.  \\nAgain, 2 in the yellow and 1 in the red will also give him 1+1+3 = 5 points. But since the totals are equal, these only count as 1.  \\nBut, if he lands 1 in each colored region, he will get 1+2+3 = 6, which is a different total than 5.\\nSo, you need to figure out how many **different** totals he can end up with"],"category":" Counting-","lang":"en","interactiveType":"dragAndDrop-2","ansType":"text","type":"dragAndDrop-2","statement":"You want to find out how many different totals Dimitri can end up with, if he **throws all 3 darts** and **doesn't miss any**.\\n\\nYou can use the board and drag the darts to play out his throws.\\n  \\nAn example of Dimitris 2 throws:  \\nIf Dimitri lands 1 dart in the yellow, 2 in the orange, he will end up with 1 + 2 + 2 = 5 total points.  ","explanation":"He can end up with the following totals:  \\n1+1+1 = 3  \\n1+1+2 = 4  \\n..  \\n..  \\n..  \\n3+3+3 = 9\\n\\nThat is, totals from 3 to 9 are all possible.   \\nSo, a total of (9 - 3) +1= 7 different totals are possible.\\n","questionnaire":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617082081848.png",110,90,null,true,-2.595978062157219,8.555758683729435],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620122578455.png",20,20,null,false,46.946983546617915,0.8775137111517388],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620122578455.png",20,20,null,false,22.44972577696527,-1.8647166361974385],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620122578455.png",20,20,null,false,null,null]],"data":{"type":"text","data":{"answer":["7","seven","Seven"]}}}	rJzLa7dCZbiVDiY5bE3q	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
26	37	Pyramid!	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/Pyramid/Pyramid+logo-01.jpg	t	hard	1	1623689308565	2	{"version":1,"description":"John is making a pyramid with Legos. He used 11 pieces for the bottom layer, then 9 pieces for the second layer and 7 pieces for the third layer.\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/Pyramid/Pyramid+ques-01.jpg)","category":"Series","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"How many more Lego pieces does John need to finish building the pyramid?","explanation":"Each layer has 2 less Lego pieces than its previous layer. Therefore, the 4th layer will have (7-2) = 5 Lego pieces.\\nThe next layer  will have (5-2) = 3 Lego pieces.\\nAnd the final top layer will have (3-2) = 1 Lego piece.\\nSo, total number of pieces needed: 1 + 3 + 5 = 9\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/Pyramid/Pyramid+solution-01.jpg)","data":{"type":"text","data":{"answer":["9"]}},"width":80}	AELVsRy2JCGKsqYpfQ7v	Hn4jI4W0tFW6zFuXl94nd7IbieI3	\N
136	67	Nodes and Edges!	https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1617551199413.png	t	medium	3	1617552758665	4	{"version":1,"description":"On a spring morning, Chancey and you were having a conversation about logical series. Your friend knows you're very fond of solving such series and instantly came up with a beautiful scenerio. With a pen, Chancey started drawing few points (nodes) and then connect them with lines (edges) in a specific way. And he starts to repeat the process. The following shows the illustration of the drawn edge and nodes.\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1617551199413.png\\n) \\n\\nThe process is described as follows: \\n1. Draw the red node and connect the nodes (as only one node, no lines are required to connect them)\\n2. Draw the blue nodes and connect with two edges (lines).\\n3. Continue drawing.\\nSo, on each step, new nodes and edges are visible. \\nNow, Chancey asks you the beautiful question: ","hint":["So, everytime odd number of nodes are being drawn! I see....you see?!"],"category":"series ","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"If the drawing is continued to** 8 steps** (Given picture has **4 steps** clearly shown by different colors), how many nodes (points) and edges (lines) have to be drawn to make the similar pattern? I.e.,** If the series of drawing is continued, find the 8th step.**","explanation":"As you can see, after every step, the next odd numbered nodes are drawn. At first step, 1 node is drawn, 2nd step draws 3 new nodes and it goes on. So the number of nodes are basically a series: 1+3+5+7+ ... ... \\nSum of first term = 1^2 = 1\\nSum of first term = 1+3 = 2^2 = 4\\nSum of second term = 1+3+5 = 3^3 = 9 ....\\nIt goes on. \\nSo after 8th step, number of nodes = 8^2 = 64 nodes.\\nSo basically it produces a 8x8 square. And for each of the square, we see the perimeter of a square = 4*length of one side. \\nIn first step, the length is zero.\\nIn the second step, the length of the side = 1.\\nThird step, length becomes = 2.\\nSo on 8th step, edges = (8-1) * 4 = 28 edges.\\nSo, the answer is 64 nodes and 28 edges. ","data":{"type":"mcq","data":{"options":["36 nodes and 18 edges","64 nodes and 22 edges","64 nodes and 28 edges","49 nodes and 24 edges"],"answer":"64 nodes and 28 edges"}}}	DQMjWEmFTBFR3nUkLVla	chn4mCsrRmb1P6QXHCbrEeEpDAl2	t
236	79	Find The Missing Piece	https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622903845992.PNG	t	easy	1	1622914717873	3	{"version":1,"description":"Abir has a following square-shaped structure:\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622903845992.PNG\\n)","category":" 2D Shapes","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Which of the following pieces do not fit into his structure?\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622904338198.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622904399313.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622904413509.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622904425935.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622904535684.png\\n)","explanation":"Other pieces fit perfectly (shown as colored parts):\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622904685705.png\\n)","data":{"type":"mcq","data":{"options":["A","B","C","D","E"],"answer":"C"}}}	WMY5OIjDJS5Cat0F1Jls	sDCgfAyDqYhCWzPhpyCXj8aU0b63	t
119	64	Ice cream on a budget	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Ice+cream/ice+cream.png	t	medium	2	1621668949260	3	{"version":1,"description":"You walk into an ice cream parlour on your way home from school. The ice cream man tells you that you must choose a flavour a topping and whether you want it in a cone or cup. The available flavours and toppings are written on the board below.\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Ice+cream/ice+cream+prices1.png)","category":"inequality","lang":"en","interactiveType":"dragAndDrop-1","ansType":"interactive","type":"dragAndDrop-1","statement":"If you have Tk360 with you, what combination could you afford that would cost the most?","explanation":"Here for the combination of vanilla ice cream served in a cone and topped with marshmellows it would cost you exactly Tk360, hence it would be the most expensive combination you can afford.","data":{"type":"interactive","unselected":["Marshmallow","Sprinkles","Vanilla ice cream","Strawberry ice cream","Chocolate ice cream","Cone","Cup"],"containers":[{"label":"Ice Cream Combination","items":[]}],"data":{"temp":["Marshmallow","Sprinkles","Vanilla ice cream","Strawberry ice cream","Chocolate ice cream","Cone","Cup"],"answer":[{"label":"Ice Cream Combination","items":["Marshmallow","Vanilla ice cream","Cone"]}]}}}	OVcNAgl2arwIDy34um75	96L7jidBxJW8vTTy6WrArU2qpd63	t
141	82	Adversity - V	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618021253868.png	t	hard	1	1627556850864	7	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623345679428.png)","category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"__Which statement is incorrect?__","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623345583092.png)\\n\\n__Look carefully. It's a different picture than the question__\\n\\n__Here the equal Vertically Opposite angles are the same color__\\n\\n__Now check the options. You can do it!!!__","data":{"type":"mcq","data":{"options":["b + g = f + h","c + g = e + h","d + b = f + a","a + f = b + e"],"answer":"a + f = b + e"}},"width":60}	DhCSOxj04923LpSnMfJ3	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
260	63	Help Jojo	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623287471277.png	f	medium	2	1623387675811	5	{"version":1,"description":"Your friend JoJo has come to visit your house. After coming inside, he finds out your naughty little sister has turned the chair upside down. Now you need to help JoJo covering up your sisters' mistake","category":" MatchSticks","lang":"en","interactiveType":"matchstick","ansType":"interactive","type":"matchstick","statement":"Can you flip the chair so that you can let your guest sit on it?\\n\\nPlease note the following things\\n\\n* You cannot change the __rhombus__ which is in the middle\\n*  __Except the rhombus__, you must move __exactly__ 3 matchsticks\\n* You can __neither __rotate the matchsticks __nor __change their size\\n* Each of the matchsticks __must participate__ in forming the chair as it is now","explanation":"Notice the __below two pictures__ to know __which matchstick to move__ and __where to move__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623387559195.png)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623387577699.png)","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":21,"y1":16,"x2":23,"y2":19,"isLocked":false},{"type":"matchstick","x1":21,"y1":12,"x2":21,"y2":16,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":23,"y2":15,"isLocked":false},{"type":"matchstick","x1":24,"y1":16,"x2":26,"y2":19,"isLocked":false},{"type":"matchstick","x1":24,"y1":16,"x2":21,"y2":16,"isLocked":false},{"type":"matchstick","x1":23,"y1":19,"x2":26,"y2":19,"isLocked":false},{"type":"matchstick","x1":23,"y1":23,"x2":23,"y2":19,"isLocked":false},{"type":"matchstick","x1":26,"y1":23,"x2":26,"y2":19,"isLocked":false},{"type":"matchstick","x1":26,"y1":23,"x2":23,"y2":23,"isLocked":false},{"type":"matchstick","x1":26,"y1":19,"x2":26,"y2":15,"isLocked":false},{"type":"matchstick","x1":24,"y1":12,"x2":24,"y2":16,"isLocked":false}],"type":"interactive","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":23,"y1":22,"x2":25,"y2":25,"isLocked":false},{"type":"matchstick","x1":28,"y1":25,"x2":25,"y2":25,"isLocked":false},{"type":"matchstick","x1":28,"y1":25,"x2":26,"y2":22,"isLocked":false},{"type":"matchstick","x1":26,"y1":22,"x2":23,"y2":22,"isLocked":false},{"type":"matchstick","x1":23,"y1":18,"x2":23,"y2":22,"isLocked":false},{"type":"matchstick","x1":26,"y1":18,"x2":26,"y2":22,"isLocked":false},{"type":"matchstick","x1":25,"y1":25,"x2":25,"y2":29,"isLocked":false},{"type":"matchstick","x1":28,"y1":29,"x2":28,"y2":25,"isLocked":false},{"type":"matchstick","x1":26,"y1":18,"x2":23,"y2":18,"isLocked":false},{"type":"matchstick","x1":23,"y1":26,"x2":23,"y2":22,"isLocked":false},{"type":"matchstick","x1":26,"y1":22,"x2":26,"y2":26,"isLocked":false}]}},"width":60}	nWEv8qugLXkZCSs0g5ip	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
200	86	Balancing Life	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/seesaw/seesaw+1.jpg	t	medium	1	1623854562055	1	{"version":1,"description":"Two friends, Mac and Jack, are playing on a seesaw. Mac is heavier and weighs 35kgs, Jack is lighter and weighs 31kgs.\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/seesaw/seesaw+1.jpg)\\n\\nJack decides to fill his bag with rocks so that he weighs the same as Mac.\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/seesaw/seesaw2.jpg)\\n","category":"weight balance","lang":"en","interactiveType":"none","ansType":"text","tags":["Algebra"],"type":"none","statement":"How much does Jack’s bag weigh in Kgs?\\n\\n__(Enter the answer in the form Number kg there should be no space between the Number and kg eg. 6kg)__","explanation":"If Jack’s bag weighs x kgs\\n\\n- x+ 31 = 35\\n- x + 31 – 31 = 35 – 31\\n- x = 4\\n\\nIf Jack weighs 31Kgs and Mac weighs 35Kgs then jack is 35Kg – 31Kg = 4Kg lighter than Mac so in order for them to weigh the same the bag needs to weigh 4Kgs.\\n","data":{"type":"text","data":{"answer":["4kg"]}},"width":90}	hzJrSbuMfWk2k5TUJb3o	96L7jidBxJW8vTTy6WrArU2qpd63	\N
257	63	Remove 1 Remove 2	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623288940072.png	t	medium	2	1623654501835	4	{"version":1,"description":"Think of a scenario. If you could __remove__ __exactly __1 matchstick, would it be possible to __reduce the number of triangles by 2__ ?\\n\\nPlease note the following things\\n\\n* There are 6 __small, non-intersecting__ triangles __already__. That means you need to reduce them to 4\\n* You can __neither __rotate the matchsticks __nor __change their size\\n* Each of the __remaining matchsticks__ __must participate__ in forming the remaining triangles i.e. __no matchsticks can be left alone__","category":" MatchSticks","lang":"en","interactiveType":"matchstick","ansType":"mcq","type":"matchstick","statement":"Is it possible to reduce the number of triangles by 2,  by removing __exactly__ 1 matchstick?","explanation":"__See the following two pictures__\\n\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623354327347.png)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623354446763.png)\\n\\n","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":21,"y1":22,"x2":23,"y2":22,"isLocked":false},{"type":"matchstick","x1":22,"y1":24,"x2":21,"y2":22,"isLocked":false},{"type":"matchstick","x1":23,"y1":22,"x2":22,"y2":24,"isLocked":false},{"type":"matchstick","x1":25,"y1":22,"x2":23,"y2":22,"isLocked":false},{"type":"matchstick","x1":24,"y1":24,"x2":25,"y2":22,"isLocked":false},{"type":"matchstick","x1":23,"y1":22,"x2":24,"y2":24,"isLocked":false},{"type":"matchstick","x1":21,"y1":26,"x2":22,"y2":24,"isLocked":false},{"type":"matchstick","x1":22,"y1":24,"x2":23,"y2":26,"isLocked":false},{"type":"matchstick","x1":23,"y1":26,"x2":21,"y2":26,"isLocked":false},{"type":"matchstick","x1":23,"y1":26,"x2":24,"y2":24,"isLocked":false},{"type":"matchstick","x1":24,"y1":24,"x2":25,"y2":26,"isLocked":false},{"type":"matchstick","x1":25,"y1":26,"x2":23,"y2":26,"isLocked":false},{"type":"matchstick","x1":24,"y1":24,"x2":22,"y2":24,"isLocked":false}],"type":"mcq","data":{"options":["Yes","No"],"answer":"Yes"}},"width":60}	4UtUOj2dBIqUtiOmA2C5	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
143	94	Adjacency - III	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618021253868.png	t	easy	1	1627559067202	2	{"version":1,"description":"__Finally back to easy problems!!!__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623346417744.png)","category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"\\n(Note: the angle in the middle is a right angle, that is 90 degree. \\nSo we use a part of a square to mark it, instead of circular markings of x and y)\\n\\n__What is correct about x & y?__  \\n__They are :__","explanation":"x + 90 + y = 180\\n\\n=> x + y = 90\\n\\n__So, they are complementary!!!__","data":{"type":"mcq","data":{"options":["Equal","Complementary (together equal to 90 degrees)","Supplementary (together equal to 180 degrees)","None of the above"],"answer":"Complementary (together equal to 90 degrees)"}},"width":60}	Z15et8u9XbJNxiWJYeZY	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
198	86	Experimenting at School	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/exp.png	t	easy	1	1623855817186	2	{"version":1,"description":"At school your friends use a ruler and a prism to compare the weight of different combinations of pencils, sharpener and an eraser. While experimenting they found for the following combination weight was equal on both sides of the ruler.\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/keyeq2.jpg)\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/eq4.png)","category":"weight balance","lang":"en","interactiveType":"none","ansType":"text","tags":["Algebra"],"type":"none","statement":"If the weight of a pencil is 7 grams and the weight of the eraser is 20 grams what is the weight of a sharpner?\\n\\n__(Enter the answer in the form Number g there should be no space between the Number and g eg. 5g )__ ","explanation":"Here the following equation can be derived:\\n\\n- 2 x weight of sharpener + 2 x weight of pencil = weight of eraser\\n\\nSince weight of pencil is 7 grams and weight of the eraser is 20 grams\\n\\n- 2 x weight of sharpener + 2 x 7 grams = 20 grams\\n- 2 x weight of sharpener + 14 grams = 20 grams\\n- 2 x weight of sharpener = 6 grams\\n- weight of sharpener = 3 grams\\n\\n(3 grams can also be written as 3g)","data":{"type":"text","data":{"answer":["3g"]}},"width":80}	RvmiDOj7SnsfLjRq2Aes	96L7jidBxJW8vTTy6WrArU2qpd63	\N
61	69	Rectangle within a Rectangle! 	https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1610344456710.png	t	medium	3	1627569063929	2	{"version":1,"description":"The __area__ of a rectangle is measured by __multiply__ing its `length` and `width.`\\n\\n> Conventionally, the bigger side is considered as the length, and the smaller one as widht.\\n\\nThe __perimeter__ is measured by __sum__ming the `lengths` of all sides of the rectangle. ","hint":["Squares are saviors!!"],"category":" Area","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1610344456710.png)\\n\\nThe total area of ABCD is 400 sq.unit. A uniform rectangle is kept inside from 2-unit distance from the exterior. Can you find the smallest perimeter for the inner rectangle to possibly have?","explanation":"For rectangles with the same area, the perimeter is smallest when we deal with __Squares__. So we can think ABCD as a square with another square inside. It follows: \\n\\n L\\\\*L = 400\\n \\n -> L = 20. \\n\\nSmaller side, L'  = 20-4 = 16.\\n \\nThe perimeter = 4*16 = 64. ","data":{"type":"text","data":{"answer":["64","Sixty Four","sixty four"]}},"width":80}	uOZLTOaixQNhzkHgvmL9	chn4mCsrRmb1P6QXHCbrEeEpDAl2	\N
237	79	Skyline of The Castle	https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622907910970.PNG	t	medium	1	1622914712056	4	{"version":1,"description":"Once upon a time, there was a king. He had a castle. From far away, the skyline of the castle can be seen as the following:\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622907910970.PNG\\n)","category":" 2D Shapes","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Which of the following pieces do not belong to the king's castle?\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622907951629.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622907966160.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622907980087.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622907992111.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622908006285.png\\n)","explanation":"Corresponding pieces are colored in blue:\\n\\n__A__\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622908074324.png\\n)\\n\\n__B__\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622908138861.PNG\\n)\\n\\n__C__\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622908180836.PNG\\n)\\n\\n__D__\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622908200952.png\\n)\\n","data":{"type":"mcq","data":{"options":["A","B","C","D","E"],"answer":"D"}}}	8oIRZKbBvjl7TRHqxGsg	sDCgfAyDqYhCWzPhpyCXj8aU0b63	t
113	76	Beginner's Dart	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617082081848.png	t	medium	1	1623347770874	1	{"version":1,"description":"You are new to the game of Darts. You know that, if a dart hits   \\nthe __Yellow__ region, its worth __1 point__  \\nthe __Orange__ region, its worth  __2 points__  \\nthe __Red__ regions, its worth __3 points__  \\n__outside the board__ (that is, a miss), its worth __0 points__\\nThough you're a beginner at darts, you're good at maths and problem solving","category":" Counting - ","lang":"en","interactiveType":"dragAndDrop-2","ansType":"mcq","type":"dragAndDrop-2","statement":"You have 3 different colored darts. You throw the first dart (colored red) and it misses. Lets say you throw the blue dart 2nd, and the green dart last. You know that you won't miss any of the next two.  \\n__In how many ways can your score be 4 at the end of your 3 throws?__","explanation":"You've already missed your 1st red dart, so you have 0 points and 2 darts left.  You can end up with a score of 4 in the following ways  \\n2nd Dart - 3rd Dart  \\n 2 points  + 2 points  = 4  \\n1 point + 3 points  = 4  \\n3 points + 1 point = 4  \\nresulting in 3 different ways, to score 4 points \\n","questionnaire":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617082081848.png",110,90,null,true,-4.4241316270566715,13.126142595978063],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620120647424.png",20,20,null,true,3.254113345521026,62.85191956124314],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620120660665.png",20,20,null,false,25.191956124314444,-0.4021937842778773],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620120674316.png",20,20,null,false,null,null]],"data":{"type":"mcq","data":{"options":["2","3","4"],"answer":"3"}},"width":80}	f75m9792jbd1l2Lz5FDB	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
81	40	Sort!	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	medium	1	1623856229930	5	{"version":1,"description":"A sequence is a collection of numbers where the order matters. If a sequence consists of numbers arranged from smaller to larger, it is said to be in an ascending order.","category":" rearrange","lang":"en","interactiveType":"rearrange","ansType":"mcq","type":"rearrange","statement":"Find the __minimum number of moves__ that are required to sort the following sequence in ascending order?  \\nNote: A single (drag + drop) will count as 1 move","explanation":"There can be many solutions that produce the desired result in 2 moves. One such solution is :  \\n1. Move '0' to before '1'  \\n2. Move '3' to the space between '2' and '4'","data":{"type":"mcq","fields":["1","0","3","2","4"],"data":{"options":["1","2","3","4"],"answer":"2"}},"width":70}	5s44JhDNZkVib9W5l238	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
126	80	Venn Diagrams	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617537643870.PNG	t	medium	1	1619200209170	1	{"version":1,"description":"Venn Diagrams help us to \\"See\\" groups or collections in the form of overlapping circles. For example:  \\nThe Venn Diagram shows Groups of people who like either ONLY Apples (Red Circle) Or ONLY Mangoes (Yellow Circle) :   \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617537567866.PNG)  \\n\\nSuppose there are some people who like BOTH Apples and Mangoes. Then our figure becomes:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617537643870.PNG)  \\n","category":" Venn Diagrams","lang":"en","interactiveType":"venn","ansType":"interactive","type":"venn","statement":"Can you color the area of the circle that shows people who like Both Apples and Oranges?","explanation":"The circle on the left represents people who like apples. The circle on the right represents people who like Mangoes. The overlapping region (colored orange) represent people who like both Apples and Mangoes, which is our answer.  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617539214535.PNG)","data":{"sets":[{"sets":["A"],"size":50,"label":"Apples","id":0,"color":"#fc4f4f","selected":false,"exclude":[]},{"sets":["B"],"size":50,"label":"Mangoes","id":1,"color":"#fffa6b","selected":false,"exclude":[]},{"sets":["A","B"],"size":10,"label":"Both","id":2,"color":"#ffba24","selected":false,"exclude":[]}],"type":"interactive","data":{"answer":{"sets":[{"sets":["A"],"size":50,"label":"Apples","id":0,"color":"#fc4f4f","selected":false,"exclude":[]},{"sets":["B"],"size":50,"label":"Mangoes","id":1,"color":"#fffa6b","selected":false,"exclude":[]},{"sets":["A","B"],"size":10,"label":"Both","id":2,"color":"#ffba24","selected":true,"exclude":[]}]}}}}	KzPB7IUTULn433bXd7FY	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
180	84	Fruit Basket	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620033144870.png	t	easy	1	1623855954004	1	{"version":1,"description":"*Ahmed*, *Bryan*, *Carl* and *Danny* went on a picnic. They brought a basket with 4 different fruits, a __Banana__, an __Apple__, a __Mango__, and an __Orange__. They have specific preferences. Help them figure out who gets which fruit, with the help of the Exclusion Grid.\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620033144870.png)","category":"logical reasoning - exclusion grid","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","tags":["Logical Reasoning","Exclusion Grid","Logic"],"type":"exclusion_grid","statement":"You know that,  \\n\\n__1.__ *Ahmed* doesn’t eat __Bananas__ or __Mangoes__  \\n__2.__ *Bryan* eats fruits that start with the same letter as his name.  \\n__3.__ *Carl* doesn’t eat fruits that need to be peeled.\\n\\nFind out who gets which fruit, __if each person gets exactly 1 fruit__.  \\n(The final board should have exactly 1 colored fruit of each type.)","explanation":"3=> Carl gets the Apple since everything else MUST be peeled----(4)  \\n1,4=>Ahmed gets the Orange  \\n2=> Bryan gets the Banana since 'Bryan' and 'Banana' both start with ‘B’  \\nDanny gets the Mango by default.\\n","data":{"type":"interactive","rowHeading":["Ahmed","Bryan","Carl","Danny"],"columnHeading":["Apple","Banana","Mango","Orange"],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030056344.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030075808.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030091900.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030104116.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030056344.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030075808.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030091900.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030104116.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030056344.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030075808.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030091900.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030104116.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030056344.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030075808.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030091900.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620030104116.png"]],"initialState":[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],"data":{"answer":[[false,false,false,true],[false,true,false,false],[true,false,false,false],[false,false,true,false]]}},"width":70}	IkL4KaKwzSn4lcKr4x6I	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
162	94	Adversity - VI	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618021253868.png	t	hard	1	1627557606479	1	{"version":1,"description":"__Words from question setter :__\\n\\n*The picture looks familiar, right? It is the same picture as the previous problems, __Adversity - III__ & __Adversity - V__. Though it may be a bit difficult than those two, you have to solve this problem exactly the same way.*\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623345679428.png)","category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"__In which option summation of angles is not equal to 180?__","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623345583092.png)\\n\\n__Look carefully. It's a different picture than the question__\\n\\n__Here the equal vertically opposite angles are colored the same__\\n\\n__Now check both adjacency (lying on same straight line) and vertically opposite angles for the given options. You can do it!!!__","data":{"type":"mcq","data":{"options":["g + a + c + f","a + f + h + e","e + d + f + g","g + e + f + h"],"answer":"g + e + f + h"}},"width":60}	TMj6ZC7WAkaTwhMF9qGp	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
253	38	Extrapolation	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1622375532707.PNG	t	hard	1	1628875786122	4	{"version":1,"description":"Sam is playing with sums and products of numbers starting from 1. He called the sums as __S__ and the products as __P__. For example, according to him,  \\n__5th S= 1+2+3+4+5 = 15__  \\n__3rd P= 1x2x3 = 6__","category":"math - parity","lang":"en","interactiveType":"dragAndDrop-1","ansType":"interactive","type":"dragAndDrop-1","statement":"He has found the values of a few __S__'s and a few __P__'s. He now asks you to find which of them are odd and which of them are even. Help him out!","explanation":"1st P=1, 2nd P=2, 3rd P=6.\\nIt is given that, 5th S=15. Therefore, 4th S=odd-odd=even.  \\nSimilarly,  \\n6th S=odd+even=odd  \\n7th S=odd+odd=even  \\n8th S=even+even=even\\n","data":{"type":"interactive","unselected":["1st P","2nd P","3rd P","4th S","5th S","6th S","7th S","8th S"],"containers":[{"label":"Odd","items":[]},{"label":"Even","items":[]}],"data":{"temp":["1st P","2nd P","3rd P","4th S","5th S","6th S","7th S","8th S"],"answer":[{"label":"Odd","items":["1st P","5th S","6th S"]},{"label":"Even","items":["2nd P","3rd P","4th S","7th S","8th S"]}]}},"width":90}	uye8BZIcnQXMYqssNLDi	st1KFPBwmUNxPq6gtlcevCF7RqA3	\N
166	95	Three Angles - II	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618883022217.png	t	hard	2	1623415355880	1	{"version":1,"description":"__Angles of same color are equal__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623415305565.png)","hint":["**Focus on this yellow triangle**\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623415327848.png)"],"category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"__What is p with respect to ⦟A?__","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623415324701.png)\\n\\n__In the yellow triangle,__\\n\\np + ⦟B/2 + ⦟C/2 = 180\\n\\nSo, p = 180 - (⦟B/2 + ⦟C/2) __------------- (1)__\\n\\n__Now, we need to find a way to replace ⦟B/2 & ⦟C/2 with ⦟A/2__\\n\\n__For that, we need to find the relation among these three angles__\\n\\n__So, let's consider △ABC__\\n\\n⦟A + ⦟B + ⦟C = 180\\n\\n=> ⦟B + ⦟C = 180 - ⦟A\\n\\n=> 1/2(⦟B + ⦟C) = 90 - ⦟A/2\\n\\nSo, ⦟B/2 + ⦟C/2 = 90 - ⦟A/2\\n\\n__Now, substitute this value in equation (1),__\\n\\np = 180 - (90 - ⦟A/2)\\n\\n__So, p = 90 + ⦟A/2__","data":{"type":"mcq","data":{"options":["90 - ⦟A/2","⦟A/2 - 90","90 + ⦟A/2"],"answer":"90 + ⦟A/2"}},"width":60}	7alGZDBjN5bLZ9GE9QHb	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
170	39	Numbers on the Road-2	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1613745325608.png	t	easy	1	1619256080074	7	{"version":1,"description":"The numbers have decided to go on a journey around the world! In this special expedition on the map, a street represents Addition (+) operation, a river represents Multiplication (*) operation and a rail-track represents Division (/) operation. Your task is to find the \\"?\\" marked numbers along its journey.","hint":["We need to calculate from the beginning. \\nSo, for the first trip, we have to multiply 7 with 3 to get our next destination number.\\n\\nNow, what is 7*3?\\n","Since you've got 7*3=21, let's move on to the next addition operation.\\n\\nFind out what is 7+21 to reach the next number.\\n","You're almost there.\\nYou've got 7+21 = 28. Now it's time for final operation.\\n\\nYou know rail-track represents division, right? So just divide 28 by 14 and you'll get the unknown rider in the train!\\n"],"category":"Basic Operations","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1619254973583.png)","explanation":"Doing the operations serially we get:\\n\\n7*3 = 21\\n7+21 = 28\\n28/14 = 2\\nThe answer is: 2","data":{"type":"text","data":{"answer":["2"]}}}	YYjt1VW45OmzZ7bWYsrG	Hn4jI4W0tFW6zFuXl94nd7IbieI3	t
140	82	Adversity - IV	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618021253868.png	t	hard	1	1627557119768	6	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623346026172.png)","category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"__Determine h + b__","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623345975698.png)\\n\\n40 + g + 70 + b = 180\\n\\n=> 110 + g + b = 180\\n\\n=> g + b = 70\\n\\n__So, h + b = 70 (g & h are vertically opposite angles, thus equal)__","data":{"type":"mcq","data":{"options":["70","110","Not possible to determine"],"answer":"70"}},"width":60}	fqcaNUsnIZusdFfvhhTf	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
65	65	Reflex Parallelogram - I	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1610631637178.png	t	medium	2	1627566040744	5	{"version":1,"description":"*__Property:__ The opposite angles of a parallelogram are equal, and the opposite sides are equal and parallel*\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623341138908.png)","hint":["**Can you determine ⦟ACB first?**\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623341154547.png)"],"category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"__Determine Reflex ⦟C__\\n\\nNote: Any Angle + its Reflex angle = 360 degrees","explanation":"__⦟A = ⦟C__\\n\\nSo, ⦟C = 110\\n\\n__Now,__\\n\\nAcute ⦟C (i.e. ⦟ACB) + Reflex ⦟C = 360\\n\\n=> 110 + Reflex ⦟B = 360\\n\\n=> Reflex ⦟B = 360 - 110\\n\\n__So, Reflex ⦟B = 250__","data":{"type":"text","data":{"answer":["250"]}},"width":80}	FoIvRbPJGdvBiZbYNJqE	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
222	37	Recognizing patterns !!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910228209.png	t	easy	1	1629017495828	1	{"version":1,"description":"Starting from our fingers to the shells of oysters, nature has hidden many __mathematical patterns__ for us to discover.\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1623517738910.png)\\n","category":" Number Series","lang":"en","interactiveType":"rearrange","ansType":"interactive","type":"rearrange","statement":"In this problem, there are 6 numbers. Rearrange the numbers so that you get a pattern __(Hint: The numbers should get bigger as you go down)__","explanation":"The pattern is : 3, 6, 9, 12, 15, 18  \\nDifference between consecutive numbers : 3","data":{"type":"interactive","fields":["12","9","15","6","3","18"],"data":{"answer":["3","6","9","12","15","18"]}},"width":80}	160eVDi1QXIzWEVmBSwn	0RMFi9mrPNe7mol2JwcZAf40F3n2	\N
269	97	Continuous Tracking - I	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623349248757.png	t	easy	2	1623359487417	1	{"version":1,"description":"Do you remember the mathematical puzzles you received as your birthday present? Let's refresh your memory with this simple one. \\n\\nLike before, each octagon represents a number and they are connected with each other with colorful ribbons. You need to perform series of basic operations according to the color of the ribbons from left to right to solve the puzzle. Find the all 6 missing numbers and rearrange them alphabetically to win the game!","hint":["Look at the puzzle carefully and start solving by finding out A first."],"category":" New Backtrack","lang":"en","interactiveType":"rearrange","ansType":"interactive","type":"rearrange","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623352518913.png)","explanation":"Start solving the numbers serially from A to F.\\n\\nFor A:\\nThe pink ribbon denotes multiplication. So, perform division for backtracking.\\n\\n15/5 = 3\\n\\nFor B:\\nSimply, add the number you just found out with 2 and you’ll get B.\\n\\n2+3 = 5\\n\\nFor C:\\nMultiply 15 with B.\\n\\n15 * 5 = 75\\n\\nFor D:\\nPerform another backtracking operation. Subtract C from 102.\\n\\n102-75 = 27\\n\\nFor E:\\nAgain, backtrack from D. \\n\\n27-15 = 12.\\n\\nFor F:\\nLast backtrack to find out the final number.\\n\\n12 – 5 = 7.\\n\\nNow, just rearrange the numbers from A to F and you’re done!\\n","data":{"type":"interactive","fields":["75","27","12","7","5","3"],"data":{"answer":["3","5","75","27","12","7"]}},"width":80}	QUqRGDXCseJtOcFBU0V8	Hn4jI4W0tFW6zFuXl94nd7IbieI3	t
127	80	Venn Diagrams II	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617537643870.PNG	t	medium	1	1621418690838	2	{"version":1,"description":"The Venn diagram is the same as before. The circle on the left represents people who like Apples. The circle on the right represents people who like Mangoes","category":"math- venndiagrams","lang":"en","interactiveType":"venn","ansType":"interactive","type":"venn","statement":"Building on our concept of Venn Diagrams, can you identify the area that represents people who **ONLY like Apples**? This is the same as saying they like apples and they don't like mangoes.","explanation":"We know that the overlapping area is for people who like Both apples and mangoes. This means that everyone in the red area likes only apples and does not like mangoes, since it is outside of the right circle that represents those who like oranges. So our answer is the **red** area.  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617538644928.PNG)","data":{"sets":[{"sets":["A"],"size":50,"label":"Apples","id":0,"color":"#fc4f4f","selected":false,"exclude":[]},{"sets":["B"],"size":50,"label":"Mangoes","id":1,"color":"#fffa6b","selected":false,"exclude":[]},{"sets":["A","B"],"size":10,"label":"Both","id":2,"color":"#ffba24","selected":false,"exclude":[]}],"type":"interactive","data":{"answer":{"sets":[{"sets":["A"],"size":50,"label":"Apples","id":0,"color":"#fc4f4f","selected":true,"exclude":[]},{"sets":["B"],"size":50,"label":"Mangoes","id":1,"color":"#fffa6b","selected":false,"exclude":[]},{"sets":["A","B"],"size":10,"label":"Both","id":2,"color":"#ffba24","selected":false,"exclude":[]}]}}}}	ID3qILE2qzZr8Kjwde9F	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
238	79	Match The Pieces 	https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622910952154.PNG	t	medium	1	1623328607807	5	{"version":1,"category":" 2D Shapes","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Select the piece(s) such that it matches to the following diagram to form a square.\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620514779297.PNG\\n)\\n\\nA:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620514842290.PNG)  \\n  \\n\\nB:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620514851093.PNG)  \\n  \\n\\nC:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620514859803.PNG)  \\n\\nD:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620514869337.PNG)\\n","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622912125868.PNG\\n)","data":{"type":"mcq","data":{"options":["A","B","C","D"],"answer":"D"}}}	vMZKvTICe1D3LChRVrcu	sDCgfAyDqYhCWzPhpyCXj8aU0b63	\N
98	66	CircAngle - II	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1615112637266.png	t	hard	3	1623343204738	4	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623340610065.png)","hint":["**Hey, isn't OA = OB? (Both are radius of the circle)**\\n\\n**Can you determine ⦟OAB now?**","**As OA = OB,**\\n\\n**⦟OBA = ⦟OAB (If sides are equal, their corresponding opposite angles are also equal)**\\n\\n**So, ⦟OAB = 50**","**Try to determine ⦟AOB now**","**In △OAB,**\\n\\n⦟AOB + ⦟OBA + ⦟OAB = 180\\n\\n=> ⦟AOB + 50 + 50 = 180\\n\\n**So, ⦟AOB = 80**","**Remember the concept of *central *and *inscribed *angles?**\\n\\n**Try to use them now!!**"],"category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"__Determine ⦟ACB__","explanation":"__See the hint 1-5 for the initial part of the solution__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623340610065.png)\\n\\n__Now, let's consider minor arc AB__\\n\\n__⦟AOB and ⦟ACB are respectively *central *and *inscribed *angle on it__\\n\\n__⦟AOB = 2 × ⦟ACB__\\n\\n=> ⦟ACB = 1/2 (⦟AOB)\\n\\n=> ⦟ACB = 1/2 (80)\\n\\n__So, ⦟ACB = 40!!!__","data":{"type":"text","data":{"answer":["40"]}}}	RXdCu0Xuev1ysqIQZjVN	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
270	97	Continuous Tracking - II	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623349248757.png	t	easy	2	1623689670757	2	{"version":1,"description":"You're getting better at solving these puzzles day by day!\\n\\nNow, you're level is upgraded and you are introduced to a new kind of piece: A pentagon and along with it a new colored ribbon: Green. The green ribbon means division operation and the pentagon is the divisor. \\n\\nCan you determine the unknown number?","category":" New Backtrack","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623689194781.png)","explanation":"The below 2 puzzles mean multiplication. Therefore,\\n\\n6xB=30\\n\\nB=30/6=5\\n\\nand, 2xA=30\\n\\nA=30/2=15\\n\\nNow, solving A/B=15/5=3","data":{"type":"text","data":{"answer":["3"]}},"width":80}	QErL45qXrit4IFqJ2NiI	Hn4jI4W0tFW6zFuXl94nd7IbieI3	t
163	94	Adjacent Adversity - I	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618021253868.png	t	hard	1	1627558475777	6	{"version":1,"description":"__CO ⊥ OE__, that is __CO is perpendicular to OE__.  \\nSo, __⦟COE = 90__\\n\\n","hint":["![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623346158650.png)\\n\\n**Try to determine ⦟COD now**"],"category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623346140924.png)\\n\\nFind the angle marked with __\\"?\\"__","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623346258802.png)\\n\\n__And finally,__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623346205357.png)","data":{"type":"mcq","data":{"options":["50","60","40","30"],"answer":"40"}},"width":60}	qt4kq2qvPrNtX1PVi73L	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
128	80	Venn Diagrams III	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617537643870.PNG	t	hard	1	1621418973140	3	{"version":1,"description":"This is the same Venn Diagram as before, with the left circel representing people who like Apples, and the right representing those who like Mangoes.","category":" Venn Diagrams","lang":"en","interactiveType":"venn","ansType":"interactive","type":"venn","statement":"Can you color the area(s) that represent all the people who like Mangoes?  \\n(Hint:  Technically, if someone likes Both apples and mangoes, he still counts as someone who likes mangoes)","explanation":"Since the ENTIRE right circle represents the people who like Mangoes, our answer is as follows:\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617539046493.PNG)  \\n\\nThis is the same as saying:  \\nPeople who like Only Mangoes + People Who like Both Apples and Mangoes = All the People who like Mangoes","data":{"sets":[{"sets":["A"],"size":50,"label":"Apples","id":0,"color":"#fc4f4f","selected":false,"exclude":[]},{"sets":["B"],"size":50,"label":"Mangoes","id":1,"color":"#fffa6b","selected":false,"exclude":[]},{"sets":["A","B"],"size":10,"label":"Both","id":2,"color":"#ffba24","selected":false,"exclude":[]}],"type":"interactive","data":{"answer":{"sets":[{"sets":["A"],"size":50,"label":"Apples","id":0,"color":"#fc4f4f","selected":false,"exclude":[]},{"sets":["B"],"size":50,"label":"Mangoes","id":1,"color":"#fffa6b","selected":true,"exclude":[]},{"sets":["A","B"],"size":10,"label":"Both","id":2,"color":"#ffba24","selected":true,"exclude":[]}]}}}}	jVpjruM75WKHDkK82hMf	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
239	79	Match The Pieces 2	https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622911100185.PNG	t	hard	1	1623328831157	6	{"version":1,"category":" 2D Shapes","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Select the piece(s) such that it matches to the following diagram to form a rectangle.\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620518708400.PNG\\n)\\n\\nA:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620518827125.PNG)  \\n\\nB:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620518834959.PNG)  \\n\\nC:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620518844243.PNG)  \\n\\nD:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620518854190.PNG)","explanation":"__A__\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622914638338.PNG\\n)\\n\\n\\n\\n__B__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622914655727.PNG\\n)","data":{"type":"mcq","data":{"options":["A","B","C","D"],"answer":"A"}}}	kYf2dulbEgkBirXXqOph	sDCgfAyDqYhCWzPhpyCXj8aU0b63	t
97	65	CircAngle	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1615112637266.png	t	medium	2	1623342393818	7	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623341358937.png)","hint":["**Hey, isn't OA = OB? (Both are radius of the circle)**"],"category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"__Determine ⦟ABO__","explanation":"__As OA = OB,__\\n\\n⦟OBA = ⦟OAB (If sides are equal, their corresponding opposite angles are also equal)\\n\\n__Now, let, ⦟OBA = ⦟OAB = x__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623341332670.png)\\n\\n__In △OAB,__\\n\\n⦟AOB + ⦟OBA + ⦟OAB = 180\\n\\n=> 70 + x + x = 180\\n\\n=> 2x = 110\\n\\n__So, x = 55__","data":{"type":"text","data":{"answer":["55"]}}}	3GHl55rxZqEuUvDE7HDK	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
240	91	Place The Square-Tile	https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621063976920.png	t	easy	2	1622915397403	1	{"version":1,"category":" 2D Shapes","lang":"en","interactiveType":"dragAndDrop-2","ansType":"mcq","type":"dragAndDrop-2","statement":"Sakib has a fixed structure (shown in the figure). He wants to place a 2x2 square tiles on that structure. In how many ways, can he do so?\\n\\n\\n","explanation":"Move the square to fit it over the given structure.","questionnaire":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621063976920.png",50,50,0,true,40,40],["https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621063961937.png",20,20,0,false,38.41269841269842,40.00000000000001]],"data":{"type":"mcq","data":{"options":["4","6","16","8","12"],"answer":"8"}}}	TZEcT78V7l5scfFYZ1F5	sDCgfAyDqYhCWzPhpyCXj8aU0b63	t
134	82	Adversity - II	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1618021253868.png	t	medium	1	1627556360023	4	{"version":1,"description":"__⦟AOB is complementary of ⦟EOD (That is, together they are 90 degree)__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623345468729.png)","hint":["**Think ⦟EOB as the summation of two angles**\\n\\n**⦟EOA & ⦟AOB. Try to find these two angles**"],"category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"__Find out ⦟EOB__","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623345468729.png)\\n\\n__Along line EC,__\\n\\n⦟EOD + ⦟DOC = 180 (adjacent angles)\\n\\n=> ⦟EOD + 118 = 180\\n\\n=> ⦟EOD = 180 - 118\\n\\nSo, ⦟EOD = 62\\n\\n__Now, again,__\\n\\n⦟EOD + ⦟AOB = 90 (complementary angles)\\n\\n=> 62 + ⦟AOB = 90\\n\\n=> ⦟AOB = 90 - 62\\n\\n__So, ⦟AOB = 28__\\n\\n__Also, ⦟EOA = ⦟DOC = 118__ (Vertically opposite angles)\\n\\n__Finally,__\\n\\n__⦟EOB__ = ⦟EOA + ⦟AOB\\n\\n        = 118 + 28\\n\\n        = 146\\n","data":{"type":"mcq","data":{"options":["133","142","146","136"],"answer":"146"}},"width":60}	wZZzago5i8nhuglrT0Vk	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
137	66	CircAngle - III	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1615112637266.png	t	hard	3	1627567070325	5	{"version":1,"description":"__ABC is a circle where O is its center__    \\n\\n*__Property__: Angle inscribed in a semicircle is 90 degrees*\\n\\n----------\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623340754052.png)","hint":["**BC is the diameter of this circle. Now it should be easy peasy for you, right?**","![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623340769670.png)\\n\\n**⦟BAC = 90 (Angle inscribed in a semi circle)**"],"category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"__Determine ⦟ADB now__","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623340754052.png)\\n\\n__⦟BAC = 90 (Angle inscribed in a semi circle)__\\n\\n=> ⦟BAD + ⦟DAC = 90\\n\\n=> 30 + ⦟DAC = 60\\n\\nSo, ⦟DAC = 60\\n\\n----------\\n\\n\\n__Now, In △ADC,__\\n\\n⦟ADC + ⦟DAC + ⦟ACD = 180\\n\\n=> ⦟ADC + 60 + 55 = 180\\n\\nSo, ⦟ADC = 65\\n\\n__Lastly,__\\n\\n⦟ADC + ⦟ADB = 180\\n\\n=> 65 + ⦟ADB = 180\\n\\n__\\nSo, ⦟ADB = 115__","data":{"type":"text","data":{"answer":["115"]}},"width":80}	pZAfKiiKiMaj8NTjwmER	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
67	66	Elongated Trapezium	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1610629355847.png	t	medium	3	1627566642199	2	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623339783603.png)","hint":["![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623339767214.png)"],"category":" Angle Chasing","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"__Determine reflex ⦟A__","explanation":"⦟DAE = ⦟ADE (alternate angles)\\n\\nSo, ⦟DAE = 60\\n\\n__Elongated ⦟A__ = ⦟DAE + 180 \\n  \\n                = 60 + 180 \\n\\n                = 240","data":{"type":"text","data":{"answer":["240"]}},"width":80}	sEbTpwh68npsdhmIDWHe	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
12	52	Test Results	https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/TestResults.png	t	medium	2	1620029273025	1	{"version":1,"description":"You have the results of 4 students, with IDs *A*, *B*, *C*, *D*. Two of them are boys and 2 are girls. You have just received their test scores. You, the headmaster, want to find out the order of merit based on reliable information given by the result board. Use the given Exclusion Grid to come to the correct conclusion.\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/TestResults.png)","category":"logical reasoning - exclusion grid","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","tags":["Logical Reasoning","Exclusion Grid","Logic"],"type":"exclusion_grid","statement":"You know the following:  \\n**1.** Both boys scored lower than ***B***  \\n**2.** ***C*** is a girl.  \\n**3.** ***D*** scored higher than ***A***  \\n**4.** The boys did not place side-by-side. The girls also did not place side-by-side.\\n","explanation":"B scored higher than both boys, so B is a girl and she placed 1st.  \\nC is a girl, so she placed 3rd.  \\nD placed higher than A so, D placed 2nd and A placed 4th","data":{"type":"interactive","rowHeading":["A","B","C","D"],"columnHeading":["1st","2nd","3rd","4th"],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"]],"initialState":[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],"data":{"answer":[[false,false,false,true],[true,false,false,false],[false,false,true,false],[false,true,false,false]]}}}	TB5KXdfoeLLt88WU9290	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
57	52	Four Brothers	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610337408207.png	t	medium	2	1620029897294	2	{"version":1,"description":"*Albert*, *Ben*, *Charlie*, and *Dan* are four brothers,*** each with different birthdays***. When asked any question, they reply in riddles. 3 of them tell the truth but the other tells a lie. Use the given exclusion grid to figure out the riddle below. You can try out possible scenarios using the grid and figure out which scenario meets all the conditions.  \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610337408207.png)","category":"logical reasoning - exclusion grid","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","tags":["Exclusion Grid","Logical Reasoning","Logic"],"type":"exclusion_grid","statement":"The brothers were asked about their ages. They replied:  \\n\\n**Albert:** I am older than Dan.  \\n**Ben:** Albert and I are twins.  \\n**Charlie:** I am younger than Albert.  \\n**Dan:** Albert is telling the truth, but I am not the youngest and he isn’t the eldest.  \\n\\nArrange the brothers **from the eldest to the youngest**.\\n","explanation":"Since everyone has different birthdays, Ben and Albert cannot be twins.\\nSo, Ben is lying.  \\nAlbert isn’t the eldest, and both Dan and Charlie are younger than Albert. So, Ben is the eldest then comes Albert.  \\nDan isn’t the youngest, so the youngest is Charlie.","data":{"type":"interactive","rowHeading":["Albert","Ben","Charlie","Dan"],"columnHeading":["The Oldest","2nd Oldest","2nd Youngest","Youngest"],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"]],"initialState":[[true,true,true,true],[true,true,true,true],[true,true,true,true],[true,true,true,true]],"data":{"answer":[[false,true,false,false],[true,false,false,false],[false,false,false,true],[false,false,true,false]]}}}	YFOFvvdHhLqbO6NIPbHO	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
16	51	Snacks	https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Snacks.jpg	t	hard	3	1620029971566	1	{"version":1,"description":"*Percy*, *Fred* and *George* bought snacks from the store. They bought a *Packet of Waffles*, an *Ice cream cone* and a *Cold Drink* (**but you don’t know who bought which**). Order them **on the basis of money spent** (**most** money spent to **least** money spent).\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Snacks.jpg)","category":"logical reasoning - exclusion grid","lang":"en","interactiveType":"exclusion_grid","ansType":"mcq","tags":["Logical Reasoning","Exclusion Grid","Logic"],"type":"exclusion_grid","statement":"You know the following:  \\n\\n**1.** *Percy*’s snack cost less than the *Ice Cream*  \\n**2.** The *Cold Drink* cost more than *Fred*’s snack  \\n**3.** *George* didn’t buy the *Cold Drink*.  \\n \\nWhich is ordered from most money spent to least money spent?\\n","explanation":"1,3=> Percy bought the cold drink ----(4)  \\n4,2=> Fred was below Percy, in terms of money spent----(5)  \\n4,1=>The ice cream cost more than Percy’s snack.----(6)  \\n5,6=>George bought the ice cream, which was the most expensive.\\n","data":{"type":"mcq","rowHeading":["Fred","George","Percy","","","Cold Drink","Waffle","Ice Cream"],"columnHeading":["Most Costly","In the Middle","Cheapest","","Cold Drink","Waffle","Ice Cream"],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["","","","","","",""],["","","","","","",""],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","","","",""],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","","","",""],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png","","","",""]],"initialState":[[true,true,true,true,true,true,true],[true,true,true,true,true,true,true],[true,true,true,true,true,true,true],[true,true,true,true,true,true,true],[true,true,true,true,true,true,true],[true,true,true,true,true,true,true],[true,true,true,true,true,true,true],[true,true,true,true,true,true,true]],"data":{"options":["Percy>Fred>George","Percy>George >Fred","George>Percy>Fred","George> Fred>Percy","Fred>Percy>George","Fred> George > Percy "],"answer":"George>Percy>Fred"}}}	gqgdKwxiirkkkEDdet4m	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
88	72	Perimeter of Nile???	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1613990034881.png	t	medium	3	1623351974281	1	{"version":1,"category":"Area/Perimeter","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623351945273.png)  \\nThe 10×6 rectangle above is cut up into four triangles and one quadrilateral. Four of the triangles have perimeters of 11,13, 14, and 15 as indicated by the numbers inside them.\\nWhat is the perimeter of the blue quadrilateral?\\n","explanation":"Adding perimeters of all triangles and then subtracting the perimeter of the rectangle will give the perimeter of the blue quadrilateral.\\n(11+13+14+15)-2×(10+6)=21","data":{"type":"text","data":{"answer":["21"]}},"width":60}	hxaCIczYO08eAsnniTkb	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
193	77	Average Age	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	easy	3	1620287347527	2	{"version":1,"description":"You are now in the 10th grade. While going through some old stuff, you found a piece of paper with your handwriting from the** 3rd grade**. It had the following written on it: \\"The **Average age** of all **30 students** in my class (including me) is 9\\"","category":" Average","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"Assuming that your classmates haven't changed, can you figure out the present average age of all your classmates? (Write answer in numerical years, without mentioning unit)","explanation":"Sum = (Average) x (Number of entries)  \\nSum of everybody's age at grade 3 is 9 x 30 = 270\\n\\nEveryone's present age has increased by 7, (7 year difference between grades 3 and 10)  \\nTotal age increase of entire class = 7 x 30 = 210  \\nPresent sum of ages = 210 + 270 = 480  \\nPresent average age = 480/30 = 16\\n\\n***Alternate:***\\nEveryone ages at the same rate. So, per year, the average increases by 1. Therefore, new average is  \\nOld Average + years passed = 9 + 7 = 16","data":{"type":"text","data":{"answer":["16","sixteen","Sixteen"]}}}	6CBRfh9LZW3MTbyNv3xd	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
241	91	Cut The Square Paper	https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620522235930.PNG	t	medium	2	1622914852508	2	{"version":1,"category":" 2D Shapes","lang":"en","interactiveType":"dragAndDrop-2","ansType":"mcq","type":"dragAndDrop-2","statement":"Sakib has a squared shaped sheet of paper. \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620522235930.PNG\\n)\\nHe wants to cut it into __two __pieces using a single straight cut. \\nWhich of the following cannot be the shape of either piece?\\n\\n> (As square is symetric, you can think Sakib places straight line on the square-sheet and cuts through along that line. You can take help from 2 possible cases given below.)","explanation":"You cannot cut a square from a square with a single line. At most, you will get a rectangle with adjacent side not equal.","questionnaire":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620522235930.PNG",50,50,0,true,40,38.80952380952381],["https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620522249176.PNG",100,1,25,false,5.079365079365078,53.6904761904762],["https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620522249176.PNG",100,1,0,false,31.071428571428573,63.41269841269842]],"data":{"type":"mcq","data":{"options":["A Rectangle","A Pentagon","A Square","A Right-Angled Triangle","An Isosceles Triangle"],"answer":"A Square"}}}	NX174bwfb9av3rF8HTSG	sDCgfAyDqYhCWzPhpyCXj8aU0b63	t
118	60	Revisiting Darts III	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617082081848.png	t	hard	3	1620122919408	5	{"version":1,"description":"You are revisiting the game of Darts after a long time. You know that, if a dart hits   \\nthe **Yellow** region, its worth **1 point**  \\nthe **Orange** region, its worth  **2 points**  \\nthe **Red** regions, its worth **3 points**  \\n**outside the board** (that is, a miss), its worth **0 points**  \\nThough your skills at darts have worsened, you're still good at maths and problem solving","category":" Counting - ","lang":"en","interactiveType":"dragAndDrop-2","ansType":"mcq","type":"dragAndDrop-2","statement":"You have 3 different colored darts.Lets say you throw the red dart first, blue dart 2nd, and the green dart last.  \\nYou haven't practiced for quite some time and you **CAN MISS** any number of your throws.  \\nIn **how many ways** can your **total score be 5** at the end of your 3 throws?  \\nNote: (1+2+2) and (2+2+1) count as different **Ways**, since the dart colors are different.","explanation":"The following ways are possible:  \\n(0,2,3) gives **6 ways**  \\neg. (0+2+3), (0+3+2), (2+0+3), (2+3+0), (3+0+2), (3+2+0)   \\nSimilarly,  \\n(1,2,2) gives **3 ways**   \\n(1,1,3) gives **3 way**   \\nfor a total of (6+3+3) = **12 ways** to get 6 points\\n","questionnaire":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617082081848.png",110,90,null,true,-1.2797074954296161,11.70018281535649],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620122821984.png",20,20,null,false,0.5118829981718486,0.5118829981718486],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620122880875.png",20,20,null,false,22.998171846435103,1.4259597806215742],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620122886799.png",20,20,null,false,44.02193784277879,0.6946983546617936]],"data":{"type":"mcq","data":{"options":["3","4","10","12","15"],"answer":"12"}}}	5pVIiw51qO0LLOm7xcMi	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
186	85	Sudoku! IV	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	medium	1	1620146775953	4	{"version":1,"description":"This is easy but only if you think from the right perspective.","category":" Sudoku","lang":"en","interactiveType":"dragAndDrop-3-Grid","ansType":"interactive","type":"dragAndDrop-3-Grid","statement":"Solve the Sudoku Puzzle!","explanation":"Try to fill up the columns (up-down).\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620146760804.PNG)","data":{"type":"interactive","unselected":["1","2","3"],"active":[false,false,false,true,true,true,false,false,false],"nCols":3,"nRows":3,"containers":[{"label":"2","items":[]},{"label":"1","items":[]},{"label":"3","items":[]},{"label":" ","items":[]},{"label":" ","items":[]},{"label":" ","items":[]},{"label":"1","items":[]},{"label":"3","items":[]},{"label":"2","items":[]}],"data":{"temp":["1","2","3"],"answer":[{"label":"2","items":[]},{"label":"1","items":[]},{"label":"3","items":[]},{"label":" ","items":["3"]},{"label":" ","items":["2"]},{"label":" ","items":["1"]},{"label":"1","items":[]},{"label":"3","items":[]},{"label":"2","items":[]}]}}}	MNIPRN5oAssB3ns8QhKK	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
116	60	Revisiting Darts	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617082081848.png	t	easy	3	1620122768785	3	{"version":1,"description":"Its been a long time since you last played darts. You remember that, if a dart hits   \\nthe **Yellow** region, its worth **1 point**  \\nthe **Orange** region, its worth  **2 points**  \\nthe **Red** regions, its worth **3 points**  \\n**outside the board** (that is, it misses), its worth **0 points**  \\nThough your skills with a dart has deteriorated, you're still adept at maths and problem solving","category":" Counting-","lang":"en","interactiveType":"dragAndDrop-2","ansType":"text","type":"dragAndDrop-2","statement":"You want to find out how many different total points you can end up with, if you **throws all 3 darts**. You can miss any number of darts.\\n\\nYou can use the board and drag the darts to play out your throws.\\n  ","explanation":"You can end up with the following totals:   \\n0+0+0 = 0   \\n0+0+1 = 1  \\n0+1+1 = 2  \\n1+1+1 = 3  \\n1+1+2 = 4  \\n..  \\n..  \\n..  \\n3+3+3 = 9\\n\\nThat is, totals from 0 to 9 are all possible.   \\nSo, a total of (9 - 0) +1= 10 different totals are possible.\\n","questionnaire":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617082081848.png",110,90,null,true,-1.3162705667276031,10.383912248628887],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620122741984.png",20,20,null,false,43.47349177330896,0.1462522851919582],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620122741984.png",20,20,null,false,21.901279707495434,0.32906764168190333],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620122741984.png",20,20,null,false,-0.4021937842778773,-0.4021937842778773]],"data":{"type":"text","data":{"answer":["10","Ten","ten"]}}}	6Cl4J1HCCnz987z72ATf	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
117	60	Revisiting Darts II	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617082081848.png	t	medium	3	1620122848995	4	{"version":1,"description":"You are revsiting the game of Darts after a long time. You know that, if a dart hits   \\nthe **Yellow** region, its worth **1 point**  \\nthe **Orange** region, its worth  **2 points**  \\nthe **Red** regions, its worth **3 points**  \\n**outside the board** (that is, a miss), its worth **0 points**  \\nThough your skills at darts have worsened, you're still good at maths and problem solving","category":" Counting - ","lang":"en","interactiveType":"dragAndDrop-2","ansType":"mcq","type":"dragAndDrop-2","statement":"You have 3 different colored darts.Lets say you throw the red dart first, blue dart 2nd, and the green dart last.  \\nYou haven't practiced for quite some time and you **CAN MISS** any number of your throws.  \\nIn **how many ways** can your **total score be 6** at the end of your 3 throws?  \\nNote: (1+2+3) and (2+3+1) count as different **Ways**, since the dart colors are different.","explanation":"The following ways are possible:  \\n(0,3,3) gives **3 ways**  \\neg. (0+3+3), (3+0+3), (3+3+0)   \\nSimilarly,  \\n(1,2,3) gives **6 ways** (Obtained by permutation/rearranging)  \\n(2,2,2) gives **1 way** (cannot be rearranged)   \\nfor a total of (3+6+1) = **10 ways** to get 6 points\\n","questionnaire":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1617082081848.png",110,90,null,true,-4.606946983546616,15.137111517367462],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620122806829.png",20,20,null,false,48.409506398537474,0.8775137111517388],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620122816086.png",20,20,null,false,25.191956124314444,0.8775137111517388],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620122821984.png",20,20,null,false,2.7056672760511904,1.2431444241316292]],"data":{"type":"mcq","data":{"options":["3","4","7","10","12"],"answer":"10"}}}	g6m5QbbwEvhunvA8QHrT	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
188	81	Confused???	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1612275645568.png	t	medium	1	1620208449986	2	{"version":1,"category":"Perimeter","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1620207908096.png) \\nWhich figure has the greatest perimeter?  \\nLength of all the matchsticks are same.","explanation":"If you observe carefully, the boundaries are made by same number of matchsticks. :)","data":{"type":"mcq","data":{"options":["The left one","The middle one","The right one","All of them are same"],"answer":"All of them are same"}}}	ihqajQh4T15yBBHzdRsl	VoTf81DreZTqGwSXurQ7g8DBnV43	t
183	85	Sudoku! II	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	medium	1	1620146193537	2	{"version":1,"description":"Sometimes you have to fill in the easier blanks first!","category":" Sudoku","lang":"en","interactiveType":"dragAndDrop-3-Grid","ansType":"interactive","type":"dragAndDrop-3-Grid","statement":"Can you solve this Sudoku problem?","explanation":"You need to attempt the bottom right corner at the end. Starting with the other two spaces will make it easier to progress.\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620146176228.PNG)","data":{"type":"interactive","unselected":["1","2","3"],"active":[false,false,false,false,false,true,false,true,true],"nCols":3,"nRows":3,"containers":[{"label":"1","items":[]},{"label":"2","items":[]},{"label":"3","items":[]},{"label":"3","items":[]},{"label":"1","items":[]},{"label":" ","items":[]},{"label":"2","items":[]},{"label":" ","items":[]},{"label":" ","items":[]}],"data":{"temp":["1","2","3"],"answer":[{"label":"1","items":[]},{"label":"2","items":[]},{"label":"3","items":[]},{"label":"3","items":[]},{"label":"1","items":[]},{"label":" ","items":["2"]},{"label":"2","items":[]},{"label":" ","items":["3"]},{"label":" ","items":["1"]}]}}}	X4LNhNJimQNWCJWMOtka	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
185	85	Sudoku! III	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	hard	1	1620146307927	3	{"version":1,"description":"This one is a bit harder than the ones before. FInd the easiest ones to fill up first!","category":" Sudoku","lang":"en","interactiveType":"dragAndDrop-3-Grid","ansType":"interactive","type":"dragAndDrop-3-Grid","statement":"Find the solution to the Sudoku puzzle.","explanation":"Attempting the middle square at the very end will make things easier!\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620146298476.PNG)","data":{"type":"interactive","unselected":["1","2","3"],"active":[false,false,false,false,true,true,false,true,false],"nCols":3,"nRows":3,"containers":[{"label":"3","items":[]},{"label":"2","items":[]},{"label":"1","items":[]},{"label":"1","items":[]},{"label":" ","items":[]},{"label":" ","items":[]},{"label":"2","items":[]},{"label":" ","items":[]},{"label":"3","items":[]}],"data":{"temp":["1","2","3"],"answer":[{"label":"3","items":[]},{"label":"2","items":[]},{"label":"1","items":[]},{"label":"1","items":[]},{"label":" ","items":["3"]},{"label":" ","items":["2"]},{"label":"2","items":[]},{"label":" ","items":["1"]},{"label":"3","items":[]}]}}}	CywO1ynBrEbsA4K8jFsA	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
267	96	Trace Back - V	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1621321011334.png	t	hard	1	1623359472576	5	{"version":1,"description":"The last problem of this series in this level is a bit different than the rest. This puzzle consists of 3 smaller puzzles. Now, can you figure out the final result to win this puzzle? ","hint":["Solve the lower 2 puzzles to find out values of A and B."],"category":" New Backtrack","lang":"bn","interactiveType":"none","ansType":"mcq","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623339447586.png)","explanation":"For determining A:\\n\\n32/2 = 16\\n\\n16=4x4\\n\\nTherefore, A=4\\n\\nFor determining B:\\n\\n2x2xB=44\\n\\nB=44/4\\n\\nTherefore, B=11\\n\\nFinally, 11+4=15","data":{"type":"mcq","data":{"options":["4","8","11","15"],"answer":"15"}},"width":80}	5RdrSfd7mkQJGgN1fitd	Hn4jI4W0tFW6zFuXl94nd7IbieI3	t
161	60	Chandler and Courtyard Again!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1613919559549.png	t	hard	3	1614960981468	6	{"version":1,"description":"Product Rule in Combinatorics: If a task \\"A\\" can be done in *x* number of  ways, and \\"B\\" can be done in *y* number of ways, and they're independent, the whole task can be completed by **x*y** (x multiplied by y) number of ways. [Click](https://en.wikipedia.org/wiki/Rule_of_product) to know more about product rule.\\n\\nAgain, you’re talented Chandler from city de friends, who loves to play football. There is an empty courtyard in front of your house which was measured ***36m x 25m.*** To make it playable, you and your friends proposed to cover it by grass carpets. Following picture illustrates the fact. \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1613918509859.png)\\n Now, some of your friends proposed it can be covered fully by few ***12m x 3m*** carpets, and some proposed it can never be done with ***11m x 9m*** carpets and so on. As you are the talented one, you were asked the following question.\\n ","hint":["So lets think about covering the length and then the width. Oh! you got it? How many ways to cover the length, and similarly how many ways to cover the width, is that so?!"],"category":"combinatorics","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"Determine the **number of variable sized grass carpets**, with which, the courtyard can be covered exactly to make it a football field. i.e. **how many ways** it can be covered exactly? ","explanation":"Firstly, the courtyard can only be covered, if the carpet dimensions are factors of the field dimension. Now,  \\nThe **factors of 25 : *1, 5, 25*** - *3 factors*.\\nSimilarly, **factors of 36 : 1,2,3,4,6,9,12,18,36** - *9 factors*. \\nFrom the product rule of combination: **3*9 = 27** ways.","data":{"type":"text","data":{"answer":["Twenty Seven","27","27 ways","Twenty seven","twenty seven"]}}}	a7ITNSE1SzmjpVb1HJXB	chn4mCsrRmb1P6QXHCbrEeEpDAl2	t
189	81	National Flag Again!!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1617524561632.png	t	easy	1	1623345472531	3	{"version":1,"category":"Perimeter","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1623345033742.png)  \\nWhat is the perimeter of this national flag?","explanation":"Perimeter of a rectangle=2×(base+height)  \\n2×(10+6)=32.","data":{"type":"text","data":{"answer":["32"]}},"width":60}	RwvOZ6BQVEqmEqShClyQ	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
196	73	The Factory	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package2.png	t	hard	2	1620295726856	4	{"version":1,"description":"A company uses a machine to sort packages. The machine first sorts the packages into small, large and fragile and then further sorts the fragile packages into cheap fragile and expensive fragile packages. A report says 1/2 of the packages are small and 2/5th of them are fragile; of the fragile packages 1/4th are cheap fragile packages. The different coloured conveyor belts transport different type of packages. A diagram of the set up is given below:\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/assembly+line.png)\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/keyass.jpg)","category":"fractions","lang":"en","interactiveType":"dragAndDrop-2","ansType":"mcq","type":"dragAndDrop-2","statement":"If 20 packages are sorted how many packages are in the boxes A, B and C?\\n\\n(You may move the packages into the boxes to help find the answer)","explanation":"If 1/2 are small packages and 2/5th are fragile packages:\\n\\n- Number of small packages = 1/2 x 20 = 10\\n- Number of fragile packages = 2/5 x 20 = 8\\n- Number of large packages = 20 - small packages - large packages = 20 - 8 -10 = 2\\n\\nIf 1/4th of fragile packages are cheap fragile packages:\\n\\n- Number of cheap fragile packages = 1/4 x fragile packages = 1/4 x 8 = 2\\n- Number of expensive fragile packages = fragile packages - cheap fragile packages = 8 - 2 = 6\\n\\nThus,\\n\\n- Number of packages in Box A = large packages + cheap fragile packages = 2 + 2 = 4\\n- Number of packages in Box B = expensive fragile packages = 6 \\n- Number of packages in Box C = small packages = 10\\n\\n\\n","questionnaire":[["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/box.png",95,35,0,true,2.974683544303799,60.09493670886076],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,9.303797468354432,46.80379746835443],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,9.620253164556964,11.360759493670887],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,9.462025316455698,34.462025316455694],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,73.54430379746834,23.069620253164558],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,41.74050632911393,10.88607594936709],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,57.879746835443036,46.64556962025316],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,25.601265822784814,46.80379746835443],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,73.86075949367088,46.4873417721519],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,25.44303797468355,11.202531645569621],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",16,12,0,false,73.22784810126582,11.044303797468356],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,41.89873417721519,34.778481012658226],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,41.74050632911393,46.80379746835443],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,25.75949367088608,34.462025316455694],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,73.86075949367087,34.778481012658226],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,9.303797468354432,22.59493670886076],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,57.563291139240505,11.044303797468356],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,57.721518987341774,34.620253164556964],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,25.44303797468355,22.436708860759495],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",15,12,0,false,57.721518987341774,22.911392405063292],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/Assembly+Line/package.png",14,12,0,false,42.21518987341772,22.436708860759495]],"data":{"type":"mcq","data":{"options":["Box A: 5 packages, Box B: 5 packages, Box C: 10 packages","Box A: 4 packages, Box B: 6 packages, Box C: 10 packages","Box A: 3 packages, Box B: 5 packages, Box C: 12 packages","Box A: 7 packages, Box B: 10 packages, Box C: 10 packages","Box A: 6 packages, Box B: 9 packages, Box C: 15 packages"],"answer":"Box A: 4 packages, Box B: 6 packages, Box C: 10 packages"}}}	GfS94tc1X1xZE0iCrxSK	96L7jidBxJW8vTTy6WrArU2qpd63	t
181	94	Draw a triangle!!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1612275645568.png	t	easy	1	1623518346769	5	{"version":1,"description":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1612275826822.png)","category":"Angle","lang":"en","interactiveType":"matchstick","ansType":"mcq","type":"matchstick","statement":"__Are we able to draw an Obtuse Triangle which has two obtuse angles?__  \\nTry with matchsticks","explanation":"A triangle can have only one obtuse angle","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":20,"y1":21,"x2":22,"y2":21,"isLocked":false},{"type":"matchstick","x1":18,"y1":18,"x2":20,"y2":21,"isLocked":false},{"type":"matchstick","x1":23,"y1":18,"x2":22,"y2":21,"isLocked":false}],"type":"mcq","data":{"options":["Yes","No"],"answer":"No"}},"width":100}	URt5GpmbtiGRRv0lt8YJ	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
203	88	Balancing the Scale	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/scale+balance.png	t	easy	3	1620417427419	1	{"version":1,"description":"A cuboid and 10 triangular prisms are made of the same material. It was found that 1 cubic centimeter of this material is 10 grams. Figures of the cuboid and prism are given below.\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/demo.jpg)","category":"weight balance","lang":"en","interactiveType":"dragAndDrop-2","ansType":"text","type":"dragAndDrop-2","statement":"If the cube is placed on one side of a scale balance how many prisms would need to be there on the other side?\\n\\n(You may place the prisms on the other side of the scale to help find the answer)\\n\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/key1.png)","explanation":"Here,\\n\\n- Volume of cube = 5 cm x 3cm x 4cm = 60 cm^3\\n- Volume of triangular prism = 1/2 x 2.5cm x 2cm x 3cm = 7.5 cm^3\\n\\nIf 1 cubic centimeter of the material is 10 grams\\n\\n- Weight of cube = 60 x 10 = 600 grams\\n- Weight of triangular prism = 7.5 x 10 = 75 grams\\n\\nTo balance the scale weight of both sides of the scale needs to be equal. Thus the prisms need to have a combined weight of 600 grams.Thus,\\n\\n- Number of prisms needed = 600/75 = 8","questionnaire":[["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/scale+balance.png",90,32,0,true,5.348101265822787,58.037974683544306],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/square.png",30,20,0,true,8.037974683544306,54.55696202531646],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/triangle.png",15,10,0,false,70.85443037974683,36.51898734177215],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/triangle.png",15,10,0,false,57.08860759493671,36.20253164556962],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/triangle.png",15,10,0,false,43.322784810126585,36.04430379746835],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/triangle.png",15,10,0,false,29.240506329113924,35.88607594936709],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/triangle.png",15,10,0,false,15.949367088607598,36.04430379746835],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/triangle.png",15,10,180,false,30.50632911392405,41.107594936708864],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/triangle.png",15,10,180,false,84.62025316455696,41.107594936708864],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/triangle.png",15,10,180,false,43.639240506329116,41.265822784810126],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/triangle.png",15,10,180,false,71.32911392405063,40.949367088607595],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/triangle.png",16,10,180,false,58.19620253164557,41.265822784810126]],"data":{"type":"text","data":{"answer":["8"]}}}	HEt7GxNzV88HASVHUaQ6	96L7jidBxJW8vTTy6WrArU2qpd63	t
271	97	Continuous Tracking - III	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623349248757.png	t	medium	2	1626635042542	3	{"version":1,"description":"Find out all the unknown numbers and rearrange them in __reverse alphabetical order__ (given, A < B and B ≠ C)\\n\\n(Reminder: The green ribbon means division operation and the pentagon is the divisor.)","hint":["Start backtracking from the last number, that is: 8\\n\\nSo, 136/D=8","You have 2 options for A and B. Choose the correct value after reading the conditions carefully.\\n\\n**A < B and B ≠ C**"],"category":" New Backtrack","lang":"en","interactiveType":"rearrange","ansType":"interactive","type":"rearrange","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623357351145.png)","explanation":"We know, the green ribbon represents division and the pentagon is the divisor. \\n\\nBy backtracking we get: 136/8 = 17\\n\\nAgain, backtracking: 17 – 7 = 10\\n\\nLastly, we have 10 = A * B\\n\\nTherefore, A and B must be 2 and 5.\\n","data":{"type":"interactive","fields":["10","5","2","17"],"data":{"answer":["17","10","5","2"]}},"width":80}	kxhjZzkmqocdmXvG9x7e	Hn4jI4W0tFW6zFuXl94nd7IbieI3	\N
30	38	Parity III	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	medium	1	1628618016047	3	{"version":1,"description":"Now let's deal with the parity of Products! Figure out the parity of the answers (and try to recognize a pattern).","category":" Parity","lang":"en","interactiveType":"dragAndDrop-1","ansType":"interactive","tags":["Basic","Arithmetic","Parity"],"type":"dragAndDrop-1","statement":"Drag and Drop the elements in the appropriate box according to the parity of the products.","explanation":"We can deduce that,__ if at least of the operands is even, then the product is even.__  \\nIn other words, __an odd product means that all the operands were odd.__\\n\\nThis is also true for the product of more than two numbers. For example: (11x 13 x 27 x 14) is even, since one of the operands, 14, is even. You can try it out for yourself!","data":{"type":"interactive","unselected":["2 x 3","7 x 9","22 x 12","49 x 51","221 x 112","10 x 10"],"containers":[{"label":"ODD","items":[]},{"label":"EVEN","items":[]}],"data":{"temp":["2 x 3","7 x 9","22 x 12","49 x 51","221 x 112","10 x 10"],"answer":[{"label":"ODD","items":["7 x 9","49 x 51"]},{"label":"EVEN","items":["2 x 3","22 x 12","221 x 112","10 x 10"]}]}},"width":90}	0Cp49zAzbvcHqalAIkC8	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
29	38	Parity II	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	medium	1	1620485595189	2	{"version":1,"description":"This problem is a bit trickier compared to the previous Parity problem. You have to do a bit of mental arithmetic and figure the answer to the operation (or do you??). Then you drag and drop the numbers according to their parity.","category":" Parity","lang":"en","interactiveType":"dragAndDrop-1","ansType":"interactive","tags":["Basic","Arithmetic","Parity"],"type":"dragAndDrop-1","statement":"Group the elements into even or odd, depending on the parity of the answer.","explanation":"We can calculate the results and then determine parity. Or... if we inspect closely, we can see that,  \\nEven - Even = Even  \\nOdd - Even = Odd  \\nEven - Odd = Odd  \\nOdd - Odd = Even\\n \\nIn other words, if both the operands are of the same parity (Both are even or both are odd), then the result is Even. And if they are of different parity (1 is even, 1 is odd), then the result is Odd.   \\nThis is also true for Addition. ","data":{"type":"interactive","unselected":[" 15-7","17+5","56-28","91 - 74","36+12","112 - 13","223 + 22"],"containers":[{"label":"EVEN","items":[]},{"label":"ODD","items":[]}],"data":{"temp":[" 15-7","17+5","56-28","91 - 74","36+12","112 - 13","223 + 22"],"answer":[{"label":"EVEN","items":[" 15-7","17+5","56-28","36+12"]},{"label":"ODD","items":["91 - 74","112 - 13","223 + 22"]}]}}}	FGSnHZkCYxGE1Rskekzd	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
204	88	Balancing the Scale - 2	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/scale+balance.png	t	hard	3	1620409198092	2	{"version":1,"description":"2 red cuboids are made of a material that has a mass of 1 grams for every 1 cubic centimeter and some blue cubes are made of a material that has a mass of 2.5 grams for every 1 cubic centimeter. The dimension of the cube and cuboid are given below:\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/demo+2.jpg)\\n\\nOn a scale balance a 1kg mass is placed on one side and 2 red cuboids are placed on the other side.\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/eqmass2.jpg)","category":"weight balance","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"How many blue cubes do you need to balance the scale?\\n\\n","explanation":"- 1kg = 1000g\\n\\nThere is a 1 kg mass on the left side of the scale and 2 red cuboids on the right side of the scale. Thus\\n\\n- Mass on left side = 1kg = 1000g\\n- Mass on right side = 2 x weight of red cuboid = 2 x (17 x 5 x 4) x 1 = 2 x 340 x 1 = 680g\\n- Mass of blue cube = (4 x 4 x 4) x 2.5 = 64 x 2.5 = 160g\\n\\nTo balance the scale weight on both sides of the scale need to be equal. Weight on the left side is (1000g - 680g) = 320g more than the left side. Thus\\n\\n- number of blue cubes required x mass of blue cube = 320g\\n- number of blue cubes required x 160g = 320g\\n- number of blue cubes required = 2","data":{"type":"text","data":{"answer":["2"]}}}	KLXnN487vXo9ULEB97Sj	96L7jidBxJW8vTTy6WrArU2qpd63	t
199	86	MassX	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/scale+balance.png	t	hard	1	1620399198310	3	{"version":1,"description":"In order to find the mass of a small blue cube some masses are placed on either side of a scale balance, for the following case the scale is balanced:\\n\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/eqmass.jpg)\\n![](https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/keymass.jpg)\\n","category":"weight balance","lang":"en","interactiveType":"none","ansType":"text","tags":["Algebra"],"type":"none","statement":"Find the mass of the small blue cube in grams.\\n\\n**(Enter the answer in the form Number g there should be no space between the Number and g eg. 5g )**","explanation":"- 1kg = 1000g\\n- 1hg = 100g\\n\\nSince the scale is balanced, weight on either sides of the scale is equal. Thus,\\n\\n- weight of 1kg block + 2 x weight of red block = 2 x weight of green block + 8 x weight of blue cube\\n- 1kg + 2 x 1hg = 2 x 400g + 8 x weight of blue cube\\n- 1000g + 2 x 100g = 2 x 400g + 8 x weight of blue cube\\n- 1000g + 200g = 800g + 8 x weight of blue cube\\n- 8 x weight of blue cube + 800g = 1200g\\n- 8 x weight of blue cube = 400g\\n- weight of blue cube = 50g\\n \\n","data":{"type":"text","data":{"answer":["50g"]}}}	qI3uiupdqC54LtZxLLUq	96L7jidBxJW8vTTy6WrArU2qpd63	t
242	59	Color The Buildings	https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622911703071.png	t	hard	2	1622915736354	4	{"version":1,"category":" 3D Shapes","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Parash wants to color the following buildongs. Which one needs the most amount of color?\\n## \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622402610604.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622402627657.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622402653746.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622402675157.png\\n)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622402705251.png\\n)","explanation":"Surface area in unit squares:\\n\\n__A:__ 42\\n\\n__B:__ 38\\n\\n__C:__ 40\\n\\n__D:__ 40\\n\\n__E:__ 40","data":{"type":"mcq","data":{"options":["A","B","C","D","E"],"answer":"A"}}}	mNdihEx6QHMUlDh4WHIt	sDCgfAyDqYhCWzPhpyCXj8aU0b63	t
146	73	Dresses in the Closet	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1618894906680.png	t	easy	2	1623604102505	3	{"version":1,"category":"fraction","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"One-seventh of all dresses in the closet are blue. A new dress was put in and now one-sixth of all dresses in the closet are blue. How many dresses are now in the closet?  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1623604077292.png)\\n\\n","restriction":[],"explanation":"35/7=5 and 36/6=6, 6-5=1.","data":{"type":"mcq","data":{"options":["35","36","42","49"],"answer":"36"}},"width":80}	6hrvWE13ZiXVnFmfKD4a	st1KFPBwmUNxPq6gtlcevCF7RqA3	\N
206	71	Shade the Triangle - II	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1620552072422.png	t	easy	2	1620552088869	4	{"version":1,"description":"**ABCD is a rectangle**\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1620550671880.png)","category":" Area","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"**Easy question. What is the area of the shaded region?**","explanation":"The shaded region is a **triangle**. And the formula for the area of a triangle is: **(1/2) × base × height**\\n\\nIf we consider PC as its base, the height will be AD\\n\\nNow that AD = 3 is given, we only need to find out PC. And for that we need to find out DP first\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1620549734167.png\\n)\\n\\n**By applying Pythagoras's Theorem in △ADP** (*Since ABCD is a rectangle, ∠ADP = 90*) **DP = 4**\\n\\nSo, PC = 7-4 = 3\\n\\n**Thus, area of △APC = (1/2) × 3 × 3 = 4.5**\\n\\n\\n\\n","data":{"type":"mcq","data":{"options":["4","7.5","4.5","6"],"answer":"4.5"}}}	WRX6Afw7pI2PNfmvlyQC	Duq6BDGCyAa5rLnIXML1yOjdOQp1	t
272	97	Continuous Tracking - IV	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623349248757.png	t	hard	2	1623690433011	4	{"version":1,"description":"Find out the difference between A and B from the puzzle:","hint":["An octagon is connected twice with pink ribbon, it means a number is multiplied with itself to get 49."],"category":" New Backtrack","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623359203684.png)","explanation":"An octagon is connected twice with pink ribbon, it means a number is multiplied with itself to get 49. \\n\\nSince, 7x7=49\\n\\nThe desired number is: 7\\nThen, 9 is the divisor. \\n\\nSo, 9x7 = 63.\\n\\nAgain, a number is multiplied with itself to get 9. \\n\\nTherefore, B = 3. (3x3 = 9)\\n\\nFor A:\\n63 – 31 = 32","data":{"type":"mcq","data":{"options":["3","27","29","32"],"answer":"29"}},"width":80}	aQkZi1Dr793kPDAqss4Y	Hn4jI4W0tFW6zFuXl94nd7IbieI3	t
207	69	Circle within a Circle!	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1620497724629.png	t	hard	3	1620498935802	3	{"version":1,"description":"*As you can see in the picture below,* surrounding a **green circular field**, there is a **circular road**\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1620497770137.png)","hint":["**First, you need to find area of two circles present in the picture**\\n\\n1. The bigger circle (field+road)\\n\\n2. The smaller circle (only the field)\\n\\n**Then subtract the area of Circle 1 from Circle 2**\\n\\nRemember the formula of a circles' area? **πr<sup>2</sup>**!!!"],"category":" Area","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"**With the given information in the picture, find out the area of the surrounding road**","explanation":"***If you do not understand the reason behind the following process, check out the hint. It is explained there***\\n\\nLet's first determine **area** of the **smaller circle** (only the field)\\n\\nIts diameter = 150\\n\\nSo, the radius = 150/2 = 75\\n\\nThus, the area = π 75<sup>2</sup> = 5625π ------------- (1)\\n\\nNow, let's determine **area** of the **bigger circle** (field+road)\\n\\n**Can you determine its radius?**\\n\\nIt is 75+12 = 87\\n\\nThus, the area = π 87<sup>2</sup> = 7569π ------------- (2)\\n\\n**Now, to find the area of the road, we need to subtract the area in equation (2) from equation (1),**\\n\\n**Area of the road = 7569π - 5625π = 1944π**\\n\\n","data":{"type":"mcq","data":{"options":["936π","144π","3744π","1944π"],"answer":"1944π"}}}	Yi1muAEpR5Ik0fQD2bLn	Duq6BDGCyAa5rLnIXML1yOjdOQp1	t
208	71	Floor Tiling	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1620544427458.png	t	medium	2	1620544434205	5	{"version":1,"description":"**The floor of a hallway looks like the below picture**\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1620543331526.png)\\n\\n**Your job is to place 5×3 size tiles on this floor and make it beautiful. Can you do that?**\\n\\n**N.B:** *The colorful triangles are symmetrical*","hint":["**Determine the area of the floor & area of the tiles. It will be handy**","If you are having trouble determining the area of the floor, this hint is for you. You need to do it in two steps. **The square** and **the triangles**"],"category":" Area","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"**How many tiles are needed to cover the entire floor?**","explanation":"Let's determine **area of the floor** first\\n\\nWe will do it in two steps\\n\\n**Step 1 (The square):**\\n\\nArea of the square = 15<sup>2 </sup> = 225\\n\\n**Step 2 (The triangles):**\\n\\nAs the triangles are symmetrical, their area will also be equal. So, let's first find out **the area of this colored triangle** only and then we will multiply it by 4\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1620543957706.png)\\n\\nArea = (1/2)×15×6 = 45\\n\\nSo, area of all the four triangles = 4×45 = 180\\n\\n**Thus, the total area of the floor = 225+180 = 405**\\n\\nNow, let's determine area of the tiles. This is quite easy\\n\\n**Area of one tile = 5×3 = 15**\\n\\n**So, total tiles needed to cover the entire floor = 405/15 = 27**\\n\\n","data":{"type":"text","data":{"answer":["27"]}}}	IAPEUQJqrSM0ypOHMVpj	Duq6BDGCyAa5rLnIXML1yOjdOQp1	t
209	71	Geogebra	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1620497563250.png	t	medium	2	1620543572245	6	{"version":1,"description":"**Area of this right angled triangle is 9 whose hypotenuse is 8**\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1620496170232.png)","hint":["**You need to take help of the most widely used formula in the algebra world to solve this problem**","**Form two equations from the given information and then use them to find out a+b!!**"],"category":" Area","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"**Find out the summation of two unknown sides**","explanation":"**Applying Pythagoras's Theorem,**\\n\\na<sup>2 </sup>+ b<sup>2 </sup> = 8<sup>2 </sup>\\n\\n=> a<sup>2 </sup>+ b<sup>2 </sup> = 64 **------------- (1)**\\n\\n**Again, as this is a right angled triangle,**\\n\\n**Area** = (1/2) × a × b = 9\\n\\n=> ab = 18 **------------- (2)**\\n\\n**Now, we need to find out a+b**\\n\\n(a+b)<sup>2 </sup> \\n\\n= a<sup>2 </sup>+ 2ab+ b<sup>2 </sup>\\n\\n=  a<sup>2 </sup>+ b<sup>2 </sup> + 2ab\\n\\n= 64 + 2 × 18\\n\\n= 64 + 36\\n\\n= 100\\n\\n**But this is not the answer!!!**\\n\\na+b = √100\\n\\n**So, a+b = 10**\\n\\n**N.B:** *Do you know, using formulas of basic algebra and equation solving method, you can even determine values of a & b separately!!!*","data":{"type":"mcq","data":{"options":["9","12","10","11"],"answer":"10"}}}	8dKQGj6d0YVN1AUEpXac	Duq6BDGCyAa5rLnIXML1yOjdOQp1	t
210	88	Balance is Key	https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/Temple/Asset+13.png	t	medium	3	1620760281453	3	{"version":1,"description":"6 archeologist were exploring an ancient temple and suddenly sprung a trap. They fell onto a triangular slab that was balanced from a point at the center. They must now find a way to distribute themselves so that weight on the 3 corners of the slab is equal to pervent it from tilting.","category":"weight balance","lang":"en","interactiveType":"dragAndDrop-2","ansType":"text","type":"dragAndDrop-2","statement":"If Dr.Jones runs to one corner and Dr.Coon runs to another what must be the weight of Dr.Willey so that weight can be distributed evenly on the slab? **The weight of the archeologists are given in the boxes in the diagram below. **\\n\\nIn the diagram below you can try pairing the archeologists by moving the boxes representing the respective archeologists and try to balance the weight. (The positions of Dr.Jones and Dr.Coon are fixed)\\n\\n**(Enter the answer in the form Number kg there should be no space between the Number and kg eg. 6kg) **","explanation":"Here if you pair Dr.Coon with Dr.Evans and Dr.Jones with Dr.Bent then the total weight at these corners will be:\\n\\n- Weight at 1st corner = Weight of Dr.Coon + Weight of Dr.Evans = 90kg + 70kg = 160kg\\n- Weight at 2nd corner = Weight of Dr. Jones + Weight of Dr.Bent = 80kg + 80kg = 160kg\\n\\nThus, \\n\\n- Weight at 3rd corner = 160kg\\n\\nThus Dr.Clark must be paired with Dr.Willey and their combined weight must be equal to weight at 3rd corner.\\n\\n- Weight of Dr.Clark + Weight of Dr.Willey = Weight at 3rd corner\\n- 85kg + Weight of Dr.Willey = 160kg\\n- Weight of Dr.Willey = 75kg","questionnaire":[["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/Temple/Asset+13.png",95,73,0,true,2.6582278481012676,26.550632911392405],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/Temple/Dr.Bent.png",15,12,0,false,10.88607594936709,7.08860759493671],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/Temple/Dr.Clark.png",15,12,0,false,53.13291139240506,6.772151898734179],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/Temple/Dr.Coon.png",15,12,0,true,42.848101265822784,30.031645569620252],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/Temple/Dr.Evans.png",15,12,0,false,31.930379746835442,6.772151898734179],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/Temple/Dr.Jones.png",15,12,0,true,8.9873417721519,86.20253164556961],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/Aditto/weight+distribution/Temple/Dr.Willey.png",15,12,0,false,74.33544303797467,6.772151898734179]],"data":{"type":"text","data":{"answer":["75kg"]}}}	0fTVJUtGmtYVhUekPThZ	96L7jidBxJW8vTTy6WrArU2qpd63	t
243	92	Cut The Square Grid	https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620521195223.PNG	t	easy	3	1622914962623	1	{"version":1,"description":"If someone has a square grid shaped sheet of paper, one can easily cut the paper along the grid line and make various shapes.","category":" 2D Shapes","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","type":"exclusion_grid","statement":"Saimum has __*3X3__* square grid as following.\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620521195223.PNG\\n)\\n\\nHe wants to cut the paper to get the following 3D-shape:\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1620520906111.PNG\\n)\\n\\nAlong which segments Saimum should cut through?","explanation":"If you do not get it, try to make a __3X3__ square grid in a paper and cut through the segments.","data":{"type":"interactive","rowHeading":["a","b","c","d","e","f","g","h","p","q","r","s"],"columnHeading":["Select the correct segment(s)"],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620029206439.png"]],"initialState":[[true],[true],[true],[true],[true],[true],[true],[true],[true],[true],[true],[true]],"data":{"answer":[[true],[false],[true],[false],[false],[false],[false],[true],[true],[true],[false],[false]]}}}	BHtt4aa1Q3kyapBRPlBp	sDCgfAyDqYhCWzPhpyCXj8aU0b63	t
213	51	Repair Shop	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1619778611548.jpg	t	easy	3	1621308997946	3	{"version":1,"description":"Yesterday, four people, *Andy*, *Bob*, *Carl* and *Susan* came to the repair shop for various reasons and saw a different mechanic. From the clues provided can you tell which person had which auto problem and what mechanic they saw?\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1619778611548.jpg)","category":"logical reasoning - exclusion grid","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","type":"exclusion_grid","statement":"1. *Carl* who didn't have engine problems or a check up, saw neither *Cassey* nor *Billy*. \\n2. *Adam* performed an oil change for one motorist, who is not *Andy*. \\n3. *Bob* who had a routine check-up didn't see *Drew*. \\n4. *Diana* didn't have the oil change, nor did she see mechanic *Drew*. \\n5. The woman who had the tire change saw either *Cassey* or *Adam*. \\n6. The person with engine problem saw *Billy*.","explanation":"Mark all boxes that are possible and unmark all boxes that are impossible.","data":{"type":"interactive","rowHeading":["Andy","Bob","Carl","Diana","Adam","Billy","Cassey","Drew"],"columnHeading":["Tire","Engine","CheckUp","Oil","Adam","Billy ","Cassey","Drew"],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","","","",""],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","","","",""],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","","","",""],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","","","",""]],"initialState":[[false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false],[false,false,false,false,true,true,true,true],[false,false,false,false,true,true,true,true],[false,false,false,false,true,true,true,true],[false,false,false,false,true,true,true,true]],"data":{"answer":[[false,false,true,false,false,false,false,true],[false,true,false,false,false,true,false,false],[false,false,false,true,true,false,false,false],[true,false,false,false,false,false,true,false],[false,false,false,true,true,true,true,true],[false,true,false,false,true,true,true,true],[true,false,false,false,true,true,true,true],[false,false,true,false,true,true,true,true]]}}}	HjmyHOsy604Ss02X5wQz	st1KFPBwmUNxPq6gtlcevCF7RqA3	t
214	51	Fuel Day	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1619778611548.jpg	t	medium	3	1621308301224	4	{"version":1,"description":"Four friends, **Ubaid**, **Zaid**, **Chris** and **Carroll**, own different kinds of vehicle. They need to pour different amounts of fuel according to their vehicle. Since your are an inquisitive person, you ask them about their vehicles and fuel amounts. But instead of answering you directly, they gave you a few clues.\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1619778611548.jpg)","category":"logical reasoning-exclusion grid","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","type":"exclusion_grid","statement":"1. The person who owns the truck put five liters less than the person who owns the car.\\n2. The most fuel were not put int the truck or the car.\\n3. *Carroll* said, \\"I put either 10 or 25 liters of fuel.\\"\\n4. *Ubaid* said, \\"I put more fuel at my truck than at least one other person.\\"\\n5. *Zaid* said, \\"I put more fuel than at least two others, but I did not put it in the\\ncar.\\"\\n6. *Chris* said, \\"I put more fuel than *Carroll* put in her snowmobile, but less than *Zaid*.\\"","explanation":"1 & 2 & 6 -> The order of the vehicle by fuel amount is snowmobile < truck < car < motorbike.\\n\\n4 -> Ubaid owns the truck.\\n\\n6 -> Carroll owns the snowmobile.\\n\\n5 -> Zaid owns the motorbike.\\n\\n6 -> Chris owns the motorbike","data":{"type":"interactive","rowHeading":["Ubaid","Zaid","Chris","Carroll","Car","Truck","Motorbike","Snowmobile"],"columnHeading":["10","15","20","25","Car","Truck","Motorbike","Snowmobile"],"cell":[["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png"],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png"],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png"],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png"],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","","","",""],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","","","",""],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","","","",""],["https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","https://buet-edu-1.s3.ap-south-1.amazonaws.com/tanjeem/ExclusionGrid/Tick.png","","","",""]],"initialState":[[false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false],[false,false,false,false,true,true,true,true],[false,false,false,false,true,true,true,true],[false,false,false,false,true,true,true,true],[false,false,false,false,true,true,true,true]],"data":{"answer":[[false,true,false,false,false,true,false,false],[false,false,false,true,false,false,true,false],[false,false,true,false,true,false,false,false],[true,false,false,false,false,false,false,true],[false,false,true,false,true,true,true,true],[false,true,false,false,true,true,true,true],[false,false,false,true,true,true,true,true],[true,false,false,false,true,true,true,true]]}}}	R7jl1g8m352Dzgp6X7Oj	st1KFPBwmUNxPq6gtlcevCF7RqA3	t
215	52	Vacation Sports	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620470988836.jpg	t	easy	2	1621308093835	3	{"version":1,"description":"Summer vacation is near and four friends are planning four different activities to learn in this time. Can you figure out which person chose which activity?\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620470988836.jpg)","category":"logical reasoning - exclusion grid","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","type":"exclusion_grid","statement":"**1.** Nobody chose an activity which started with the same first letter as their name.  \\n**2.** *Susan* is afraid of bungee jumping.  \\n**3.** *Roger* did not choose bungee jumping.  \\n**4.** Neither *Bill* nor *Susan* like motorsports.  \\n**5.** *Susan* did not choose high jump.","explanation":"1, 2, 3 -> Susan, Roger and Bill didn't choose bungee jumping, leaving only Joe.  \\n4-> Joe, Bill, Susan didn't choose motorsports, leaving only Roger.  \\n5-> Susan didn't choose high jump, hence, Susan chose hiking and Bill chose high jump.","data":{"type":"interactive","rowHeading":["Joe","Susan","Roger","Bill"],"columnHeading":["High Jump","Bungee","Motorsports","Hiking"],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"]],"initialState":[[false,false,false,false],[false,false,false,false],[false,false,false,false],[false,false,false,false]],"data":{"answer":[[false,true,false,false],[false,false,false,true],[false,false,true,false],[true,false,false,false]]}}}	Nblg5NfWt9A89Wt1dpQs	st1KFPBwmUNxPq6gtlcevCF7RqA3	t
149	61	Magic Squares Explored	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1623519046198.png	t	easy	3	1623519204772	2	{"version":1,"description":"Let's revisit Magic squares a bit. We know, an n x n magic square is a square with n rows and n columns that  \\n- is filled with numbers between 1and n.\\n- each cell has 1 number and__ each number can be used exactly once__ in the entire square\\n- the __sum of the numbers__ along each __row__ as well as each __column__ and both __diagonals__, will be __equal__","category":" Magic Squares","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"Below are 2 different 3x3 Magic Squares.\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1619336916735.png)  \\nAs you can see, there can be many different 3x3 Magic squares. Just how many __different__ 3x3 magic squares can you have?","explanation":"If you look at the corners, you'll find that these 8 are all reflections/rotations of each other.\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1619081351322.png)","data":{"type":"text","data":{"answer":["8","eight","Eight"]}},"width":70}	OlmctBZXjrhx0zq857jK	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
244	92	Cover The Rectangle with Tiles	https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1622911356729.png	t	easy	3	1623329901140	2	{"version":1,"description":"Mashroor has a rectangle which is covered with blue tiles as following:\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621052639556.png\\n)","category":" 2D Shapes","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Which of the following patterns of tiles can be completely covered up with Mashroor's rectangle?  \\n\\nA:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621052739513.png)  \\n\\nB:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621052748593.png)  \\n\\nC:   \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621052763085.png\\n)  \\n\\nD:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621052772139.png)  \\n\\nE:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621052780378.png)  \\n\\nF:  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621052797192.png)","explanation":"Try to rotate the patterns from the options and place it over the given pattern in your imagination.","data":{"type":"mcq","data":{"options":["A","B","C","D","E","F"],"answer":"D"}}}	3pnnvCsHoz1Qa9tdp9Gh	sDCgfAyDqYhCWzPhpyCXj8aU0b63	t
187	51	Where Am I From?	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1619838932086.png	t	easy	2	1621310704428	2	{"version":1,"description":"*Isaac*, *Josephus*, *Harold* and *John* sat together for dinner and found out that each of them comes from a different country! Can you find out each of their countries using the given clues?\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1619838910289.jpg)","category":"logical reasoning - exclusion grid","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","type":"exclusion_grid","statement":"**1.** *Harold* is not from Bangladesh.  \\n**2.** *Josephus'* country name is one word and has the same number of letters as his name.  \\n**3.** *Isaac* and his country name has the same initials.  ","explanation":"According to the 2nd clue, Josephus is from Pakistan (since both the names has 8 letters and Pakistan consists of one word). Isaac is from India (since the both starts with \\"I\\"). Harold is not from Bangladesh, and the persons from Pakistan and India is not Harold. Therefore Harold is from Sri Lanka and John remains who is from Bangladesh.","data":{"type":"interactive","rowHeading":["Isaac","Josephus","Harold","John"],"columnHeading":["Sri Lanka","Bangladesh","Pakistan","India"],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"]],"initialState":[[false,false,false,false],[false,false,false,false],[false,false,false,false],[false,false,false,false]],"data":{"answer":[[false,false,false,true],[false,false,true,false],[true,false,false,false],[false,true,false,false]]}}}	c5k7r99oCCmwCoAy14VX	st1KFPBwmUNxPq6gtlcevCF7RqA3	t
216	52	Family Tree	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620221410866.jpg	t	hard	2	1621328417416	5	{"version":1,"description":"Bill, Andy, Martha, Susy, Henry, Mary, and Melinda have come together for a family reunion. You do not know how they ar related to each other. You tell them about this and they replied:\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620221410866.jpg)\\n","category":"logical reasoning - exclusion grid","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","type":"exclusion_grid","statement":"- Henry is a grandfather \\n- Mary is a grandmother\\n- Henry and Bill are fathers\\n- Mary and Melinda are mothers\\n- Bill, Andy, Martha and Susy are children \\n\\nThere are also: \\n- 3 grandchildren\\n- 1 brother\\n- 2 sisters\\n- 2 sons\\n- 3 daughters\\n- 1 father-in-law\\n- 1 mother-in-law\\n- 1 daughter-in-law\\n\\nMark the boxes if a two person has a parent-child relation.\\n","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620223260400.PNG)","data":{"type":"interactive","rowHeading":["Susy","Martha","Andy","Melinda","Bill","Mary"],"columnHeading":["Henry","Mary","Bill","Melinda","Andy","Martha"],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222363705.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222282564.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222363705.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222282564.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222363705.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222282564.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222363705.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222282564.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222363705.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222282564.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222363705.png",""],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222363705.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222282564.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222363705.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222282564.png","",""],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222363705.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222282564.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222363705.png","","",""],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222363705.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222282564.png","","","",""],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620222363705.png","","","","",""]],"initialState":[[false,false,false,false,false,false],[false,false,false,false,false,true],[false,false,false,false,true,true],[false,false,false,true,true,true],[false,false,true,true,true,true],[false,true,true,true,true,true]],"data":{"answer":[[false,false,true,true,false,false],[false,false,true,true,false,true],[false,false,true,true,true,true],[false,false,false,true,true,true],[true,true,true,true,true,true],[false,true,true,true,true,true]]}}}	RKEEskCoABQTi2KaYW85	st1KFPBwmUNxPq6gtlcevCF7RqA3	t
218	52	Queue to Fun	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620546706578.jpg	t	easy	2	1621329159196	4	{"version":1,"description":"Five kids are standing in line waiting for the ice cream shop to open. What is the\\norder of the line?\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620546706578.jpg)","category":"logical reasoning - exclusion grid","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","type":"exclusion_grid","statement":"**1.** *Vajed* is in the exact middle of the line.  \\n**2.** *Brock* is directly behind *Tom*.  \\n**3.** *Mary* is not first or last.  \\n**4.** *Ayvan* is before *Vajed*.","explanation":"1 -> Wajed stood 3rd.  \\n2-> Brock and Tom are either 5th and 4th or 2nd and 1st.  \\n4-> Ayvan is before Vajed, therefore Brock and Tom are 5th and 4th.  \\n3-> Mary is 2nd, Ayvan is 1st.","data":{"type":"interactive","rowHeading":["Vajed","Brock","Tom","Mary","Ayvan"],"columnHeading":["1st ","2nd","3rd","4th","5th"],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1620547079820.png"]],"initialState":[[false,false,false,false,false],[false,false,false,false,false],[false,false,false,false,false],[false,false,false,false,false],[false,false,false,false,false]],"data":{"answer":[[false,false,true,false,false],[false,false,false,false,true],[false,false,false,true,false],[false,true,false,false,false],[true,false,false,false,false]]}}}	q6riolM3pf2IBs4vQZ7T	st1KFPBwmUNxPq6gtlcevCF7RqA3	t
245	93	Build Rectangular Box	https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621041361232.png	t	medium	3	1622915261140	1	{"version":1,"description":"Sakib has a rectangular box that looks like this:\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621041361232.png\\n)\\n","category":" 3D Shapes","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"Parash has some blocks of the following shape:\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/sDCgfAyDqYhCWzPhpyCXj8aU0b63/1621041395847.png\\n)\\n\\nHow many blocks does Parash need to build a box similar to that one of Sakib? (Answer in the numerical value)","explanation":"Imagine placing a block on top of one and another next to that one.","data":{"type":"text","data":{"answer":["4"]}}}	bybiSO650FON3jW0njri	sDCgfAyDqYhCWzPhpyCXj8aU0b63	t
220	85	Sudoku! VI	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	hard	1	1621332014999	6	{"version":1,"category":" Sudoku","lang":"en","interactiveType":"dragAndDrop-3-Grid","ansType":"interactive","type":"dragAndDrop-3-Grid","statement":"This is a bit tricky. Give it your best shot!","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1621331972979.PNG)","data":{"type":"interactive","unselected":["1","2","3","4"],"active":[true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true],"nCols":4,"nRows":4,"containers":[{"label":"2","items":[]},{"label":"3","items":[]},{"label":"4","items":[]},{"label":"1","items":[]},{"label":"4","items":[]},{"label":"1","items":[]},{"label":"2","items":[]},{"label":"3","items":[]},{"label":" ","items":[]},{"label":" ","items":[]},{"label":"1","items":[]},{"label":"4","items":[]},{"label":" ","items":[]},{"label":" ","items":[]},{"label":"3","items":[]},{"label":"2","items":[]}],"data":{"temp":["1","2","3","4"],"answer":[{"label":"2","items":[]},{"label":"3","items":[]},{"label":"4","items":[]},{"label":"1","items":[]},{"label":"4","items":[]},{"label":"1","items":[]},{"label":"2","items":[]},{"label":"3","items":[]},{"label":" ","items":["3"]},{"label":" ","items":["2"]},{"label":"1","items":[]},{"label":"4","items":[]},{"label":" ","items":["1"]},{"label":" ","items":["4"]},{"label":"3","items":[]},{"label":"2","items":[]}]}}}	ZrHbr45hGneqDIQu3pPA	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
273	97	Continuous Tracking - V	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623349248757.png	t	hard	2	1623691428715	5	{"version":1,"description":"The last puzzle of this series in this level is made up of two smaller ones. \\n\\nYour task is simple: Drag and drop the correct operators to validate the expression.","hint":["From the first puzzle, AxA=10","126/D=C"],"category":" Backtrack","lang":"en","interactiveType":"dragAndDrop-3-Grid","ansType":"interactive","type":"dragAndDrop-3-Grid","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623690699265.png)","explanation":"From the first puzzle, we get: 10 * 10 = 100 (A)\\n\\nThen, 100-46 = 54 (B)\\n\\n54/6 = 9 (C)\\n\\n126/9 = 14 (D)\\n\\nFinally, A__-__B__+__C-D=41\\n","data":{"type":"interactive","unselected":["+","-","x","/"],"active":[false,true,false,true,false,false,false,false,false],"nCols":9,"nRows":1,"containers":[{"label":"A","items":[]},{"label":" ","items":[]},{"label":"B","items":[]},{"label":" ","items":[]},{"label":"C","items":[]},{"label":"-","items":[]},{"label":"D","items":[]},{"label":"=","items":[]},{"label":"41","items":[]}],"data":{"temp":["+","-","x","/"],"answer":[{"label":"A","items":[]},{"label":" ","items":["-"]},{"label":"B","items":[]},{"label":" ","items":["+"]},{"label":"C","items":[]},{"label":"-","items":[]},{"label":"D","items":[]},{"label":"=","items":[]},{"label":"41","items":[]}]}},"width":80}	DU3WV7QAUVPtQiz1tnCV	Hn4jI4W0tFW6zFuXl94nd7IbieI3	t
219	85	Sudoku! V	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	hard	1	1621332447559	5	{"version":1,"category":" Sudoku","lang":"en","interactiveType":"dragAndDrop-3-Grid","ansType":"interactive","type":"dragAndDrop-3-Grid","statement":"This is a 4x4 sudoku puzzle. This time, each of the 2x2 squares in the corners must also have the numbers from 1 to 4 exactly once. For example: \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1621332358796.PNG)\\n\\nCan you solve the puzzle given below?","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1621331182265.PNG)\\n\\nHere, each of the numbers 1 to 4 appears **EXACTLY ONCE** in each column, row and 2x2 grid in the corners.","data":{"type":"interactive","unselected":["1","2","3","4"],"active":[false,false,false,false,false,false,false,false,false,true,true,true,false,false,true,false],"nCols":4,"nRows":4,"containers":[{"label":"1","items":[]},{"label":"4","items":[]},{"label":"3","items":[]},{"label":"2","items":[]},{"label":"3","items":[]},{"label":"2","items":[]},{"label":"1","items":[]},{"label":"4","items":[]},{"label":"4","items":[]},{"label":" ","items":[]},{"label":" ","items":[]},{"label":" ","items":[]},{"label":"2","items":[]},{"label":"3","items":[]},{"label":" ","items":[]},{"label":"1","items":[]}],"data":{"temp":["1","2","3","4"],"answer":[{"label":"1","items":[]},{"label":"4","items":[]},{"label":"3","items":[]},{"label":"2","items":[]},{"label":"3","items":[]},{"label":"2","items":[]},{"label":"1","items":[]},{"label":"4","items":[]},{"label":"4","items":[]},{"label":" ","items":["1"]},{"label":" ","items":["2"]},{"label":" ","items":["3"]},{"label":"2","items":[]},{"label":"3","items":[]},{"label":" ","items":["4"]},{"label":"1","items":[]}]}}}	DGYyXm7QU7zOE7r0J2ZG	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	t
221	52	Better Be Going	https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1621354841047.jpg	t	easy	2	1621354938577	6	{"version":1,"description":"Three people are going to the beach, each using a different mode of\\ntransportation in a different color. Who’s using what?\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/st1KFPBwmUNxPq6gtlcevCF7RqA3/1621354841047.jpg)","category":"logical reasoning - exclusion grid","lang":"en","interactiveType":"exclusion_grid","ansType":"interactive","type":"exclusion_grid","statement":"**1.** *Carol* loves orange, but she hates the water.  \\n**2.** *Finch* did not use the green vehicle.  \\n**3.** *Donald* drove the car.  ","explanation":"Donald took the car. Carol didn't take the boat, hence she took the motorbike. Finch took green boat. Donald took blue car. Carol took orange motorbike.","data":{"type":"interactive","rowHeading":["Carol","Donald","Finch","Blue","Orange","Green"],"columnHeading":["Car","Motorbike","Boat","Blue","Orange","Green"],"cell":[["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png"],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","","",""],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","","",""],["https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1620028078285.png","","",""]],"initialState":[[false,false,false,false,false,false],[false,false,false,false,false,false],[false,false,false,false,false,false],[false,false,false,true,true,true],[false,false,false,true,true,true],[false,false,false,true,true,true]],"data":{"answer":[[false,true,false,false,true,false],[true,false,false,true,false,false],[false,false,true,false,false,true],[true,false,false,true,true,true],[false,true,false,true,true,true],[false,false,true,true,true,true]]}}}	7lvCWHNXSDyDWFhGgSfY	st1KFPBwmUNxPq6gtlcevCF7RqA3	t
261	74	Shape With Matchstick - III	https://firebasestorage.googleapis.com/v0/b/setter-34453.appspot.com/o/ShapeWithMatchstick.PNG?alt=media&token=20f22e8a-62fb-4199-b220-f460f8fc2d0a	f	hard	3	1623388455089	7	{"version":1,"category":" MatchSticks","lang":"en","interactiveType":"matchstick","ansType":"interactive","type":"matchstick","statement":"You have to again turn this __5 squares to 4 squares__ again. But this time, you must move __exactly__ 3 matchsticks\\n\\nPlease note the following things\\n\\n* You can __neither __rotate the matchsticks __nor __change their size\\n* Each of the matchsticks __must participate__ in forming the remaining squares i.e. __no matchsticks can be left alone__","explanation":"Notice the __below two pictures__ to know __which matchsticks to move__ and __where to move__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623385327158.png)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623385343182.png)","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":22,"y1":24,"x2":22,"y2":28,"isLocked":false},{"type":"matchstick","x1":26,"y1":24,"x2":22,"y2":24,"isLocked":false},{"type":"matchstick","x1":26,"y1":24,"x2":26,"y2":28,"isLocked":false},{"type":"matchstick","x1":22,"y1":28,"x2":26,"y2":28,"isLocked":false},{"type":"matchstick","x1":30,"y1":24,"x2":26,"y2":24,"isLocked":false},{"type":"matchstick","x1":30,"y1":28,"x2":30,"y2":24,"isLocked":false},{"type":"matchstick","x1":26,"y1":28,"x2":30,"y2":28,"isLocked":false},{"type":"matchstick","x1":34,"y1":24,"x2":30,"y2":24,"isLocked":false},{"type":"matchstick","x1":34,"y1":28,"x2":34,"y2":24,"isLocked":false},{"type":"matchstick","x1":30,"y1":28,"x2":34,"y2":28,"isLocked":false},{"type":"matchstick","x1":22,"y1":32,"x2":26,"y2":32,"isLocked":false},{"type":"matchstick","x1":26,"y1":32,"x2":26,"y2":28,"isLocked":false},{"type":"matchstick","x1":30,"y1":32,"x2":34,"y2":32,"isLocked":false},{"type":"matchstick","x1":30,"y1":28,"x2":30,"y2":32,"isLocked":false},{"type":"matchstick","x1":34,"y1":28,"x2":34,"y2":32,"isLocked":false},{"type":"matchstick","x1":22,"y1":28,"x2":22,"y2":32,"isLocked":false}],"type":"interactive","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":22,"y1":24,"x2":22,"y2":28,"isLocked":false},{"type":"matchstick","x1":26,"y1":24,"x2":22,"y2":24,"isLocked":false},{"type":"matchstick","x1":26,"y1":24,"x2":26,"y2":28,"isLocked":false},{"type":"matchstick","x1":22,"y1":28,"x2":26,"y2":28,"isLocked":false},{"type":"matchstick","x1":30,"y1":24,"x2":26,"y2":24,"isLocked":false},{"type":"matchstick","x1":30,"y1":28,"x2":30,"y2":24,"isLocked":false},{"type":"matchstick","x1":26,"y1":28,"x2":30,"y2":28,"isLocked":false},{"type":"matchstick","x1":34,"y1":24,"x2":30,"y2":24,"isLocked":false},{"type":"matchstick","x1":34,"y1":28,"x2":34,"y2":24,"isLocked":false},{"type":"matchstick","x1":30,"y1":28,"x2":34,"y2":28,"isLocked":false},{"type":"matchstick","x1":22,"y1":32,"x2":26,"y2":32,"isLocked":false},{"type":"matchstick","x1":26,"y1":32,"x2":26,"y2":28,"isLocked":false},{"type":"matchstick","x1":30,"y1":32,"x2":34,"y2":32,"isLocked":false},{"type":"matchstick","x1":30,"y1":28,"x2":30,"y2":32,"isLocked":false},{"type":"matchstick","x1":34,"y1":28,"x2":34,"y2":32,"isLocked":false},{"type":"matchstick","x1":22,"y1":28,"x2":22,"y2":32,"isLocked":false}]}},"width":60}	MY7TUv5GGJYgqHrUr69y	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
258	74	Move 3 Make 3	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623285718366.png	f	hard	3	1623384936852	5	{"version":1,"category":" MatchSticks","lang":"en","interactiveType":"matchstick","ansType":"interactive","type":"matchstick","statement":"You need to make __exactly __3 squares which means you need to __vanish __1 square But you also need to do that by moving __exactly__ 3 matchsticks\\n\\nPlease note the following things\\n\\n* There are 4 squares __already__\\n* You can __neither __rotate the matchsticks __nor __change their size\\n* Each of the matchsticks __must participate__ in forming the remaining squares i.e. __no matchsticks can be left alone__","explanation":"Notice the __below two pictures__ to know __which matchstick to move__ and __where to move__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623356508028.png)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623356524101.png)","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":21,"y1":22,"x2":21,"y2":25,"isLocked":false},{"type":"matchstick","x1":24,"y1":22,"x2":21,"y2":22,"isLocked":false},{"type":"matchstick","x1":24,"y1":25,"x2":24,"y2":22,"isLocked":false},{"type":"matchstick","x1":21,"y1":25,"x2":24,"y2":25,"isLocked":false},{"type":"matchstick","x1":27,"y1":22,"x2":24,"y2":22,"isLocked":false},{"type":"matchstick","x1":27,"y1":25,"x2":24,"y2":25,"isLocked":false},{"type":"matchstick","x1":27,"y1":22,"x2":27,"y2":25,"isLocked":false},{"type":"matchstick","x1":27,"y1":19,"x2":27,"y2":22,"isLocked":false},{"type":"matchstick","x1":24,"y1":19,"x2":27,"y2":19,"isLocked":false},{"type":"matchstick","x1":24,"y1":22,"x2":24,"y2":19,"isLocked":false},{"type":"matchstick","x1":21,"y1":19,"x2":24,"y2":19,"isLocked":false},{"type":"matchstick","x1":21,"y1":22,"x2":21,"y2":19,"isLocked":false}],"type":"interactive","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":24,"y1":22,"x2":24,"y2":25,"isLocked":false},{"type":"matchstick","x1":27,"y1":22,"x2":24,"y2":22,"isLocked":false},{"type":"matchstick","x1":27,"y1":25,"x2":27,"y2":22,"isLocked":false},{"type":"matchstick","x1":24,"y1":25,"x2":27,"y2":25,"isLocked":false},{"type":"matchstick","x1":21,"y1":25,"x2":24,"y2":25,"isLocked":false},{"type":"matchstick","x1":21,"y1":28,"x2":21,"y2":25,"isLocked":false},{"type":"matchstick","x1":24,"y1":28,"x2":24,"y2":25,"isLocked":false},{"type":"matchstick","x1":21,"y1":28,"x2":24,"y2":28,"isLocked":false},{"type":"matchstick","x1":30,"y1":25,"x2":27,"y2":25,"isLocked":false},{"type":"matchstick","x1":27,"y1":28,"x2":27,"y2":25,"isLocked":false},{"type":"matchstick","x1":30,"y1":28,"x2":30,"y2":25,"isLocked":false},{"type":"matchstick","x1":30,"y1":28,"x2":27,"y2":28,"isLocked":false}]}},"width":60}	EbnWpcInjxYmpD4zaYZT	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
274	98	Advanced Backtracking - I	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623851584511.png	t	easy	3	1624545655291	1	{"version":1,"description":"Let's refresh your knowledge on this series once again before moving to a new kind of puzzles. Find out the \\"?\\" marked number just like before.","category":"New Backtrack","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1624545102454.png)","explanation":"Starting from 84:\\n\\n84/12 = 7\\n\\n7 x 4 = 28\\n\\nTherefore, the answer is: __28__\\n","data":{"type":"text","data":{"answer":["28"]}},"width":80}	aduLINQLyYDjYBjkG28q	Hn4jI4W0tFW6zFuXl94nd7IbieI3	t
263	96	Trace Back - I	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1621321011334.png	t	easy	1	1623359438522	1	{"version":1,"description":"You’ve got a mathematical puzzle as your birthday present. In this puzzle, each octagon represents a number and they are connected with each other with colorful ribbons. You need to perform series of basic operations according to the color of the ribbons from left to right to solve the puzzle. Find the __“?”__ marked number to win the game!","hint":["To find the desired number, start backtracking from the final number, 30.\\nSince Pink ribbon denotes multiplication, divide 30 by 2 for backtracking.\\n","the purple ribbon denotes addition. So, 10 + ? = 15. Therefore, perform a subtractionto reach your answer!"],"category":" New Backtrack","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1621321277396.png)","explanation":"To find the desired number, we need to start backtracking from our final number, 30.\\nSince Pink ribbon denotes multiplication, we have to divide 30 by 2 for backtracking. \\n\\n30/2 = __15__.\\n\\nNow, the purple ribbon denotes addition. \\n\\nSo, 10 + __?__ = 15. \\n\\nTherefore, performing a subtraction, the final answer __5__ is reached!\\n","data":{"type":"text","data":{"answer":["5"]}},"width":80}	Ji8hZc063S8JW23mB39D	Hn4jI4W0tFW6zFuXl94nd7IbieI3	t
262	78	Correct Equation - II	https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623387799225.png	t	medium	1	1623854382241	5	{"version":1,"category":" MatchSticks","lang":"en","interactiveType":"matchstick","ansType":"interactive","type":"matchstick","statement":"As you can see, the given equation is incorrect. Can you make it correct?\\n\\nPlease note the following things\\n\\n* You must move __exactly__ 1 matchstick\\n* You cannot change the operators (i.e. the __+ & =__ sign for this question). You can only change the digits (i.e the numbers __6, 2 and 9__ for this question)\\n* You can __neither__ rotate the matchsticks __nor__ change their size\\n* Each of the matchsticks __must participate__ in forming the equation as it is now","explanation":"Notice the __below two pictures__ to know __which matchstick to move__ and __where to move__\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623388376774.png)\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Duq6BDGCyAa5rLnIXML1yOjdOQp1/1623388390009.png)","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":21,"y1":22,"x2":21,"y2":25,"isLocked":false},{"type":"matchstick","x1":24,"y1":22,"x2":21,"y2":22,"isLocked":false},{"type":"matchstick","x1":21,"y1":25,"x2":24,"y2":25,"isLocked":false},{"type":"matchstick","x1":24,"y1":25,"x2":24,"y2":22,"isLocked":false},{"type":"matchstick","x1":21,"y1":19,"x2":21,"y2":22,"isLocked":false},{"type":"matchstick","x1":24,"y1":19,"x2":21,"y2":19,"isLocked":false},{"type":"matchstick","x1":27,"y1":21,"x2":27,"y2":23,"isLocked":false},{"type":"matchstick","x1":26,"y1":22,"x2":28,"y2":22,"isLocked":false},{"type":"matchstick","x1":30,"y1":19,"x2":33,"y2":19,"isLocked":false},{"type":"matchstick","x1":33,"y1":19,"x2":33,"y2":22,"isLocked":false},{"type":"matchstick","x1":42,"y1":22,"x2":39,"y2":22,"isLocked":false},{"type":"matchstick","x1":39,"y1":22,"x2":39,"y2":19,"isLocked":false},{"type":"matchstick","x1":42,"y1":19,"x2":42,"y2":22,"isLocked":false},{"type":"matchstick","x1":39,"y1":25,"x2":42,"y2":25,"isLocked":false},{"type":"matchstick","x1":30,"y1":22,"x2":30,"y2":25,"isLocked":false},{"type":"matchstick","x1":33,"y1":22,"x2":30,"y2":22,"isLocked":false},{"type":"matchstick","x1":30,"y1":25,"x2":33,"y2":25,"isLocked":false},{"type":"matchstick","x1":35,"y1":21,"x2":37,"y2":21,"isLocked":false},{"type":"matchstick","x1":37,"y1":23,"x2":35,"y2":23,"isLocked":false},{"type":"matchstick","x1":42,"y1":22,"x2":42,"y2":25,"isLocked":false},{"type":"matchstick","x1":39,"y1":19,"x2":42,"y2":19,"isLocked":false}],"type":"interactive","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":21,"y1":22,"x2":21,"y2":25,"isLocked":false},{"type":"matchstick","x1":24,"y1":22,"x2":21,"y2":22,"isLocked":false},{"type":"matchstick","x1":21,"y1":25,"x2":24,"y2":25,"isLocked":false},{"type":"matchstick","x1":24,"y1":25,"x2":24,"y2":22,"isLocked":false},{"type":"matchstick","x1":21,"y1":19,"x2":21,"y2":22,"isLocked":false},{"type":"matchstick","x1":24,"y1":19,"x2":21,"y2":19,"isLocked":false},{"type":"matchstick","x1":27,"y1":21,"x2":27,"y2":23,"isLocked":false},{"type":"matchstick","x1":26,"y1":22,"x2":28,"y2":22,"isLocked":false},{"type":"matchstick","x1":30,"y1":19,"x2":33,"y2":19,"isLocked":false},{"type":"matchstick","x1":33,"y1":19,"x2":33,"y2":22,"isLocked":false},{"type":"matchstick","x1":42,"y1":22,"x2":39,"y2":22,"isLocked":false},{"type":"matchstick","x1":39,"y1":22,"x2":39,"y2":19,"isLocked":false},{"type":"matchstick","x1":42,"y1":19,"x2":42,"y2":22,"isLocked":false},{"type":"matchstick","x1":39,"y1":25,"x2":42,"y2":25,"isLocked":false},{"type":"matchstick","x1":33,"y1":22,"x2":33,"y2":25,"isLocked":false},{"type":"matchstick","x1":33,"y1":22,"x2":30,"y2":22,"isLocked":false},{"type":"matchstick","x1":30,"y1":25,"x2":33,"y2":25,"isLocked":false},{"type":"matchstick","x1":35,"y1":21,"x2":37,"y2":21,"isLocked":false},{"type":"matchstick","x1":37,"y1":23,"x2":35,"y2":23,"isLocked":false},{"type":"matchstick","x1":42,"y1":22,"x2":42,"y2":25,"isLocked":false},{"type":"matchstick","x1":39,"y1":19,"x2":42,"y2":19,"isLocked":false}]}},"width":60}	2PHVpktcK3BVMbF60PA8	Duq6BDGCyAa5rLnIXML1yOjdOQp1	\N
275	98	Advanced Backtracking - II	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623851584511.png	t	easy	3	1624545634973	2	{"version":1,"description":"You're becoming a pro at solving backtracking puzzles! Only a few pieces are left to crack. But you see that some ribbons of these remaining puzzles have become colorless (grey). So, now instead of finding out numbers, you have to figure out the correct colors of the grey ribbons.","hint":["Start from **100** and find out the other addend. ","Can we multiply any integer with 7 to get the required number"],"category":"New Backtrack","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1624542797456.png)","explanation":"The final number is 100. \\n\\nBy backtracking and performing subtraction: __100-36 = 64__\\n\\nSince we have only 2 operators in this puzzle (multiplication and addition) and __we cannot get 64 by multiplying any integer number with 7, we must perform addition.__\\n\\nThat means the color of these ribbons should be purple.\\n","data":{"type":"mcq","data":{"options":["pink (multiplication)","purple (addition)"],"answer":"purple (addition)"}},"width":80}	zSWlO2YhIMeohUOQeSHw	Hn4jI4W0tFW6zFuXl94nd7IbieI3	t
264	96	Trace Back - II	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1621321011334.png	t	easy	1	1623359447703	2	{"version":1,"description":"Another puzzle of the same type for you to solve! But this time you have to find out all three numbers denoted by A, B and C, given __A < B__ and __B < C__.","hint":["Start backtracking from 42 and perform a division.\\n\\n42/7 = ?","Now, A + B + C = 6\\n\\nThere are two options for A, B and C.\\n\\n(i) 2 + 2 + 2 = 6\\n\\n(ii) 1 + 2 + 3 = 6\\n\\nLook at the given condition in the question again and find out which one is correct."],"category":" New Backtrack","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1621321764796.png)","explanation":"Backtracking from 42, we get 42/7 = 6.\\n\\nSo, A + B + C = 6\\n\\nGiven condition: A < B and B < C\\n\\nTherefore, A = 1, B = 2, C = 3\\n","data":{"type":"mcq","data":{"options":["A = 2, B = 2, C = 2","A = 1, B = 2, C = 3","A = 2, B = 3, C = 1","A = 3, B = 1, C = 2"],"answer":"A = 1, B = 2, C = 3"}},"width":80}	F3AYzaDmbFen6Knz3ls2	Hn4jI4W0tFW6zFuXl94nd7IbieI3	t
265	96	Trace Back - III	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1621321011334.png	t	medium	1	1623359454854	3	{"version":1,"description":"You are making great progress in solving trace back puzzles. So, here is another challenging puzzle for you. Can you find out the __\\"?\\"__ marked number?","hint":["To find the desired number, start backtracking from the final number, 60.\\n\\nSince Pink ribbon denotes multiplication, we have to divide 60 by 5 for backtracking. \\n\\nSo, what is 60/5?\\n","the purple ribbon denotes addition. \\n\\nSince 1 octagon is attached twice with the ribbon, we need to add ? marked number with itself to get 12. \\n\\nTherefore, ? + ? = 12\\n\\nIn another words, 2*? = 12\\n\\nWhich means: 12 / 2 = ?"],"category":" New Backtrack","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1621322906176.png)","explanation":"Backtracking from our final number, 60:\\n\\nSince Pink ribbon denotes multiplication, we have to divide 60 by 5.\\n\\n60/5 = 12.\\n\\nNow, the purple ribbon denotes addition. \\n\\nSo, we need to add ? marked number twice to get 12. \\n\\nTherefore, 12/2 = 6\\n \\n","data":{"type":"text","data":{"answer":["6"]}},"width":80}	fxYjWmDAQbNwS4a3v9yF	Hn4jI4W0tFW6zFuXl94nd7IbieI3	t
266	96	Trace Back - IV	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1621321011334.png	t	hard	1	1623359463704	4	{"version":1,"description":"You are making great progress in solving trace back puzzles. So, here is another another variation of your previously solved puzzles. Can you find out the __\\"?\\"__ marked number?","hint":["the purple ribbon denotes addition and pink ribbon denotes multiplication. \\n\\nSince 1 octagon is attached twice with the ribbons, we need to multiply ? marked number with itself. \\n\\nThe same logic applies for the octagon containing \\"18\\"\\n"],"category":" New Backtrack","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623338325475.png)","explanation":"We cannot start backtracking from our final number, 72 because we don't know any of the previous numbers yet.\\n\\nSo, starting forward calculation from 18 we get:\\n\\n18+18=36\\n\\nNow we can divide 72 by 36 and get 36 as quotient.\\n\\nSince Pink ribbon denotes multiplication, we finally have to multiply ? with itself to reach 36. \\n\\n6*6=36\\n\\n\\nTherefore, ?=6\\n \\n","data":{"type":"mcq","data":{"options":["6","18","27","36"],"answer":"6"}},"width":80}	2NLBhJ1Ab2Ez3uq4YVfn	Hn4jI4W0tFW6zFuXl94nd7IbieI3	t
24	36	Candies at The Party	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1623517296351.png	t	medium	1	1623517433351	3	{"version":1,"description":"Mike’s birthday is coming up and he wants to invite his friends. Help him count the number of extra candies he needs to buy, so that everyone gets equal number of candies.  \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1623517296351.png)","category":" Unitary Method","lang":"en","interactiveType":"none","ansType":"text","tags":["Basic","Arithmetic","Unitary","Method"],"type":"none","statement":"Mike remembers that last year he only had 5 friends and he bought 15 candies in total. He distributed all the candies equally among his friends and everyone was happy.  \\nThis year he has 15 friends and wants to give each friend 1 candy more than last year. He already has 37 candies at home.  \\nHow many __more__ candies does he need to buy?","explanation":"Last Year:  \\n                    He gave 5 friends -> 15 candies   \\nTherefore, He gave 1 friend -> 3 candies  \\n \\nThis Year:  \\nHe wants to give each friend 1 more candy.  \\ni.e He wants to give 1 friend (1+3) = 4 candies.  \\nTherefore, He wants to give 15 friends (4x15) = 60 candies.\\n\\nHe already has 37 candies. \\nHe needs an extra of (60-37) = 23 candies.\\n\\t\\t\\n","data":{"type":"text","data":{"answer":["23"]}},"width":60}	s5nFBYDuTFJmxcptjlsK	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
110	39	Operators and Operands	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1617030128111.png	t	easy	1	1623517509654	1	{"version":1,"description":"In an arithmetic expression, some elements which have their own value are known as __operands__. Other elements don't have their own value; however, they can work on one or many operands to get a final value. These are known as __operators__.  \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1617032079372.png)\\n  \\nFor example, in the expression __2+2-2__, 2 is an __operand__ which has its own numerical value. ","category":" Basic Operations","lang":"en","interactiveType":"dragAndDrop-1","ansType":"interactive","type":"dragAndDrop-1","statement":"Drag the operands and operators from the bottom and drop those into their corresponding box.","explanation":" +, - , / and x are operators and the rest are operands.","data":{"type":"interactive","unselected":["54","-","566","77","0","+","/","20","16","x"],"containers":[{"label":"Operand","items":[]},{"label":"Operator","items":[]}],"data":{"temp":["54","-","566","77","0","+","/","20","16","x"],"answer":[{"label":"Operand","items":["54","566","77","0","20","16"]},{"label":"Operator","items":["-","+","/","x"]}]}},"width":50}	RjrxF1ns6SlsVY1eEG7s	0RMFi9mrPNe7mol2JwcZAf40F3n2	\N
254	37	Detect series members	https://buet-edu-1.s3.ap-south-1.amazonaws.com/mehrab/venn_icon.png	t	hard	1	1623517635173	3	{"version":1,"description":"In this problem, you are given 8 numbers. Some of them belong to the series : __2, 4, 8, 16, 32, ..........__ and some do not.\\n\\nDrag the numbers and drop them in the first box if the number is in the series, otherwise, drop them in the second container.","category":" Number Series","lang":"en","interactiveType":"dragAndDrop-1","ansType":"interactive","type":"dragAndDrop-1","statement":"Drag and drop all of those numbers to their corresponding box.","explanation":"The series is : __2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096,...__","data":{"type":"interactive","unselected":["56","48","128","1048","2048","512","2096","64"],"containers":[{"label":"In the series","items":[]},{"label":"Not in the series","items":[]}],"data":{"temp":["56","48","128","1048","2048","512","2096","64"],"answer":[{"label":"In the series","items":["128","2048","512","64"]},{"label":"Not in the series","items":["56","48","1048","2096"]}]}},"width":50}	fu4LAlDgs0mavNV3wRM5	0RMFi9mrPNe7mol2JwcZAf40F3n2	\N
148	75	Magic Square for Beginners-2	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1623519046198.png	t	medium	2	1623519115061	3	{"version":1,"description":"An n x n magic square is a square with n rows and n columns that\\n\\n- is filled with numbers between 1and n.\\n- each cell has 1 number and__ each number can be used exactly once__ in the entire square\\n- the __sum of the numbers__ along each __row__ as well as each __column__ and both __diagonals__, will be __equal__","hint":["The sum along each row and each column will be 15! Can you figure out why?"],"category":" Magic Squares","lang":"en","interactiveType":"dragAndDrop-3-Grid","ansType":"interactive","type":"dragAndDrop-3-Grid","statement":"Can you drag and drop the numbers in the empty cells to make a magic square?","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1622983485183.PNG)\\n\\n\\nThe sum along each row and each column is 15!","data":{"type":"interactive","unselected":["1","2","3","4","5","6","7","8","9"],"active":[true,true,false,true,false,true,false,false,true],"nCols":3,"nRows":3,"containers":[{"label":" ","items":[]},{"label":" ","items":[]},{"label":"6","items":[]},{"label":" ","items":[]},{"label":"5","items":[]},{"label":" ","items":[]},{"label":"4","items":[]},{"label":"3","items":[]},{"label":" ","items":[]}],"data":{"temp":["1","2","3","4","5","6","7","8","9"],"answer":[{"label":" ","items":["2"]},{"label":" ","items":["7"]},{"label":"6","items":[]},{"label":" ","items":["9"]},{"label":"5","items":[]},{"label":" ","items":["1"]},{"label":"4","items":[]},{"label":"3","items":[]},{"label":" ","items":["8"]}]}},"width":60}	WHtS9WKgvWrVhclAsiVr	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
151	61	Magic Squares Explored - 3	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1623519046198.png	t	medium	3	1623519270351	4	{"version":1,"description":"Let us revert to our original definition of an n x n Magic Square: A square with n rows and n columns such that\\n\\n- it is filled with numbers between 1and n.\\n- each cell has 1 number and__ each number can be used exactly once__ in the entire square\\n- the __sum of the numbers__ along each __row__ as well as each __column__ and both __diagonals__, will be __equal__","category":" Magic Squares","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"You might have noticed that the sum of each row/column/diagonal of a 3x3 magic square is 15.  \\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1619337270366.png)\\nCan you figure out the sum of each row/column/diagonal of a 4x4 Magic Square? (There will be a unique sum!)","explanation":"In general:\\nAnd n x n Magic Square has the numbers 1 to n^2  \\nSo sum of all the numbers  \\n= 1+2+....+n^2  \\n= (n^2 x (n^2 +1))/2  \\n\\nNow this sum is __equally divided across n rows__ (since sum of all rows = total sum of the entire square, and each of the row-sums are equal)  \\n\\nSo, sum of all numbers in a row  \\n= ((n^2 x (n^2 + 1))/2)/n\\n= (n x (n^2 + 1))/2\\n\\nPutting n = 4,\\nwe get, required sum = 4 x(16 +1) /2 =__ 34__\\n\\n","data":{"type":"mcq","data":{"options":["20","28","34","36","40"],"answer":"34"}},"width":80}	MOkdBqvKRVMc4jAmJPOy	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
147	75	Magic Square for Beginners	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1623519046198.png	t	easy	2	1623519157353	2	{"version":1,"description":"An n x n magic square is a square with n rows and n columns that\\n\\n- is filled with numbers between 1and n.\\n- each cell has 1 number and__ each number can be used exactly once__ in the entire square\\n- the __sum of the numbers__ along each __row__ as well as each __column__ and both __diagonals__, will be __equal__","category":" Magic Squares","lang":"en","interactiveType":"dragAndDrop-3-Grid","ansType":"interactive","type":"dragAndDrop-3-Grid","statement":"Try to fill the blank spaces with appropriate numbers so that you end up with a magic square.","explanation":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1622983446586.PNG)   \\n\\nThe sum across each row, column and diagonal is 15!","data":{"type":"interactive","unselected":["1","2","3","4","5","6","7","8","9"],"active":[false,false,false,true,false,true,true,true,false],"nCols":3,"nRows":3,"containers":[{"label":"8","items":[]},{"label":"1","items":[]},{"label":"6","items":[]},{"label":" ","items":[]},{"label":"5","items":[]},{"label":" ","items":[]},{"label":" ","items":[]},{"label":" ","items":[]},{"label":"2","items":[]}],"data":{"temp":["1","2","3","4","5","6","7","8","9"],"answer":[{"label":"8","items":[]},{"label":"1","items":[]},{"label":"6","items":[]},{"label":" ","items":["3"]},{"label":"5","items":[]},{"label":" ","items":["7"]},{"label":" ","items":["4"]},{"label":" ","items":["9"]},{"label":"2","items":[]}]}},"width":60}	SHVQAIxV7byKSAJYrTfr	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
150	61	Magic Squares Explored 2	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1623519046198.png	t	medium	3	1623519292251	3	{"version":1,"description":"Lets say that instead of 1 to 9, you want to construct a 3x3 magic square with the numbers  6 to 14.  \\nEvery other property still holds (the sum across rows, columns and diagonals will stay the same, and you can still use each number only once)","hint":["Each number is just 5 more than one number in our previous range.\\nEg. 6 = 1 + 5; 7 = 2 + 5; ... ... 14 = 9 + 5"],"category":" Magic Squares","lang":"en","interactiveType":"dragAndDrop-3-Grid","ansType":"interactive","type":"dragAndDrop-3-Grid","statement":"Can you fill out the blanks so that you end up with out newly defined magic square?","explanation":"You can go about thinking in 2 ways:  \\n\\n1. Each number is just 5 greater than the numbers in our previous magic square (ie. 6 = 1 + 5, 7 = 2 + 5, ... ... 14 = 9 + 5). So just subtract 5 from each number, fill it up like before (with sum =15 across each row, column and diagonal). Then add 5 to each number individually.  \\n\\n1. Since each number is just 5 more than one of our previous numbers, that means the sum across each row (containing 3 numbers) will be 5+5+5 = 15 __MORE__ than our previous sum. So, the new sum will be 15 + 15 = 30. Then we fill up the square like before.\\n","data":{"type":"interactive","unselected":["6","7","8","9","10","11","12","13","14"],"active":[false,true,false,true,false,true,true,true,true],"nCols":3,"nRows":3,"containers":[{"label":"13","items":[]},{"label":" ","items":[]},{"label":"9","items":[]},{"label":" ","items":[]},{"label":"10","items":[]},{"label":" ","items":[]},{"label":" ","items":[]},{"label":" ","items":[]},{"label":" ","items":[]}],"data":{"temp":["6","7","8","9","10","11","12","13","14"],"answer":[{"label":"13","items":[]},{"label":" ","items":["8"]},{"label":"9","items":[]},{"label":" ","items":["6"]},{"label":"10","items":[]},{"label":" ","items":["14"]},{"label":" ","items":["11"]},{"label":" ","items":["12"]},{"label":" ","items":["7"]}]}},"width":60}	q2SKWRqhCeUE0HVm7451	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
92	77	Chandler's Football Field!	https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1613918509859.png	t	hard	3	1623604792077	5	{"version":1,"description":"Your Friend Chandler is a talented football (soccer) player. He decides to turn the empty plot of land in front of his house into a football field. The plot of land is __36m x 25m__.\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1613918509859.png)\\n\\nChandler asks you to buy grass carpets to cover the plot of land. When you go to buy the carpets you are faced with the choice of buying 1 of 4 different sizes: __1m x 5m__ , __3m x 5m__ , __3m x 7m__ and __12m x 5m__.","hint":["The field has **2 dimensions**. You can thus split it into two **1 dimensional** scenerios; One where you consider the **length** and another where you consider the **width**."],"category":"factorization","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Select the grass carpet with dimensions which __cannot__ be used to __exactly__ cover the entire plot of land assuming that there is no wastage. (You can use more than one carpet but all of them have to be __identical__).","explanation":"As the field is 36 x 25, the length and width can be considered separately. A 3 x 5 grass carpet can be evaluated like: 36/3 = 12 and 25/5 = 5. So dimensions are divisible, and so it can be covered with a 3 x 5 grass. This checking fails while dealing with 3 x 7 as 7 is not a factor of either 25 or 36. So the answer is 3 x 7.","data":{"type":"mcq","data":{"options":["1m x 5m","3m x 5m","3m x 7m","12m x 5m"],"answer":"3m x 7m"}},"width":100}	zVB9A6Y4opLRKH5TgvFH	chn4mCsrRmb1P6QXHCbrEeEpDAl2	\N
95	67	Guess The Next Triangle-2 !!	https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1613413908049.png	t	medium	3	1623604905671	1	{"version":1,"description":"Following a similar problem, the above picture illustrates a series of __colored__ triangle put one after another. Start guessing!!\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/chn4mCsrRmb1P6QXHCbrEeEpDAl2/1613413908049.png)","hint":["Red , blue , yellow , red , blue ....!! Now I can see it."],"category":"series","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"If the series is followed further, can you guess the __color and the formation__ (with reference to the first four shapes) of the __19th triangle__? ","explanation":"On each step, the triangle is rotated 90 degree clockwise. After every 4th rotation, the first triangle is received again. Thus, the 17th one will be the same as the first triangle. So, its a series of 4 formation of triangle. \\nFollowing, the color itself makes a series: red blue yellow, red blue yellow, if the series is followed, it goes on!!\\n\\nSo formulated shapes: \\n\\n`(4n+1) -> 1`\\n`(4n+2) -> 2`\\n`(4n+2) -> 3`\\n`(4n+4) -> 4`\\n\\nAnd formulated color: \\n\\n`(3n+1) -> red`\\n`(3n+2) -> blue`\\n`(3n+3) -> yellow`\\n\\n``\\n\\n> 19 = 4 x 4 + 3 = 3 x 6+1\\n\\n``","data":{"type":"mcq","data":{"options":["Shape 1 and Blue","Shape 2 and Blue","Shape 4 and Yellow","Shape 3 and Red","Shape 2 and Red"],"answer":"Shape 3 and Red"}},"width":90}	kMJfxEKA7sdk6putpOn7	chn4mCsrRmb1P6QXHCbrEeEpDAl2	\N
56	56	Unknown Digits III	https://buet-edu-1.s3.ap-south-1.amazonaws.com/maneesha/no+change.jpg	t	hard	2	1623653200760	3	{"version":1,"description":"This problem is a bit trickier in comparison. Use your knowledge of addition and parity to solve the puzzle!","category":" Backtracking","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"Figure out the values of A,B,C.  \\n(All values are between 0 and 9 inclusive)  \\n \\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1610268228907.png)\\n","explanation":"We first note the hundred's digit. There can be 2 possible values for B: if nothing carries over from the right, then B =3. If 1 carries over from the right, then B=4.  \\nWe move on to the one's digit. Here C+C must be even. So, B must be even. Thus, B is 4 (since the only other option, 3 is odd). This means that C can either be 6 (6+6 = 12; 1 carries over) or C can be 2 (2+2 = 4 and nothing carries over).  \\nComing on to the ten's digit. We know that 0 is even and since A + A is even, there was no carry from the one's place. So, C is 2. Again, B is 4, and there was a carry from ten's digit. So, A is 5 (since 5+5 =10, and 1 carries over)","data":{"type":"mcq","data":{"options":["A = 0, B = 8, C = 4","A = 5, B = 4, C = 2","A = 5, B = 8, C = 4","A = 4, B = 3, C = 6"],"answer":"A = 5, B = 4, C = 2"}},"width":40}	l5J3G7AfIdkAyEEpyuUc	bqB7NqnV8zd3nrQnYnLgZPaPuGZ2	\N
276	98	Advanced Backtracking - III	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623851584511.png	t	medium	3	1624545565110	3	{"version":1,"description":"You have stumbled upon another puzzle with faded ribbons. Can you figure out the correct colors of the grey ribbons?","hint":["First find out, 8x9=?"],"category":"New Backtrack","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1624543286852.png)","explanation":"The final number is 8 and we see that the ribbons indicate a division where 9 is the divisor. So, by backtracking we get: __8 x 9 = 72 __\\n\\nNow, one octagon is connected with 2 purple ribbons which means we have to add this number with itself to get 72.\\n\\nTherefore, __B is 36__ (36 + 36 = 72)\\n\\nNow since 6 is connect with two ribbons it means either we have to add it twice to get 36 or to multiply it. \\nBut 6 + 6 ≠ 36 and__ 6 x 6 = 36__\\n\\nTherefore, that ribbon should be colored __pink__ to denote multiplication.\\n\\nFor A:\\n\\nApplying the same logic, either you have to do A+A or AxA to get to 9.\\n\\nSince, __3x3 = 9\\n__\\nthis ribbon should also be __pink (multiplication)__.\\n","data":{"type":"mcq","data":{"options":["pink (multiplication)","purple (addition)"],"answer":"pink (multiplication)"}},"width":80}	05PdRMe8DlG2XkqBwDeZ	Hn4jI4W0tFW6zFuXl94nd7IbieI3	t
50	69	Increase The Area!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1610283034106.png	t	hard	3	1623655347608	6	{"version":1,"category":"Area","lang":"en","interactiveType":"matchstick","ansType":"text","type":"matchstick","statement":"Four matchsticks create the square shown. You need to quadruple the area using the minimum number of matchsticks. How many matchsticks will the new figure have?    \\n\\nYou can use the interactive interface to experiment, and finally submit the answer as a number.\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1610284353850.png)","explanation":"If we think one matchstick is 2 units, then the area of the given figure is 4 square units. To quadruple the area we have to make each side 4 units, 4×4=16 square units. So we will need 2 matchsticks on each side, hence a total of 4×2=8 matchsticks.","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":20,"y1":15,"x2":20,"y2":17,"isLocked":false},{"type":"matchstick","x1":20,"y1":17,"x2":22,"y2":17,"isLocked":false},{"type":"matchstick","x1":22,"y1":15,"x2":22,"y2":17,"isLocked":false},{"type":"matchstick","x1":20,"y1":15,"x2":22,"y2":15,"isLocked":false},{"type":"matchstick","x1":24,"y1":20,"x2":24,"y2":22,"isLocked":false},{"type":"matchstick","x1":25,"y1":20,"x2":25,"y2":22,"isLocked":false},{"type":"matchstick","x1":26,"y1":20,"x2":26,"y2":22,"isLocked":false},{"type":"matchstick","x1":27,"y1":20,"x2":27,"y2":22,"isLocked":false},{"type":"matchstick","x1":28,"y1":20,"x2":28,"y2":22,"isLocked":false},{"type":"matchstick","x1":29,"y1":20,"x2":29,"y2":22,"isLocked":false}],"type":"text","data":{"answer":["8"]}},"width":30}	7hTA3xBrNzUhpKOH0cod	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
49	33	Increase The Area!!	https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1610283034106.png	t	hard	3	1623655347608	7	{"version":1,"category":"Area","lang":"en","interactiveType":"matchstick","ansType":"text","type":"matchstick","statement":"Four matchsticks create the square shown. You need to quadruple the area using the minimum number of matchsticks. How many matchsticks will the new figure have?    \\n\\nYou can use the interactive interface to experiment, and finally submit the answer as a number.\\n\\n![](https://buet-edu-1.s3.amazonaws.com/auto_upload/VoTf81DreZTqGwSXurQ7g8DBnV43/1610284353850.png)","explanation":"If we think one matchstick is 2 units, then the area of the given figure is 4 square units. To quadruple the area we have to make each side 4 units, 4×4=16 square units. So we will need 2 matchsticks on each side, hence a total of 4×2=8 matchsticks.","data":{"divCount":100,"bgColor":"#f4f4f4","lineColor":"#00aa00","lineOpacity":0.5,"elements":[{"type":"matchstick","x1":20,"y1":15,"x2":20,"y2":17,"isLocked":false},{"type":"matchstick","x1":20,"y1":17,"x2":22,"y2":17,"isLocked":false},{"type":"matchstick","x1":22,"y1":15,"x2":22,"y2":17,"isLocked":false},{"type":"matchstick","x1":20,"y1":15,"x2":22,"y2":15,"isLocked":false},{"type":"matchstick","x1":24,"y1":20,"x2":24,"y2":22,"isLocked":false},{"type":"matchstick","x1":25,"y1":20,"x2":25,"y2":22,"isLocked":false},{"type":"matchstick","x1":26,"y1":20,"x2":26,"y2":22,"isLocked":false},{"type":"matchstick","x1":27,"y1":20,"x2":27,"y2":22,"isLocked":false},{"type":"matchstick","x1":28,"y1":20,"x2":28,"y2":22,"isLocked":false},{"type":"matchstick","x1":29,"y1":20,"x2":29,"y2":22,"isLocked":false}],"type":"text","data":{"answer":["8"]}},"width":30}	7hTA3xBrNzUhpKOH0cod	VoTf81DreZTqGwSXurQ7g8DBnV43	\N
277	98	Advanced Backtracking - IV	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623851584511.png	t	medium	3	1624545551992	4	{"version":1,"description":"This is another puzzle with colorless ribbons. Can you find out the __\\"?\\"__ marked number of this puzzle?","category":"New Backtrack","lang":"en","interactiveType":"none","ansType":"text","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1624544467472.png)","explanation":"First we have to add 6 with itself.\\n\\n6 + 6 = 12.\\n\\nNow start backtracking from 37.\\n\\n37 – 12 = 25.\\n\\nSince,__ 5 * 5 = 25__\\n\\nthe “?” marked number is: 5\\n","data":{"type":"text","data":{"answer":["5"]}},"width":80}	2ZHdLjhlSnt1o02WW9cy	Hn4jI4W0tFW6zFuXl94nd7IbieI3	t
278	98	Advanced Backtracking - V	https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1623851584511.png	t	hard	3	1626635644726	5	{"version":1,"description":"Recolor the ribbons of this puzzle and finally become an Expert at backtracking!","hint":["Suppose,** A * B = 72.**\\n\\nTherefore, **A > 4** and **B > 3**.\\n","There are two options for A and B: \\n\\n**6 x 12 = 72 **\\n\\nor\\n\\n**8 x 9 = 72**"],"category":"New Backtrack","lang":"en","interactiveType":"none","ansType":"mcq","type":"none","statement":"![](https://buet-edu-1.s3.amazonaws.com/auto_upload/Hn4jI4W0tFW6zFuXl94nd7IbieI3/1624544642667.png)","explanation":"Suppose,__ A * B = 72.__\\n\\nTherefore, __A > 4__ and __B > 3__.\\n\\nThere are two options for A and B: \\n\\n__6 x 12 = 72 __\\n\\nor\\n\\n__8 x 9 = 72__\\n\\nSince both 4 and 3 are connected twice with colorless ribbons, it has to be 8 and 9. \\n\\nThen, we will have: __4+4 = 8 __and__ 3*3 = 9__\\n\\n\\nTherefore, __ribbons connected with 4 should be purple (addition) and ribbons connected with 3 should be pink (multiplication) __","data":{"type":"mcq","data":{"options":["all 4 ribbons should be pink","all 4 ribbons should be purple","ribbons with 4 -> pink  and ribbons with 3 -> purple","ribbons with 4 -> purple and ribbons with 3 -> pink  "],"answer":"ribbons with 4 -> purple and ribbons with 3 -> pink  "}},"width":80}	86aZKiOTPjp6lW9eeyHe	Hn4jI4W0tFW6zFuXl94nd7IbieI3	\N
\.


--
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: brainlytic
--

COPY public.profile (user_id, name, image, star, trophy, plan, birth_date, country) FROM stdin;
33	MD.MEHRAB HAQUE	https://lh3.googleusercontent.com/a-/AOh14Gio4Kn9bakYhhueA0ExyAx1XE8p-8cvyYfECK2r	\N	\N	\N	\N	\N
34	Md. Mehrab Haque	\N	\N	\N	\N	\N	\N
35	buet edu_1	https://lh3.googleusercontent.com/a-/AOh14GjT3Q1-J71qiREfqlydLtaV-WQPIX8MAc5HAPT9	\N	\N	\N	\N	\N
36	ZANNATUL NAIM	https://lh3.googleusercontent.com/a-/AOh14GgHFLSUe2_B0lpjdYI7yPSKXCu8n6yPRfADCC6c-Q	\N	\N	\N	\N	\N
37	MJKSabit	\N	\N	\N	\N	\N	\N
39	Md. Jehadul Karim	https://lh3.googleusercontent.com/a-/AOh14GhjRq35rXu6OozGGkeA5x3HWf3lMPIxW7faK69vpg	\N	\N	\N	\N	\N
40	shown ahmed	https://lh4.googleusercontent.com/-iPUucJFGTMQ/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucms3vglMm4zgWVdv8DMXzcmK7YhCw/photo.jpg	\N	\N	\N	\N	\N
41	Rabib Jahin	https://lh5.googleusercontent.com/-QPZ_Fyf89Yk/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucl1PplZknsM_4_7PxxOLEpX7D9Ksw/photo.jpg	\N	\N	\N	\N	\N
42	rabib	\N	\N	\N	\N	\N	\N
44	Md. Mehrab Haque	https://lh3.googleusercontent.com/a-/AOh14GiZMV1p5IyWrzswyypvave-gxjDyczNDHSTjTq8HA	\N	\N	\N	\N	\N
45	Zehady	\N	\N	\N	\N	\N	\N
49	MOHAMMAD TAMIMUL EHSAN	https://lh3.googleusercontent.com/a-/AOh14GhQYNpvh9-y-tRcjFjj6_-l8vErMg7cIaVaUQ4z	\N	\N	\N	\N	\N
50	MD. Jubair Hasan	https://lh3.googleusercontent.com/a-/AOh14Giebk8D1lcvkgSY2JPjM4jpCZzHyhnb25R_7u-fcQ	\N	\N	\N	\N	\N
51	abc	\N	\N	\N	\N	\N	\N
52	Imran	\N	\N	\N	\N	\N	\N
53	সাবিত	\N	\N	\N	\N	\N	\N
54	Hasan Masum	https://lh3.googleusercontent.com/a-/AOh14Gjp7yKADoa70L0141Vj66Bqp9EBURBI6gRbe28q	\N	\N	\N	\N	\N
56	Anindya Iqbal	https://lh5.googleusercontent.com/-EgkKMWFT_58/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucl3Ri0fEhl0EoTYmA47SEW_IrLJDA/photo.jpg	\N	\N	\N	\N	\N
57	rownok ratul	https://lh3.googleusercontent.com/a-/AOh14GhEntif4oaLtZi1_Ek15edSTOtuItvp6krYkBJy=s96-c	\N	\N	\N	\N	\N
58	Goru	\N	\N	\N	\N	\N	\N
59	TestReqbin	\N	\N	\N	\N	\N	\N
75	ANINDYA HOQUE	https://lh4.googleusercontent.com/-41G5bDYfSHY/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnbFO3LuiKt_jOuA8MuzdIcx1ApZw/s96-c/photo.jpg	\N	\N	\N	\N	\N
76	Anindya Hoque	https://lh3.googleusercontent.com/-L9jo4CyOKwA/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclqqcN0n1KxbqKrtQyXmxrhD-4vHg/s96-c/photo.jpg	\N	\N	\N	\N	\N
77	Sanjana Binte Siraj	\N	\N	\N	\N	\N	\N
38	Tamim Ehsan	https://lh3.googleusercontent.com/a-/AOh14GjH-HzfS5beIuhT03W9BbQlOXGoWPLK290TDDLo2A	\N	\N	\N	\N	\N
78	Md. Mehrab Haque	\N	\N	\N	\N	\N	\N
79	saira	\N	\N	\N	\N	\N	\N
80	Aditto Arif Rahman	https://lh4.googleusercontent.com/-FTlx6dPJr_Y/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucn2mQEOtQaQ-YCNMhEWbDkaxVlX9Q/s96-c/photo.jpg	\N	\N	\N	\N	\N
81	Sadat Mahmud	https://lh3.googleusercontent.com/a-/AOh14GhN67087U6FMkaoxo5ElK3XG4p96cGsE8nZFxKu0Z4=s96-c	\N	\N	\N	\N	\N
82	Farhan Tanvir	https://lh5.googleusercontent.com/-QQrYiea3zZo/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucmmwgrS5xFu0I1gN4IFh9xEMRwKCg/s96-c/photo.jpg	\N	\N	\N	\N	\N
83	Toki	\N	\N	\N	\N	\N	\N
84	Md. Saiful Islam	\N	\N	\N	\N	\N	\N
85	Sudip B	\N	\N	\N	\N	\N	\N
86	Anushka Ahmed	https://lh3.googleusercontent.com/a-/AOh14GiyLCTiTccGIGltaFgKL8kePhWTfN2NBuORa_JmVw=s96-c	\N	\N	\N	\N	\N
87	Shamim Hasnath	https://lh3.googleusercontent.com/a-/AOh14GgP-zCIbJODPNMkbVzu8kwyRHPAJ2NuC4YdYm1Y9g=s96-c	\N	\N	\N	\N	\N
88	Azman Amin	\N	\N	\N	\N	\N	\N
89	Masum	\N	\N	\N	\N	\N	\N
90	gias	\N	\N	\N	\N	\N	\N
91	Test	\N	\N	\N	\N	\N	\N
60	Tamim vai	trial2.jpg	10	20	1	Jan-01	Bangladesh
61	Anup Bhowmik	https://lh3.googleusercontent.com/a-/AOh14Gjr523lB_RN2WkIOHWARbREFhG4cV2rEY0nkCH5Gg=s96-c	\N	\N	\N	\N	\N
62	Bhuiyan Mohammad Iklash	https://lh5.googleusercontent.com/-RSAP_8YXjhI/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnwTkFyB5EHDIYw85BzIy8C435Nag/s96-c/photo.jpg	\N	\N	\N	\N	\N
63	iklash	\N	\N	\N	\N	\N	\N
64	Tanjeem Zaman	https://lh3.googleusercontent.com/a-/AOh14Giwa29SrbuXZ80Ii04_9nbP6yu118XuHsHSNTS4=s96-c	\N	\N	\N	\N	\N
65	Tanjeem Azwad Zaman	\N	\N	\N	\N	\N	\N
66	Hasan Masum	https://lh3.googleusercontent.com/a-/AOh14GhvcJ8ObqWFaGwuwDDDYYhYzh2sG9yD7uWxImBO=s96-c	\N	\N	\N	\N	\N
67	Md. Mehrab Haque	\N	\N	\N	\N	\N	\N
68	A.K.M.ASHFAQUR RAHMAN	https://lh6.googleusercontent.com/-Ti81LuWjj_Q/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucmbJDOKuBXUxOdys7cpgjdSPXZQ6g/s96-c/photo.jpg	\N	\N	\N	\N	\N
69	Prince Zarzees	https://lh4.googleusercontent.com/-x0YZ4Z64SnI/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnuocins69nIexBqNGrF6F1_6N2dg/s96-c/photo.jpg	\N	\N	\N	\N	\N
70	Md. Mehrab Haque	\N	\N	\N	\N	\N	\N
71	dummy	\N	\N	\N	\N	\N	\N
72	Aditto Arif Rahman	\N	\N	\N	\N	\N	\N
73	Maneesha Rani Saha	https://lh3.googleusercontent.com/a-/AOh14GgDoic9lBgO_lC2GO_7q7OjP1nRzK-50u5Hbrt2mg=s96-c	\N	\N	\N	\N	\N
74	Mahmud	https://lh3.googleusercontent.com/a-/AOh14Gg4Jof_suX9orDryJba4Ytp0sqSy_qQTIBo2i9lUA=s96-c	\N	\N	\N	\N	\N
92	promona	\N	\N	\N	\N	\N	\N
93	Aniruddha Ganguly	https://lh3.googleusercontent.com/a-/AOh14Gg5HtVyie0z5GCSNZ3Dxun3UxaO_xkFkFg8z3mYRQ=s96-c	\N	\N	\N	\N	\N
94	Zareen	\N	\N	\N	\N	\N	\N
95	Anindya 2	\N	\N	\N	\N	\N	\N
96	Abdul Kadir Kabbo	\N	\N	\N	\N	\N	\N
97	Swakkhar S	https://lh3.googleusercontent.com/-qCCv11npqPY/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuckYPf6WrZkH9eWSjhgKQi4MjSquxA/s96-c/photo.jpg	\N	\N	\N	\N	\N
98	Hasin Rayhan Dewan Dhruboo	\N	\N	\N	\N	\N	\N
99	Tarikul Islam Papon	\N	\N	\N	\N	\N	\N
100	Anik Sarker	https://lh3.googleusercontent.com/a-/AOh14GhqkLb4JFiDSgc54JhVvzZU0cEcZy4XO2A3tTmd6Q=s96-c	\N	\N	\N	\N	\N
101	Mortuza Ali	\N	\N	\N	\N	\N	\N
102	Anindya	\N	\N	\N	\N	\N	\N
103	kaysar abdullah soikot	https://lh3.googleusercontent.com/a-/AOh14GhZI5I7QIuSAb0eE91L4yLJwluFNhYGakNNlfIxncw=s96-c	\N	\N	\N	\N	\N
104	mahnewton	\N	\N	\N	\N	\N	\N
105	Taskinoor	\N	\N	\N	\N	\N	\N
108	Mahfuzul Haque	https://lh3.googleusercontent.com/a-/AOh14GgHjcmd5d07n1vOM4nnX4FlxSdzhIbNacGusDuuww=s96-c	\N	\N	\N	\N	\N
109	Hasan Masum	https://lh3.googleusercontent.com/a-/AOh14Gg6sLNwckIPt3JLY5Gjekxpml3ZmSmL3PdThyzh=s96-c	\N	\N	\N	\N	\N
110	Bonhishikha	\N	\N	\N	\N	\N	\N
111	abc	\N	\N	\N	\N	\N	\N
112	Bad Boy	https://lh6.googleusercontent.com/-dmXUp0fy3-c/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuck0-y649eqyugfUTJqakZVxSMWtug/s96-c/photo.jpg	\N	\N	\N	\N	\N
113	Saira	\N	\N	\N	\N	\N	\N
114	Naima	\N	\N	\N	\N	\N	\N
115	Tareq Amin	https://lh6.googleusercontent.com/-eAVAPrSu_nY/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnxEhxN45yIy0JAgSGp4uroyjL2NA/s96-c/photo.jpg	\N	\N	\N	\N	\N
116	Bonhishikha	\N	\N	\N	\N	\N	\N
117	Ahmed Hasan	https://lh3.googleusercontent.com/a-/AOh14GjZl--5uW9Puj5-pwolCn3Uyfbxi09zRGl3BrL9w4k=s96-c	\N	\N	\N	\N	\N
118	Hasan Tazwoar	https://lh3.googleusercontent.com/a-/AOh14GgqGJTXJzXKjXymIs2urk-LiItRj3_AZogAzkNY0Yo=s96-c	\N	\N	\N	\N	\N
119	Maria Hossain Mati	https://lh3.googleusercontent.com/a-/AOh14GgxVM0ip012Bn9SAspVAbXQ1R1tgMhthDKloGsJwQ=s96-c	\N	\N	\N	\N	\N
120	Shadmaan Aariq	\N	\N	\N	\N	\N	\N
121	Abtahee Salakeen	https://lh3.googleusercontent.com/a-/AOh14GjVk2nDD0hLUmHdghdlgcC7UxImAM7-csVoWpl96Q=s96-c	\N	\N	\N	\N	\N
122	Md Kamrul Islam	https://lh3.googleusercontent.com/a-/AOh14Gg6_QboY5CLfgZsxo_GSpyDbogHqswIgPGNEikOVT0=s96-c	\N	\N	\N	\N	\N
123	Shahadat Hossain	https://lh3.googleusercontent.com/a-/AOh14GjxBDpa_pJbAiQAwiMj94NGwWjsMHYJoUd0ERX9DA=s96-c	\N	\N	\N	\N	\N
124	Anirban Bala Pranto	\N	\N	\N	\N	\N	\N
125	Test	\N	\N	\N	\N	\N	\N
126	Test	\N	\N	\N	\N	\N	\N
127	Masud	\N	\N	\N	\N	\N	\N
128	Ikram Ud Doula	https://lh3.googleusercontent.com/a-/AOh14GjW5t2UspsxexltrigeuNfnxpEKisz9-hMEL3Z1=s96-c	\N	\N	\N	\N	\N
129	rashid mahdi	https://lh3.googleusercontent.com/a-/AOh14GhRgeu1VphIlmoi2hajggOQKiBBchoa7Ls5kD-mrA=s96-c	\N	\N	\N	\N	\N
130	Nafis Irtiza Tripto	https://lh4.googleusercontent.com/-Tmi2vtmcOZo/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucn4YY7GiEFZAp6H0zjtlFIjstAOmw/s96-c/photo.jpg	\N	\N	\N	\N	\N
131	Saad Bin Quddus	https://lh4.googleusercontent.com/-6XAoeIQcVUA/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuck0oPBD5c7P7iMuSuAuyJ75EVvDzA/s96-c/photo.jpg	\N	\N	\N	\N	\N
132	Md. Jehadul Karim	https://lh4.googleusercontent.com/-qtNTfjlFKBE/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucmSXlVReUsqUBSWv25Sk-I9_gLeTg/s96-c/photo.jpg	\N	\N	\N	\N	\N
133	Hasan Masum	https://lh3.googleusercontent.com/a-/AOh14Ggm1TnDeXZfJASfJSZR-Gpea-Xy19TcosY0Yhc1=s96-c	\N	\N	\N	\N	\N
134	Sheikh Azizul Hakim	https://lh3.googleusercontent.com/a-/AOh14GhBEAT7j4sXBnn39qBo9G2UlFJ652qSdpRkRsrtng=s96-c	\N	\N	\N	\N	\N
135	Sabbir Rahman	https://lh3.googleusercontent.com/a-/AOh14GgENnbFRPZQoy7WcEc4O2YfHDhRfSaOWI1CNjJG=s96-c	\N	\N	\N	\N	\N
136	Mashroor Hasan Bhuiyan	https://lh3.googleusercontent.com/a-/AOh14Ghvp9BAgAErsqJsb7ZKHcmyJneYMzF36Ed9P4SKVA=s96-c	\N	\N	\N	\N	\N
138	Sharafat Ibn Mollah Mosharraf	https://lh3.googleusercontent.com/a-/AOh14Gge4h2Fcec6mtEiEZC6UivQBQ7kHNVlJCdi_pj5Xw=s96-c	\N	\N	\N	\N	\N
137	Sadi Muhammad Hossain	https://lh3.googleusercontent.com/a-/AOh14GjgKz4IpItMPLfxchebTd7ceBINY4xVGKXHBtG6uQ=s96-c	\N	\N	\N	\N	\N
139	Faria	\N	\N	\N	\N	\N	\N
140	Fariha Maliat	\N	\N	\N	\N	\N	\N
141	Ajmat Iqbal	https://lh3.googleusercontent.com/a-/AOh14GjHUvAGSgS0fWTiV8r8hsVJy9KjXzTA9-3iNvCt=s96-c	\N	\N	\N	\N	\N
142	Rasman Mubtasim Swargo	https://lh3.googleusercontent.com/a-/AOh14Gha77hl3gjvOcEzX4g4wkbfgXdRrdh7ztNfGvLP=s96-c	\N	\N	\N	\N	\N
143	Farzin Awsaf Zaman	\N	\N	\N	\N	\N	\N
144	Md.Rafat Al Razy Rafi	\N	\N	\N	\N	\N	\N
145	Nafis Sadik Zim	\N	\N	\N	\N	\N	\N
146	MD.Billal Hossain	\N	\N	\N	\N	\N	\N
147	Mahmudul Hasan	\N	\N	\N	\N	\N	\N
148	Sameer Iqbal	https://lh3.googleusercontent.com/a-/AOh14GiGyqJhDyZXuRMRbPdfV3puxj27-yIH2IiAKApgIA4=s96-c	\N	\N	\N	\N	\N
149	Kishalay Saha Roktim	\N	\N	\N	\N	\N	\N
150	Anusua Saha	\N	\N	\N	\N	\N	\N
151	BUET CSE18	https://lh3.googleusercontent.com/a/AATXAJzMl6UO1y1B5TdFdpmdRN-3c3KPf3LCDIzMMYw8=s96-c	\N	\N	\N	\N	\N
152	Minaoar Tanzil	https://lh3.googleusercontent.com/a-/AOh14GjJHFuNuOkBatjBpd5Hc1430BvpwwdocvrBloTySqQ=s96-c	\N	\N	\N	\N	\N
153	Anuva Alvin	\N	\N	\N	\N	\N	\N
154	Fathe Mubin	\N	\N	\N	\N	\N	\N
155	Manzur Murshed	https://lh3.googleusercontent.com/a-/AOh14GiFj_TYCPjv4GlmG2h8LAeQspAbDpDy06ajVKaR=s96-c	\N	\N	\N	\N	\N
156	Masud Ahmed	https://lh3.googleusercontent.com/a/AATXAJwJeOMF-oKKv1zNJqX2tKrj5Bdyfroo4UXRJmFR=s96-c	\N	\N	\N	\N	\N
157	ier anik	https://lh3.googleusercontent.com/a-/AOh14GhSBc89ByUwxXKw9f_r_Vmy2ouu0kxKXI3Ayj-1=s96-c	\N	\N	\N	\N	\N
158	Bonhishikha	\N	\N	\N	\N	\N	\N
159	Jubaer Jami	https://lh3.googleusercontent.com/a-/AOh14GgU_1WePD1VmQYnKO4uxQSNaKrLKXdUhZmwGx3e-A=s96-c	\N	\N	\N	\N	\N
160	Md. Toufik Zaman	https://lh3.googleusercontent.com/a-/AOh14GiAkrgVLBRoi94o8W25XhBKDC17oRV-ja9-Omb_=s96-c	\N	\N	\N	\N	\N
161	Rajibul Islam	https://lh3.googleusercontent.com/a/AATXAJwbVi30T3PGxEK9ckQt3dhv1hscVC8xHMxhJNDR=s96-c	\N	\N	\N	\N	\N
162	Sama	\N	\N	\N	\N	\N	\N
163	DFF	\N	\N	\N	\N	\N	\N
164	Farzin Awsaf Zaman	https://lh3.googleusercontent.com/a/AATXAJyTuTa8f7tA-ucJCK3MEpx2t5KFe5qI7zDNxN5l=s96-c	\N	\N	\N	\N	\N
165	Ahmed Rumi	\N	\N	\N	\N	\N	\N
166	ASZADUR RAHMAN RAKIN	https://lh3.googleusercontent.com/a/AATXAJzl5kaBccE-jK-z8lSwUPoaSmRsiokKuvmbZALb=s96-c	\N	\N	\N	\N	\N
167	Syed Khan	https://lh3.googleusercontent.com/a/AATXAJzH89j5svNRhX--PjWk7mZOsiNdA6Un1osQvvPz=s96-c	\N	\N	\N	\N	\N
168	sdsd	\N	\N	\N	\N	\N	\N
169	Nawal Sazzad	https://lh3.googleusercontent.com/a/AATXAJzrq-sw7jjsiehPVnYSkL8K81lBWlzTWb6gUGeD=s96-c	\N	\N	\N	\N	\N
170	AdiIsh Pri1	https://lh3.googleusercontent.com/a-/AOh14Gju0l6MRn9PiQZtsd_juRlGeW-Q_NrNuQlo5lwS=s96-c	\N	\N	\N	\N	\N
171	Asaduzzaman Kalam	https://lh3.googleusercontent.com/a/AATXAJyd-itfy8-5dmHpxR6mjBSI7Pp5IV1o7Xc2g74K=s96-c	\N	\N	\N	\N	\N
172	Mir Mahathir Mohammad	https://lh3.googleusercontent.com/a-/AOh14Gh6iswwfBZlIDB1wvSvyKn_iNJtyclDOMNkP20x_A=s96-c	\N	\N	\N	\N	\N
173	reza	\N	\N	\N	\N	\N	\N
174	Jubaer Jami	https://lh3.googleusercontent.com/a-/AOh14GgiKcT_xZu8jK-i7YvtgCpnbtQ3_CmYOPmBXJ7z=s96-c	\N	\N	\N	\N	\N
175	Sayan Paul	https://lh3.googleusercontent.com/a-/AOh14Gjz6kESRFh07UUx-Gl-TsNXHo3ZKUrkgseoA7LwMw=s96-c	\N	\N	\N	\N	\N
176	Small Foot	https://lh3.googleusercontent.com/a-/AOh14GhzIR8C0oF8Dq5ySVwzk_r5woq0AisK_EEb1RGk=s96-c	\N	\N	\N	\N	\N
177	Md. Rasul Khan Hamim	https://lh3.googleusercontent.com/a-/AOh14Gjx2hCXPhPTtp3HgufpihO0kaGFj-VtLnMG4V4zlbM=s96-c	\N	\N	\N	\N	\N
178	Azman Amin	https://lh3.googleusercontent.com/a-/AOh14GjhsZm0KD2Wb5dewWobhrfQxnqpPlJ_m3TE58RYKg=s96-c	\N	\N	\N	\N	\N
179	John John	https://lh3.googleusercontent.com/a-/AOh14GhhzDW52MXkA2JM-ZvNzFNqmeZxdh4T7UJzZutC=s96-c	\N	\N	\N	\N	\N
180	Mashiyat Mahjabin Prapty	https://lh3.googleusercontent.com/a-/AOh14GhY_NyZbx9wmjbUyrE4cbZMP1ioeGNDkscI3QhsrQ=s96-c	\N	\N	\N	\N	\N
181	Sanjana Siraj	https://lh3.googleusercontent.com/a/AATXAJwU_MU1wYQciqLfvAdCj4nS-FK5mLnJpcxoXLv0=s96-c	\N	\N	\N	\N	\N
182	Wire Bangladesh	https://lh3.googleusercontent.com/a-/AOh14GgE12Is7UADL70O5_xYJlmofEHR4kxxod62aMmveA=s96-c	\N	\N	\N	\N	\N
183	Nuage Laboratoire	https://lh3.googleusercontent.com/a/AATXAJyXdbDee1x4miXpevTYCpTA9Wg5AoIGv3EOuA3F=s96-c	\N	\N	\N	\N	\N
184	Noshin Nawal	https://lh3.googleusercontent.com/a/AATXAJyPsJTIGrBLmsvkxoUQ96T0QDa19PAI8aJTN9qq=s96-c	\N	\N	\N	\N	\N
185	Nuage Laboratoire	https://lh3.googleusercontent.com/a/AATXAJySeW879K4WtnW5VEOlVN6COdYfbHK2oxLEhdU=s96-c	\N	\N	\N	\N	\N
186	Nuage Laboratoire	https://lh3.googleusercontent.com/a/AATXAJxCd39P3Qu8dV6zc6pPMlUqgLGNAJxAJZnDBw7A=s96-c	\N	\N	\N	\N	\N
187	Nuage Laboratoire	https://lh3.googleusercontent.com/a/AATXAJwnbPNc6YP580eGZKZcisctB8nnD8yzD0memBQ5=s96-c	\N	\N	\N	\N	\N
\.


--
-- Data for Name: series; Type: TABLE DATA; Schema: public; Owner: brainlytic
--

COPY public.series (series_id, topic_id, islive, name, description, logo, serial, nproblem) FROM stdin;
36	25	t	Unitary Method	The unitary method is a technique for solving a problem by first finding the value of a single unit, and then finding the necessary value by multiplying the single unit value.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910092228.png	1	6
38	25	t	Parity	In mathematics, parity is the property of an integer of whether it is even or odd. An integer's parity is even if it is divisible by two with no remainders left and its parity is odd if its remainder is 1.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909948694.png	5	4
63	29	t	Matchstick	This series contains Matchstick problems based on logic and Drag and Drop .	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910467394.png	2	4
52	29	t	Exclusion Grid	This series contains logical problems where you need to think logically and exclude options one by one to reach to the answer.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910272229.png	1	6
55	30	t	Number Series	In mathematics, a series is, roughly speaking, a description of the operation of adding infinitely many quantities, one after the other, to a given starting quantity. The study of series is a major part of calculus and its generalization, mathematical analysis.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909633469.png	3	5
79	27	t	2D/3D Shapes	A 2D shape is a shape with two dimensions, such as width and height; a 3D shape is a shape with three dimensions, such as width, height and depth.	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1614097171979.png	2	6
81	27	t	Length & Perimeter	A perimeter is either a path that encompasses/surrounds/outlines a shape or its length. The perimeter of a circle or an ellipse is called its circumference. Calculating the perimeter has several practical applications	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1614097301721.png	3	5
54	30	t	Basic Operations	This series includes mathematical problems where you need to use basic mathematical operations to find the answers.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910151400.png	2	3
40	23	t	Rearrange	In this series, items are in logically incorrect positions.Your task is to correct them and put them in right order	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910228209.png	3	5
39	25	t	Basic Operations	This series includes mathematical problems where you need to use basic mathematical operations to find the answers.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910151400.png	2	4
33	27	t	Area & Volume	It deals with geometrical problems and different kinds of shapes.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909483981.png	1	6
80	25	t	Venn Diagram	This series contains problems related to venn diagram and set operations	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909715695.png	6	3
51	28	t	Exclusion Grid	This series contains logical problems where you need to think logically and exclude options one by one to reach to the answer.You may find the problems difficult	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910272229.png	1	5
37	25	t	Number Series	In mathematics, a series is, roughly speaking, a description of the operation of adding infinitely many quantities, one after the other, to a given starting quantity. The study of series is a major part of calculus and its generalization, mathematical analysis.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909633469.png	4	3
62	30	t	Venn Diagram	This series contains problems related to venn diagram and set operations 	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909715695.png	6	1
57	30	t	Unitary Method	The unitary method is a technique for solving a problem by first finding the value of a single unit, and then finding the necessary value by multiplying the single unit value	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910092228.png	5	2
59	31	t	3D Shapes	A 3D shape is a shape with three dimensions, such as width, height and depth.	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1614097171979.png	2	4
77	32	t	Basic Operations	This series includes mathematical problems where you need to use basic mathematical operations to find the answers.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910151400.png	4	4
65	31	t	Angle Chasing-1	In Euclidean geometry, an angle is the figure formed by two rays, called the sides of the angle, sharing a common endpoint, called the vertex of the angle. Angles formed by two rays lie in the plane that contains the rays. Angles are also formed by the intersection of two planes.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909377039.png	3	7
78	23	t	Matchstick	This series contains problems on matchstick based on logic.These problems are interactive.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910467394.png	2	4
66	33	t	Angle Chasing	In Euclidean geometry, an angle is the figure formed by two rays, called the sides of the angle, sharing a common endpoint, called the vertex of the angle. Angles formed by two rays lie in the plane that contains the rays. Angles are also formed by the intersection of two planes.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909377039.png	1	5
72	33	t	Length & Perimeter	A perimeter is either a path that encompasses/surrounds/outlines a shape or its length. The perimeter of a circle or an ellipse is called its circumference. Calculating the perimeter has several practical applications	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1614097301721.png	4	4
64	30	t	Inequalities	An inequality compares two values, showing if one is less than, greater than, or simply not equal to another value. a ≠ b says that a is not equal to b a < b says that a is less than b a > b says that a is greater than b\n\n	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909766710.png	7	2
56	30	t	Finding Digits	A method of solving combinatorial problems by means of an algorithm which is allowed to run forward until a dead end is reached, at which point previous steps are retraced and the algorithm is allowed to run forward again. Backtracking can greatly reduce the amount of work in an exhaustive search	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910040060.png	4	3
74	28	t	Matchstick	This series contains Matchstick problems based on logic and Drag and Drop 	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910467394.png	3	3
61	28	t	Logical Problems	This series deals with logic related problems .You need to think logically to solve this kind of problems.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910396344.png	2	5
58	31	t	Length & Perimeter	A perimeter is either a path that encompasses/surrounds/outlines a shape or its length. The perimeter of a circle or an ellipse is called its circumference. Calculating the perimeter has several practical applications	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1614097301721.png	1	9
75	29	t	Logical Problems	This series deals with logic related problems .You need to think logically to solve this kind of problems.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910396344.png	3	3
76	25	t	Counting	In math, counting can be defined as the act of determining the quantity or the total number of objects in a set or a group. In other words, to count means to say numbers in order while assigning a value to an item in group, basis one to one correspondence.	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1614097022653.png	5	3
60	32	t	Counting	In math, counting can be defined as the act of determining the quantity or the total number of objects in a set or a group. In other words, to count means to say numbers in order while assigning a value to an item in group, basis one to one correspondence.	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1614097022653.png	1	7
69	33	t	Area & Volume	It deals with geometrical problems and different kinds of shapes.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909483981.png	3	7
71	31	t	Area & Volume	It deals with geometrical problems and different kinds of shapes.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909483981.png	4	6
73	30	t	Fractions	A fraction represents a part of a whole or, more generally, any number of equal parts. In this fraction related medium level problems are covered	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1615975531792.png	8	6
93	33	t	3D Shapes	Objects and shapes that have a length, breadth and height	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1614097171979.png	6	5
88	32	t	Weight Balance	This series covers problems dealing with weight measurement and calculation to balance the weight of different objects.	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1620392243140.png	6	4
84	23	t	Exclusion Grid	This series contains logical problems where you need to think logically and exclude options one by one to reach to the answer.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910272229.png	3	3
95	31	t	Angle Chasing-2	In Euclidean geometry, an angle is the figure formed by two rays, called the sides of the angle, sharing a common endpoint, called the vertex of the angle. Angles formed by two rays lie in the plane that contains the rays. Angles are also formed by the intersection of two planes.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909377039.png	6	1
94	27	t	Angle Chasing-2	In Euclidean geometry, an angle is the figure formed by two rays, called the sides of the angle, sharing a common endpoint, called the vertex of the angle. Angles formed by two rays lie in the plane that contains the rays. Angles are also formed by the intersection of two planes.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909377039.png	5	6
87	30	t	Weight Balance	This series covers problems dealing with weight measurement and calculation to balance the weight of different objects.	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1620392243140.png	8	2
82	27	t	Angle Chasing-1	In Euclidean geometry, an angle is the figure formed by two rays, called the sides of the angle, sharing a common endpoint, called the vertex of the angle. Angles formed by two rays lie in the plane that contains the rays. Angles are also formed by the intersection of two planes.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909377039.png	4	7
90	25	t	Inequalities	An inequality compares two values, showing if one is less than, greater than, or simply not equal to another value. a ≠ b says that a is not equal to b a < b says that a is less than b a > b says that a is greater than b	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909766710.png	8	3
67	32	t	Number Series	In mathematics, a series is, roughly speaking, a description of the operation of adding infinitely many quantities, one after the other, to a given starting quantity. The study of series is a major part of calculus and its generalization, mathematical analysis	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613909633469.png	2	5
85	23	t	Logical Problems	This series deals with logic related problems .You need to think logically to solve this kind of problems.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910396344.png	4	6
86	25	t	Weight Balance	This series covers problems dealing with weight measurement and calculation to balance the weight of different objects.	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1620392243140.png	7	3
91	31	t	2D Shapes	Shapes with 2 dimensions (Hence names 2-D) usually have a length and breadth	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910040060.png	5	4
92	33	t	2-D Shapes	2 Dimensional (2D) shapes only have a length and a breadth.	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910040060.png	5	3
96	25	t	Backtrack	Working backwards can lead to a solution much easier than expected!	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1627560198024.png	9	5
89	32	t	Finding Digits	A method of solving combinatorial problems by means of an algorithm which is allowed to run forward until a dead end is reached, at which point previous steps are retraced and the algorithm is allowed to run forward again. Backtracking can greatly reduce the amount of work in an exhaustive search	https://buet-edu-1.s3.amazonaws.com/auto_upload/0RMFi9mrPNe7mol2JwcZAf40F3n2/1613910040060.png	7	3
97	30	t	Backtrack	One must retrace the steps to find out previous results, and then slowly move forward	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1627560198024.png	9	5
98	32	t	Backtrack	Tracing back your steps might help you to find the solution much easier than you expect!	https://buet-edu-1.s3.amazonaws.com/auto_upload/bqB7NqnV8zd3nrQnYnLgZPaPuGZ2/1627560198024.png	6	5
\.


--
-- Data for Name: submission; Type: TABLE DATA; Schema: public; Owner: brainlytic
--

COPY public.submission (submission_id, problem_id, user_id, sub_status, timestp) FROM stdin;
183	33	44	0	1615985447259
184	33	35	0	1615985456104
185	33	44	1	1615985468994
186	104	38	0	1616066632161
187	104	38	1	1616066649045
188	76	126	1	1616338042137
189	17	126	1	1616338230660
190	17	126	1	1616338304441
191	17	126	1	1616338309986
192	35	126	0	1616338574320
193	17	127	1	1616476289600
194	17	128	0	1616480449687
195	17	128	0	1616480459187
196	35	128	0	1616566183486
197	35	128	0	1616566201613
198	35	128	1	1616566212817
202	33	44	1	1616941035117
203	34	56	1	1616942422273
204	35	56	0	1616942447777
205	12	56	0	1616942577190
206	45	44	1	1616944035559
212	78	44	1	1616946439112
213	79	44	0	1616946599474
214	79	44	1	1616946604221
215	108	35	1	1616949971022
216	30	44	1	1616955042542
217	33	44	0	1616955109546
218	79	44	1	1616956672252
222	110	44	1	1617033724507
223	109	44	1	1617033765492
224	109	35	0	1617033887391
225	109	44	0	1617037220506
226	109	44	0	1617037235338
227	109	44	0	1617045221602
228	109	44	0	1617045229635
229	17	35	1	1617080771181
233	112	35	0	1617086863040
234	113	64	1	1617097790454
235	114	64	1	1617097802639
236	115	64	1	1617097832490
237	116	64	1	1617097878723
238	117	64	1	1617097899627
239	118	64	0	1617097934594
240	118	64	1	1617097939962
241	114	44	0	1617131502313
242	114	44	1	1617132416222
243	114	44	1	1617132424550
244	110	44	1	1617132957928
245	109	44	0	1617133004619
246	109	44	0	1617133009363
247	81	44	0	1617133140683
248	81	44	1	1617133170874
249	17	44	1	1617133199172
250	113	56	0	1617189173442
251	114	56	1	1617189411132
252	69	129	0	1617388072532
253	63	129	1	1617388100430
254	35	129	0	1617388153896
255	35	129	0	1617388166150
256	35	129	0	1617388174611
257	35	129	0	1617388230980
258	35	129	1	1617388239896
259	40	129	0	1617388263398
260	108	56	0	1617456056802
261	31	56	1	1617456211867
262	30	56	0	1617456375544
263	30	56	1	1617456453758
264	22	56	1	1617456583178
265	23	56	1	1617456630347
266	24	56	1	1617457091832
267	110	64	1	1617457548402
268	46	56	1	1617470910451
269	47	56	1	1617470981192
270	51	56	1	1617471052757
274	115	56	0	1617472321273
275	17	56	1	1617519032046
276	33	56	1	1617519130503
277	78	56	1	1617519173342
278	79	56	0	1617519302853
279	79	56	1	1617519325998
280	79	56	1	1617519381050
281	81	56	1	1617519803261
282	112	64	0	1617520677309
283	112	64	0	1617520692775
284	112	64	0	1617520715256
285	121	35	0	1617531574258
286	121	35	1	1617531589689
287	121	35	0	1617531671063
288	121	35	1	1617531678872
289	121	64	0	1617535753814
290	125	69	1	1617543015865
291	130	35	1	1617543951346
292	130	35	0	1617544189622
293	112	56	0	1617557881727
294	120	56	0	1617558353892
295	120	56	1	1617558452333
296	130	56	1	1617558556704
297	92	130	0	1617629280380
298	92	130	1	1617629313861
299	92	130	1	1617629331806
300	95	130	1	1617629352895
301	52	130	1	1617629390518
302	96	130	1	1617629435022
303	96	130	1	1617629443553
304	109	130	0	1617629552354
305	109	130	1	1617629586802
306	35	130	0	1617629764223
307	35	130	1	1617629781292
308	52	80	1	1618030621184
309	96	80	1	1618031034463
310	109	64	0	1618033021919
311	109	64	0	1618033056511
312	109	64	0	1618033081031
313	109	64	0	1618033112275
314	109	64	1	1618033120255
316	135	35	1	1618048243837
317	135	35	1	1618049344397
318	38	66	0	1618160973519
319	38	66	0	1618161070881
320	38	66	1	1618161094771
321	38	66	1	1618161104673
322	38	66	1	1618161126878
323	38	66	1	1618211007341
324	137	82	0	1618243851252
325	137	82	0	1618244955505
326	98	82	0	1618245471454
327	98	82	1	1618245476995
328	137	82	0	1618245678505
329	98	82	0	1618245704239
330	134	82	0	1618252099448
331	13	38	0	1618333697381
332	13	38	1	1618333703994
333	13	38	1	1618333777635
334	40	38	0	1618334560502
335	12	38	0	1618346185296
336	12	38	0	1618346275017
337	12	38	0	1618346296294
338	12	38	1	1618346312993
339	92	134	1	1618397705772
340	76	134	0	1618397769169
341	76	134	1	1618397779733
342	82	38	1	1618398225602
343	83	38	0	1618398235160
344	35	44	1	1618408851701
345	35	82	1	1618488128757
346	40	82	0	1618488269040
347	40	82	1	1618488315824
348	84	33	0	1618677788927
349	112	56	0	1618678732982
350	57	56	1	1618679125478
351	38	56	0	1618679233236
352	94	56	1	1618681348524
353	48	56	1	1618681668175
354	131	135	1	1618736886229
355	131	135	1	1618736966788
356	17	135	0	1618737060499
357	33	135	0	1618737153703
358	33	135	0	1618737165072
359	40	135	0	1618737209798
360	45	135	1	1618737288068
361	63	135	1	1618737431471
362	92	64	0	1618744241877
363	35	136	1	1618759514952
364	35	136	0	1618759546357
365	35	136	1	1618759560631
366	35	136	1	1618759566573
367	40	136	1	1618819146851
368	41	136	0	1618819232286
369	41	136	1	1618819261732
370	119	136	1	1618819962746
371	82	136	1	1618819994864
372	83	136	0	1618820046034
373	83	136	1	1618820074146
374	84	136	1	1618820105545
375	79	64	1	1618821937617
376	84	64	0	1618822174547
377	84	64	0	1618822911907
378	78	64	1	1618823130304
379	81	64	1	1618823155971
380	84	64	1	1618823246848
381	14	38	0	1618825719761
382	14	38	0	1618825750770
383	14	38	1	1618825775777
387	43	136	0	1618828039882
388	22	38	0	1618830349151
389	45	136	1	1618830453468
390	34	136	1	1618830752109
391	121	136	0	1618830801910
392	63	136	1	1618831219150
393	95	80	1	1619006888534
394	136	80	1	1619008215184
395	122	69	1	1619033263852
396	34	54	1	1619089727103
397	121	54	0	1619090729588
398	135	54	0	1619090801571
399	121	54	0	1619091032991
400	135	54	0	1619091063495
401	22	54	0	1619091103405
402	153	33	1	1619105810078
403	147	64	1	1619106182279
404	149	64	1	1619106284731
405	150	64	1	1619106537459
406	122	64	1	1619108212223
407	101	54	0	1619117594093
408	101	66	0	1619117644912
409	101	54	1	1619117738025
410	77	54	0	1619118582559
411	28	54	1	1619159261973
412	112	80	0	1619182153696
413	84	33	0	1619187813513
414	95	54	0	1619190827035
415	95	54	1	1619190863312
416	147	66	1	1619195064097
417	153	39	0	1619195205553
418	12	64	0	1619197410326
419	12	64	1	1619197451505
420	41	64	1	1619198647831
421	33	64	0	1619198840694
422	33	64	1	1619198848216
423	34	64	1	1619198946239
424	135	64	0	1619199030760
425	35	64	1	1619199922094
426	35	64	1	1619200023771
427	126	64	0	1619200172460
428	126	64	0	1619200182383
429	126	64	1	1619200227463
430	33	54	0	1619203226388
431	33	54	1	1619203231576
432	81	54	1	1619243317862
433	34	33	0	1619244144059
434	34	33	0	1619244164814
435	150	33	0	1619244215214
436	40	33	0	1619244366164
437	34	54	0	1619244758423
438	34	54	1	1619244775057
439	13	61	0	1619257321865
440	88	61	0	1619260403705
441	88	61	0	1619260537221
442	43	61	0	1619261205803
443	122	136	1	1619304616683
444	160	136	0	1619304651540
445	160	136	0	1619304699108
446	17	136	1	1619305070988
447	123	136	1	1619305093676
448	124	136	1	1619305110968
449	125	136	1	1619305143619
450	129	136	1	1619305236760
451	131	136	1	1619305319296
452	133	136	1	1619305343987
453	132	136	0	1619305363785
454	134	136	0	1619305477455
455	134	136	0	1619305481978
456	134	136	1	1619305508209
457	164	136	0	1619305550141
458	164	136	1	1619305567892
459	140	136	1	1619305619646
460	141	136	1	1619305672673
461	142	136	0	1619305734396
462	142	136	0	1619305738318
463	163	136	1	1619305780816
464	143	136	1	1619305793068
465	144	136	1	1619305855502
466	145	136	1	1619305867489
467	78	136	0	1619305963887
468	78	136	1	1619305979076
469	79	136	0	1619306050379
470	79	136	1	1619306073566
471	81	136	1	1619306199211
472	34	136	1	1619306276714
473	121	136	1	1619306296412
474	135	136	0	1619306311037
475	135	136	0	1619306319008
476	135	136	0	1619306331687
477	29	136	0	1619306431698
478	30	136	0	1619306526178
479	22	136	1	1619306595309
480	23	136	1	1619306674256
481	24	136	1	1619306796410
482	46	136	1	1619306821166
483	47	136	1	1619307187198
484	126	136	1	1619307254842
485	127	136	0	1619307271372
486	127	136	0	1619307279439
487	127	136	0	1619307288402
488	127	136	0	1619307321628
489	128	136	0	1619307355897
490	128	136	0	1619307363815
491	128	136	0	1619307373945
492	128	136	0	1619307380262
493	128	136	0	1619307385960
494	128	136	1	1619307390551
495	153	136	0	1619307533307
503	113	136	0	1619308843789
504	113	136	1	1619308895411
505	114	136	0	1619308960747
506	114	136	1	1619308990063
507	115	136	0	1619309053875
508	115	136	1	1619309092054
509	34	64	1	1619343752043
510	127	64	0	1619358058887
511	127	64	0	1619358209754
512	126	64	1	1619358829878
513	126	64	1	1619358879851
514	126	64	1	1619359082087
515	126	64	1	1619359140765
516	126	64	1	1619359190683
517	153	73	1	1619382056155
518	16	136	1	1619392326831
519	13	136	0	1619392538071
520	13	136	1	1619392563403
521	149	136	1	1619392682400
522	150	136	1	1619392777842
523	44	136	0	1619393068115
524	44	136	0	1619393105053
525	92	136	1	1619393175960
526	76	136	0	1619394570663
527	76	136	1	1619394624912
528	77	136	0	1619394672241
529	77	136	1	1619394685469
530	116	136	1	1619394722946
531	117	136	1	1619394824436
532	96	136	1	1619396239612
533	136	136	1	1619396338493
534	161	136	1	1619396507549
535	136	64	1	1619414838069
536	131	64	1	1619430899951
537	82	64	1	1619432772877
538	83	64	1	1619432783711
539	129	69	1	1619434815235
540	38	66	1	1619542060171
541	23	54	0	1619604580405
542	23	54	1	1619604604860
543	131	64	1	1619605083620
544	131	64	1	1619605098698
545	131	64	1	1619605118414
546	131	64	1	1619605161597
547	133	64	1	1619605178714
548	76	64	1	1619605245067
549	121	61	0	1619609648355
552	61	82	0	1619774911906
553	80	61	0	1619776934926
554	33	61	0	1619776971006
555	33	61	1	1619776978082
556	33	61	1	1619777012890
557	33	61	1	1619777146218
558	60	140	0	1619792077623
559	32	140	0	1619792234414
560	40	140	0	1619792516912
561	160	61	0	1619792709001
562	30	61	0	1619792820336
563	30	61	0	1619792828634
564	30	61	0	1619792835798
565	119	140	0	1619792847873
566	30	61	0	1619792852731
567	30	61	1	1619792865331
568	30	61	1	1619792942066
569	19	140	1	1619793003417
570	30	61	1	1619793056671
571	127	61	1	1619793779903
572	28	66	0	1619797930172
573	119	66	0	1619798186631
574	119	66	1	1619798193020
575	117	66	0	1619798256793
576	147	66	0	1619798336580
577	110	61	1	1619941519011
578	110	61	1	1619941599989
579	104	61	1	1619942122041
580	41	61	0	1619942649452
581	34	61	1	1619942819880
582	135	61	0	1619943310798
583	135	61	0	1619943322504
584	135	61	0	1619943350896
585	135	61	0	1619943364708
586	135	61	0	1619943383007
587	135	61	0	1619943398223
588	135	61	0	1619943451780
589	135	61	0	1619944993432
590	135	61	0	1619945097861
591	135	61	0	1619945103961
592	135	61	0	1619945117185
593	135	61	0	1619945143892
594	34	61	0	1619945443926
595	34	61	1	1619945463649
596	149	33	0	1619961103342
597	149	33	0	1619961111838
598	126	44	0	1619961168212
599	76	64	1	1619969092957
600	116	64	1	1619969362346
601	118	64	0	1619969407205
602	117	64	1	1619969418076
603	113	64	1	1619969476800
604	147	64	1	1620026945384
605	147	64	1	1620027141692
606	76	64	1	1620027913785
607	180	64	1	1620028506902
608	178	64	0	1620028543807
609	179	64	0	1620028561096
610	178	64	0	1620028567584
611	178	64	0	1620028695007
612	16	64	1	1620029646452
613	126	64	1	1620030576934
614	127	64	1	1620030586758
615	182	35	1	1620035004848
616	180	61	1	1620106410627
617	180	61	1	1620106841969
618	180	61	1	1620109438358
619	76	61	1	1620111734858
620	147	61	0	1620114940088
621	147	61	0	1620114971302
622	147	61	1	1620115057882
623	113	61	0	1620116500509
624	113	61	1	1620116504555
625	115	64	0	1620122710353
626	115	64	1	1620122718467
627	182	64	1	1620145371379
628	35	61	1	1620186903036
629	15	82	1	1620204247096
630	14	82	1	1620204418556
631	182	64	1	1620206123964
632	50	82	1	1620206452468
633	187	64	1	1620206800967
634	111	82	1	1620207581724
635	20	82	0	1620208167271
636	20	82	1	1620208208074
637	103	66	1	1620209681149
638	103	66	0	1620209686970
639	34	142	1	1620239398349
641	35	142	1	1620239608476
642	188	64	1	1620286769010
643	23	69	1	1620300817057
644	46	69	1	1620300956522
645	60	69	0	1620301288164
646	53	69	1	1620301346345
647	28	54	0	1620476463751
648	28	54	0	1620476512920
649	28	54	0	1620480163004
650	28	54	1	1620480269081
651	29	54	0	1620480832509
652	29	54	1	1620480987850
653	29	54	1	1620480996369
654	112	143	0	1620487513645
655	112	143	1	1620487546569
656	120	143	0	1620487594664
657	120	143	1	1620487628394
658	130	143	1	1620487719150
659	35	143	1	1620487760700
660	35	143	1	1620487766022
661	153	66	0	1620491932801
662	153	39	0	1620492063572
663	153	66	1	1620493999033
664	204	80	1	1620497391984
665	198	80	1	1620497440106
666	199	80	1	1620497471421
667	200	80	1	1620497480622
669	115	66	0	1620499218831
670	18	82	0	1620499859029
671	18	82	0	1620499911913
672	18	82	0	1620499966439
673	113	54	0	1620500477792
674	113	54	0	1620500484200
675	113	54	1	1620500495678
678	153	54	0	1620503664933
679	153	54	1	1620503674083
680	30	54	0	1620503701189
681	30	54	0	1620503716919
682	30	54	0	1620503737247
683	30	54	1	1620503752775
684	114	54	0	1620503782831
685	114	54	1	1620503786155
686	110	54	0	1620507021857
687	110	54	0	1620507031016
688	110	54	1	1620507052604
689	153	54	1	1620507062946
690	104	54	0	1620507179676
691	34	54	1	1620507333284
692	203	54	0	1620507463983
693	21	64	1	1620554980715
694	49	64	0	1620555053739
695	195	64	1	1620555154144
696	206	64	1	1620557516216
697	206	82	1	1620592491502
698	112	80	0	1620744276509
699	112	80	1	1620744293173
700	120	80	0	1620744344470
701	120	80	1	1620744392869
702	192	144	0	1620749874088
703	192	144	1	1620749890237
704	193	144	1	1620749948510
705	16	145	0	1620750636325
706	16	146	0	1620751149855
707	187	146	1	1620751405407
708	13	146	1	1620751597065
709	149	146	0	1620751730789
710	149	146	1	1620751790758
711	150	146	0	1620751863107
712	150	146	0	1620751929195
713	151	146	0	1620752111351
714	151	146	1	1620752230351
715	150	146	0	1620752299422
716	150	146	0	1620752302590
717	152	146	0	1620752375845
718	152	146	1	1620752396264
719	152	146	1	1620752400191
720	43	146	0	1620752672295
721	44	146	0	1620752795039
722	16	147	1	1620753782535
723	16	147	1	1620754050706
724	187	147	1	1620754198827
725	187	147	1	1620754229699
726	33	147	0	1620754324483
727	28	148	1	1620760765908
728	29	148	0	1620760815707
729	35	33	0	1621139257780
730	34	54	1	1621139693202
731	28	38	0	1621157668697
732	28	38	1	1621157674340
733	203	64	1	1621250585599
734	204	64	1	1621250691469
735	210	64	1	1621250735896
736	210	64	1	1621250750760
738	215	64	1	1621328345271
739	216	64	0	1621328526147
740	216	64	0	1621328614990
741	216	64	1	1621328630642
742	216	64	1	1621328670637
743	218	64	0	1621329036254
744	218	64	0	1621329135009
745	218	64	1	1621329191691
746	219	64	1	1621332490299
747	220	64	1	1621332512711
748	135	61	0	1621403854087
749	135	64	0	1621403893000
750	135	64	0	1621403917581
751	126	61	0	1621403999144
752	126	61	1	1621404010884
753	17	61	1	1621404891035
754	17	61	1	1621405172063
755	17	61	1	1621405252106
756	123	61	1	1621405277325
757	124	61	0	1621405388631
758	21	61	0	1621405477565
759	21	61	0	1621405480714
760	175	61	1	1621405739675
761	125	61	0	1621406130484
762	49	61	0	1621406168924
763	49	61	0	1621406227168
764	49	61	0	1621406288472
765	129	61	0	1621406398333
766	188	61	0	1621406417967
767	188	61	0	1621406421637
768	189	61	1	1621406656886
769	190	61	0	1621406709343
770	191	61	0	1621406758402
771	28	64	1	1621412189868
772	29	64	1	1621412215801
773	30	64	0	1621412245520
774	30	64	1	1621412259508
775	22	64	1	1621412372082
776	23	64	1	1621412402517
777	24	64	1	1621412434193
778	126	64	1	1621418612887
779	127	64	1	1621418734786
780	110	64	1	1621419074360
781	110	64	0	1621419317579
782	153	64	1	1621419337680
783	31	64	1	1621419365731
784	42	64	1	1621419406584
785	222	64	1	1621419840687
787	114	64	0	1621420388468
788	113	64	1	1621420612927
789	114	64	1	1621420628134
790	115	64	0	1621420639890
791	115	64	1	1621420673971
792	198	64	0	1621420737248
793	198	64	1	1621420750614
794	198	64	1	1621420773841
795	199	64	0	1621420875422
796	200	64	1	1621420936659
797	33	64	1	1621421233602
798	180	64	0	1621421375178
799	178	64	0	1621421381666
800	178	64	0	1621421449436
801	178	64	1	1621421524026
802	179	64	1	1621421573095
803	179	64	1	1621421639215
804	160	82	1	1621438065057
805	160	82	1	1621438073782
806	21	82	0	1621438219313
807	49	82	0	1621438321381
808	49	82	0	1621438688360
809	49	82	0	1621438795629
810	21	82	1	1621438991218
811	34	82	1	1621439109156
812	34	82	0	1621439121238
813	34	82	0	1621439256882
814	140	61	0	1621445569235
815	122	61	0	1621446011460
816	122	61	1	1621446064713
817	160	61	0	1621446153313
818	16	82	0	1621598696064
819	16	82	1	1621598763107
820	187	82	1	1621598918986
821	13	82	1	1621599076493
822	13	82	1	1621599084399
823	149	82	0	1621599356595
824	150	82	1	1621599818440
825	151	82	1	1621599908698
826	152	82	1	1621600071055
827	43	82	0	1621610183618
828	43	82	0	1621610194258
829	43	82	0	1621610198965
830	43	82	0	1621610251025
831	43	82	0	1621610298325
832	43	82	0	1621610338879
833	44	82	0	1621610785687
834	44	82	0	1621610825618
835	44	82	0	1621611143784
836	44	82	0	1621611180715
837	44	82	1	1621611189392
838	193	82	1	1621612120746
839	126	132	0	1621614097412
840	126	132	1	1621614107174
841	109	82	0	1621614498017
842	109	82	0	1621614552576
843	194	82	1	1621614692652
844	92	82	1	1621614732927
845	112	82	0	1621614981040
846	112	82	1	1621615047692
847	120	82	0	1621615118379
848	120	82	0	1621615216689
849	130	82	1	1621615313631
850	34	82	1	1621615363653
851	121	82	1	1621615390275
852	135	82	0	1621615510982
853	32	64	1	1621664300352
854	108	64	0	1621664464454
855	103	64	1	1621664728399
856	103	64	1	1621664802431
857	104	64	1	1621664831377
858	146	64	0	1621664891872
859	146	64	1	1621664897956
860	196	64	1	1621665028638
861	197	64	0	1621665066460
862	197	64	0	1621665108947
863	197	64	1	1621665120419
864	35	64	0	1621665439488
865	40	64	0	1621665539545
866	40	64	1	1621665556148
867	119	64	0	1621665601290
868	119	64	0	1621665653605
869	119	64	0	1621666286807
870	119	64	0	1621667466969
871	119	64	0	1621667480282
872	201	64	1	1621667684865
873	202	64	1	1621667730857
874	119	64	0	1621668809646
875	119	64	1	1621669013455
876	119	64	1	1621669030742
877	119	64	0	1621669036523
878	119	64	0	1621669049283
879	34	64	0	1621669526402
880	34	64	1	1621669536591
881	121	64	1	1621669600654
882	135	64	0	1621669628459
883	135	64	0	1621669635614
884	135	64	0	1621669641826
885	135	64	0	1621669653879
886	135	64	0	1621669661414
887	108	33	0	1621676268797
888	108	66	1	1621676270243
889	34	82	1	1621689066242
890	34	82	1	1621689344672
891	121	82	1	1621689485323
892	135	82	0	1621689517788
893	112	82	1	1621689586136
894	120	82	1	1621689786943
895	130	82	1	1621689945669
896	43	82	0	1621690115360
897	43	82	0	1621690162909
898	43	82	0	1621690169231
899	44	82	0	1621690389798
900	44	82	0	1621690440578
901	44	82	1	1621690456300
902	20	73	0	1621692550526
903	20	73	1	1621692608849
904	112	82	1	1621696067792
905	191	73	1	1622038788377
906	224	64	1	1622513532964
907	227	64	0	1622514169249
908	227	64	1	1622514209162
911	225	64	1	1622514301659
912	228	64	0	1622514629299
913	228	64	1	1622514640921
914	229	64	1	1622514678747
915	230	64	1	1622514708827
916	231	64	1	1622514835150
917	232	64	1	1622515132949
918	33	64	1	1622515719736
919	33	64	1	1622515860959
920	112	64	0	1622516199282
921	130	64	0	1622516345801
922	33	54	0	1622709133684
923	24	54	0	1622728057520
924	228	54	0	1622730038423
925	228	54	0	1622730085782
926	228	54	1	1622730118292
927	120	64	0	1622981038931
928	120	64	1	1622981057865
929	130	64	1	1622981093848
930	45	64	1	1622981191508
931	155	64	1	1622981775935
932	86	64	1	1622981913544
933	87	64	1	1622981925356
934	87	64	1	1622981928611
935	86	64	0	1622981935822
936	89	64	0	1622981951531
937	89	64	1	1622981959454
938	90	64	1	1622982033743
939	91	64	1	1622982260982
940	154	64	1	1622982324927
941	156	64	0	1622982652562
942	156	64	1	1622982660944
943	177	64	0	1622982721249
944	15	64	1	1622982780634
945	14	64	0	1622982798774
946	14	64	1	1622982864593
947	195	64	1	1622982901327
948	206	64	1	1622982912850
949	209	64	1	1622983026431
950	209	64	1	1622983033243
951	208	64	0	1622983120050
952	208	64	1	1622983136130
953	112	64	1	1622983205647
954	45	64	1	1622983232491
955	147	64	1	1622983271719
956	147	64	1	1622983352566
957	148	64	1	1622983375342
958	147	64	0	1622983640515
959	147	64	0	1622983651343
960	147	64	1	1622983671099
961	148	64	0	1622983687671
962	148	64	0	1622983702322
963	12	64	0	1622983802534
964	12	64	0	1622983818821
965	12	64	1	1622983829174
966	57	64	0	1622983838091
967	57	64	1	1622983849711
968	215	64	0	1622983888884
969	215	64	1	1622983895102
970	218	64	0	1622983899895
971	218	64	1	1622983907634
972	104	64	1	1622984272253
973	33	54	0	1622987227636
974	33	54	1	1622987236631
975	224	82	1	1623146331822
976	43	64	1	1623169161162
977	43	64	0	1623169175209
978	44	64	0	1623169270224
979	13	64	1	1623169353529
980	149	64	1	1623169376032
981	150	64	1	1623169441724
982	151	64	1	1623169500362
983	152	64	1	1623169552964
984	192	64	1	1623169692610
985	193	64	1	1623169718040
986	109	64	0	1623169824731
987	109	64	0	1623169835306
988	109	64	0	1623169852275
989	109	64	0	1623169881268
990	194	64	1	1623169998836
991	92	64	1	1623170050385
992	92	64	1	1623170068820
993	76	64	1	1623170109788
994	116	64	1	1623170150675
995	161	64	0	1623170245973
996	217	64	1	1623170322601
997	217	64	1	1623170326389
998	217	64	1	1623170466650
999	130	82	1	1623283275726
1000	130	82	1	1623284145518
1001	130	82	0	1623289894395
1002	236	64	0	1623328191171
1003	236	64	1	1623328208428
1004	237	64	1	1623328320337
1005	238	64	0	1623328394454
1006	238	64	0	1623328406931
1007	238	64	0	1623328423212
1008	238	64	1	1623328647219
1009	239	64	1	1623328881256
1010	240	64	1	1623329152372
1011	241	64	1	1623329274727
1012	242	64	1	1623329421650
1013	244	64	1	1623329955012
1014	245	64	1	1623330152408
1015	246	64	0	1623330214653
1016	246	64	1	1623330283355
1017	247	64	0	1623330373171
1018	247	64	1	1623330382897
1019	247	64	1	1623330407780
1020	248	64	1	1623330550681
1021	249	64	1	1623330638023
1022	252	64	1	1623330853182
1023	251	64	1	1623330875818
1024	251	64	1	1623330880547
1025	250	64	1	1623330887739
1026	250	64	1	1623330893390
1027	44	64	0	1623332928838
1028	44	64	0	1623332942639
1029	44	64	0	1623332953578
1030	43	64	0	1623333038566
1031	224	64	1	1623333458525
1032	137	64	0	1623343759358
1033	137	64	0	1623343782594
1034	137	64	0	1623343847261
1035	98	64	1	1623343918893
1036	68	64	1	1623343990097
1037	67	64	1	1623344009405
1038	69	64	0	1623344055774
1039	100	64	1	1623344872276
1040	165	64	0	1623344895577
1041	165	64	1	1623344902978
1042	138	64	1	1623344930269
1043	65	64	1	1623344950132
1044	64	64	1	1623344967397
1045	100	64	0	1623345003655
1046	165	64	0	1623345013044
1047	97	64	1	1623345099714
1048	250	69	0	1623347286989
1049	69	82	1	1623347287382
1050	250	69	0	1623347292964
1051	67	82	1	1623347296711
1052	68	82	1	1623347315309
1053	176	69	1	1623347564279
1054	63	69	1	1623347621213
1055	205	69	1	1623347678106
1056	207	69	1	1623347725808
1057	71	69	1	1623347834014
1058	88	69	1	1623347906934
1059	20	69	1	1623347953968
1060	89	69	1	1623348001422
1061	90	69	1	1623348032603
1062	155	69	1	1623348074441
1063	15	69	1	1623348105723
1064	206	69	1	1623348156973
1065	208	69	0	1623348217023
1066	208	69	0	1623348339631
1067	208	69	0	1623348341182
1068	91	61	0	1623348902710
1069	216	132	0	1623350422135
1070	111	69	1	1623350582616
1071	209	69	1	1623350727663
1072	43	33	0	1623351597422
1073	43	33	0	1623351607498
1074	43	33	0	1623351618341
1075	43	33	0	1623351627806
1076	43	33	1	1623351641723
1077	43	33	1	1623351644109
1078	34	132	1	1623357866154
1079	182	39	0	1623360661187
1080	31	39	1	1623360694003
1081	181	39	0	1623360980566
1082	181	39	1	1623360985435
1083	182	38	1	1623361006838
1084	121	82	1	1623388919063
1085	256	82	1	1623501979991
1086	258	82	0	1623502034759
1087	258	82	0	1623502060707
1088	259	82	0	1623502108646
1089	260	82	0	1623502188724
1090	260	82	0	1623502227349
1091	263	64	1	1623517030471
1092	264	64	1	1623517053084
1093	265	64	1	1623517073368
1094	266	64	1	1623517087143
1095	267	64	1	1623517110808
1096	181	64	1	1623518377558
1097	195	64	1	1623652119886
1098	195	64	1	1623652129338
1099	195	64	1	1623652138186
1100	253	61	0	1623652733954
1101	253	61	0	1623652766499
1102	112	64	1	1623653712041
1103	112	64	1	1623653839165
1104	257	64	0	1623653986203
1105	260	64	0	1623654073557
1106	260	64	0	1623654101310
1107	260	64	0	1623654114209
1108	260	64	0	1623654120175
1109	260	64	0	1623654160908
1110	257	64	1	1623654597350
1111	160	64	1	1623655006874
1112	49	64	0	1623655275080
1113	160	64	1	1623655424444
1114	79	64	0	1623655527010
1115	79	64	1	1623655537963
1116	80	64	1	1623655589599
1117	79	64	1	1623655698895
1118	80	64	1	1623655723763
1119	80	64	1	1623655726895
1120	247	64	1	1623655929319
1121	49	64	1	1623656575079
1122	255	64	0	1623656722803
1123	255	64	1	1623656739786
1124	256	64	1	1623656773651
1125	247	64	1	1623656811047
1126	259	64	0	1623657471223
1127	258	64	0	1623657519140
1128	261	64	1	1623657557208
1129	261	64	1	1623657585796
1130	259	64	0	1623657600328
1131	259	64	0	1623657619373
1132	259	64	0	1623657629489
1133	259	64	0	1623657638380
1134	255	64	0	1623657747559
1135	255	64	0	1623657756032
1136	256	64	1	1623657766044
1137	255	64	1	1623657951097
1138	256	64	1	1623657961597
1139	256	64	1	1623657966353
1140	13	61	1	1623680380519
1141	13	61	1	1623680391491
1142	261	64	1	1623682689538
1143	43	64	0	1623691727109
1144	43	64	1	1623691737953
1145	43	64	0	1623691983797
1146	43	64	0	1623691998740
1147	135	64	0	1623692455587
1148	135	64	0	1623692471270
1149	135	64	0	1623692478342
1150	135	64	0	1623692503445
1151	262	64	0	1623724497424
1152	262	64	0	1623724514332
1153	262	64	1	1623724584010
1154	224	64	1	1623724609339
1155	182	56	1	1623776072460
1156	183	56	1	1623776142568
1157	185	56	1	1623776189625
1158	186	56	1	1623776213552
1159	219	56	1	1623776333049
1160	220	56	1	1623776383041
1161	220	56	1	1623776394295
1162	33	64	1	1623776517166
1163	33	56	0	1623776554903
1164	33	56	0	1623776582966
1165	33	56	1	1623776621309
1166	182	64	1	1623776866340
1167	193	153	1	1623777080060
1168	194	153	1	1623777254175
1169	126	153	1	1623777342210
1170	126	153	1	1623777349716
1171	127	153	1	1623777387472
1172	128	153	1	1623777437631
1173	128	153	1	1623777492125
1174	113	153	0	1623777770454
1175	113	153	1	1623777799383
1176	110	153	1	1623777993654
1177	186	61	1	1623778073927
1178	183	61	1	1623778098322
1179	28	153	1	1623778111775
1180	29	153	1	1623778253328
1181	43	154	0	1623778306567
1182	43	154	0	1623778398268
1183	263	153	1	1623778401792
1184	245	155	0	1623793480941
1185	245	155	0	1623793494144
1186	245	155	1	1623793518305
1187	40	122	1	1623798087959
1188	40	100	0	1623803405534
1189	40	100	0	1623803410285
1190	40	100	1	1623803431036
1191	119	100	0	1623803465930
1192	110	100	0	1623804004868
1193	126	100	1	1623804039509
1194	34	138	0	1623814154015
1195	34	138	0	1623814157133
1196	34	138	0	1623814164394
1197	34	138	1	1623814200680
1198	82	64	1	1623822708964
1199	82	64	1	1623823005948
1200	83	64	1	1623823036816
1201	84	64	1	1623823053023
1202	225	156	1	1623824594496
1203	123	35	0	1623830216696
1204	78	56	0	1623838738893
1205	78	56	0	1623838763443
1206	78	56	0	1623838777786
1207	78	56	1	1623838931633
1208	79	56	0	1623839106173
1209	79	56	1	1623839133437
1210	80	56	0	1623839358392
1211	80	56	0	1623839421506
1212	80	56	0	1623839635667
1213	80	56	0	1623839651033
1214	80	56	1	1623839663903
1215	81	56	1	1623839905320
1216	180	56	1	1623840257493
1217	178	56	1	1623840569762
1218	179	56	1	1623840840850
1219	34	138	0	1623851537971
1220	34	138	1	1623851556116
1221	34	138	1	1623851566971
1222	34	138	1	1623851628789
1223	34	138	0	1623851635148
1224	203	138	0	1623852044077
1225	203	138	0	1623852097603
1226	203	138	0	1623852115657
1227	203	138	0	1623852135120
1228	182	138	0	1623852189844
1229	182	138	1	1623852249137
1230	219	64	1	1623854860191
1231	123	54	0	1623856620592
1232	123	54	0	1623856620688
1233	256	82	1	1623859528078
1234	34	158	1	1623860867107
1235	121	158	0	1623861182384
1236	121	158	0	1623861237461
1237	121	158	0	1623861258584
1238	121	158	0	1623861331158
1239	121	158	1	1623861395876
1240	224	158	0	1623861836193
1241	224	158	0	1623862009352
1242	224	158	0	1623862047654
1243	224	158	0	1623862065057
1244	224	158	0	1623862067964
1245	224	158	1	1623862136434
1246	262	158	1	1623862884623
1247	126	158	1	1623862995371
1248	127	158	1	1623863061225
1249	128	158	1	1623863095313
1250	222	158	1	1623863221481
1251	26	158	1	1623863306507
1252	254	158	0	1623863511061
1253	254	158	0	1623863555855
1254	23	54	0	1623870852220
1255	23	54	0	1623870857925
1256	113	158	1	1623948075652
1257	114	158	1	1623948691147
1258	115	158	0	1623949246576
1259	28	158	1	1623949641992
1260	112	158	1	1623950364180
1261	120	158	0	1623950774697
1262	120	158	1	1623950849745
1263	130	158	1	1623951009398
1264	35	159	0	1623955560728
1265	29	158	1	1623989843173
1266	257	158	0	1623990154218
1267	45	158	1	1623990586912
1268	147	158	1	1623990767997
1269	148	158	1	1623991347232
1270	148	158	1	1623991482319
1271	16	162	0	1624296271660
1272	192	163	0	1624312532954
1273	35	33	0	1624376938168
1274	54	164	1	1624627777781
1275	55	164	1	1624627876567
1276	56	164	1	1624627925002
1277	56	164	1	1624627929144
1278	193	164	0	1624627974522
1279	193	164	0	1624628008182
1280	193	164	1	1624628013326
1281	194	164	1	1624628040737
1282	234	164	1	1624628162442
1283	227	164	0	1624628173277
1284	227	164	1	1624628201397
1285	35	164	1	1624628223446
1286	40	164	1	1624628263687
1287	40	164	1	1624628289183
1288	119	164	0	1624628338160
1289	119	164	0	1624628367807
1290	119	164	0	1624628396107
1291	82	164	1	1624628510120
1292	83	164	1	1624628528079
1293	84	164	1	1624628718996
1294	242	164	0	1624628825201
1295	242	164	1	1624628839203
1296	28	66	0	1624633789622
1297	121	82	1	1624641186764
1298	224	82	1	1624641240758
1299	228	82	0	1624641666941
1300	228	82	0	1624641695144
1301	228	82	1	1624641714275
1302	40	82	1	1624641833822
1303	23	54	0	1624706648324
1304	51	54	0	1624707312703
1305	23	54	0	1624707327846
1306	23	54	0	1624707380931
1307	23	54	0	1624707391213
1308	23	54	0	1624707393752
1309	34	166	0	1624893059851
1310	34	166	1	1624893114234
1311	121	166	0	1624893334633
1312	121	166	1	1624893413978
1313	224	166	1	1624894536834
1314	224	166	1	1624894559727
1315	262	166	0	1624894810693
1316	262	166	1	1624894959624
1317	182	166	0	1624895379884
1318	182	166	0	1624895447219
1319	182	166	1	1624895521802
1320	183	166	1	1624895556406
1321	183	166	1	1624895567643
1322	185	166	1	1624895613681
1323	186	166	1	1624895654601
1324	219	166	1	1624895729617
1325	220	166	0	1624895775450
1326	220	166	0	1624895849571
1327	220	166	0	1624895936448
1328	220	166	1	1624896072934
1329	22	54	0	1624974791916
1330	28	54	0	1624974977066
1331	28	54	1	1624975012537
1332	28	54	1	1624975289376
1333	28	54	0	1624975294672
1334	28	54	0	1624976059344
1335	34	54	1	1624976088826
1336	34	54	0	1624976151191
1337	34	54	1	1624976181167
1338	34	54	0	1624976234873
1339	34	54	0	1624976237403
1340	34	54	1	1624976243264
1341	121	54	0	1624976316588
1342	34	54	0	1624976443691
1343	34	54	0	1624976538448
1344	34	54	0	1624976624659
1345	33	54	0	1624976697208
1346	33	54	0	1624976767173
1347	33	54	0	1624976962281
1348	33	54	0	1624976992493
1349	33	54	0	1624977056294
1350	33	54	1	1624977082436
1351	34	61	1	1624978054200
1352	34	61	0	1624978064675
1353	34	61	0	1624978076848
1354	34	61	0	1624978110155
1355	34	61	0	1624978145131
1356	22	61	0	1624979306292
1357	34	61	1	1625553097737
1358	34	61	0	1625553111193
1359	119	164	1	1625563875393
1360	119	164	0	1625563890441
1361	45	169	1	1625576869730
1362	147	169	1	1625576993565
1363	148	169	1	1625577116293
1364	112	169	0	1625577352485
1365	112	169	0	1625577504168
1366	112	169	0	1625577775635
1367	112	169	0	1625577775828
1368	112	169	0	1625577775852
1369	112	169	0	1625577776117
1370	112	169	0	1625577776271
1371	112	169	0	1625577776272
1372	112	169	0	1625577776294
1373	112	169	0	1625577776477
1374	112	169	0	1625577776615
1375	112	169	0	1625577790059
1376	112	169	0	1625577790281
1377	112	169	0	1625577790445
1378	54	169	0	1625578102120
1379	54	169	0	1625578109847
1380	54	169	1	1625578114613
1381	54	169	1	1625578123067
1382	112	169	0	1625578556983
1383	112	169	0	1625578636255
1384	112	169	0	1625578649020
1385	112	169	1	1625578723774
1386	34	171	1	1625581382521
1387	121	171	1	1625581396209
1388	224	171	0	1625581449079
1389	224	171	0	1625581645181
1390	33	169	1	1625581648375
1391	224	171	0	1625581689544
1392	224	171	0	1625581732517
1393	224	171	0	1625581760124
1394	224	171	0	1625581766559
1395	224	171	0	1625581768491
1396	34	170	1	1625581864062
1397	34	170	1	1625581871712
1398	34	170	1	1625581871717
1399	34	170	1	1625581871718
1400	34	170	1	1625581871712
1401	34	170	1	1625581893785
1402	121	170	1	1625581904122
1403	224	170	0	1625581921551
1404	224	170	0	1625581963361
1405	34	170	1	1625582034893
1406	121	170	0	1625582058262
1407	121	170	1	1625582066584
1408	224	170	0	1625582084341
1409	224	170	0	1625582112255
1410	224	170	1	1625582131764
1411	224	170	1	1625582134399
1412	224	170	0	1625582161565
1413	224	170	0	1625582181345
1414	262	170	1	1625582254857
1415	224	170	0	1625582285318
1416	224	170	0	1625582398370
1417	224	170	0	1625582450991
1418	224	170	0	1625582453620
1419	262	170	1	1625582487705
1420	33	170	1	1625582516909
1421	78	170	0	1625582559331
1422	78	170	0	1625582620819
1423	78	170	1	1625582714433
1424	79	170	1	1625582810894
1425	80	170	0	1625582904607
1426	80	170	0	1625583057153
1427	80	170	0	1625583204265
1428	80	170	0	1625583739178
1429	80	170	1	1625583903203
1430	81	170	1	1625583965680
1431	180	170	1	1625584224658
1432	180	170	1	1625584232659
1433	178	170	1	1625584335293
1434	178	170	1	1625584363318
1435	179	170	1	1625584410915
1436	182	170	1	1625584461459
1437	183	170	1	1625584493231
1438	185	170	1	1625584516391
1439	186	170	1	1625584534051
1440	219	170	1	1625584555488
1441	220	170	1	1625584584587
1442	22	170	1	1625584655996
1443	23	170	1	1625584709633
1444	24	170	1	1625584759306
1445	46	170	1	1625584781682
1446	47	170	1	1625584830473
1447	51	170	1	1625584887897
1448	110	170	1	1625584940136
1449	153	170	1	1625585058556
1450	31	170	1	1625585079017
1451	42	170	1	1625585126325
1452	170	170	0	1625585242749
1453	170	170	1	1625585308303
1454	222	170	0	1625585391595
1455	222	170	0	1625585409559
1456	222	170	1	1625585437010
1457	26	170	1	1625585471433
1458	254	170	1	1625585533092
1459	28	170	1	1625585569422
1460	29	170	1	1625585653249
1461	30	170	1	1625585720655
1462	253	170	1	1625585859394
1463	113	170	0	1625585930199
1464	113	170	0	1625585976438
1465	113	170	1	1625585983417
1466	114	170	1	1625586067440
1467	115	170	0	1625586167756
1468	115	170	1	1625586261296
1469	126	170	1	1625586308175
1470	127	170	1	1625586413773
1471	128	170	1	1625586427808
1472	200	170	1	1625586460911
1473	198	170	1	1625586502681
1474	198	170	1	1625586504399
1475	199	170	1	1625586574581
1476	228	170	0	1625586629570
1477	228	170	1	1625586645669
1478	229	170	0	1625586726411
1479	229	170	0	1625586735430
1480	229	170	1	1625586778067
1481	230	170	1	1625586831856
1482	263	170	1	1625586888806
1483	264	170	0	1625586923834
1484	264	170	1	1625586953188
1485	265	170	0	1625586980778
1486	265	170	0	1625587003226
1487	265	170	1	1625587015082
1488	266	170	0	1625587108464
1489	266	170	1	1625587149505
1490	267	170	0	1625587226642
1491	267	170	1	1625587245185
1492	17	170	1	1625587426737
1493	123	170	1	1625587437915
1494	124	170	0	1625587451789
1495	124	170	1	1625587492964
1496	125	170	1	1625587505415
1497	21	170	1	1625587552635
1498	175	170	1	1625587582096
1499	49	170	1	1625587695228
1500	122	170	0	1625587728679
1501	122	170	0	1625587739000
1502	122	170	1	1625587754625
1503	160	170	1	1625587816324
1504	236	170	1	1625587857430
1505	237	170	1	1625587903536
1506	238	170	0	1625587927445
1507	238	170	0	1625587960652
1508	238	170	1	1625588017726
1509	239	170	0	1625588093267
1510	239	170	1	1625588098683
1511	129	170	1	1625588327269
1512	188	170	1	1625588348032
1513	189	170	0	1625588367823
1514	189	170	1	1625588380085
1515	190	170	1	1625588401368
1516	191	170	1	1625588449487
1517	131	170	1	1625588482537
1518	131	170	1	1625588482748
1519	131	170	1	1625588494169
1520	133	170	1	1625588516478
1521	132	170	0	1625588572986
1522	132	170	0	1625588604251
1523	132	170	0	1625588627088
1524	132	170	0	1625588693855
1525	134	170	0	1625588745679
1526	134	170	0	1625588754701
1527	134	170	0	1625588777950
1528	134	170	0	1625588829738
1529	134	170	0	1625588883879
1530	134	170	1	1625588892768
1531	132	170	0	1625588902511
1532	132	170	0	1625588905495
1533	132	170	1	1625588909303
1534	134	170	0	1625588959482
1535	134	170	0	1625588967439
1536	134	170	0	1625588980821
1537	164	170	1	1625589019535
1538	140	170	0	1625589099402
1539	132	82	0	1625596425194
1540	224	82	1	1625597456096
1541	224	54	0	1625597629595
1542	224	73	1	1625597696407
1543	224	54	0	1625597756011
1544	134	82	0	1625597880459
1545	262	54	0	1625598000620
1546	262	54	1	1625598017224
1547	224	132	1	1625598750579
1548	224	132	1	1625599109860
1549	224	54	0	1625599117814
1550	224	82	1	1625599231973
1551	224	54	1	1625599279838
1552	224	54	1	1625599294663
1553	224	54	1	1625599297770
1554	140	170	0	1625633158005
1555	140	170	1	1625633192339
1556	141	170	1	1625633461160
1557	142	170	1	1625633513215
1558	142	170	1	1625633517353
1559	142	170	0	1625633520115
1560	142	170	0	1625633522198
1561	142	170	0	1625633526522
1562	162	170	1	1625633715520
1563	143	170	1	1625633730693
1564	144	170	1	1625633754507
1565	145	170	1	1625633763126
1566	181	170	1	1625633786503
1567	163	170	1	1625633902964
1568	163	170	1	1625633915115
1569	12	170	1	1625634357973
1570	57	170	1	1625634543562
1571	215	170	1	1625634769181
1572	218	170	1	1625634897835
1573	216	170	0	1625635098164
1574	216	170	1	1625635107557
1575	221	170	0	1625635210343
1576	221	170	0	1625635231722
1577	221	170	0	1625635250765
1578	221	170	0	1625635282698
1579	221	170	0	1625635306102
1580	112	170	0	1625635454545
1581	112	170	0	1625635469661
1582	112	170	1	1625635512030
1583	120	170	0	1625635565707
1584	120	170	0	1625635606089
1585	120	170	0	1625635618273
1586	120	170	0	1625635637880
1587	120	170	0	1625635664317
1588	120	170	1	1625635670592
1589	130	170	0	1625635736418
1590	130	170	1	1625635756530
1591	257	170	0	1625635831878
1592	257	170	1	1625635842263
1593	45	170	0	1625635900813
1594	45	170	0	1625635935867
1595	45	170	1	1625635970114
1596	147	170	1	1625636034182
1597	148	170	1	1625636096016
1598	32	170	1	1625636187207
1599	19	170	1	1625636306635
1600	108	170	0	1625636381191
1601	108	170	1	1625636490538
1602	38	170	1	1625636544361
1603	39	170	0	1625636584584
1604	39	170	0	1625636643082
1605	39	170	1	1625636718978
1606	94	170	1	1625636759281
1607	48	170	1	1625636800782
1608	223	170	1	1625636861938
1609	54	170	0	1625636992490
1610	54	170	1	1625637071779
1611	54	170	1	1625637084217
1612	55	170	1	1625637156854
1613	55	170	1	1625637171152
1614	56	170	1	1625637226225
1615	60	170	1	1625637318941
1616	60	170	1	1625637327457
1617	53	170	1	1625637484171
1618	35	170	1	1625637546512
1619	40	170	1	1625637613371
1620	119	170	1	1625637677359
1621	103	170	0	1625637806041
1622	103	170	1	1625637883366
1623	104	170	1	1625637909754
1624	146	170	0	1625637972734
1625	146	170	1	1625638113375
1626	196	170	0	1625638334739
1627	196	170	1	1625638381069
1628	197	170	1	1625638465879
1629	231	170	1	1625638532712
1630	231	170	1	1625638556068
1631	231	170	1	1625638562900
1632	201	170	1	1625678175513
1633	202	170	1	1625678266856
1634	86	170	1	1625678336063
1635	87	170	1	1625678381099
1636	89	170	1	1625678442706
1637	89	170	1	1625678446263
1638	90	170	1	1625678496308
1639	91	170	1	1625678568785
1640	154	170	1	1625678644492
1641	155	170	0	1625678711631
1642	155	170	0	1625678736944
1643	155	170	0	1625678790896
1644	156	170	1	1625678862958
1645	177	170	1	1625678938977
1646	82	170	0	1625678969087
1647	82	170	1	1625678982786
1648	83	170	1	1625679008471
1649	84	170	0	1625679113177
1650	84	170	0	1625679132675
1651	84	170	1	1625679168301
1652	84	170	1	1625679192737
1653	242	170	1	1625679257220
1654	12	169	0	1625738967916
1655	12	169	0	1625739019972
1656	12	169	0	1625739083804
1657	122	38	1	1626337942393
1658	122	38	1	1626337952524
1659	236	38	1	1626338705060
1660	236	38	0	1626338715599
1661	113	173	1	1626356492976
1662	122	158	1	1626503080168
1663	160	158	0	1626503280043
1664	236	158	1	1626503535205
1665	237	158	1	1626503620475
1666	238	158	1	1626503853324
1667	239	158	0	1626504144687
1668	239	158	0	1626504162622
1669	239	158	0	1626504283860
1670	239	158	0	1626504315541
1671	131	158	1	1626504700166
1672	269	64	1	1626634420658
1673	270	64	1	1626634499610
1674	271	64	0	1626634578144
1675	271	64	0	1626634588913
1676	272	64	1	1626634674597
1677	273	64	0	1626634791012
1678	273	64	0	1626634804464
1679	273	64	0	1626634820763
1680	273	64	0	1626634859765
1681	271	64	0	1626634903362
1682	271	64	1	1626635080980
1683	274	64	1	1626635353404
1684	275	64	1	1626635393470
1685	276	64	1	1626635428594
1686	277	64	1	1626635450345
1687	278	64	1	1626635552646
1688	278	64	1	1626635676277
1689	115	61	0	1627041180358
1690	133	158	1	1627147194163
1691	132	158	0	1627147573314
1692	132	158	0	1627147622441
1693	132	158	0	1627147874867
1694	132	158	0	1627147969797
1695	134	158	0	1627148350904
1696	134	158	0	1627148396222
1697	132	158	0	1627280991295
1698	134	158	0	1627281263211
1699	164	158	1	1627281325746
1700	141	158	1	1627281579421
1701	162	158	1	1627282117057
1702	143	158	0	1627282275420
1703	144	158	1	1627282645801
1704	145	158	1	1627282729298
1705	181	158	1	1627282897052
1706	163	158	1	1627283182150
1707	122	158	1	1627395402406
1708	160	158	1	1627395635397
1709	129	158	1	1627395820162
1710	188	158	1	1627395868971
1711	189	158	1	1627395908945
1712	190	158	1	1627396165230
1713	191	158	1	1627396390827
1714	17	158	1	1627396591975
1715	123	158	0	1627396729421
1716	123	158	1	1627396739034
1717	124	158	0	1627396815427
1718	125	158	1	1627397125868
1719	21	158	1	1627397284580
1720	175	158	1	1627397440774
1721	131	64	1	1627555629829
1722	131	64	0	1627555633651
1723	131	64	1	1627555636628
1724	131	64	1	1627555647921
1725	133	64	1	1627555740467
1726	131	64	1	1627555762744
1727	132	64	0	1627556074999
1728	132	64	0	1627556119784
1729	134	64	0	1627556182044
1730	134	64	0	1627556250996
1731	134	64	0	1627556322667
1732	164	64	1	1627556386841
1733	164	64	1	1627556390727
1734	140	64	0	1627556444158
1735	164	64	1	1627556492839
1736	140	64	1	1627556625633
1737	141	64	1	1627556797683
1738	131	64	1	1627556935062
1739	133	64	1	1627556948470
1740	132	64	1	1627556967533
1741	134	64	1	1627557015863
1742	164	64	1	1627557046598
1743	140	64	1	1627557061171
1744	140	64	1	1627557063363
1745	141	64	1	1627557129734
1746	141	64	1	1627557173937
1747	140	64	0	1627557180690
1748	131	64	0	1627557273213
1749	133	64	1	1627557281088
1750	132	64	1	1627557289844
1751	134	64	1	1627557299195
1752	162	64	1	1627557521939
1753	143	64	1	1627557797304
1754	143	64	1	1627557798348
1755	181	64	1	1627558322431
1756	145	64	1	1627558330846
1757	144	64	0	1627558341560
1758	143	64	0	1627558350459
1759	163	64	1	1627558497218
1760	162	64	1	1627558592860
1761	143	64	1	1627558645818
1762	145	64	0	1627558800941
1763	181	64	1	1627558836958
1764	163	64	0	1627558856119
1765	143	64	1	1627558908373
1766	144	64	1	1627559004578
1767	143	64	1	1627559149280
1768	144	64	1	1627559155413
1769	175	64	1	1627559735710
1770	175	64	1	1627559739995
1771	21	64	0	1627559761718
1772	101	64	0	1627565159632
1773	101	64	1	1627565173066
1774	100	64	1	1627565192505
1775	101	64	1	1627565206301
1776	165	64	1	1627565304136
1777	138	64	0	1627565330045
1778	65	64	1	1627565402198
1779	65	64	1	1627565406359
1780	97	64	1	1627565728948
1781	97	64	1	1627565746609
1782	64	64	1	1627565761070
1783	65	64	1	1627565773884
1784	69	64	0	1627565818538
1785	69	64	1	1627565831383
1786	101	64	1	1627566171935
1787	100	64	1	1627566184580
1788	165	64	1	1627566192302
1789	138	64	1	1627566200077
1790	65	64	1	1627566209446
1791	64	64	1	1627566223360
1792	97	64	1	1627566233038
1793	69	64	1	1627566351142
1794	68	64	0	1627566491054
1795	98	64	1	1627566661156
1796	98	64	1	1627566665834
1797	137	64	1	1627566730871
1798	137	64	0	1627566962370
1799	137	64	0	1627567049049
1800	137	64	1	1627567098684
1801	88	64	1	1627567534497
1802	71	64	0	1627567601938
1803	71	64	1	1627567622396
1804	71	64	1	1627567634041
1805	176	64	1	1627567659797
1806	176	64	1	1627567672303
1807	63	64	1	1627568111091
1808	205	64	1	1627568159604
1809	61	64	1	1627568246242
1810	61	64	1	1627568350454
1811	207	64	1	1627568538514
1812	18	64	1	1627568577695
1813	18	64	1	1627568582428
1814	20	64	1	1627568651472
1815	50	64	1	1627568830354
1816	111	64	1	1627568936554
1817	111	64	1	1627568937339
1818	34	159	0	1627584430104
1819	34	159	1	1627584454467
1820	121	159	1	1627584504022
1821	224	159	0	1627584587557
1822	224	159	0	1627584619413
1823	224	159	1	1627584626397
1824	33	159	1	1627584652687
1825	262	159	1	1627588305312
1826	78	159	0	1627588338265
1827	78	159	0	1627588350407
1828	78	159	0	1627588358544
1829	78	159	0	1627588427882
1830	78	159	0	1627588440172
1831	78	159	0	1627588457452
1832	78	159	0	1627588477926
1833	78	159	0	1627588500312
1834	80	159	0	1627588615844
1835	80	159	0	1627588627109
1836	80	159	0	1627588643013
1837	80	159	0	1627588667783
1838	80	159	0	1627588691694
1839	80	159	1	1627588708610
1840	182	159	0	1627588741428
1841	180	159	1	1627593503660
1842	34	175	1	1627626969815
1843	34	175	1	1627626970025
1844	110	176	1	1627626984872
1845	200	176	1	1627627090468
1846	198	176	0	1627627151126
1847	198	176	1	1627627177731
1848	263	176	0	1627627233071
1849	263	176	0	1627627243353
1850	263	176	1	1627627259361
1851	34	175	1	1627627290202
1852	34	175	0	1627627330804
1853	34	175	1	1627627344764
1854	121	175	1	1627627826626
1855	224	175	1	1627627904182
1856	262	175	1	1627627941587
1857	262	175	1	1627627945455
1858	33	175	1	1627627990471
1859	78	175	0	1627628051257
1860	78	175	0	1627628073294
1861	78	175	1	1627628078593
1862	79	175	1	1627628182171
1863	182	175	1	1627632325092
1864	183	175	1	1627632337267
1865	185	175	1	1627632401259
1866	186	175	1	1627632475185
1867	78	159	0	1627636901554
1868	78	159	0	1627636910439
1869	78	159	1	1627636982424
1870	219	175	1	1627638731372
1871	220	175	1	1627638749144
1872	180	175	1	1627638967347
1873	178	175	1	1627639071639
1874	179	175	1	1627639415255
1875	81	61	0	1627655346091
1876	179	61	0	1627659193664
1877	224	54	0	1627660138697
1878	224	54	0	1627660384677
1879	30	54	0	1627674436429
1880	30	54	0	1627674440566
1881	30	54	1	1627674448838
1882	126	54	1	1627674652723
1883	119	54	0	1627675798868
1884	273	54	0	1627676802399
1885	34	177	1	1627678426166
1886	34	177	1	1627678432978
1887	34	177	1	1627678438535
1888	121	177	1	1627678555517
1889	183	38	1	1627679992780
1890	185	159	1	1627722011500
1891	126	38	1	1627722029465
1892	127	38	0	1627722051631
1893	127	38	1	1627722056774
1894	128	38	1	1627722076990
1895	230	38	0	1627722156537
1896	230	38	1	1627722166622
1897	153	38	1	1627722353647
1898	182	38	1	1627722412419
1899	182	164	1	1627722418837
1900	183	38	1	1627722427562
1901	183	164	1	1627722434720
1902	185	164	1	1627722454633
1903	219	38	0	1627722466430
1904	219	38	1	1627722470331
1905	186	164	1	1627722471700
1906	219	164	1	1627722487087
1907	220	164	1	1627722549886
1908	273	164	1	1627722713904
1909	153	164	1	1627722787092
1910	269	38	1	1627722875517
1911	114	61	0	1627745302315
1912	33	61	0	1627797472242
1913	79	61	0	1627797756558
1914	179	61	0	1627797794511
1915	30	61	0	1627797889461
1916	179	61	0	1627797966941
1917	178	61	0	1627798016124
1918	179	61	0	1627798083136
1919	179	61	0	1627798091597
1920	179	61	0	1627798439506
1921	179	61	0	1627798615168
1922	78	61	0	1627798671126
1923	153	61	0	1627798726023
1924	179	61	0	1627798736683
1925	80	61	0	1627798826705
1926	253	61	0	1627799473560
1927	149	38	0	1627847925193
1928	149	38	0	1627847943761
1929	149	38	0	1627847947294
1930	149	38	0	1627847959845
1931	149	38	0	1627847984902
1932	149	54	0	1627848402691
1933	149	54	0	1627848423476
1934	149	54	1	1627848452717
1935	26	54	0	1627848543335
1936	113	54	0	1627848577422
1937	113	54	0	1627848583482
1938	126	54	1	1627848688851
1939	273	54	0	1627848739000
1940	273	54	0	1627848794449
1941	273	54	1	1627848822100
1942	113	54	1	1627848849632
1943	17	54	1	1627848911521
1944	123	54	0	1627848939335
1945	123	54	1	1627849118164
1946	149	54	1	1627849132216
1947	175	54	1	1627849514164
1948	149	38	1	1627850451004
1949	28	164	1	1627887848362
1950	113	164	1	1627887868267
1951	182	159	1	1627908029506
1952	183	159	1	1627908046359
1953	185	159	1	1627908063339
1954	186	159	1	1627908099565
1955	219	159	1	1627908119242
1956	220	159	1	1627908138405
1957	225	159	1	1627908217767
1958	121	54	1	1627913969515
1959	34	159	1	1627982251473
1960	34	178	0	1628073708262
1961	34	178	1	1628073775580
1962	224	179	0	1628148604846
1963	34	54	1	1628159221308
1964	54	38	0	1628172991115
1965	54	38	0	1628173003836
1966	54	38	1	1628173017629
1967	83	38	0	1628174117506
1968	83	38	1	1628174125167
1969	78	54	0	1628184624484
1970	26	38	0	1628187163872
1971	40	38	0	1628187191159
1972	254	38	0	1628187648213
1973	222	38	0	1628187658699
1974	29	61	0	1628222824859
1975	46	54	0	1628275053802
1976	46	54	1	1628275112227
1977	33	38	0	1628275890799
1978	254	54	0	1628281625809
1979	115	61	0	1628319117542
1980	254	38	0	1628360213687
1981	254	38	1	1628360239362
1982	222	38	1	1628360275750
1983	186	38	0	1628414773417
1984	81	159	0	1628415242286
1985	81	159	1	1628415253482
1986	29	180	1	1628502792902
1987	34	132	1	1628575408683
1988	224	132	1	1628575506112
1989	51	54	1	1628588480072
1990	192	158	1	1628602748370
1991	193	158	1	1628603348965
1992	121	138	1	1628607080906
1993	121	138	1	1628607089055
1994	121	138	0	1628607113009
1995	121	138	0	1628607116196
1996	165	138	0	1628607161780
1997	276	138	1	1628607275977
1998	276	138	1	1628607292954
1999	22	158	1	1628613416627
2000	160	54	0	1628613532974
2001	230	54	0	1628613631513
2002	228	54	0	1628613643234
2003	229	54	0	1628613679280
2004	230	54	0	1628613686300
2005	115	54	0	1628613710343
2006	78	35	0	1628613788170
2007	178	35	0	1628613806298
2008	23	158	0	1628613825819
2009	179	35	0	1628613868990
2010	24	158	1	1628614461973
2011	46	158	1	1628614572159
2012	47	158	0	1628615316368
2013	47	64	0	1628615515159
2014	47	64	1	1628615632311
2015	51	158	0	1628615729101
2016	51	158	1	1628615770387
2017	28	158	1	1628615885342
2018	29	158	1	1628616206318
2019	276	35	1	1628617650929
2020	276	35	0	1628617658777
2021	145	61	0	1628623746872
2022	163	61	1	1628623804315
2023	163	61	1	1628623815958
2024	163	61	0	1628623821536
2025	163	61	0	1628623826837
2026	163	61	1	1628623829328
2027	145	61	1	1628623888112
2028	181	61	0	1628623893156
2029	181	61	1	1628623896140
2030	38	71	1	1628624507980
2031	178	38	0	1628624868238
2032	178	38	0	1628624873769
2033	115	35	0	1628624891142
2034	115	35	0	1628624895621
2035	115	38	0	1628624899998
2036	115	35	0	1628624912548
2037	115	35	0	1628624914602
2038	115	35	0	1628624914756
2039	22	38	0	1628624952894
2040	115	35	0	1628625041508
2041	46	38	1	1628625171321
2042	46	38	0	1628625181612
2043	23	38	0	1628625188691
2044	115	35	0	1628625390039
2045	29	38	0	1628625420635
2046	43	38	0	1628625457781
2047	28	35	0	1628625464709
2048	230	159	1	1628656594902
2049	181	61	1	1628668124083
2050	262	38	0	1628677751600
2051	262	38	1	1628677821765
2052	34	38	1	1628677893161
2053	121	38	0	1628677942544
2054	121	38	0	1628677971955
2055	121	38	0	1628678051819
2056	121	38	0	1628678068729
2057	121	38	1	1628678114762
2058	224	38	0	1628678165427
2059	224	38	0	1628678199106
2060	224	38	0	1628678257629
2061	224	38	0	1628678321533
2062	224	38	1	1628678341244
2063	262	38	1	1628678385573
2064	33	38	1	1628678433318
2065	78	38	0	1628678467955
2066	78	38	0	1628678494273
2067	180	38	1	1628678677277
2068	178	38	0	1628678724844
2069	178	38	1	1628678774503
2070	179	38	1	1628678872088
2071	179	61	0	1628688878493
2072	115	179	0	1628691600130
2073	115	179	0	1628691604229
2074	115	179	0	1628691616637
2075	30	179	1	1628692274221
2076	17	38	0	1628692309771
2077	30	179	0	1628692313259
2078	126	38	1	1628692356348
2079	114	179	0	1628692904501
2080	114	179	0	1628692917614
2081	262	181	1	1628711344560
2082	224	181	1	1628711405063
2083	121	181	1	1628711439630
2084	34	181	1	1628711460454
2085	180	54	0	1628861830472
2086	180	54	1	1628861883835
2087	30	158	1	1628864077954
2088	256	159	0	1628864432334
2089	256	159	0	1628864444150
2090	256	159	0	1628864454123
2091	256	159	1	1628864465442
2092	127	159	1	1628864572457
2093	128	159	1	1628864580723
2094	253	56	1	1628864805686
2095	110	56	1	1628865088330
2096	153	56	1	1628865291141
2097	31	56	1	1628865485194
2098	42	56	0	1628866179967
2099	42	56	1	1628866275970
2100	179	61	0	1628945517225
2101	179	61	0	1628945976945
2102	183	183	0	1628962108119
2103	185	183	0	1628962146823
2104	219	183	0	1628962185991
2105	186	183	0	1628962197802
2106	182	183	0	1628962210372
2107	26	185	0	1628968223194
2108	79	184	0	1628975828132
2109	79	184	1	1628975841855
2110	80	184	0	1628975935325
2111	240	184	1	1628976015921
2112	241	184	0	1628976085697
2113	241	184	1	1628976098379
2114	250	184	0	1628976135553
2115	250	184	1	1628976144886
2116	126	56	1	1629009679502
2117	127	56	1	1629009722293
2118	128	56	1	1629009759227
2119	222	56	1	1629009951544
2120	26	56	1	1629010095216
2121	254	56	0	1629010170120
2122	254	56	1	1629010656523
2123	222	64	1	1629014521831
2124	222	64	1	1629016686915
2125	222	64	1	1629017025634
2126	222	64	0	1629017152250
2127	222	64	1	1629017158239
2128	222	64	1	1629017388455
2129	222	64	1	1629017803562
2130	222	64	1	1629017843238
2131	254	64	0	1629017882064
2132	254	64	1	1629017898526
2133	222	64	1	1629017963432
2134	222	64	1	1629018344414
2135	143	185	1	1629041817747
2136	179	109	0	1629042878594
2137	78	61	0	1629052543836
2138	28	184	1	1629062366039
2139	113	184	1	1629062416050
2140	34	184	1	1629062484952
2141	122	184	1	1629062531453
2142	122	184	1	1629062534664
2143	43	184	0	1629062556399
2144	113	38	0	1629113579798
2145	126	38	1	1629113645702
2146	17	159	1	1629117970012
2147	123	159	1	1629117985208
2148	124	159	0	1629118010422
2149	124	159	0	1629118022126
2150	124	159	1	1629118041581
2151	125	159	1	1629118104381
2152	21	159	0	1629118186626
2153	21	159	0	1629118201917
2154	21	159	0	1629118207389
2155	21	159	0	1629118243622
2156	21	159	0	1629118261296
2157	21	159	1	1629118266443
2158	127	38	0	1629120279950
2159	12	54	0	1629125679563
2160	12	54	0	1629126731491
2161	12	54	1	1629126765464
2162	38	54	0	1629126907512
2163	38	54	0	1629126922624
2164	38	54	1	1629126928939
\.


--
-- Data for Name: suggestion; Type: TABLE DATA; Schema: public; Owner: brainlytic
--

COPY public.suggestion (suggestion_id, from_user_id, to_user_id, problem_id, timestp) FROM stdin;
1	33	38	12	1613571880293
2	33	37	13	1613571956696
3	33	38	13	1613571975624
4	71	38	13	1613572159392
5	38	71	13	1613572178263
6	37	71	14	1613573993654
\.


--
-- Data for Name: topic; Type: TABLE DATA; Schema: public; Owner: brainlytic
--

COPY public.topic (topic_id, name, subject, islive, logo, nseries, nproblem, description, serial, lang, level_id, color) FROM stdin;
29	Logical Reasoning	Logic	t	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1626515613113.png	3	13	This topic contains serieses that deals with different kinds of logic based problems of difficult level where you need to think logically to solve the problems.	1	en	7	#45C881
23	Logical Reasoning	Logical Thinking	t	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1626515613113.png	4	19	This topic contains serieses that deals with different kinds of logic based problems where you need to think logically to solve the problems.	2	en	6	#45C881
28	Logical Reasoning	Logic	t	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1626515613113.png	3	13	This topic contains serieses that deals with different kinds of logic based problems of medium level where you need to think logically to solve the problems.	1	en	8	#45C881
25	Math	math	t	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1626515696340.png	9	35	This topic contains serieses that deal with mathematical problems.	3	en	6	#FD5183
30	Math	Math	t	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1626515696340.png	9	29	This topic contains serieses that deal with mathematical problems.(medium level)	2	en	7	#FD5183
33	Geometry	geometry	t	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1626515745795.png	5	24	Geometry is one of the oldest branches of mathematics. It is concerned with the properties of space that are related to distance, shape, size, and relative position of figures. A mathematician who works in the field of geometry is called a geometer.(Difficult version)	3	en	8	#6C63FF
32	Math	math	t	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1626515696340.png	6	29	This topic contains serieses that deal with mathematical problems(Hard)	2	en	8	#FD5183
31	Geometry	Math	t	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1626515745795.png	6	31	Geometry is one of the oldest branches of mathematics. It is concerned with the properties of space that are related to distance, shape, size, and relative position of figures. A mathematician who works in the field of geometry is called a geometer.	3	en	7	#6C63FF
27	Geometry	geometry	t	https://buet-edu-1.s3.amazonaws.com/auto_upload/I97my9P8SJhfh4WrtV4CTc8xNo92/1626515745795.png	5	33	Geometry is one of the oldest branches of mathematics. It is concerned with the properties of space that are related to distance, shape, size, and relative position of figures. A mathematician who works in the field of geometry is called a geometer.	5	en	6	#6C63FF
\.


--
-- Data for Name: tutorial; Type: TABLE DATA; Schema: public; Owner: brainlytic
--

COPY public.tutorial (tutorial_id, series_id, title, logo, islive, difficulty, grade, timestp, serial, data, doc_id, author_id, ispremium) FROM stdin;
3	36	Tutorial36	example.png	t	hard	5	\N	\N	{"text":"text"}	\N	need to chamge	\N
4	33	TutorialAfter Change	example.png	t	hard	5	\N	\N	{"text":"text"}	\N	need to chamge	\N
\.


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brainlytic
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 187, true);


--
-- Name: fbcontest_sl_seq; Type: SEQUENCE SET; Schema: public; Owner: brainlytic
--

SELECT pg_catalog.setval('public.fbcontest_sl_seq', 67, true);


--
-- Name: feedback_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brainlytic
--

SELECT pg_catalog.setval('public.feedback_feedback_id_seq', 230, true);


--
-- Name: level_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brainlytic
--

SELECT pg_catalog.setval('public.level_level_id_seq', 8, true);


--
-- Name: meet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brainlytic
--

SELECT pg_catalog.setval('public.meet_id_seq', 85, true);


--
-- Name: problem_problem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brainlytic
--

SELECT pg_catalog.setval('public.problem_problem_id_seq', 683, true);


--
-- Name: series_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brainlytic
--

SELECT pg_catalog.setval('public.series_series_id_seq', 189, true);


--
-- Name: submission_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brainlytic
--

SELECT pg_catalog.setval('public.submission_submission_id_seq', 2166, true);


--
-- Name: suggestion_suggestion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brainlytic
--

SELECT pg_catalog.setval('public.suggestion_suggestion_id_seq', 6, true);


--
-- Name: topic_topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brainlytic
--

SELECT pg_catalog.setval('public.topic_topic_id_seq', 54, true);


--
-- Name: tutorial_tutorial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brainlytic
--

SELECT pg_catalog.setval('public.tutorial_tutorial_id_seq', 4, true);


--
-- Name: auth auth_pkey; Type: CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.auth
    ADD CONSTRAINT auth_pkey PRIMARY KEY (user_id);


--
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);


--
-- Name: fbcontest fbcontest_pkey; Type: CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.fbcontest
    ADD CONSTRAINT fbcontest_pkey PRIMARY KEY (sl);


--
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (feedback_id);


--
-- Name: level level_pkey; Type: CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.level
    ADD CONSTRAINT level_pkey PRIMARY KEY (level_id);


--
-- Name: meet meet_pkey; Type: CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.meet
    ADD CONSTRAINT meet_pkey PRIMARY KEY (id);


--
-- Name: problem problem_pkey; Type: CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.problem
    ADD CONSTRAINT problem_pkey PRIMARY KEY (problem_id);


--
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (user_id);


--
-- Name: series series_pkey; Type: CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_pkey PRIMARY KEY (series_id);


--
-- Name: submission submission_pkey; Type: CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.submission
    ADD CONSTRAINT submission_pkey PRIMARY KEY (submission_id);


--
-- Name: suggestion suggestion_pkey; Type: CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.suggestion
    ADD CONSTRAINT suggestion_pkey PRIMARY KEY (suggestion_id);


--
-- Name: topic topic_pkey; Type: CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.topic
    ADD CONSTRAINT topic_pkey PRIMARY KEY (topic_id);


--
-- Name: tutorial tutorial_pkey; Type: CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.tutorial
    ADD CONSTRAINT tutorial_pkey PRIMARY KEY (tutorial_id);


--
-- Name: feedback feedback_problem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_problem_id_fkey FOREIGN KEY (problem_id) REFERENCES public.problem(problem_id) ON DELETE CASCADE;


--
-- Name: feedback feedback_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth(user_id) ON DELETE CASCADE;


--
-- Name: series fk; Type: FK CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT fk FOREIGN KEY (topic_id) REFERENCES public.topic(topic_id) ON DELETE CASCADE;


--
-- Name: profile fk; Type: FK CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT fk FOREIGN KEY (user_id) REFERENCES public.auth(user_id) ON DELETE CASCADE;


--
-- Name: topic fk_level; Type: FK CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.topic
    ADD CONSTRAINT fk_level FOREIGN KEY (level_id) REFERENCES public.level(level_id) ON DELETE CASCADE;


--
-- Name: problem fk_problem; Type: FK CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.problem
    ADD CONSTRAINT fk_problem FOREIGN KEY (series_id) REFERENCES public.series(series_id) ON DELETE CASCADE;


--
-- Name: tutorial fk_series_id; Type: FK CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.tutorial
    ADD CONSTRAINT fk_series_id FOREIGN KEY (series_id) REFERENCES public.series(series_id);


--
-- Name: submission submission_problem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.submission
    ADD CONSTRAINT submission_problem_id_fkey FOREIGN KEY (problem_id) REFERENCES public.problem(problem_id) ON DELETE CASCADE;


--
-- Name: submission submission_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.submission
    ADD CONSTRAINT submission_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth(user_id) ON DELETE CASCADE;


--
-- Name: suggestion suggestion_from_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.suggestion
    ADD CONSTRAINT suggestion_from_user_id_fkey FOREIGN KEY (from_user_id) REFERENCES public.profile(user_id);


--
-- Name: suggestion suggestion_problem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.suggestion
    ADD CONSTRAINT suggestion_problem_id_fkey FOREIGN KEY (problem_id) REFERENCES public.problem(problem_id);


--
-- Name: suggestion suggestion_to_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brainlytic
--

ALTER TABLE ONLY public.suggestion
    ADD CONSTRAINT suggestion_to_user_id_fkey FOREIGN KEY (to_user_id) REFERENCES public.profile(user_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: brainlytic
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO brainlytic;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

