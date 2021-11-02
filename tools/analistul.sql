--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)

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
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comentarii; Type: TABLE; Schema: public; Owner: cosmin
--

CREATE TABLE public.comentarii (
    id integer NOT NULL,
    data_creare date DEFAULT CURRENT_DATE NOT NULL,
    continut text NOT NULL,
    id_utilizator integer NOT NULL
);


ALTER TABLE public.comentarii OWNER TO cosmin;

--
-- Name: comentarii_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmin
--

ALTER TABLE public.comentarii ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comentarii_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: dislike_comentarii; Type: TABLE; Schema: public; Owner: cosmin
--

CREATE TABLE public.dislike_comentarii (
    id integer NOT NULL,
    id_utilizator integer NOT NULL,
    id_comentariu integer NOT NULL
);


ALTER TABLE public.dislike_comentarii OWNER TO cosmin;

--
-- Name: dislike_comentarii_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmin
--

ALTER TABLE public.dislike_comentarii ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dislike_comentarii_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: institutii; Type: TABLE; Schema: public; Owner: cosmin
--

CREATE TABLE public.institutii (
    id integer NOT NULL,
    denumire character varying(200) NOT NULL,
    id_judet integer NOT NULL,
    privata bigint,
    tip character varying(100)
);


ALTER TABLE public.institutii OWNER TO cosmin;

--
-- Name: institutii_id_institutie_seq; Type: SEQUENCE; Schema: public; Owner: cosmin
--

ALTER TABLE public.institutii ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.institutii_id_institutie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: judete; Type: TABLE; Schema: public; Owner: cosmin
--

CREATE TABLE public.judete (
    id integer NOT NULL,
    denumire character varying(200) NOT NULL
);


ALTER TABLE public.judete OWNER TO cosmin;

--
-- Name: judete_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmin
--

ALTER TABLE public.judete ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.judete_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: like_comentarii; Type: TABLE; Schema: public; Owner: cosmin
--

CREATE TABLE public.like_comentarii (
    id integer NOT NULL,
    id_utilizator integer NOT NULL,
    id_comentariu integer NOT NULL
);


ALTER TABLE public.like_comentarii OWNER TO cosmin;

--
-- Name: like_comentarii_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmin
--

ALTER TABLE public.like_comentarii ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.like_comentarii_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: lista_neagra; Type: TABLE; Schema: public; Owner: cosmin
--

CREATE TABLE public.lista_neagra (
    id integer NOT NULL,
    id_profesor integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.lista_neagra OWNER TO cosmin;

--
-- Name: lista_neagra_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmin
--

ALTER TABLE public.lista_neagra ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.lista_neagra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: materii; Type: TABLE; Schema: public; Owner: cosmin
--

CREATE TABLE public.materii (
    id integer NOT NULL,
    nume character varying(200) NOT NULL
);


ALTER TABLE public.materii OWNER TO cosmin;

--
-- Name: materii_id_materie_seq; Type: SEQUENCE; Schema: public; Owner: cosmin
--

ALTER TABLE public.materii ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.materii_id_materie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: materii_profesori; Type: TABLE; Schema: public; Owner: cosmin
--

CREATE TABLE public.materii_profesori (
    id integer NOT NULL,
    id_profesor integer NOT NULL,
    id_materie integer NOT NULL
);


ALTER TABLE public.materii_profesori OWNER TO cosmin;

--
-- Name: materii_profesori_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmin
--

ALTER TABLE public.materii_profesori ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.materii_profesori_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: profesori; Type: TABLE; Schema: public; Owner: cosmin
--

CREATE TABLE public.profesori (
    id integer NOT NULL,
    nume character varying(200) NOT NULL,
    id_institutie_activ integer NOT NULL,
    pensionat boolean DEFAULT false NOT NULL
);


ALTER TABLE public.profesori OWNER TO cosmin;

--
-- Name: profesori_id_profesor_seq; Type: SEQUENCE; Schema: public; Owner: cosmin
--

ALTER TABLE public.profesori ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.profesori_id_profesor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: rating_institutii; Type: TABLE; Schema: public; Owner: cosmin
--

CREATE TABLE public.rating_institutii (
    id integer NOT NULL,
    nota_conditii integer DEFAULT 0 NOT NULL,
    id_utilizator integer NOT NULL,
    id_institutie integer,
    text text,
    nota_facilitati integer DEFAULT 0 NOT NULL,
    nota_dotari integer DEFAULT 0 NOT NULL,
    nota_utilitati integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.rating_institutii OWNER TO cosmin;

--
-- Name: rating_id_rating_seq; Type: SEQUENCE; Schema: public; Owner: cosmin
--

ALTER TABLE public.rating_institutii ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rating_id_rating_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: rating_profesori; Type: TABLE; Schema: public; Owner: cosmin
--

CREATE TABLE public.rating_profesori (
    id integer NOT NULL,
    id_utilizator integer NOT NULL,
    nota_predare integer DEFAULT 0 NOT NULL,
    data_creare date DEFAULT CURRENT_DATE NOT NULL,
    id_profesor integer NOT NULL,
    text text,
    nota_ascultare integer DEFAULT 0 NOT NULL,
    nota_personalitate integer DEFAULT 0 NOT NULL,
    nota_pregatire integer DEFAULT 0 NOT NULL,
    nota_indulgenta integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.rating_profesori OWNER TO cosmin;

--
-- Name: rating_profesori_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmin
--

ALTER TABLE public.rating_profesori ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rating_profesori_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: reclamatii; Type: TABLE; Schema: public; Owner: cosmin
--

CREATE TABLE public.reclamatii (
    id integer NOT NULL,
    titlu character varying(200) NOT NULL,
    text text NOT NULL,
    id_profesor integer NOT NULL
);


ALTER TABLE public.reclamatii OWNER TO cosmin;

--
-- Name: reclamatii_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmin
--

ALTER TABLE public.reclamatii ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reclamatii_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: cosmin
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    creation_time time without time zone DEFAULT CURRENT_TIME NOT NULL,
    creation_date date DEFAULT CURRENT_DATE NOT NULL,
    id_utilizator integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO cosmin;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmin
--

ALTER TABLE public.sessions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: utilizatori; Type: TABLE; Schema: public; Owner: cosmin
--

CREATE TABLE public.utilizatori (
    id integer NOT NULL,
    username character varying(200) DEFAULT 'new-user'::character varying NOT NULL,
    google_id character varying(160) NOT NULL,
    data_inregistrare date DEFAULT CURRENT_DATE NOT NULL,
    data_nastere date DEFAULT CURRENT_DATE NOT NULL,
    id_institutie_curenta integer,
    ban_status boolean DEFAULT false NOT NULL,
    email character varying(160) NOT NULL,
    profile_pic_url text,
    prenume character varying(100),
    nume character varying(100)
);


ALTER TABLE public.utilizatori OWNER TO cosmin;

--
-- Name: utilizatori_id_seq; Type: SEQUENCE; Schema: public; Owner: cosmin
--

ALTER TABLE public.utilizatori ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.utilizatori_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: comentarii; Type: TABLE DATA; Schema: public; Owner: cosmin
--

COPY public.comentarii (id, data_creare, continut, id_utilizator) FROM stdin;
\.


--
-- Data for Name: dislike_comentarii; Type: TABLE DATA; Schema: public; Owner: cosmin
--

COPY public.dislike_comentarii (id, id_utilizator, id_comentariu) FROM stdin;
\.


--
-- Data for Name: institutii; Type: TABLE DATA; Schema: public; Owner: cosmin
--

COPY public.institutii (id, denumire, id_judet, privata, tip) FROM stdin;
36190	Scoala Gimnaziala Sohodol	3	\N	\N
36191	Scoala Gimnaziala Aron Cotrus  Cergau Mare	3	\N	\N
36192	Scoala Gimnaziala Intregalde	3	\N	\N
36193	Colegiul Tehnic Ion D Lazarescu	3	\N	\N
36194	Colegiul Tehnic Apulum	3	\N	\N
36195	Scoala Gimnaziala Iosif Sarbu Sibot	3	\N	\N
36196	Scoala Gimnaziala Simion Lazar Lunca Mureșului	3	\N	\N
36197	Scoala Gimnaziala Vasile Goldis	3	\N	\N
36198	Scoala Gimnaziala Germana Sebes	3	\N	\N
36199	Liceul Dr.lazar Chirila Baia De Aries	3	\N	\N
36200	Scoala Gimnaziala Drasov	3	\N	\N
36201	Scoala Gimnaziala Petresti	3	\N	\N
36202	Liceul Tehnologic Tara Motilor Albac	3	\N	\N
36203	Scoala Gimnaziala Livezile	3	\N	\N
36204	Scoala Gimnaziala Vadu Motilor	3	\N	\N
36205	Institutul Teologic Greco-Catolic Bunavestire - Blaj	3	\N	\N
36206	Liceul Teologic Romano-catolic Grof Majlath Gusztav Karoly	3	\N	\N
36207	Scoala Gimnaziala Demetriu Radu  Radesti	3	\N	\N
36208	Liceul Tehnologic Jidvei	3	\N	\N
36209	Scoala Gimnaziala Sugag	3	\N	\N
36210	Liceul Thnologic De Turism Si Alimentatie Arieseni	3	\N	\N
36211	Scoala Gimnaziala Simion Pantea Salciua	3	\N	\N
36212	Scoala Gimnaziala Simion Barn Utiu	3	\N	\N
36213	Scoala Gimnaziala Lopadea Noua	3	\N	\N
36214	Colegiul National David Prodan Cugir	3	\N	\N
36215	Gradinita Cu Program Prelungit Dumbrava Minunata Alba Iulia	3	\N	\N
36216	Scoala Gimnaziala Singidava Cugir	3	\N	\N
36217	Universitatea 1 Decembrie 1918 Alba Iulia	3	\N	\N
36218	Liceul Horea Closca Si Crisan Abrud	3	\N	\N
36219	Scoala Gimnaziala Prof. Univ. Dr Gheorghe Beleiu Poiana Vadului	3	\N	\N
36220	Scoala Gimnaziala Girbova	3	\N	\N
36221	Scoala Gimnaziala Simion Balint Rosia Montana	3	\N	\N
36222	Scoala Gimnaziala Ion Pop Reteganul	3	\N	\N
36223	Scoala Gimnaziala Ovidiu Hulea	3	\N	\N
36224	Liceul Tehnologic Agricol Alexandru Borza Ciumbrud	3	\N	\N
36225	Scoala Gimnaziala Ion Agarbiceanu Bucium	3	\N	\N
36226	Scoala Gimnaziala Avram Iancu	3	\N	\N
36227	Scoala Gimnaziala Iuliu Maniu Vintu De Jos	3	\N	\N
36228	Scoala Gimnaziala Ion Breazu Mihalt	3	\N	\N
36229	Scoala Gimnaziala Mihai Eminescu Ighiu	3	\N	\N
36230	Gradinita Cu Program Prelungit Nr 2 Aiud	3	\N	\N
36231	Liceul De Arte  Regina Maria  Alba Iulia	3	\N	\N
36232	Scoala Gimnaziala Nicodim Ganea Bistra	3	\N	\N
36233	Scoala Gimnaziala Dr.petru Span Lupsa	3	\N	\N
36234	Scoala Gimnaziala Toma Cocisiu	3	\N	\N
36235	Gradinita Cu Program Prelungit Nr.13 Alba Iulia	3	\N	\N
36236	Scoala Gimnaziala Stremt	3	\N	\N
36237	Scoala Gimnaziala Emil Racovita Girda De Sus	3	\N	\N
36238	Colegiul Tehnic Alexandru Domsa	3	\N	\N
36239	Scoala Gimnaziala Sebes Pal Rimetea	3	\N	\N
36240	Scoala Gimnaziala Mihai Eminescu Alba Iulia	3	\N	\N
36241	Scoala Gimnaziala Avram Iancu Abrud	3	\N	\N
36242	Gradinita Cu Program Prelungit Primii Pasi Aiud	3	\N	\N
36243	Scoala Gimnaziala Craciunelu De Jos	3	\N	\N
36244	Liceul Cu Program Sportiv Sebes	3	\N	\N
36245	Scoala Gimnaziala Daia Romana	3	\N	\N
36246	Scoala Gimnaziala Avram Iancu Unirea	3	\N	\N
36247	Scoala Gimnaziala Ocolis	3	\N	\N
36248	Liceul Tehnolgic Ocna Mureș	3	\N	\N
36249	Scoala Gimnaziala Horea	3	\N	\N
36250	Scoala Gimnaziala Noslac	3	\N	\N
36251	Liceul Tehnologic Timotei  Cipariu	3	\N	\N
36252	Scoala Gimnaziala Ciuruleasa	3	\N	\N
36253	Scoala Gimnaziala Rosia De Secas	3	\N	\N
36254	Scoala Gimnaziala Iosif Pervain Cugir	3	\N	\N
36255	Colegiul Tehnic Aiud	3	\N	\N
36256	Colegiul National Inochentie Micu Clain Blaj	3	\N	\N
36257	Gradinita Cu Program Prelungit Piticot	3	\N	\N
36258	Scoala Gimnaziala Hopirta	3	\N	\N
36259	Scoala Gimnaziala Mogos	3	\N	\N
36260	Scoala Gimnaziala Petru Pavel Aron Blaj	3	\N	\N
36261	Scoala Gimnaziala Ion Micu Moldovan Blaj	3	\N	\N
36262	Scoala  Gimnaziala Vidra	3	\N	\N
36263	Scoala Gimnaziala Nr.2 Sebes	3	\N	\N
36264	Liceul Teoretic Petru Maior	3	\N	\N
36265	Scoala Gimnaziala Mihail Kogalniceanu	3	\N	\N
36266	Scoala Gimnaziala Cimpeni	3	\N	\N
36267	Liceul Tehnologic Stefan Manciulea	3	\N	\N
36268	Gradinita Cu Program Prelungit Nr.12 Alba Iulia	3	\N	\N
36269	Scoala Gimnaziala Posaga De Jos	3	\N	\N
36270	Scoala Gimnaziala Metes	3	\N	\N
36271	Scoala Gimnaziala Almasu Mare	3	\N	\N
36272	Scoala Gimnaziala Ion Agarbiceanu Alba Iulia	3	\N	\N
36273	Colegiul Economic Dionisie Pop Martian Alba Iulia	3	\N	\N
36274	Colegiul Tehnic Dorin  Pavel	3	\N	\N
36275	Scoala Gimnaziala Ponor	3	\N	\N
36276	Gradinita Cu Program Prelungit Lumea Copiilor Blaj	3	\N	\N
36277	Colegiul National Titu Maiorescu	3	\N	\N
36278	Scoala Gimnaziala Ohaba	3	\N	\N
36279	Scoala Gimnaziala Ion Bianu Valea-lunga	3	\N	\N
36280	Scoala Gimnaziala Ion Agarbiceanu Cenade	3	\N	\N
36281	Scoala Gimnaziala Cilnic	3	\N	\N
36282	Scoala Gimnaziala Nr.3 Cugir	3	\N	\N
36283	Scoala Gimnaziala Farau	3	\N	\N
36284	Scoala Gimnaziala Blan Diana	3	\N	\N
36285	Scoala Gimnaziala Nicolae Dragan Galda De Jos	3	\N	\N
36286	Liceul Teologic Greco-catolic Sfantul Vasile Cel Mare Blaj	3	\N	\N
36287	Gradinita Cu Program Prelungit Scufita Rosie Alba Iulia	3	\N	\N
36288	Seminarul Teologic Ortodox Sfantul Simion Stefan	3	\N	\N
36289	Scoala Gimnaziala Ioan De Hunedoara Sintimbru	3	\N	\N
36290	Scoala Gimnaziala Adam Nicolae Arad	4	\N	\N
36291	Universitatea de Vest Vasile Goldiș	4	\N	\N
36292	Scoala Gimnaziala Vanatori	4	\N	\N
36293	Colegiul Economic Arad	4	\N	\N
36294	Scoala Gimnaziala Adam Muller Guttenbrunn Zabran	4	\N	\N
36295	Colegiul Tehnic De Constructii Si Protectia Mediului Arad	4	\N	\N
36296	Scoala Gimnaziala Agrisu Mare	4	\N	\N
36297	Colegiul Tehnic Aurel Vlaicu Arad	4	\N	\N
36298	Scoala Gimnaziala Emil Montia Sicula	4	\N	\N
36299	Colegiul Csiky Gergely Arad	4	\N	\N
36300	Scoala Gimnaziala Olari	4	\N	\N
36301	Scoala Gimnaziala Buteni	4	\N	\N
36302	Liceul Teoretic Jozef Gregor Tajovsky	4	\N	\N
36303	Liceul Ioan Buteanu Gurahont	4	\N	\N
36304	Scoala Gimnaziala Mora Ferenc Zimandu Nou	4	\N	\N
36305	Scoala Gimnaziala Sintea Mare	4	\N	\N
36306	Liceul Teoretic  Mihai Veliciu	4	\N	\N
36307	Liceul Teologic Baptist Alexa Popovici Arad	4	\N	\N
36308	Scoala Primara Sever Bocu Sistarovat	4	\N	\N
36309	Scoala Gimnaziala Titus Popovici Misca	4	\N	\N
36310	Scoala Gimnaziala Craiva	4	\N	\N
36311	Scoala Gimnaziala Vasile Pop  Bocsig	4	\N	\N
36312	Scoala Gimnaziala Mailat	4	\N	\N
36313	Scoala Gimnaziala Taut	4	\N	\N
36314	Scoala Gimnaziala Andrei Saguna Andrei Saguna	4	\N	\N
36315	Scoala Gimnaziala Santana	4	\N	\N
36316	Scoala Gimnaziala Tipar	4	\N	\N
36317	Scoala Gimnaziala Silindia	4	\N	\N
36318	Gradinita Cu Program Prelungit Chisineu Cris	4	\N	\N
36319	Scoala Gimnaziala Tirnova	4	\N	\N
36320	Liceul Teoretic Cermei	4	\N	\N
36321	Gradinita Program Prelungit Palatul  Fermecat	4	\N	\N
36322	Scoala Primara Ignesti	4	\N	\N
36323	Scoala Gimnaziala Aron Cotrus	4	\N	\N
36324	Liceul Tehnologic De Industrie Alimentara	4	\N	\N
36325	Scoala Gimnaziala Corneliu Miclosi Covasint	4	\N	\N
36326	Scoala Gimnaziala Stefan Cicio Pop Arad	4	\N	\N
36327	Scoala Gimnaziala Avram Iancu	4	\N	\N
36328	Colegiul National Elena Ghiba Birta Arad	4	\N	\N
36329	Scoala Gimnaziala Fiscut	4	\N	\N
36330	Liceul Tehnologic Francisc Neuman	4	\N	\N
36331	Scoala Gimnaziala Tabajdi Karoly Zerind	4	\N	\N
36332	Scoala Gimnaziala Olosz Lajos Adea	4	\N	\N
36333	Liceul Tehnologic Stefan Hell	4	\N	\N
36334	Scoala Gimnaziala Patrichie Popescu Bata	4	\N	\N
36335	Scoala Gimnaziala Virgil Iovanas Sofron Ea	4	\N	\N
36336	Scoala Gimnaziala Simonyi Imre Satu Nou	4	\N	\N
36337	Universitatea Aurel Vlaicu Arad	4	\N	\N
36338	Scoala Gimnaziala Mihai Eminescu Arad	4	\N	\N
36339	Gradinita Program Prelungit Casuta Piticilor	4	\N	\N
36340	Scoala Gimnaziala Vladimirescu	4	\N	\N
36341	Gradinita Cu Program Prelungit Nr. 1 Arad	4	\N	\N
36342	Colegiul National Moise Nicoara Arad	4	\N	\N
36343	Scoala Gimnaziala Zadareni	4	\N	\N
36344	Scoala Gmnaziala Plescuta	4	\N	\N
36345	Gradinita Cu Program Prelungit Gradinita Prieteniei	4	\N	\N
36346	Scoala Gimnaziala Sagu	4	\N	\N
36347	Scoala Gimnaziala Gheorghe Groza Moneasa	4	\N	\N
36348	Scoala Gimnaziala Chisindia	4	\N	\N
36349	Scoala Gimnaziala Carand	4	\N	\N
36350	Liceul Atanasie Marienescu Lipova	4	\N	\N
36351	Scoala Gimnaziala Paulis	4	\N	\N
36352	Scoala Gimnaziala Stefan Bozian Seitin	4	\N	\N
36353	Scoala Gimnaziala Halmagel	4	\N	\N
36354	Gradinita Cu Program Prelungit Gradinita Veseliei Cu Rtici	4	\N	\N
36355	Scoala Gimnaziala Iratosu	4	\N	\N
36356	Scoala Gimnaziala Nr.2 Pecica	4	\N	\N
36357	Scoala Gimnaziala Aurel Sebesan Felnac	4	\N	\N
36358	Scoala Gimnaziala Dr. Ioan Danicico Semlac	4	\N	\N
36359	Liceul Tehnologic Ion Creanga	4	\N	\N
36360	Scoala Gimnaziala Birzava	4	\N	\N
36361	Scoala Gimnaziala Zarand	4	\N	\N
36362	Scoala Gimnaziala Pater Godo Mihaly Dorobanti	4	\N	\N
36363	Liceul Special Sfanta Maria	4	\N	\N
36364	Scoala Gimnaziala Graniceri	4	\N	\N
36365	Liceul Cu Program Sportiv Arad	4	\N	\N
36366	Scoala Gimnaziala Aurel Vlaicu Arad	4	\N	\N
36367	Scoala Gimnaziala Teodor Pacatian Ususau	4	\N	\N
36368	Colegiul National Preparandia Dimitrie Tichindeal Arad	4	\N	\N
36369	Seminarul Teologic Ortodox	4	\N	\N
36370	Gradinita Cu Program Prelungit Furnicuta Arad	4	\N	\N
36371	Scoala Gimnaziala Nr 2 Curtici	4	\N	\N
36372	Scoala Gimnaziala Nicolae Balcescu Arad	4	\N	\N
36373	Scoala Gimnaziala Lazar Tampa Almas	4	\N	\N
36374	Liceul Tehnologic De Electronica Si Automatizari Caius Iacob	4	\N	\N
36375	Gradinita Cu Program Prelungit Nr.11 Arad	4	\N	\N
36376	Gradinita Cu Program Prelungit Elefantelul Alfa  Arad	4	\N	\N
36377	Gradinita Program Prelungit Curcubeul Copiilor	4	\N	\N
36378	Scoala Gimnaziala Secusigiu	4	\N	\N
36379	Scoala Gimnaziala Iacobini	4	\N	\N
36380	Liceul Tehnologic Vasile Juncu Minis	4	\N	\N
36381	Liceul Tehnologic Beliu	4	\N	\N
36382	Scoala Gimnaziala Iosif Moldovan	4	\N	\N
36383	Scoala Gimnaziala Mihai Veliciu Sepreus	4	\N	\N
36384	Scoala Gimnaziala Peregu Mic	4	\N	\N
36385	Liceul Tehnologic De Transporturi Auto Henri Coanda	4	\N	\N
36386	Scoala Gimnaziala Peregu Mare	4	\N	\N
36387	Scoala Gimnaziala Simand	4	\N	\N
36388	Scoala Gimnaziala Fratii Neuman	4	\N	\N
36389	Scoala Gimnaziala Fintinele	4	\N	\N
36390	Liceul Tehnologic Chisineu Cris	4	\N	\N
36391	Scoala Gimnaziala Iustin Marsieu Socodor	4	\N	\N
36392	Scoala Gimnaziala Caius Iacob	4	\N	\N
36393	Scoala Gimnaziala Balilesti	5	\N	\N
36394	Universitatea Constantin Brancoveanu	5	\N	\N
36395	Colegiul National Dinicu Golescu	5	\N	\N
36396	Liceul Tehnologic Dinu  Bratianu	5	\N	\N
36397	Scoala Gimnaziala Traian	5	\N	\N
36398	Scoala Gimnaziala Elena Davila Perticari	5	\N	\N
36399	Scoala Gimnaziala Toma Bratianu	5	\N	\N
36400	Scoala Gimnaziala  George Marinescu	5	\N	\N
36401	Universitatea Din Pitesti	5	\N	\N
36402	Scoala Gimnaziala Nr.1uda	5	\N	\N
36403	Scoala Gimnaziala Nr 1	5	\N	\N
36404	Liceul Tehnologic Dacia	5	\N	\N
36405	Scoala Gimnaziala  Brosteni Aninoasa	5	\N	\N
36406	Scoala Gimnaziala Serbanesti	5	\N	\N
36407	Liceul Tehnologic Auto	5	\N	\N
36408	Scoala Gimnaziala Gheorghe I.i.c. Bratianu	5	\N	\N
36409	Scoala Gimnaziala General Constantin Cristescu	5	\N	\N
36410	Scoala Gimnaziala Nr.1	5	\N	\N
36411	Scoala Gimnaziala Nr. 1	5	\N	\N
36412	Scoala Gimnaziala Vladimir Streinu	5	\N	\N
36413	Gradinita Cu Program Prelungit Sfanta Marina	5	\N	\N
36414	Scoala Gimnaziala Sanda Movila Albota	5	\N	\N
36415	Scoala Gimnaziala Bratia	5	\N	\N
36416	Scoala Gimnaziala Nr1	5	\N	\N
36417	Gradinita Cu Program Prelungit Micul Print	5	\N	\N
36418	Scoala Gimnaziala  Petre Tutea	5	\N	\N
36419	Colegiul Tehnic	5	\N	\N
36420	Scoala Gimnaziala  Tudor Cornel	5	\N	\N
36421	Scoala Gimnaziala Petre Badea	5	\N	\N
36422	Scoala Gimnaziala Dumitru Udrescu	5	\N	\N
36423	Scoala Gimnaziala Alexandru Davila	5	\N	\N
36424	Scoala Gimnaziala Virgil Calotescu Bascov	5	\N	\N
36425	Scoala Gimnaziala Nr 1 Vulturesti	5	\N	\N
36426	Liceul Tehnologic  Foresti Er	5	\N	\N
36427	Liceul Tehnologic  I.c.  Petrescu	5	\N	\N
36428	Scoala Gimnaziala Tu Dor Arghezi	5	\N	\N
36429	Scoala Gimnaziala Gruiu Din Comuna Cateasca	5	\N	\N
36430	Scoala Gimnaziala  Nae A Ghica	5	\N	\N
36431	Gradinita Cu Program Prelungit Raza De Soare	5	\N	\N
36432	Scoala Gimnaziala Harsesti	5	\N	\N
36433	Gradinita Cu Program Prelungit Aripi Deschise	5	\N	\N
36434	Scoala Gimnaziala Ilie Stanculescu Raca	5	\N	\N
36435	Scoala De Muzica Campulung	5	\N	\N
36436	Scoala Gimnaziala Nicolae Velea	5	\N	\N
36437	Scoala Gimnaziala Iosif Catrinescu	5	\N	\N
36438	Liceul Tehnologic  Petre Ionescu Muscel	5	\N	\N
36439	Scoala Gimnaziala Constantin Balaceanu Stolnici	5	\N	\N
36440	Liceul Cu Program Sportiv Viitorul Pitesti	5	\N	\N
36441	Scoala Gimnaziala Dirmanesti	5	\N	\N
36442	Gradinita Cu Program Normal Campionii	5	\N	\N
36443	Scoala Gimnaziala Galesu	5	\N	\N
36444	Scoala Gimnaziala Constantin Brancoveanu	5	\N	\N
36445	Gradinita Cu Program Prelungit Alba Ca Zapada	5	\N	\N
36446	Scoala Gimnaziala Carol I	5	\N	\N
36447	Scoala Gimnaziala Nr 1  Bughea De Sus	5	\N	\N
36448	Scoala Gimnaziala Liviu Rebreanu	5	\N	\N
36449	Scoala Gimnaziala Naum Ramniceanu	5	\N	\N
36450	Scoala Gimnaziala Mosoaia	5	\N	\N
36451	Scoala Gimnaziala	5	\N	\N
36452	Scoala Gimnaziala Cotmeana	5	\N	\N
36453	Gradinita Cu Program Prelungit Floare De Colt	5	\N	\N
36454	Liceul Tehnologic Constantin Brancusi	5	\N	\N
36455	Scoala Gimnaziala Tu Dor Vladimirescu	5	\N	\N
36456	Scoala Gimnaziala Ion Iorgulescu	5	\N	\N
36457	Scoala Gimnaziala Nr .1	5	\N	\N
36458	Scoala Speciala Pentru Copii Cu Deficiente Asociate Sfantul  Stelian Costesti	5	\N	\N
36459	Scoala Gimnaziala Nicolae Simonide	5	\N	\N
36460	Liceul Teologic Elim	5	\N	\N
36461	Scoala Gimnaziala Mircea Ghitulescu	5	\N	\N
36462	Gradinita Cu Program Prelungit Primii Pasi	5	\N	\N
36463	Gradinita Cu Program Prelungit Fantezia	5	\N	\N
36464	Scoala Gimnaziala Cd Aricescu	5	\N	\N
36465	Gradinita Cu Program Prelungit Academia Piticilor	5	\N	\N
36466	Scoala Gimnaziala Marin Preda	5	\N	\N
36467	Colegiul National Ion C Bratianu	5	\N	\N
36468	Seminarul Teologic Ortodox Neagoe Voda Basarab	5	\N	\N
36469	Scoala Gimnaziala Ion Minulescu	5	\N	\N
36470	Scoala Gimnaziala Matei Basarab	5	\N	\N
36471	Scoala Gimnaziala Nicolae Balcescu	5	\N	\N
36472	Gradinita Cu Program Prelungit Pui De Lei	5	\N	\N
36473	Colegiul National Vlaicu Voda	5	\N	\N
36474	Scoala Gimnaziala Gabriel Marinescu	5	\N	\N
36475	Scoala Gimnaziala Merisani	5	\N	\N
36476	Scoala Gimnaziala Petre Tudose	5	\N	\N
36477	Colegiul Tehnic Armand Calinescu	5	\N	\N
36478	Scoala Gimnaziala Mihai Eminescu	5	\N	\N
36479	Gradinita Cu Program Prelungit Castelul Magic	5	\N	\N
36480	Liceul Tehnologic Nrj	5	\N	\N
36481	Colegiul Tehnic Dimitrie Dima	5	\N	\N
36482	Gradinita Cu Program Normal Istetel	5	\N	\N
36483	Scoala Gimnaziala Baiculesti	5	\N	\N
36484	Scoala Gimnaziala Prof.emil Negoita	5	\N	\N
36485	Scoala Gimnaziala D Radulescu	5	\N	\N
36486	Scoala Gimnaziala Regina Maria Curtea De Arges	5	\N	\N
36487	Scoala Gimnaziala Vranesti	5	\N	\N
36488	Scoala Gimnaziala Nr 1 Cocu	5	\N	\N
36489	Scoala Gimnaziala Oprea Iorgulescu	5	\N	\N
36490	Liceul Teoretic Iulia Zamfirescu	5	\N	\N
36491	Liceul Tehnologic	5	\N	\N
36492	Liceul Tehnologic Victor Slavescu	5	\N	\N
36493	Gradinita Cu Program Prelungit Dumbrava Minunata	5	\N	\N
36494	Liceul De Arte Dinu Lipatti	5	\N	\N
36495	Scoala Gimnaziala Musatesti	5	\N	\N
36496	Scoala Gimnaziala Vintila Bratianu	5	\N	\N
36497	Scoala Gimnaziala Nr 1  Poiana Lacului	5	\N	\N
36498	Colegiul National Pedagogic Carol I	5	\N	\N
36499	Scoala Gimnaziala Beleti-negresti	5	\N	\N
36500	Scoala Gimnaziala  Nanu Muscel	5	\N	\N
36501	Scoala Gimnaziala Basarab I	5	\N	\N
36502	Colegiul National Alexandru Odobescu	5	\N	\N
36503	Scoala Gimaziala Moraresti	5	\N	\N
36504	Scoala Gimnaziala Nr.1 Schitu Golesti	5	\N	\N
36505	Scoala Gimnaziala Mircea Cel Batran	5	\N	\N
36506	Scoala Gimnaziala Babana	5	\N	\N
36507	Liceul Tehnologic Ferdinand I	5	\N	\N
36508	Gradinita Cu Program Prelungit Castelul Fermecat	5	\N	\N
36509	Scoala Gimnaziala Ion Pillat	5	\N	\N
36510	Liceul Tehnologic Topoloveni	5	\N	\N
36511	Liceul Tehnologic Vedea	5	\N	\N
36512	Liceul Tehnologic Constantin Dobrescu	5	\N	\N
36513	Scoala Gimnaziala Ungureni	6	\N	\N
36514	Universitatea George Bacovia	6	\N	\N
36515	Scoala Gimnaziala Nr.1  Blagesti	6	\N	\N
36516	Liceul Tehnologic Jacques M. Elias Com. Sascut	6	\N	\N
36517	Scoala Gimnaziala Nr.1  Comuna Manastirea Casin	6	\N	\N
36518	Scoala Gimnaziala Nicolae Iorga	6	\N	\N
36519	Scoala Gimnaziala Helegiu	6	\N	\N
36520	Scoala Gimnaziala Nr.1 Slanic Moldova	6	\N	\N
36521	Scoala Gimnaziala Comuna Cleja	6	\N	\N
36522	Scoala Gimnaziala Comuna Racaciuni	6	\N	\N
36523	Scoala Gimnaziala Sfantul Voievod Stefan Cel Mare	6	\N	\N
36524	Scoala Gimnaziala Stefan Cel Mare Oras Buhusi	6	\N	\N
36525	Scoala Gimnaziala Nicolae Balcescu	6	\N	\N
36526	Scoala Gimnaziala Emil Braescu Magura	6	\N	\N
36527	Scoala Gimnaziala Glavanesti	6	\N	\N
36528	Scoala Gimnaziala Comuna Cotofanesti	6	\N	\N
36529	Scoala Gimnaziala Comuna Colonesti	6	\N	\N
36530	Scoala Gimnaziala Secuieni	6	\N	\N
36531	Scoala Gimnaziala Alexandru Sever  Moinesti	6	\N	\N
36532	Scoala Cu Clasele I-viii Huruiesti	6	\N	\N
36533	Colegiul Henri Coanda Bacău	6	\N	\N
36534	Colegiul National De Arta George Apostu	6	\N	\N
36535	Scoalanationala De Pregatire A Agentilor De Penitenciare	6	\N	\N
36536	Colegiul Tehnic Anghel Saligny	6	\N	\N
36537	Scoala Gimnazialcomuna Oncesti	6	\N	\N
36538	Scoala Gimnaziala Nr.1  Municipiul Onesti	6	\N	\N
36539	Colegiul National Pedagogic Stefan Cel Mare	6	\N	\N
36540	Colegiul Tehnic Grigore Cobalcescu	6	\N	\N
36541	Scoala Gimnaziala Alexandru  Cel Bun  Bacău	6	\N	\N
36542	Scoala Gimnaziala  Al . I. Cuza  Bacău	6	\N	\N
36543	Liceul Tehnologic  Darman Esti	6	\N	\N
36544	Liceul Tehnologic Municipiul Onesti	6	\N	\N
36545	Scoala Gimnaziala Stefan Luchian Moinesti	6	\N	\N
36546	Scoala Gimnaziala Octavian Voicu	6	\N	\N
36547	Scoala Gimnaziala Comuna Scorteni	6	\N	\N
36548	Scoala Gimnaziala Scarlat Longhin -dofteana	6	\N	\N
36549	Scoala Gimnaziala George Apostu Stanisesti	6	\N	\N
36550	Scoala Gimnaziala Comuna Beresti Tazlau	6	\N	\N
36551	Colegiul National Vasile Alecsandri	6	\N	\N
36552	Colegiul Tehnic Petru Poni	6	\N	\N
36553	Scoala Gimnaziala Parava	6	\N	\N
36554	Liceul Tehnologic . Oras Tirgu Ocna	6	\N	\N
36555	Liceul Tehnologic  Rachitoasa	6	\N	\N
36556	Scoala Gimnaziala Comuna Agas	6	\N	\N
36557	Colegiul Grigore Antipa Bacău	6	\N	\N
36558	Scoala Gimnaziala Nr.1 Comuna Faraoani	6	\N	\N
36559	Scoala Gimnaziala Comuna Filipeni	6	\N	\N
36560	Scoala Gimnaziala Calugareni	6	\N	\N
36561	Scoala Gimnaziala Comuna Strugari	6	\N	\N
36562	Scoala Gimnaziala Ciprian Porumbescu Comanesti	6	\N	\N
36563	Scoala Gimnaziala Stefan Cel Mare Comuna Zemes	6	\N	\N
36564	Scoala Gimnaziala Gheorghe Nechita Motoseni	6	\N	\N
36565	Scoala Gimnaziala Ghita Mocanu	6	\N	\N
36566	Scoala Gimnaziala Comuna Sascut	6	\N	\N
36567	Scoala Gimnaziala Liviu Rebreanu Oras Comanesti	6	\N	\N
36568	Universitatea Vasile Alecsandri Din Bacău	6	\N	\N
36569	Scoala Gimnaziala Vasile Gh.radu Satu Nou	6	\N	\N
36570	Scoala Gimnaziala Ioana Radu Rosetti Comuna Brusturoasa	6	\N	\N
36571	Scoala Gimnaziala Nr.2 Targu Ocna	6	\N	\N
36572	Scoala Gimnaziala Vultureni	6	\N	\N
36573	Scoala Gimnaziala Mihail Andrei Orasul Buhusi	6	\N	\N
36574	Scoala Gimnaziala Nr 1 Comuna Valea Seaca	6	\N	\N
36575	Colegiul Economic Ion Ghica Bacău	6	\N	\N
36576	Scoala Gimnaziala Nr. 1 Oituz	6	\N	\N
36577	Liceul Tehnologic Ghimes-faget	6	\N	\N
36578	Scoala Gimnaziala Sat Ch Etris Comuna Tamasi	6	\N	\N
36579	Scoala Gimnaziala -sat Haghiac Comuna Dofteana	6	\N	\N
36580	Scoala Gimnaziala Comuna Buciumi	6	\N	\N
36581	Liceul Teologic Fericitul Ieremia	6	\N	\N
36582	Scoala Gimnaziala Alexandru Cel Bun Berzunti	6	\N	\N
36583	Scoala Gimnaziala Loc Plopu Darman Esti	6	\N	\N
36584	Colegiul Mihai Eminescu Bacău	6	\N	\N
36585	Scoala Gimnaziala Alecu Russo	6	\N	\N
36586	Scoala Populara De Arte  Si Meserii	6	\N	\N
36587	Scoala Gimnaziala Sat Cornii De Sus Com.tatarasti	6	\N	\N
36588	Scoala Gimnaziala Mihai Eminescu Lespezi Com Girleni	6	\N	\N
36589	Scoala Gimnaziala Nr.1 Comuna Livezi	6	\N	\N
36590	Scoala Gimnaziala Comuna Solont	6	\N	\N
36591	Scoala Gimnaziala General Nicolae Sova Poduri	6	\N	\N
36592	Scoala Cu Clasele I-viii Constantin Moscu Izvoru Berheciului	6	\N	\N
36593	Scoala Gimnaziala Comuna Magiresti	6	\N	\N
36594	Scoala Gimnaziala Comuna Caiuti	6	\N	\N
36595	Scoala Gimnaziala Mihai Dragan Mun Bacău	6	\N	\N
36596	Colegiul National Grigore C Moisil	6	\N	\N
36597	Scoala Gimnaziala Comuna Pirjol	6	\N	\N
36598	Scoala Gimnaziala Sat Racatau Comuna Horgesti	6	\N	\N
36599	Scoala Gimnaziala Corbasca	6	\N	\N
36600	Scoala Cu Clasele I-viii Ionita Sandu Sturdza	6	\N	\N
36601	Scoala Gimnaziala Com. Luizi Calugara	6	\N	\N
36602	Scoala  Gimnaziala Nr.1 Gura Vaii	6	\N	\N
36603	Scoala Gimnaziala Domnita Maria	6	\N	\N
36604	Colegiul Tehnic Ion Borcea Buhusi	6	\N	\N
36605	Liceul Cu Program Sportiv	6	\N	\N
36606	Colegiul National Catolic Sfantul Iosif	6	\N	\N
36607	Liceul Tehnologic Alexandru Vlahuta Podu Turcului	6	\N	\N
36608	Scoala Gimnaziala George Enescu Moinesti	6	\N	\N
36609	Scoala Gimnaziala Nr.3 Orasul Darmanesti	6	\N	\N
36610	Scoala Gimnaziala Ion Borcea Comuna Racova	6	\N	\N
36611	Scoala Gimnaziala Nr.1 Comuna Rosiori	6	\N	\N
36612	Scoala Gimnaziala Gheorghe Bantas Itesti	6	\N	\N
36613	Scoala Gimnaziala Nr 22	6	\N	\N
36614	Scoala Gimnaziala Filipesti	6	\N	\N
36615	Scoala Gimnaziala Nr.1 Slobozia	6	\N	\N
36616	Colegiul Tehnic Dumitru Mangeron Bacău	6	\N	\N
36617	Scoala Gimnaziala Nr. 2 Orasul Darmanesti	6	\N	\N
36618	Scoala Gimnaziala Nr. 1 Negoiesti	6	\N	\N
36619	Scoala Gimnaziala  Gheorghe Avramescu	6	\N	\N
36620	Scoala Gimnaziala Nr 1 Pincesti	6	\N	\N
36621	Colegiul Sportiv Nadia Comaneci	6	\N	\N
36622	Scoala Gimnaziala Ion Rotaru Valea Lui Ion	6	\N	\N
36623	Scoala Gimnaziala Bacioiu	6	\N	\N
36624	Scoala Gimnaziala Nr.1 Comuna Sarata	6	\N	\N
36625	Scoala Gimnaziala Comuna Dealu Morii	6	\N	\N
36626	Scoala Gimnaziala Costachi S.ciocan Comanesti	6	\N	\N
36627	Liceul Don Orione	7	\N	\N
36628	Liceul Teoretic Ady Endre	7	\N	\N
36629	Gradinita Cu Program Prelungit Toldi Salonta	7	\N	\N
36630	Scoala Gimnaziala Dimitrie Cantemir	7	\N	\N
36631	Scoala Gimnaziala Nr.1  Bulz	7	\N	\N
36632	Liceul Ortodox Episcop Roman Ciorogariu Municipiul Oradea	7	\N	\N
36633	Scoala Gimnaziala Szalardi Janos Salard	7	\N	\N
36634	Colegiul Tehnic Nr 1 Vadu Crisului	7	\N	\N
36635	Scoala Gimnaziala Nr.1 Cheresig	7	\N	\N
36636	Liceul Teoretic Horvath Janos	7	\N	\N
36637	Scoala De Arte Francisc Hubic	7	\N	\N
36638	Scoala Gimnaziala Lucretia Suciu	7	\N	\N
36639	Scoala Gimnaziala Nr.1 Comuna Pomezeu	7	\N	\N
36640	Scoala Gimnaziala Nr. 1 Comuna Viisoara	7	\N	\N
36641	Scoala Gimnaziala Toldy Sinnicolau De Munte	7	\N	\N
36642	Colegiul Economic Partenie Cosma Oradea	7	\N	\N
36643	Scoala Gimnaziala Nr.1 Sat Urvis De Beius Comuna Soimi	7	\N	\N
36644	Scoala Primara Nr.1 Comuna Pocola	7	\N	\N
36645	Scoala Gimnaziala Nicolae Popoviciu Beius	7	\N	\N
36646	Liceul Tehnologic Nr. 1 Suplacu De Barcau	7	\N	\N
36647	Scoala Gimnaziala Nr.1  Comuna Sirbi	7	\N	\N
36648	Universitatea Din Oradea	7	\N	\N
36649	Universitatea Crestina Partium	7	\N	\N
36650	Scoala De Pregatire A Agentilor Politiei De Frontiera Avram Iancu	7	\N	\N
36651	Scoala Gimnaziala Nr.1  Comuna Ceica	7	\N	\N
36652	Liceul De Arte	7	\N	\N
36653	Scoala Gimnaziala Nr 1 Oras Nucet	7	\N	\N
36654	Colegiul National Iosif Vulcan	7	\N	\N
36655	Scoala Gimnaziala Nr.1 Sintandrei	7	\N	\N
36656	Gradinita Cu Program Prelungit Nr.34	7	\N	\N
36657	Scoala Gimnaziala Nr.1  Sat Petreu Comuna Abramut	7	\N	\N
36658	Scoala Gimnaziala Nr. 1 Sinteu	7	\N	\N
36659	Liceul Teoretic Lucian  Blaga	7	\N	\N
36660	Scoala Gimnaziala Avram Iancu Oradea	7	\N	\N
36661	Scoala Gimnaziala Nr.1  Comuna Tarcea	7	\N	\N
36662	Scoala Gimnaziala Nr. 1 Sacadat	7	\N	\N
36663	Gradinita Nr. 54	7	\N	\N
36664	Scoala Gimnaziala Nicolae Bogdan Vascau	7	\N	\N
36665	Scoala Gimnaziala Nr 1 Husasau De Tinca	7	\N	\N
36666	Liceul Tehnologic George Baritiu Oradea	7	\N	\N
36667	Scoala Gimnaziala Oltea Doamna	7	\N	\N
36668	Scoala Gimnaziala Miskolczy Karoly Sat  Misca Comuna Chislaz	7	\N	\N
36669	Scoala Gimnaziala Benedek Elek Comuna Cetariu	7	\N	\N
36670	Scoala Gimnaziala Nr.1 Comuna Curatele	7	\N	\N
36671	Colegiul National Avram Iancu	7	\N	\N
36672	Scoala Gimnaziala Nr. 1 Comuna Lunca	7	\N	\N
36673	Scoala Gimnaziala Nr.1 Sannicolau Roman	7	\N	\N
36674	Liceul Tehnologic Horea	7	\N	\N
36675	Scoala Gimnaziala Balasko Nandor Comuna Salacea	7	\N	\N
36676	Scoala Gimnaziala Nr.1 Comuna Budureasa	7	\N	\N
36677	Liceul Tehnologic Nrj Comuna Popesti	7	\N	\N
36678	Scoala Primara Nr1 Comuna Paleu	7	\N	\N
36679	Scoala Gimnaziala Nr. 1 Comuna Tauteu	7	\N	\N
36680	Scoala Gimnaziala Nr.11	7	\N	\N
36681	Scoala Gimnaziala Nr. 1 Gepiu	7	\N	\N
36682	Liceul Tehnologic Ioan Bococi	7	\N	\N
36683	Scoala Gimnaziala Miron Pompiliu	7	\N	\N
36684	Scoala Gimnaziala Nr.1 Comuna Bu Duslau	7	\N	\N
36685	Scoala Gimnaziala Nr.1 Comuna Cociuba Mare	7	\N	\N
36686	Scoala Gimnaziala Ovidiu Drimba	7	\N	\N
36687	Colegiul National Samuil Vulcan Beius	7	\N	\N
36688	Scoala Gimnaziala Nr. 1 Comuna Rieni	7	\N	\N
36689	Scoala Gimnaziala Octavian Goga Oradea	7	\N	\N
36690	Gradinita Cu Program Prelungit Nr. 45	7	\N	\N
36691	Liceul Teoretic Aurel Lazar	7	\N	\N
36692	Scoala Gimnaziala Gaspar Andras Comuna Biharia	7	\N	\N
36693	Scoala Gimnaziala Nr 1 Sat Mihai Bravu Comuna Rosiori	7	\N	\N
36694	Liceul Tehnologic Sanitar  Vasile Voiculescu	7	\N	\N
36695	Scoala Gimnaziala Nr.1 Comuna Brusturi	7	\N	\N
36696	Scoala Gimnaziala Nr.1 Comuna Batar	7	\N	\N
36697	Scoala Gimnaziala Zelk Zoltan Valea Lui Mihai	7	\N	\N
36698	Scoala Gimnaziala Nr.1 Abram	7	\N	\N
36699	Gradinita Cu Program Prelungit Nr.25	7	\N	\N
36700	Scoala Gimnaziala Nr.1 Chislaz	7	\N	\N
36701	Liceul Tehnologic Agroindustrial  Tamasi Aron	7	\N	\N
36702	Liceul Tehnologic Nrj  Cadea	7	\N	\N
36703	Colegiul Agricol Nrj Oras Valea Lui Mihai	7	\N	\N
36704	Scoala Gimnaziala Nr.1 Comuna Olcea	7	\N	\N
36705	Scoala Gimnaziala Georgiu Popa Cimpani	7	\N	\N
36706	Scoala Gimnaziala Nr. 1 Spinus	7	\N	\N
36707	Scoala Gimnaziala  Inv.galgau Iosif Sat Pagaia Comuna Boianu Mare	7	\N	\N
36708	Scoala Gimnaziala Nr.1 Uileacu De Beius	7	\N	\N
36709	Scoala Gimnaziala Nicolae Balcescu Oradea	7	\N	\N
36710	Scoala Gimnaziala Nr.1 Cefa	7	\N	\N
36711	Gradinita Cu Program Prelungit Nr. 1 Beius	7	\N	\N
36712	Scoala Gimnaziala Nr.1  Butani	7	\N	\N
36713	Scoala Gimnaziala Nr.1 Nojorid	7	\N	\N
36714	Colegiul Tehnic Traian Vuia	7	\N	\N
36715	Scoala Gimnaziala Nr.1  Comuna Capilna	7	\N	\N
36716	Gradinita Cu Program Prelungit Nr.1 Comuna Tinca	7	\N	\N
36717	Colegiul National Mihai Eminescu	7	\N	\N
36718	Scoala Gimnaziala Nr.1 Comuna Bu Ntesti	7	\N	\N
36719	Scoala Gimnaziala Viorel Horj Draganesti	7	\N	\N
36720	Colegiul National „samuil Vu Lcanbeius	7	\N	\N
36721	Colegiul Tehnic Mihai Viteazul Oradea	7	\N	\N
36722	Liceul Teoretic Nicolae  Jiga Tinca	7	\N	\N
36723	Gradinita De Copii Nr.50	7	\N	\N
36724	Liceul Teoretic Petofi San Dor	7	\N	\N
36725	Gradinita Cu Program Prelungit Floare De Colt Beius	7	\N	\N
36726	Liceul Teologic Baptist Emanuel	7	\N	\N
36727	Liceul Teologic Penticostal Betel	7	\N	\N
36728	Scoala Gimnaziala Dacia	7	\N	\N
36729	Scoala Gimnaziala Nr 1 Comuna Derna	7	\N	\N
36730	Scoala Gimnaziala Nr.2 Sat Bogei  Comuna Tauteu	7	\N	\N
36731	Liceul Teoretic Nr 1 Bratca	7	\N	\N
36732	Scoala Gimnaziala Floare De Lotus Sinmartin	7	\N	\N
36733	Gradinita Cu Program Prelungit Nr. 28 Oradea	7	\N	\N
36734	Liceul Teoretic Constantin Serban	7	\N	\N
36735	Scoala Gimnaziala Nr.1 Madaras	7	\N	\N
36736	Colegiul Tehnic Alexandru Roman	7	\N	\N
36737	Scoala Gimnaziala Puiu Sever	7	\N	\N
36738	Scoala Gimnaziala Nrj Tileagd	7	\N	\N
36739	Scoala Gimnaziala Nr.1 Comuna Lazareni	7	\N	\N
36740	Scoala Gimnaziala Nr. 1 Ciumeghiu	7	\N	\N
36741	Scoala Gimnaziala Nr.1 Comuna Diosig	7	\N	\N
36742	Liceul Cu Program Sportiv Bihorul	7	\N	\N
36743	Colegiul National Teodor Nes	7	\N	\N
36744	Liceul Reformat Lorantffy Zsuzsan Na	7	\N	\N
36745	Liceul Teoretic Onisifor Ghibu	7	\N	\N
36746	Scoala Gimnaziala Ioan Slavici	7	\N	\N
36747	Scoala Gimnaziala Matei	8	\N	\N
36748	Gradinita Cu Program Prelungit Nr.2 Bistrita	8	\N	\N
36749	Scoala Gimnaziala Micestii De Cimpie	8	\N	\N
36750	Gradinita Cu Program Prelungit Nr.1	8	\N	\N
36751	Liceul Cu Program Sportiv Bistrita	8	\N	\N
36752	Scoala Gimnaziala Tiha Birgaului	8	\N	\N
36753	Colegiul National Petru Rares Beclean	8	\N	\N
36754	Scoala Gimnaziala Sintereag	8	\N	\N
36755	Gradinita Cu Program Saptamanal Dumbrava Minunata	8	\N	\N
36756	Scoala Gimnaziala Iacob Si Ioachim Mureșanu	8	\N	\N
36757	Scoala Gimnaziala Dumitra	8	\N	\N
36758	Scoala Gimnaziala Avram Iancu	8	\N	\N
36759	Scoala Gimnaziala Nr.1  Ilva Mica	8	\N	\N
36760	Scoala Gimnaziala Bu Desti	8	\N	\N
36761	Scoala Gimnaziala Ioan S. Pavelea	8	\N	\N
36762	Scoala Gimnaziala Sieu	8	\N	\N
36763	Gradinita Cu Program Prelungit Raza De Soare	8	\N	\N
36764	Scoala Gimnaziala Milas	8	\N	\N
36765	Scoala Gimnaziala Budacu De Sus	8	\N	\N
36766	Scoala Gimnaziala Nr. 1 Rebra	8	\N	\N
36767	Liceul Tehnologic  Foresti Er	8	\N	\N
36768	Scoala Gimnaziala Livezile	8	\N	\N
36769	Scoala Gimnaziala Ilva Mare	8	\N	\N
36770	Scoala Gimnaziala Sever Pop Poiana Ilvei	8	\N	\N
36771	Scoala Gimnaziala George Cobuc	8	\N	\N
36772	Colegiul Economic Nasaud	8	\N	\N
36773	Scoala Gimnaziala Lucian Blaga	8	\N	\N
36774	Scoala Gimnaziala Nr. 4	8	\N	\N
36775	Liceul Tehnologic Lechinta	8	\N	\N
36776	Scoala Gimnaziala Josenii Birgaului	8	\N	\N
36777	Scoala Gimnaziala Nuseni	8	\N	\N
36778	Scoala Gimnaziala Nr.1  Lunca Ilvei	8	\N	\N
36779	Scoala Gimnaziala Uriu	8	\N	\N
36780	Scoala Gimnaziala Liviu Rebreanu Chiuza	8	\N	\N
36781	Scoala Gimnaziala Vasile Scurtu Parva	8	\N	\N
36782	Gradinita Cu Program Prelungit Nr.6 Bistrita	8	\N	\N
36783	Gradinita Cu Program Prelungit Nr.3	8	\N	\N
36784	Gradinita Cu Program Prelungit Trenuletul Veseliei Bistrita	8	\N	\N
36785	Gradinita Cu Program Prelungit Nr. 12	8	\N	\N
36786	Scoala Gimnaziala Florian Porcius Rodna	8	\N	\N
36787	Scoala Gimnaziala Grigore Herinean Galațiibistritei	8	\N	\N
36788	Liceul Tehnologic Special Sfanta Maria Bistrita	8	\N	\N
36789	Gradinita Cu Program Prelungit Singeorz-bai	8	\N	\N
36790	Gradinita Cu Program Prelungit Nr.13	8	\N	\N
36791	Gradinita Cu Program Prelungit Casuta Cu Povesti	8	\N	\N
36792	Scoala Gimnaziala Stefan Cel Mare	8	\N	\N
36793	Scoala Gimaziala Petru Rares Ciceu-mihaiesti	8	\N	\N
36794	Scoala Gimnaziala Nr.1  Lesu	8	\N	\N
36795	Scoala Gimnaziala Paul Tanco Monor	8	\N	\N
36796	Scoala Gimnaziala Grigore Silasi Beclean	8	\N	\N
36797	Scoala Gimnaziala Urmenis	8	\N	\N
36798	Scoala Gimnaziala Nr. 1  Bistrita Birgaului	8	\N	\N
36799	Liceul Tehnologic Ion Caian Romanul	8	\N	\N
36800	Scoala Gimnaziala Enea Grapini	8	\N	\N
36801	Scoala Gimnaziala Tiberiu Morariu	8	\N	\N
36802	Liceul Radu Petrescu	8	\N	\N
36803	Scoala Gimnaziala Dariu Pop	8	\N	\N
36804	Colegiul Tehnic Infoel Bistrita	8	\N	\N
36805	Liceul De Muzica Tudor Jarda	8	\N	\N
36806	Liceul Tehnologic Henri Coanda Beclean	8	\N	\N
36807	Liceul Tehnologic De Servicii	8	\N	\N
36808	Scoala Gimnaziala Nicolae Draganu Zagra	8	\N	\N
36809	Scoala Gimnaziala Spermezeu	8	\N	\N
36810	Scoala Gimnaziala Nr.1	8	\N	\N
36811	Scoala Gimnaziala Tu Reac	8	\N	\N
36812	Liceul Teoretic Solomon Halita	8	\N	\N
36813	Liceul Tehnologic Tirlisua	8	\N	\N
36814	Scoala Gimnaziala Silivasu De Cimpie	8	\N	\N
36815	Liceul De Arte Corneliu Baba	8	\N	\N
36816	Scoala Gimnaziala Nr 7 Bistrita	8	\N	\N
36817	Scoala Gimnaziala Branistea	8	\N	\N
36818	Scoala Gimnaziala Ciceu-giurgesti	8	\N	\N
36819	Scoala Gimnaziala Mariselu	8	\N	\N
36820	Colegiul  National George Cosbuc Nasaud	8	\N	\N
36821	Scoala Gimnaziala Petris	8	\N	\N
36822	Scoala Gimnaziala Sinmihaiu De Cimpie	8	\N	\N
36823	Scoala Gimnaziala Nr.12 Botoșani	9	\N	\N
36824	Scoala Gimnaziala Nr.2 Tudor Vladimirescu-albesti	9	\N	\N
36825	Scoala Gimnaziala Aristotel Crismaru Draguseni	9	\N	\N
36826	Liceul Tehnologic Plopenii  Mari	9	\N	\N
36827	Scoala Gimnaziala Nr. 1 Corlateni	9	\N	\N
36828	Liceul Tehnologic Todireni	9	\N	\N
36829	Colegiul Tehnic Gheorghe Asachi Botoșani	9	\N	\N
36830	Scoala Gimnaziala Leon Danaila Darabani	9	\N	\N
36831	Liceul Teoretic Anastasie Basota	9	\N	\N
36832	Scoala Gimnaziala Nr 1 Dobirceni	9	\N	\N
36833	Liceul Tehnologic Stefan Cel Mare Si Sfant Vorona	9	\N	\N
36834	Scoala Gimnaziala Nr.1 Santa Mare	9	\N	\N
36835	Scoala Gimnaziala Mihail Sadoveanu Dumbravita	9	\N	\N
36836	Gradinita Cu Program Prelungit Nr.6 Botoșani	9	\N	\N
36837	Scoala Gimnaziala Nr.1 Vaculesti	9	\N	\N
36838	Scoala Gimnaziala Nr.13 Botoșani	9	\N	\N
36839	Gradinita Cu Program Prelungit Stefan Cel Mare Si Sfant Dorohoi	9	\N	\N
36840	Scoala Gimnaziala Alexandru Ioan Cuza	9	\N	\N
36841	Gradinita Pp. Nr.22 Botoșani	9	\N	\N
36842	Scoala Gimnaziala Nr 1 Albesti	9	\N	\N
36843	Scoala Gimnaziala Nr.1 Mileanca	9	\N	\N
36844	Scoala Gimaziala Nr.1 Hudesti	9	\N	\N
36845	Scoala Gimnaziala Nr.1 Copalau	9	\N	\N
36846	Scoala Gimnaziala Ion Bojoi	9	\N	\N
36847	Scoala Gimnaziala Nr.1 Stiubieni	9	\N	\N
36848	Scoala Gimnaziala Nr. 11	9	\N	\N
36849	Scoala Gimnaziala Nr.1 Gorbanesti	9	\N	\N
36850	Scoala Gimnaziala Elena Rares	9	\N	\N
36851	Scoala Gimnaziala Ioan Murariu Cristinesti	9	\N	\N
36852	Liceul Tehnologic Cotusca	9	\N	\N
36853	Scoala Profesionala Sfantul Apostl Andrei Smirdan	9	\N	\N
36854	Colegiul National A.t.laurian Botoșani	9	\N	\N
36855	Scoala Gimnaziala Sfinta Maria Botoșani	9	\N	\N
36856	Scoala Gimnaziala Nr. 1 Adaseni	9	\N	\N
36857	Scoala Gimnaziala Nr.1 Concesti	9	\N	\N
36858	Seminarul Teologic Sf. Ioan Iacob Dorohoi	9	\N	\N
36859	Scoala Gimnaziala Nr.1 Stauceni	9	\N	\N
36860	Scoala Gimnaziala Nr 1 Rauseni	9	\N	\N
36861	Colegiul National Gr.ghica	9	\N	\N
36862	Scoala Gimnaziala Nr.1  Prajeni	9	\N	\N
36863	Liceul De Arta Stefan Luchian Botoșani	9	\N	\N
36864	Scoala Gimnaziala Nr.1  Radauti-prut	9	\N	\N
36865	Scoala Gimnaziala Nr. 1 Dorohoi	9	\N	\N
36866	Scoala Gimnaziala Dimitrie Romanescu Dorohoi	9	\N	\N
36867	Liceul Alexandru Cel Bun	9	\N	\N
36868	Liceul Tehnologic Petru Rares Botoșani	9	\N	\N
36869	Scoala Gimnaziala Nr.1  Roma	9	\N	\N
36870	Scoala Gimnaziala Stefan Cel Mare Botoșani	9	\N	\N
36871	Gradinita Cu Program Prelungit Sotron Botoșani	9	\N	\N
36872	Scoala Gimnaziala Nr.7	9	\N	\N
36873	Scoala Gimnaziala Nr.1 Vladeni Deal	9	\N	\N
36874	Liceul Tehnologic Special  Ion Pillat Dorohoi	9	\N	\N
36875	Liceul Tehnologic Bucecea	9	\N	\N
36876	Scoala Gimnaziala  Florica Murariu Mitoc	9	\N	\N
36877	Scoala Gimnaziala Nr. 1 Avrameni	9	\N	\N
36878	Scoala Gimnaziala Octav Bancila Corni	9	\N	\N
36879	Scoala Gimnaziala Mihail Kogalniceanu Dorohoi	9	\N	\N
36880	Scoala Gimnaziala Nicolae Calinescu Cosula	9	\N	\N
36881	Scoala Gimnaziala Nr 1 Sulita	9	\N	\N
36882	Scoala Gimnaziala Nr 1 Dimacheni	9	\N	\N
36883	Scoala Gimnaziala Ioan Cernat Havirna	9	\N	\N
36884	Scoala Gimnaziala Nr.1 Saveni	9	\N	\N
36885	Scoala Gimnaziala Gheorghe Coman Braesti	9	\N	\N
36886	Scoala Gimnaziala Nr.1o Botoșani	9	\N	\N
36887	Liceul Teoretic  Nicolae Iorga	9	\N	\N
36888	Scoala Gimnaziala Nr. 1 Blandesti	9	\N	\N
36889	Colegiul Economic Octav Onicescu Botoșani	9	\N	\N
36890	Scoala Profesionala Gheorghe Burac Vlasinesti	9	\N	\N
36891	Scoala Gimnaziala Dimitrie Brandza Viisoara	9	\N	\N
36892	Scoala Gimnaziala Nr1 Călărași	9	\N	\N
36893	Liceul Dimitrie Negreanu Botoșani	9	\N	\N
36894	Liceul Regina Maria Dorohoi	9	\N	\N
36895	Scoala Gimnaziala Nr.1 Oraseni Deal	9	\N	\N
36896	Scoala Gimnaziala Nr. 1 Cristesti	9	\N	\N
36897	Scoala Gimnaziala Nr.1 Mihalaseni	9	\N	\N
36898	Scoala Gimnaziala Nr.1  Dingeni	9	\N	\N
36899	Scoala Gimnaziala Nr.1 Manoleasa	9	\N	\N
36900	Colegiul National Mihai Eminescu Botoșani	9	\N	\N
36901	Scoala Gimnaziala Nr 1 Dumeni	9	\N	\N
36902	Scoala Gimnaziala Nr 1 Ungureni	9	\N	\N
36903	Scoala Gimnaziala Nr.1  Durnesti	9	\N	\N
36904	Scoala Gimnaziala Tiberiu Crudu Tudora	9	\N	\N
36905	Liceul Demostene Botez Trusesti	9	\N	\N
36906	Gradinita Pp. Nr. 19 Botoșani	9	\N	\N
36907	Scoala Gimnaziala Nr.1  Romanesti	9	\N	\N
36908	Scoala Gimnaziala Nr. 1 Rachiti	9	\N	\N
36909	Liceul Tehnologic Alexandru Vlahuta	9	\N	\N
36910	Scoala Gimnaziala Nr. 1 Ripiceni	9	\N	\N
36911	Gradinita Cu Program Prelungit Nr 36	11	\N	\N
36912	Colegiul Tehnic Edmond Nicolau	11	\N	\N
36913	Scoala Gimnaziala Frecatei	11	\N	\N
36914	Scoala Gimnaziala Chiscani	11	\N	\N
36915	Scoalaa Gimnaziala Romanu	11	\N	\N
36916	Scoala Gimnaziala Comuna Ramnicelu Judetul Brăila	11	\N	\N
36917	Scoala Gimnaziala Tichilesti	11	\N	\N
36918	Liceul Tehnologic Gheorghe K.constantinescu	11	\N	\N
36919	Gradinita Cu Program Prelungit Nr.7	11	\N	\N
36920	Gradinita Cu Program Prelungit Numarul 56	11	\N	\N
36921	Scoala Gimnaziala Bordei Verde	11	\N	\N
36922	Gradinita Cu Program Prelungit Nr. 37 Brăila	11	\N	\N
36923	Scoala Gimnaziala Cazasu	11	\N	\N
36924	Gradinita Cu Program Prelungit Nr 11	11	\N	\N
36925	Scoala Gimnaziala Racovita	11	\N	\N
36926	Colegiul National Ana Aslan	11	\N	\N
36927	Gradinita Cu Program Prelungit Nr 1 Brăila	11	\N	\N
36928	Scoala Gimnaziala Alexandru Vechiu Zavoaia	11	\N	\N
36929	Scoala Gimnaziala Ion Creanga Brăila	11	\N	\N
36930	Scoala  Gimnaziala  Baraganul	11	\N	\N
36931	Colegiul Tehnic Panait Istrati	11	\N	\N
36932	Scoala Gimnaziala Vlaicu Voda Brăila	11	\N	\N
36933	Scoala Gimnaziala Nedelcu Chercea	11	\N	\N
36934	Scoala Gimnaziala Dudesti	11	\N	\N
36935	Liceul Tehnologic Insuratei	11	\N	\N
36936	Scoala Gimnaziala	11	\N	\N
36937	Scoala Gimnaziala Mihail Kogalniceanu Brăila	11	\N	\N
36938	Scoala Gimnaziala Ciocile	11	\N	\N
36939	Scoala Gimnaziala Mihu Dragomir	11	\N	\N
36940	Liceul Tehnologic Nicolae Oncescu	11	\N	\N
36941	Scoala Gimnaziala Mihai Eminescu	11	\N	\N
36942	Scoala Gimnaziala Gropeni	11	\N	\N
36943	Scoala Gimnaziala Radu Tu Doran Brăila	11	\N	\N
36944	Scoala Gimnaziala Plopu	11	\N	\N
36945	Gradinita Cu Program Normal Ion Creanga	11	\N	\N
36946	Scoala Gimnaziala Lanurile	11	\N	\N
36947	Liceul Teoretic George Valsan Fau Rei	11	\N	\N
36948	Gradinita Cu Program Saptamanal Nr. 49 Brăila	11	\N	\N
36949	Scoala Populara De Arte Si Meserii Vespasian Lungu	11	\N	\N
36950	Scoala Gimnaziala Anton Pann	11	\N	\N
36951	Scoala Gimnaziala  Dimitrie Cantemir	11	\N	\N
36952	Scoala Gimnaziala Ecaterina Teodoroiu	11	\N	\N
36953	Liceul Teoretic Constantin Angelescu	11	\N	\N
36954	Scoala Gimnaziala Movila Miresii	11	\N	\N
36955	Scoala De Arte Si Meserii Bertestii De Jos	11	\N	\N
36956	Liceul Teoretic Panait Cerna	11	\N	\N
36957	Scoala Gimnaziala George Cosbuc Brăila	11	\N	\N
36958	Scoala Gimnaziala Salcia Tudor	11	\N	\N
36959	Scoala Gimnaziala Toma Tampeanu Galbenu	11	\N	\N
36960	Liceul Teoretic Mihail Sebastian	11	\N	\N
36961	Scoala Gimnaziala Victoria	11	\N	\N
36962	Liceul Tehnologic Grigore Moisil	11	\N	\N
36963	Scoala Gimnaziala Petre Carp Tufesti	11	\N	\N
36964	Gradinita Cu Program Prelungit Nr.48	11	\N	\N
36965	Gradinita Cu Program Prelungit Nr.39 Brăila	11	\N	\N
36966	Gradinita Cu Program Prelungit Nr.3o Brăila	11	\N	\N
36967	Colegiul National Gheorghe Munteanu Murgoci	11	\N	\N
36968	Liceul Tehnologic Constantin Bancoveanu	11	\N	\N
36969	Scoala Gimnaziala Gemenele	11	\N	\N
36970	Scoala Gimnaziala Vadeni	11	\N	\N
36971	Scoala Gimnaziala  Mihai Viteazul	11	\N	\N
36972	Gradinita Cu Program Prelungit Nr. 8 Brăila	11	\N	\N
36973	Scoala Gimnaziala Stancuta	11	\N	\N
36974	Liceul Pedagogic  D.p.perpessicius	11	\N	\N
36975	Scoala Gimnaziala Speciala Tichilesti	11	\N	\N
36976	Scoala Gimnaziala Al.i.cuza	11	\N	\N
36977	Scoala Gimnaziala Nikos Kazantzakis	11	\N	\N
36978	Scoala  Gimnaziala Rosiori	11	\N	\N
36979	Scoala Gimnaziala Vasile Alecsandri Brăila	11	\N	\N
36980	Liceul De Arte Hariclea Darclee	11	\N	\N
36981	Gradinita  Cu Program Prelungit Nr.6 Brăila	11	\N	\N
36982	Scoala Gimnaziala Sutesti	11	\N	\N
36983	Scoala Gimnaziala  Alexandr Sergheevici Puskin Brăila	11	\N	\N
36984	Scoala Gimnaziala Fanus Neagu	11	\N	\N
36985	Scoala Gimnaziala Comuna Visani	11	\N	\N
36986	Scoala Gimnaziala Aurel Hornet	11	\N	\N
36987	Scoala Gimnaziala Aurel Vlaicu	11	\N	\N
36988	Scoala Gimnaziala Emil Dragan	11	\N	\N
36989	Scoala Gimnaziala Marasu	11	\N	\N
36990	Liceul Tehnologic Silvic Dr. Nicolae Rucareanu	10	\N	\N
36991	Academia Forțelor Aeriene Henri Coandă	10	\N	\N
36992	Universitatea George Barițiu	10	\N	\N
36993	Universitatea Populară Sextil Pușcariu	10	\N	\N
36994	Gradinita Cu Program Prelungit Nr.9 Brașov	10	\N	\N
36995	Liceul Tehnologic Victor Jinga	10	\N	\N
36996	Scoala Profesionala Speciala Codlea	10	\N	\N
36997	Liceul Petru Rares	10	\N	\N
36998	Scoala Gimnaziala Mandra	10	\N	\N
36999	Liceul Sextil Puscariu Bran	10	\N	\N
37000	Gradinita Cu Program Normal Rupea	10	\N	\N
37001	Scoala Gimnaziala Tarlungeni	10	\N	\N
37002	Gradinita Cu Program Prelungit Nr. 2 Rasnov	10	\N	\N
37003	Scoala Gimnaziala Nr 3 Gheorghe Lazar Brașov	10	\N	\N
37004	Scoala Profesionala Germana Kronstadt	10	\N	\N
37005	Gradinita Cu Program Prelungit Nr.7 Brașov	10	\N	\N
37006	Scoala Gimnaziala Bethlen Samuel Racos	10	\N	\N
37007	Scoala Populara De Arte Si Meserii-tiberiu Brediceanu	10	\N	\N
37008	Gradinita Cu Program Prelungit Dintisori De Lapte Nr 23 Brașov	10	\N	\N
37009	Scoala Gimnaziala Nr. 6 Iacob Mureșianu Brașov	10	\N	\N
37010	Colegiul Tehnic Maria Baiulescu Brașov	10	\N	\N
37011	Scoala Gimnaziala Ghimbav	10	\N	\N
37012	Scoala Gimnaziala Nr 2 Zarn Esti	10	\N	\N
37013	Gradinita Cu Program Prelungit Prichindeii	10	\N	\N
37014	Gradinita Cu Program Prelungit Boboceii Nr.19	10	\N	\N
37015	Scoala Gimnaziala Nr. 3 Rasnov	10	\N	\N
37016	Liceul Teoretic Zajzoni Rab Istvan Sacele	10	\N	\N
37017	Gradinita Cu Program Saptamanal Pinochio Fagaras	10	\N	\N
37018	Colegiul National Andrei Saguna Brașov	10	\N	\N
37019	Scoala   Gimnaziala  Cata	10	\N	\N
37020	Scoala Gimnaziala Nr. 5 Sacele	10	\N	\N
37021	Scoala Gimnaziala Fundata	10	\N	\N
37022	Colegiul Pentru Agricultura Si Industrie Alimentara Tara Barsei Prejmer	10	\N	\N
37023	Gradinita Cu Program Prelungit Nr. 33 Brașov	10	\N	\N
37024	Scoala Gimnaziala Vu Lcan	10	\N	\N
37025	Scoala Gimnaziala Budila	10	\N	\N
37026	Gradinita Cu Program Prelungit Nr.1 Codlea	10	\N	\N
37027	Scoala Gimnaziala Bod	10	\N	\N
37028	Scoala Gimnaziala Augustin	10	\N	\N
37029	Colegiul Tehnic De Transporturi Brașov	10	\N	\N
37030	Scoala Gimnaziala Nr.2 Codlea	10	\N	\N
37031	Liceul Andrei Mureșanu Brașov	10	\N	\N
37032	Scoala Gimnaziala Ticusu Vechi	10	\N	\N
37033	Gradinita Cu Program Prelungit Nr. 15	10	\N	\N
37034	Scoala Gimnaziala Nr.1  Poiana Marului	10	\N	\N
37035	Scoala Gimnaziala Nr.1  Brașov	10	\N	\N
37036	Scoala Gimnaziala Ovid Densusianu	10	\N	\N
37037	Scoala Gimnaziala Harman	10	\N	\N
37038	Scoala Gimnaziala Peter Thal Rasnov	10	\N	\N
37039	Liceul Teologic Ortodox Sfantul Constantin Brancoveanu Fagaras	10	\N	\N
37040	Gradinita Cu Program Normal Albinuta Nr 1	10	\N	\N
37041	Scoala Gimnaziala Homorod	10	\N	\N
37042	Gradinita Cu Program Prelungit Nr.8	10	\N	\N
37043	Colegiul Tehnic Transilvania Brașov	10	\N	\N
37044	Colegiul Tehnic Energetic Remus Radulet Brașov	10	\N	\N
37045	Gradinita Cu Program Prelungit Nr.29	10	\N	\N
37046	Gradinita Cu Program Prelungit Nr.14	10	\N	\N
37047	Scoala Gimnaziala Aron Pumnul Cuciulata	10	\N	\N
37048	Scoala Gimnaziala Nr.1 Sacele	10	\N	\N
37049	Scoala Gimnaziala Nr.11 Stefan Octavian Iosif Brașov	10	\N	\N
37050	Gradinita Cu Program Normal Dumbravita	10	\N	\N
37051	Scoala Gimnaziala Cincu	10	\N	\N
37052	Gradinita Cu Program Prelungit Dumbrava Minunata Nr. 18	10	\N	\N
37053	Colegiul Tehnic Simion Mehedinți Codlea	10	\N	\N
37054	Scoala Gimnaziala Vistea De Jos	10	\N	\N
37055	Gradinita Cu Program Prelungit Nr. 21 Brașov	10	\N	\N
37056	Gradinita Cu Program Prelungit Nr. 28	10	\N	\N
37057	Scoala Gimnaziala Parau	10	\N	\N
37058	Colegiul Aurel Vijoli Fagaras	10	\N	\N
37059	Scoala Gimnaziala Recea	10	\N	\N
37060	Universitatea Transilvania Brașov	10	\N	\N
37061	Gradinita Cu Program Prelungit Nr.24	10	\N	\N
37062	Liceul Teoretic Ioan Pascu Codlea	10	\N	\N
37063	Scoala Gimnaziala Nr. 14 Brașov	10	\N	\N
37064	Liceul Teoretic Johannes Honterus  Brașov	10	\N	\N
37065	Scoala Gimnaziala Halchiu	10	\N	\N
37066	Gradinita Cu Program Prelungit Martinica Nr.17 Brașov	10	\N	\N
37067	Liceul Vocational De Muzica Tu Dor Ciortea Brașov	10	\N	\N
37068	Scoala Gimnaziala Nr. 5 Brașov	10	\N	\N
37069	Gradinita Cu Program Prelungit Halchiu	10	\N	\N
37070	Scoala Gimnaziala Prof.dr.ioan Cerghit	10	\N	\N
37071	Gradinita Cu Program Normal Nr 4	10	\N	\N
37072	Gradinita Cu Program Prelungit Nr. 12	10	\N	\N
37073	Scoala Gimnaziala Vama Buzăului	10	\N	\N
37074	Colegiul De Stiinte Grigore Antipa Brașov	10	\N	\N
37075	Liceul Teoretic George Moroianu Sacele	10	\N	\N
37076	Colegiul De Stiinte Ale Naturii Emil Racovita Brașov	10	\N	\N
37077	Gradinita Cu Program Prelungitjunior Nr 26 Brașov	10	\N	\N
37078	Gradinita Cu Program Prelungit Nr.34 Brașov	10	\N	\N
37079	Gradinita Cu Program Normal Nr 1 Rasnov	10	\N	\N
37080	Scoala Gimnaziala Gheorghe Sincai	10	\N	\N
37081	Colegiul National Unirea Brașov	10	\N	\N
37082	Scoala Gimnaziala Drauseni	10	\N	\N
37083	Scoala  Primara Beclean	10	\N	\N
37084	Gradinita Cu Program Normal Nr.2 Codlea	10	\N	\N
37085	Liceul Cu Program Sportiv Brașov	10	\N	\N
37086	Scoala Gimnaziala Ormenis	10	\N	\N
37087	Scoala Gimnaziala Apaczai Csere Janos-apata	10	\N	\N
37088	Scoala Gimnaziala Nr. 3 Codlea	10	\N	\N
37089	Scoala Gimnaziala Maierus	10	\N	\N
37090	Colegiul Tehnic Mircea Cristea  Brașov	10	\N	\N
37091	Gradinita Cu Program Prelungit Nr. 13 Brașov	10	\N	\N
37092	Scoala Gimnaziala Bunesti	10	\N	\N
37093	Scoala Gimnaziala Sinca Noua	10	\N	\N
37094	Gradinita Cu Program Prelungit Bobocel Nr 4	10	\N	\N
37095	Scoala Gimnaziala Nr 3 Pompiliu Dan	10	\N	\N
37096	Gradinita Cu Program Prelungit Micul Print Nr.22 Brașov	10	\N	\N
37097	Scoala Gimnaziala Nr.27 Anatol Ghermanschi Brașov	10	\N	\N
37098	Scoala Gimnaziala Nr. 15 Brașov	10	\N	\N
37099	Gradinita Cu Program Prelungit Lumea Copiilor Nr 25 Brașov	10	\N	\N
37100	Gradinita Cu Program Prelungit Casuta Bucuriei Nr. 11	10	\N	\N
37101	Gradinita Cu Program Normal 1 Predeal	10	\N	\N
37102	Scoala Gimnaziala Moieciu De Jos	10	\N	\N
37103	Scoala Gimnaziala Cristian	10	\N	\N
37104	Scoala Gimnaziala Jibert	10	\N	\N
37105	Scoala Gimnaziala Nr.19 Brașov	10	\N	\N
37106	Scoala Gimnaziala Ungra	10	\N	\N
37107	Colegiul Tehnic Dr.alexan Dru Barbat	10	\N	\N
37108	Gradinita Cu Program Prelungit Nr.31	10	\N	\N
37109	Colegiul National De Informatica Grigore Moisil Brașov	10	\N	\N
37110	Liceul Teoretic  I.c. Dragusanu Victoria	10	\N	\N
37111	Gradinita Cu Program Prelungit Nr. 4	10	\N	\N
37112	Gradinita Cu Program Prelungit Primii Pasi Nr.1o Brașov	10	\N	\N
37113	Colegiul National Aprily Lajos Brașov	10	\N	\N
37114	Gradinita Cu Program Prelungit Albinuta Fagaras	10	\N	\N
37115	Scoala Gimnaziala Ion I C Bratianu	2	\N	\N
37116	Institutul de Administrare al Afacerilor	2	\N	\N
37117	Institutul Teologic Baptist	2	\N	\N
37118	Școala Normală Superioară	2	\N	\N
37119	Universitatea Artifex	2	\N	\N
37120	Universitatea Athenaeum	2	\N	\N
37121	Universitatea Bioterra	2	\N	\N
37122	Universitatea Creștină Dimitrie Cantemir	2	\N	\N
37123	Universitatea Europei de Sud-Est Lumina	2	\N	\N
37124	Universitatea Hyperion	2	\N	\N
37125	Universitatea Nicolae Titulescu	2	\N	\N
37126	Universitatea Spiru Haret	2	\N	\N
37127	Universitatea Titu Maiorescu	2	\N	\N
37128	Universitatea de Științe și Arte Gheorghe Cristea	2	\N	\N
37129	Academia Națională de Informații Mihai Viteazul	2	\N	\N
37130	Academia de Poliție Alexandru Ioan Cuza	2	\N	\N
37131	Academia Tehnică Militară	2	\N	\N
37132	Universitatea Națională de Apărare Carol I	2	\N	\N
37133	Universitatea de Științe Agronomice și Medicină Veterinară	2	\N	\N
37134	Colegiul National Matei Basarab	2	\N	\N
37135	Gradinita Steaua	2	\N	\N
37136	Academia Oamenilor De Stiinta Din Romania	2	\N	\N
37137	Scoala Gimnaziala Nr.280	2	\N	\N
37138	Colegiul Tehnologic Grigore Cerch Ez	2	\N	\N
37139	Asociatia Scoala Europeana București	2	\N	\N
37140	Scoala Gimnaziala Nr. 144	2	\N	\N
37141	Colegiul National I.l.caragiale	2	\N	\N
37142	Gradinita Nr. 62	2	\N	\N
37143	Gradinita 101 Dalmatieni	2	\N	\N
37144	Scoala Gimnaziala Regele Mihai I	2	\N	\N
37145	Colegiul Tehnic De Aeronautica Henri Coanda	2	\N	\N
37146	Colegiul National Octav Onicescu	2	\N	\N
37147	Liceul Teoretic Constantin Brancoveanu	2	\N	\N
37148	Gradinita Nr.71	2	\N	\N
37149	Scoala Gimnaziala Nr. 162 București	2	\N	\N
37150	Gradinita Martisor	2	\N	\N
37151	Scoala Gimnaziala Nr.108	2	\N	\N
37152	Liceul Teoretic Hyperion Din București	2	\N	\N
37153	Academia De Stiinte Agricole Si Silvice	2	\N	\N
37154	Gradinita Colt De Rai	2	\N	\N
37155	Liceul Tehnologic Sf.antim  Ivireanu	2	\N	\N
37156	Academia De Studii Economice Din București	2	\N	\N
37157	Gradinita Nrj 33	2	\N	\N
37158	Academia De Stiinte Ale Securitatii Nationale	2	\N	\N
37159	Scoala Gimnaziala Mircea Santimbreanu	2	\N	\N
37160	Scoala Gimnaziala Nr.181	2	\N	\N
37161	Colegiul  Economic Virgil  Madgearu	2	\N	\N
37162	Gradinita Nr.229	2	\N	\N
37163	Scoala Gimnaziala Nr. 163	2	\N	\N
37164	Institutul Teologic Penticostal Din Municipiul București	2	\N	\N
37165	Liceul Tehnologic Mircea Vulcanescu	2	\N	\N
37166	Scoala Gimnaziala  Ionel Teodoreanu	2	\N	\N
37167	Scoala Gimnaziala Sfantul Silvestru	2	\N	\N
37168	Liceul Tehnologic Sfantul Pantelimon	2	\N	\N
37169	Scoala Gimnaziala Metropolitana Arc	2	\N	\N
37170	Gradinita Spiridusii	2	\N	\N
37171	Liceul Teoretic T. Vladimirescu	2	\N	\N
37172	Colegiul Tehnic Mircea Cel Batran	2	\N	\N
37173	Scoala Gimnaziala Ferdinand I	2	\N	\N
37174	Scoala Gimnaziala Sfantul Andrei	2	\N	\N
37175	Scoala Postliceala Sanitarasfantul Ioan	2	\N	\N
37176	Scoala Gimnaziala Speciala Pentru Surzi Nrj	2	\N	\N
37177	Academia De Stiinte Tehnice Din Romania	2	\N	\N
37178	Scoala Gimnaziala Speciala Nr. 4	2	\N	\N
37179	Scoala Gimnaziala Nr. 99	2	\N	\N
37180	Colegiul Tehnic De Industrie Alimentara Dumitru Motoc	2	\N	\N
37181	Scoala Gimnaziala Speciala Nr.9	2	\N	\N
37182	Colegiul Ucecom Spiru Haret	2	\N	\N
37183	Gradinita Nrj 16	2	\N	\N
37184	Scoala Gimnaziala Nr.198	2	\N	\N
37185	Gradinita Nr.50	2	\N	\N
37186	Gradinita Nr 178	2	\N	\N
37187	Colegiul Economic Hermes	2	\N	\N
37188	Gradinita Nr.97	2	\N	\N
37189	Scoala Gimnaziala Ienachita Vacarescu	2	\N	\N
37190	Scoala Gimnaziala Nr.112	2	\N	\N
37191	Universitatea Nationala De Arte Din București	2	\N	\N
37192	Universitatea din București	2	\N	\N
37193	Scoala Gimnaziala Nr.5	2	\N	\N
37194	Liceul Teoretic Ion  Barbu	2	\N	\N
37195	Liceul Tehnologic Elie Radu	2	\N	\N
37196	Gradinita Nr. 248	2	\N	\N
37197	Scoala Gimnaziala Nr.145	2	\N	\N
37198	Gradinita Paradisul Piticilor	2	\N	\N
37199	Colegiul Tehnic Mecanic Grivita	2	\N	\N
37200	Scoala Gimnaziala De Arte Nr. 4	2	\N	\N
37201	Gradinita Nr. 43	2	\N	\N
37202	Scoala Gimnaziala Nr. 84	2	\N	\N
37203	Scoala Gimnaziala Alexandru Costescu	2	\N	\N
37204	Universitatea Politehnica Din București	2	\N	\N
37205	Gradinita Panseluta	2	\N	\N
37206	Scoala Gimnaziala Maria Rosetfi	2	\N	\N
37207	Colegiul Tehnic Costin D. Nenitescu	2	\N	\N
37208	Scoala Gimnaziala Speciala Constatin Paunescu	2	\N	\N
37209	Colegiul National Mihai Eminescu	2	\N	\N
37210	Scoala Gimnaziala Uruguay	2	\N	\N
37211	Liceul Teoretic Bilingv Ita Wegman	2	\N	\N
37212	Gradinita Nr 24	2	\N	\N
37213	Gradinita Luminita	2	\N	\N
37214	Scoala Gimnaziala Nr.311	2	\N	\N
37215	Colegiul National Spiru Haret	2	\N	\N
37216	Scoala Gimnaziala Nr.115	2	\N	\N
37217	Gradinita Nr.276	2	\N	\N
37218	Scoala Gimnaziala Geo Bogza	2	\N	\N
37219	Scoala Gimnaziala Nr 169	2	\N	\N
37220	Scoala Gimnaziala Nr 136	2	\N	\N
37221	Universitatea Româno-Americană	2	\N	\N
37222	Scoala Gimnaziala Nr.81	2	\N	\N
37223	Scoala Gimnaziala Nr.103	2	\N	\N
37224	Scoala Gimnaziala Nr.46	2	\N	\N
37225	Liceul Teoretic Nichita Stanescu	2	\N	\N
37226	Scoala Gimnaziala Nr.31	2	\N	\N
37227	Scoala Gimnaziala Speciala Nr 5	2	\N	\N
37228	Scoala Gimnaziala Nr. 41	2	\N	\N
37229	Scoala Gimnazial Nr. 71	2	\N	\N
37230	Gradinita Nr.242	2	\N	\N
37231	Scoala Centrala	2	\N	\N
37232	Liceul Teoretic Alexandru Ioan Cuza	2	\N	\N
37233	Universitatea Ecologica Din București	2	\N	\N
37234	Gradinita Nr.231	2	\N	\N
37235	Colegiul Tehnic Gh. Asachi	2	\N	\N
37236	Gradinita Nr.41	2	\N	\N
37237	Scoala Gimnaziala Nr.129	2	\N	\N
37238	Gradinita Nrj 38	2	\N	\N
37239	Universitatea Nationala De Arta Teatrala Si Cinematografica Ion Luca Caragiale	2	\N	\N
37240	Scoala Gimnaziala Nr.8o	2	\N	\N
37241	Gradinita Nr 54	2	\N	\N
37242	Gradinita Nr.208	2	\N	\N
37243	Gradinita Floare Albastra	2	\N	\N
37244	Scoala Gimnaziala Nr. 24	2	\N	\N
37245	Scoala Gimnaziala De Arte Nr.3	2	\N	\N
37246	Scoala Gimnaziala Nr.117	2	\N	\N
37247	Gradinita Nr.206	2	\N	\N
37248	Gradinita Planeta Copiilor	2	\N	\N
37249	Scoala Gimnaziala Nr. 131	2	\N	\N
37250	Colegiul National De Arte Dinu Lipatti	2	\N	\N
37251	Scoala Gimnaziala Nr. 184	2	\N	\N
37252	Scoala Gimnaziala Grigore Tocilescu	2	\N	\N
37253	Scoala Profesionala Speciala Nr.2	2	\N	\N
37254	Scoala Nationala De Studii Politice Si Administrative	2	\N	\N
37255	Scoala Gimnaziala Nr.85	2	\N	\N
37256	Scoala Gimnaziala Nr. 49	2	\N	\N
37257	Scoala Postliceala Sanitara Fundeni	2	\N	\N
37258	Gradinita Nr.274	2	\N	\N
37259	Gradinita Nr.44	2	\N	\N
37260	Liceul Teoretic Sfintii Trei Ierarhi	2	\N	\N
37261	Scoala Gimnaziala Nr.25	2	\N	\N
37262	Gradinita Prichindel	2	\N	\N
37263	Liceul Tehnologic Special Regina Elisabeta	2	\N	\N
37264	Scoala Gimnaziala De Arte Iosif Sava	2	\N	\N
37265	Liceul Teoretic D. Bolintineanu	2	\N	\N
37266	Gradinita Nr. 246	2	\N	\N
37267	Gradinita Nr.185	2	\N	\N
37268	Gradinita Nr.72	2	\N	\N
37269	Liceul Tehnologic De Metrologie Traian Vuia	2	\N	\N
37270	Scoala Gimnaziala Nr.119	2	\N	\N
37271	Scoala Gimnaziala Nr 188	2	\N	\N
37272	Gradinita Nr. 149	2	\N	\N
37273	Colegiul National Bilingv George Cosbuc	2	\N	\N
37274	Liceul Tehnologic Constantin Brancusi	2	\N	\N
37275	Scoala Superioara Comerciala Nicolae Kretzulescu	2	\N	\N
37276	Gradinita Nr.111	2	\N	\N
37277	Gradinita Ciupecuta	2	\N	\N
37278	Gradinita Nr.211	2	\N	\N
37279	Scoala Gimnaziala Nr.164	2	\N	\N
37280	Scoala Gimnaziala Nr.308	2	\N	\N
37281	Gradinita Nr.4o	2	\N	\N
37282	Liceul Teoretic M.sadovean U	2	\N	\N
37283	Liceul Tehnologic Dragomir Hurmuzescu	2	\N	\N
37284	Scoala Gimnaziala Nr.153	2	\N	\N
37285	Scoala Gimnaziala Nr 125	2	\N	\N
37286	Scoala Gimnaziala Emil Racovita	2	\N	\N
37287	Scoala Gimnaziala Pia Bratianu	2	\N	\N
37288	Gradinita Scufita Rosie	2	\N	\N
37289	Scoala Gimnaziala Nr. 161	2	\N	\N
37290	Scoala Gimnaziala Alexandru Ioan Cuza	2	\N	\N
37291	Scoala Gimnaziala Sfantul Nicolae	2	\N	\N
37292	Scoala Gimnaziala Nr. 51	2	\N	\N
37293	Scoala Gimnaziala Nr. 200	2	\N	\N
37294	Gradinita Nr.191	2	\N	\N
37295	Liceul Tehnologic Dacia	2	\N	\N
37296	Gradinita Nr. 35	2	\N	\N
37297	Gradinitanr. 280	2	\N	\N
37298	Gradinita Nr 30	2	\N	\N
37299	Colegiul National De Muzica George Enescu	2	\N	\N
37300	Colegiul National Cantemir Voda	2	\N	\N
37301	Gradinita Alba Ca Zapada Si Piticii	2	\N	\N
37302	Scoala Gimnaziala Herastrau	2	\N	\N
37303	Liceul Dimitrie Paciurea	2	\N	\N
37304	Gradinita Licurici	2	\N	\N
37305	Gradinita Nr 245	2	\N	\N
37306	Liceul Teologic Adventist Stefan Demetrescu	2	\N	\N
37307	Scoala Gimnaziala Martisor	2	\N	\N
37308	Gradinita Nr. 230	2	\N	\N
37309	Scoala Gimnaziala Nr 116	2	\N	\N
37310	Liceul De Arte Plastice Nicolae Tonitza	2	\N	\N
37311	Colegiul Tehnic Mihai  Bravu	2	\N	\N
37312	Scoala Gimnaziala Speciala Nr.8	2	\N	\N
37313	Scoala Gimnaziala Maica Domnului	2	\N	\N
37314	Scoala Gimnaziala Nr. 4	2	\N	\N
37315	Scoala Gimnaziala Nr.193	2	\N	\N
37316	Liceul Tehnologic Special Nr. 3	2	\N	\N
37317	Scoala Gimnaziala I.g. Duca	2	\N	\N
37318	Scoala Gimnaziala Cezar Bolliac	2	\N	\N
37319	Scoala Gimnaziala Nr. 62	2	\N	\N
37320	Scoala Gimnaziala Nr. 78	2	\N	\N
37321	Liceul Tehnologic Ion  I.c. Bratianu	2	\N	\N
37322	Colegiul Tehnic Energetic	2	\N	\N
37323	Gradinita Nr. 239	2	\N	\N
37324	Scoala Gimnaziala De Arte Nr. 2	2	\N	\N
37325	Gradinita Nr.21o	2	\N	\N
37326	Scoala Gimnaziala Nr. 194	2	\N	\N
37327	Scoala Gimnaziala Nr. 97	2	\N	\N
37328	Colegiul National Iulia Hasdeu	2	\N	\N
37329	Universitatea Nationala De Educatie Fizica Si Sport	2	\N	\N
37330	Gradinita M.ap.n.nr.1	2	\N	\N
37331	Scoala Gimnaziala Speciala Nr. 2	2	\N	\N
37332	Colegiul National Mihai Viteazul	2	\N	\N
37333	Scoala Gimnaziala Luceafarul	2	\N	\N
37334	Gradinita  Nr.34	2	\N	\N
37335	Academia De Stiinte Medicale	2	\N	\N
37336	Gradinita Nr 135	2	\N	\N
37337	Colegiul Tehnic Anghel Saligny	2	\N	\N
37338	Gradinita Nr.7o	2	\N	\N
37339	Gradinita Dumbrava Minunilor	2	\N	\N
37340	Seminarul Teologic Ortodox București	2	\N	\N
37341	Scoala Gimnaziala Nr. 66	2	\N	\N
37342	Universitatea De Medicina Si Farmacie Carol Davila București	2	\N	\N
37343	Liceul Teoretic Waldorf	2	\N	\N
37344	Gradinita Nr.283	2	\N	\N
37345	Liceul Teoretic Dante Alighieri	2	\N	\N
37346	Universitatea Nationala De Muzica București	2	\N	\N
37347	Colegiul Economic A. D. Xenopol	2	\N	\N
37348	Scoala Gimnaziala Nr.13	2	\N	\N
37349	Liceul Teoretic Benjamin Franklin	2	\N	\N
37350	Gradinita Paradisul Verde	2	\N	\N
37351	Colegiul Tehnic Miron Nicolescu	2	\N	\N
37352	Scoala Gimnaziala Nr. 7	2	\N	\N
37353	Scoala Gimnaziala Nr. 40	2	\N	\N
37354	Scoala Gimnaziala Nr. 183	2	\N	\N
37355	Gradinita Nr.69	2	\N	\N
37356	Colegiul Tehnic  Edmond Nicolau	2	\N	\N
37357	Colegiul National Ion Neculce	2	\N	\N
37358	Scoala Gimnaziala Nicolae Labis	2	\N	\N
37359	Scoala Gimnaziala Nr.56	2	\N	\N
37360	Gradinita Nr 73	2	\N	\N
37361	Liceul Teoretic Marin Preda	2	\N	\N
37362	Scoala Gimnaziala Ion Heliade Radulescu	2	\N	\N
37363	Scoala Gimnaziala Eugen Barbu	2	\N	\N
37364	Scoala Gimnaziala George Bacovia	2	\N	\N
37365	Gradinita Insir Te Margarite	2	\N	\N
37366	Scoala Gimnaziala Nr. 142	2	\N	\N
37367	Scoala Gimnaziala Nr 86	2	\N	\N
37368	Liceul De Coregrafie Floria Capsali	2	\N	\N
37369	Gradinita Hillary Clinton	2	\N	\N
37370	Scoala Gimnaziala Liviu Rebreanu Fosta 21	2	\N	\N
37371	Gradinita Nr.52	2	\N	\N
37372	Colegiul National Aurel Vlaicu	2	\N	\N
37373	Gradinita Nr.154	2	\N	\N
37374	Liceul Cu Program Sportiv Mircea Eliade	2	\N	\N
37375	Gradinita Piticot	2	\N	\N
37376	Scoala Gimnaziala Nr. 192	2	\N	\N
37377	Liceul Toretic George Calinescu	2	\N	\N
37378	Scoala Nationala De Grefieri	2	\N	\N
37379	Scoala Gimnaziala Petrache Poenaru	2	\N	\N
37380	Scoala Gimnaziala Nr. 39	2	\N	\N
37381	Scoala Gimnaziala Nicolae Grigorescu	2	\N	\N
37382	Colegiul Tehnic Media	2	\N	\N
37383	Scoala Gimnaziala Nr 59	2	\N	\N
37384	Colegiul Tehnic De Arhitectura Si Lucrari Publice I.n. Socolescu	2	\N	\N
37385	Universitatea Romano-americana	2	\N	\N
37386	Gradinita Floarea Soarelui	2	\N	\N
37387	Gradinita Nr.47	2	\N	\N
37388	Scoala Gimnaziala Nr. 195	2	\N	\N
37389	Gradinita Nr. 42	2	\N	\N
37390	Colegiul Tehnic Iuliu Maniu	2	\N	\N
37391	Gradinita Nr.225	2	\N	\N
37392	Liceul Teoretic Decebal	2	\N	\N
37393	Scoala Gimnaziala De Arte Nr.5	2	\N	\N
37394	Scoala Gimnaziala Nr.88	2	\N	\N
37395	Colegiul National Elena Cuza	2	\N	\N
37396	Gradinita Nr 273	2	\N	\N
37397	Scoala Gimnaziala Speciala Nr. 10	2	\N	\N
37398	Gradinita Nr.168	2	\N	\N
37399	Universitatea Tehnica De Constructii București	2	\N	\N
37400	Scoala Gimnaziala Vasile Alecsandri	2	\N	\N
37401	Gradinita Casuta Fermecata	2	\N	\N
37402	Gradinita Nr.205	2	\N	\N
37403	Scoala Gimnaziala Speciala Nr.3	2	\N	\N
37404	Scoala Gimnaziala Constantin Brancusi	2	\N	\N
37405	Scoala Gimnaziala 189	2	\N	\N
37406	Gradinita Nr.216	2	\N	\N
37407	Scoala Superioara De Aviatie Civila	2	\N	\N
37408	Scoala Gimnaziala Speciala Nr.7	2	\N	\N
37409	Scoala Gimnaziala Nr 82	2	\N	\N
37410	Universitatea De Arhitectura Si Urbanism Ion Mincu	2	\N	\N
37411	Liceul Teoretic Nicolae Iorga	2	\N	\N
37412	Gradinita Nr.7	2	\N	\N
37413	Scoala Gimnaziala Speciala  Pentru Deficienti De Auz Sfanta Maria	2	\N	\N
37414	Gradinita Nr.222	2	\N	\N
37415	Gradinita Brandusa	2	\N	\N
37416	Liceul Greco Catolic Timotei Cipariu	2	\N	\N
37417	Scoala Gimnaziala Nr. 6	2	\N	\N
37418	Scoala Gimnaziala Nicolae Titulescu	2	\N	\N
37419	Scoala Gimnaziala Nr. 92	2	\N	\N
37420	Scoala Gimnaziala Nr.28	2	\N	\N
37421	Colegiul Tehnic Dinicu Golescu	2	\N	\N
37422	Gradinita Nr. 137	2	\N	\N
37423	Gradinita Zana Florilor	2	\N	\N
37424	Liceul Teoretic Ady Endre	2	\N	\N
37425	Liceul Tehnologic Petru  Poni	2	\N	\N
37426	Scoala Nationala De Sanatate Publica Management Si Perfectionare In Domeniul Sanitar Buc	2	\N	\N
37427	Gradinita Nr. 68	2	\N	\N
37428	Colegiul National De Informatica Tudor Vianu	2	\N	\N
37429	Scoala Profesionala Speciala Numarul 3	2	\N	\N
37430	Scoala Gimnaziala Iancului	2	\N	\N
37431	Scoala Gimnaziala Sfintii Voievozi	2	\N	\N
37432	Gradinita Speciala Pentru Hipoacuzici  Nr.65	2	\N	\N
37433	Gradinita Nr 272	2	\N	\N
37434	Gradinita Strop De Roua	2	\N	\N
37435	Scoala Gimnaziala Sfanta Treime	2	\N	\N
37436	Scoala Gimnaziala Mexic	2	\N	\N
37437	Scoala Gimnaziala Nr 167	2	\N	\N
37438	Scoala Militara De Maistri Militari Si Subofiteri A Fortelor Aeriene Traian Vuia  U.m.01940	12	\N	\N
37439	Scoala Gimnaziala Nr 2	12	\N	\N
37440	Scoala Gimnaziala Valea Ramnicului	12	\N	\N
37441	Scoala Gimnaziala Pamfil Georgian Gura Teghii	12	\N	\N
37442	Scoala Gimnaziala Cochirleanca	12	\N	\N
37443	Scoala Gimnaziala Mihailesti	12	\N	\N
37444	Gradinita Cu Program Prelungit Nr.8	12	\N	\N
37445	Scoala Gimnaziala Costomiru	12	\N	\N
37446	Liceul Special Pentru Deficienti De Vedere Buzău	12	\N	\N
37447	Scoala Gimnaziala Nr.7 Buzău	12	\N	\N
37448	Gradinita Cu Program Prelungit Nr 6	12	\N	\N
37449	Liceul Tehnologic Costin Nenitescu	12	\N	\N
37450	Scoala Gimnaziala Magura	12	\N	\N
37451	Scoala Gimnaziala Puiesti	12	\N	\N
37452	Scoala Gimnaziala Prof.dr.ion Anghel Luciu	12	\N	\N
37453	Scoala Gimnaziala Inv. Clementa Beschea Capatinesti	12	\N	\N
37454	Scoala Gimnaziala Pietroasele	12	\N	\N
37455	Scoala Gimnaziala Boldu	12	\N	\N
37456	Scoala Gimnaziala Constantin Popescu Fundeni	12	\N	\N
37457	Scoala Gimnaziala  Nr.3	12	\N	\N
37458	Scoala Gimnaziala Nr. 1 Comuna Rimnicelu	12	\N	\N
37459	Liceul Teoretic Alexandru Marghiloman	12	\N	\N
37460	Scoala Gimnaziala Panatau	12	\N	\N
37461	Scoala Gimnaziala C.a. Rosetti	12	\N	\N
37462	Scoala Gimnaziala Margaritesti	12	\N	\N
37463	Gradinita Cu Program Normal Nr 18	12	\N	\N
37464	Liceul Tehnologic Agricol Smeeni	12	\N	\N
37465	Liceul De Arte Margareta Sterian	12	\N	\N
37466	Scoala Gimnaziala Colti	12	\N	\N
37467	Scoala Gimnaziala Grebanu	12	\N	\N
37468	Scoala Gimnaziala Dumitru N. Cristea	12	\N	\N
37469	Colegiul National  M.eminescu	12	\N	\N
37470	Scoala Gimnaziala Galbinasi	12	\N	\N
37471	Liceul Tehnologic Grigore C. Moisil Buzău	12	\N	\N
37472	Gradinita Cu Program Prelungit Lumea Copilariei	12	\N	\N
37473	Liceul Teoretic Radu Vladescu Patarlagele	12	\N	\N
37474	Liceul Tehnologic  Patarlagele	12	\N	\N
37475	Scoala Gimnaziala Odaile	12	\N	\N
37476	Liceul Teoretic Beceni	12	\N	\N
37477	Scoala Gimnaziala Sfantul Apostol Andrei Buzău	12	\N	\N
37478	Scoala Gimnaziala Gheorghe Munteanu-murgoci Bisoca	12	\N	\N
37479	Scoala Gimnaziala Prof.constantin Dinca	12	\N	\N
37480	Liceul Cu Program Sportiv Iolanda Balas Soter	12	\N	\N
37481	Scoala Gimnaziala Cernatesti	12	\N	\N
37482	Scoala Gimnaziala Nr.1	12	\N	\N
37483	Scoala Gimnaziala Sapoca	12	\N	\N
37484	Scoala Gimnaziala Podgoria	12	\N	\N
37485	Scoala Gimnaziala Bozioru	12	\N	\N
37486	Scoala Gimnaziala Merei	12	\N	\N
37487	Scoala Gimnaziala Episcop Dionisie Romano	12	\N	\N
37488	Scoala Gimnaziala Glodeanu Silistea	12	\N	\N
37489	Scoala Gimnaziala Smeeni	12	\N	\N
37490	Gradinita Cu Program Prelungit Nr.3 Buzău	12	\N	\N
37491	Scoala Gimnaziala Comuna Amaru	12	\N	\N
37492	Scoala Gimnaziala Siriu	12	\N	\N
37493	Scoala Postliceala Sanitara Buzău	12	\N	\N
37494	Scoala Gimnaziala Robeasca	12	\N	\N
37495	Scoala Gimnaziala Cislau	12	\N	\N
37496	Scoala Gimnaziala Valcelele	12	\N	\N
37497	Scoala Gimnaziala Scortoasa	12	\N	\N
37498	Scoala Gimnaziala Topliceni	12	\N	\N
37499	Colegiul Agricol Dr.c.angelescu	12	\N	\N
37500	Scoala Gimnaziala Florica	12	\N	\N
37501	Scoala Gimnaziala Nicu Constantinescu Buzău	12	\N	\N
37502	Scoala Gimnaziala Ing. Oprisan Iarca Unguriu	12	\N	\N
37503	Liceul Teoretic Nicolae Iorga	12	\N	\N
37504	Scoala Gimnaziala Constantin Ivan Escu	12	\N	\N
37505	Gradinita Cu Program Prelungit Mugurasii	12	\N	\N
37506	Scoala Gimnaziala Comuna Stilpu	12	\N	\N
37507	Scoala Gimnaziala Nehoiu	12	\N	\N
37508	Liceul Tehnologic  Lopatari	12	\N	\N
37509	Scoala Gimnaziala Amara	12	\N	\N
37510	Liceul Tehnologic Vern Esti	12	\N	\N
37511	Gradinita Cu Program Prelungit Nr 1 Buau	12	\N	\N
37512	Liceul Pedagogic Spiru Haret	12	\N	\N
37513	Gradinita Cu Program Prelungit Cei Sapte Pitici	12	\N	\N
37514	Scoala Gimnaziala Sat Hales	12	\N	\N
37515	Scoala Gimnaziala Ghergheasa	12	\N	\N
37516	Gradinita Cu Program Prelungit Orizont	12	\N	\N
37517	Scoala Gimnaziala Capitan Aviator Mircea T. Badulescu	12	\N	\N
37518	Scoala Gimnaziala Naeni	12	\N	\N
37519	Scoala Gimnaziala Racoviteni	12	\N	\N
37520	Scoala Gimnaziala Cindesti	12	\N	\N
37521	Scoala Gimnaziala Nicolae Titulescu Municipiul Buzău	12	\N	\N
37522	Scoala Gimnaziala Chiliile	12	\N	\N
37523	Liceul Tehnologic Victor Frunza	12	\N	\N
37524	Gradinita Cu Program Prelungit Nr.9	12	\N	\N
37525	Liceul Tehnologic Sf.mucenic Sava Berca	12	\N	\N
37526	Liceul Teoretic Pogoanele	12	\N	\N
37527	Scoala Gimnaziala Constantin Giurescu	12	\N	\N
37528	Scoala Gimnaziala Gheraseni	12	\N	\N
37529	Colegiul Tehnic Buzău	12	\N	\N
37530	Scoala Gimnaziala Cozieni	12	\N	\N
37531	Liceul Tehnologic Special Pentru Copii Cu Deficiente Au Ditive Buzău	12	\N	\N
37532	Colegiul National B.p. Hasdeu	12	\N	\N
37533	Liceul Tehnologic Rusetu	12	\N	\N
37534	Scoala Gimnaziala Blajani	12	\N	\N
37535	Scoala Gimnaziala Viperesti	12	\N	\N
37536	Colegiul National Al.vlahuta	12	\N	\N
37537	Liceul Tehnologic Henri Coanda	12	\N	\N
37538	Scoala Gimnaziala Largu	12	\N	\N
37539	Liceul Tehnologic Dimitrie Filipescu	12	\N	\N
37540	Scoala Gimnaziala Breaza	12	\N	\N
37541	Scoala Gimnaziala Glodeanu Sarat	12	\N	\N
37542	Liceul  Stefan Cel Mare	12	\N	\N
37543	Scoala Gimnaziala  Nr.6	12	\N	\N
37544	Scoala Gimnaziala  Mihail Kogalniceanu	12	\N	\N
37545	Colegiul Economic	12	\N	\N
37546	Scoala Gimnaziala Alexandru Vlah Uta Oltenita	14	\N	\N
37547	Liceul Tehnologic Ion Ghica	14	\N	\N
37548	Liceul Tehnologic Nr.  1	14	\N	\N
37549	Gradinita Cu Program Normal Nr.11	14	\N	\N
37550	Scoala Gimnaziala Speciala Nr.1 Călărași	14	\N	\N
37551	Liceul Tehnologic Matei Basarab Manastirea	14	\N	\N
37552	Liceul Danubius Călărași	14	\N	\N
37553	Scoala Gimnaziala Mircea  Nedelciu Fundulea	14	\N	\N
37554	Scoala Gimnaziala Nr.1 Curcani	14	\N	\N
37555	Gradinita Cu Program Normal Elisabeta Rosetti	14	\N	\N
37556	Scoala Gimnaziala Mircea Voda Călărași	14	\N	\N
37557	Scoala Gimnaziala Nr1 Sarulesti Gara	14	\N	\N
37558	Scoala Gimnaziala George Valsan	14	\N	\N
37559	Gradinita Cu Program Prelungit Amicii	14	\N	\N
37560	Scoala Gimnaziala Nr. 1 Tamadau Mare	14	\N	\N
37561	Liceul Teoretic Neagoe Basarab Oltenita	14	\N	\N
37562	Gradinita Cu Program Normal  Nr. 1	14	\N	\N
37563	Scoala Gimnaziala Gheorghe Manu	14	\N	\N
37564	Scoala Gimnaziala Nr.2	14	\N	\N
37565	Scoala Gimnaziala Nr.1 Ciocan Esti	14	\N	\N
37566	Gradinita Cu Program Prelungit Voinicel Călărași	14	\N	\N
37567	Scoala Postliceala Sanitara Pompei Samarian	14	\N	\N
37568	Scoala Gimnaziala Prof.lucian Pavel	14	\N	\N
37569	Colegiul Agricol Sandu Aldea	14	\N	\N
37570	Scoala Gimnaziala Nr.2 Borcea	14	\N	\N
37571	Scoala Ginmaziana Nr. 1 Vlad Tepes	14	\N	\N
37572	Scoala Gimnaziala Nr.1  Perisoru	14	\N	\N
37573	Gradinita Cu Program Prelungit Rostogol Călărași	14	\N	\N
37574	Liceul Tehnologic Duiliu Zamfirescu	14	\N	\N
37575	Scoala Gimnaziala Nr1 Gurbanesti	14	\N	\N
37576	Scoala Gimnaziala Nr 1 Razvani	14	\N	\N
37577	Gradinita Cu Program Prelungit Nr.2 Oltenita	14	\N	\N
37578	Scoala Gimnaziala Nr.1  Frumusani	14	\N	\N
37579	Scoala Constantin Brancoveanu Călărași	14	\N	\N
37580	Scoala Gimnaziala Nr. 1 Belciugatele	14	\N	\N
37581	Scoala Gimnaziala Nr. 1 Fundeni	14	\N	\N
37582	Liceul Alexandru Odobescu Lehliu-gara	14	\N	\N
37583	Scoala Gimnaziala Constantin Teodorescu Soldanu	14	\N	\N
37584	Scoala Gimnaziala Nr.1  Dalga-gara	14	\N	\N
37585	Scoala Gimnaziala Nr 1 Valea Argovei	14	\N	\N
37586	Scoala Gimnaziala Mircea Eliade Oltenita	14	\N	\N
37587	Scoala Gimnaziala N.1  Luica	14	\N	\N
37588	Scoala Gimnaziala Tu Dor Vladimirescu	14	\N	\N
37589	Scoala Gimnaziala Nr.1  Nicolae Balcescu	14	\N	\N
37590	Gradinita Cu Program Normal Nr10 Călărași	14	\N	\N
37591	Scoala Gimnaziala Nr.1  Ulmu	14	\N	\N
37592	Scoala Gimnaziala Nr.1 Sohatu	14	\N	\N
37593	Scoala Gimnaziala Nr.1  Lehliu	14	\N	\N
37594	Scoala Gimnaziala Florenta Albu	14	\N	\N
37595	Scoala Gimnaziala Nr.1 Galbinasi	14	\N	\N
37596	Scoala Gimnaziala Nr.1 Cascioarele	14	\N	\N
37597	Scoala Gimnaziala Nr.1	14	\N	\N
37598	Scoala Gimnaziala Nicolae Petrescu Crivat	14	\N	\N
37599	Liceul Tehnologic Constantin George Calinescu Gradistea	14	\N	\N
37600	Scoala Gimnaziala Nr.1  Plataresti	14	\N	\N
37601	Scoala Gimnaziala Nr.1  Lehliu-gara	14	\N	\N
37602	Gradinita Cu Program Prelungit Brotacel	14	\N	\N
37603	Scoala Gimnaziala Nr1  Unirea	14	\N	\N
37604	Colegiul Economic	14	\N	\N
37605	Scoala Gimnaziala Nr 1  Modelu	14	\N	\N
37606	Scoala Gimnaziala Dragos Marin	14	\N	\N
37607	Scoala Gimnaziala Nr.2 Stancea	14	\N	\N
37608	Scoala Gimnaziala Nr. 1 Valea Rosie	14	\N	\N
37609	Scoala Gimnaziala Nr. 1 Dichiseni	14	\N	\N
37610	Liceul Tehnologic Dan Mateescu Călărași	14	\N	\N
37611	Scoala Gimnaziala Nr 1 Nana	14	\N	\N
37612	Scoala Gimnaziala Nr. 1 Dorobantu	14	\N	\N
37613	Scoala Gimnaziala Nr.1 Jegalia	14	\N	\N
37614	Scoala Gimnaziala Nr 1 Stefan Voda	14	\N	\N
37615	Scoala Gimnaziala Spiru Haret Oltenita	14	\N	\N
37616	Liceul Teoretic Mihai  Eminescu	14	\N	\N
37617	Scoala Gimnaziala Nr 1  Radu Voda	14	\N	\N
37618	Colegiul National Barbu Stirbei Călărași	14	\N	\N
37619	Scoala Gimnaziala Nr.1 Chiselet	14	\N	\N
37620	Scoala Gimnaziala Constantin Brancoveanu Vasilati	14	\N	\N
37621	Liceul Tehnologic Nrj  Borcea	14	\N	\N
37622	Scoala Gimnaziala Nr. 1  Dragos Voda	14	\N	\N
37623	Scoala Gimnaziala Nr.3	14	\N	\N
37624	Gradinita Cu Program Prelungit Aricel	14	\N	\N
37625	Scoala Gimnaziala Iancu Rosetfi	14	\N	\N
37626	Scoala Gimnaziala Alexandru D.ghica	14	\N	\N
37627	Colegiul Stefan Banulescu	14	\N	\N
37628	Scoala Gimnaziala  Mihai Viteazul Călărași	14	\N	\N
37629	Scoala Gimnaziala Armenis	13	\N	\N
37630	Universitatea Eftimie Murgu	13	\N	\N
37631	Scoala Postliceala Sanitara  Banatul  Caransebes	13	\N	\N
37632	Scoala Gimnaziala  Slatina Timiș	13	\N	\N
37633	Colegiul Economic Al Banatului Montan	13	\N	\N
37634	Scoala Gimnaziala Obreja	13	\N	\N
37635	Liceul Teologic Baptist Resita	13	\N	\N
37636	Liceul Tehnologic  Iosif Coriolan Buracu Prigor	13	\N	\N
37637	Liceul Traian Vu Ia	13	\N	\N
37638	Liceul Tehnologic Dacia Caransebes	13	\N	\N
37639	Scoala Gimnaziala Sacu	13	\N	\N
37640	Scoala Gimnaziala Nr 2 Bocsa	13	\N	\N
37641	Scoala Gimnaziala Petrosnita	13	\N	\N
37642	Scoala Gimnaziala Poiana	13	\N	\N
37643	Scoala Gimnaziala Berzasca	13	\N	\N
37644	Scoala Gimnaziala Nrj Otelu Rosu	13	\N	\N
37645	Scoala Gimnaziala Dr.ion Sirbu Eftimie Murgu	13	\N	\N
37646	Gradinita Cu Program Prelungit Riki-priki Resita	13	\N	\N
37647	Scoala Gimnaziala Zorlentu-mare	13	\N	\N
37648	Scoala Gimnaziala Nr. 9 Resita	13	\N	\N
37649	Scoala Gimnaziala Romul Ladea Oravita	13	\N	\N
37650	Gradinita Cu Program Prelungit Sfintul Stelian	13	\N	\N
37651	Liceul Tehnologic  Berzovia	13	\N	\N
37652	Liceul Teoretic Traian Doda Caransebes	13	\N	\N
37653	Liceul Tehnologic Sfantul Dimitrie Teregova	13	\N	\N
37654	Scoala Gimnaziala Girnic	13	\N	\N
37655	Liceul De Arte Sabin Pauta	13	\N	\N
37656	Gradinita Cu Program Prelungit Nr.2 Caransebes	13	\N	\N
37657	Scoala Gimnaziala Iablanita	13	\N	\N
37658	Liceul Banatean	13	\N	\N
37659	Liceul Tehnologic Clisura Dunarii	13	\N	\N
37660	Scoala Gimnaziala Cornutel	13	\N	\N
37661	Scoala Gimnaziala Goruia	13	\N	\N
37662	Colegiul National Diaconovici Tietz Resita	13	\N	\N
37663	Gradinita Program Prelungit Bocsa	13	\N	\N
37664	Scoala Gimnaziala Sopotu Nou	13	\N	\N
37665	Scoala Gimnaziala Zavoi	13	\N	\N
37666	Scoala Gimnaziala Mihai Novac Sasca Montana	13	\N	\N
37667	Scoala Gimnaziala Trandafir Tamas Marga	13	\N	\N
37668	Liceul Teoretic Tata Oancea Bocsa	13	\N	\N
37669	Scoala Gimnaziala Constantin Daicoviciu	13	\N	\N
37670	Gradinita Cu Program Prelungit Otelu Rosu	13	\N	\N
37671	Liceul Tehnologic Trandafir Cocarla Caransebes	13	\N	\N
37672	Scoala Gimnaziala Virciorova	13	\N	\N
37673	Scoala Gimnaziala Ramna	13	\N	\N
37674	Liceul Hercules	13	\N	\N
37675	Scoala Gimnaziala Verendin	13	\N	\N
37676	Gradinita Cu Program Prelungit Palatul Fermecat Resita	13	\N	\N
37677	Scoala Gimnaziala Stefan Velovan Rusca Montana	13	\N	\N
37678	Scoala Gimnaziala Bautar	13	\N	\N
37679	Scoala Gimnaziala Carbunari	13	\N	\N
37680	Scoala Gimnaziala Firliug	13	\N	\N
37681	Scoala Gimnaziala Coronini	13	\N	\N
37682	Scoala Populara De Arte Si Meserii Ion Romanu	13	\N	\N
37683	Scoala Gimnaziala Mihai Peia Resita	13	\N	\N
37684	Scoala Gimnaziala Mehadica	13	\N	\N
37685	Scoala Gimnaziala Vrani	13	\N	\N
37686	Scoala Gimnaziala Nr.8 Resita	13	\N	\N
37687	Liceul Teoretic Bilingv Romano-croat Carasova	13	\N	\N
37688	Gradinita Floare De Colt  Baile Herculane	13	\N	\N
37689	Seminarul Teologic Ortodox Episcop Ioan Popasu Caransebes	13	\N	\N
37690	Gradinita Cu Program Prelungit Nr.4 Caransebes	13	\N	\N
37691	Scoala Gimnaziala Atanasie Cojocaru Pojejena	13	\N	\N
37692	Colegiul National Traian Lalescu	13	\N	\N
37693	Scoala Gimnaziala Toplet	13	\N	\N
37694	Scoala Gimnaziala Tirnova	13	\N	\N
37695	Scoala Gimnaziala Gheorghe Guga Racasdia	13	\N	\N
37696	Scoala Gimnaziala Maureni	13	\N	\N
37697	Colegiul Tehnic Resita	13	\N	\N
37698	Scoala Gimnaziala Nr 2 Resita	13	\N	\N
37699	Scoala  Gimnaziala Trandafir Cocirla Tu Rn U-ruieni	13	\N	\N
37700	Scoala Gimnaziala Sichevita	13	\N	\N
37701	Colegiul National Constantin Diaconovici Loga	13	\N	\N
37702	Scoala Gimnaziala Petre Sava Baleanu Valiug	13	\N	\N
37703	Scoala Gimnaziala Dalboset	13	\N	\N
37704	Scoala Gimnaziala Lapusnicel	13	\N	\N
37705	Scoala Gimnaziala Berliste	13	\N	\N
37706	Scoala Gimnaziala Pavel Bordan Gradinari	13	\N	\N
37707	Scoala Gimnaziala Bania	13	\N	\N
37708	Scoala Gimnaziala Vermes	13	\N	\N
37709	Liceul Mathias Hammer Anina	13	\N	\N
37710	Colegiul National Mircea Eliade	13	\N	\N
37711	Scoala Gimnaziala Ocna De Fier	13	\N	\N
37712	Scoala Gimnaziala Romulus Fabian Varadia	13	\N	\N
37713	Scoala Gimnaziala Dognecea	13	\N	\N
37714	Scoala Gimnaziala Ciclova Romana	13	\N	\N
37715	Gradinita Cu Program Prelungit Floarea Soarelui	13	\N	\N
37716	Scoala Gimnaziala Lupac	13	\N	\N
37717	Scoala Gimnaziala Aurel Peia Ezeris	13	\N	\N
37718	Liceul Teoretic General Dragalina	13	\N	\N
37719	Gradinita Cu Program Normal Pinocchio	13	\N	\N
37720	Institutul Teologic Protestant	15	\N	\N
37721	Universitatea Avram Iancu	15	\N	\N
37722	Universitatea Bogdan Vodă	15	\N	\N
37723	Universitatea Sapientia	15	\N	\N
37724	Scoala Gimnaziala Buza	15	\N	\N
37725	Universitatea Babeș-Bolyai	15	\N	\N
37726	Academia Romana Filiala Cluj	15	\N	\N
37727	Scoala  Gimnaziala Mociu	15	\N	\N
37728	Academia De Muzica Gheorghe Dima	15	\N	\N
37729	Colegiul National Andrei Mureșanu	15	\N	\N
37730	Universitatea De Stiinte Agricole Si Medicina Veterinara	15	\N	\N
37731	Scoala Gimnaziala Mihai Viteazu	15	\N	\N
37732	Scoala Gimnaziala Mintiu Gherlii	15	\N	\N
37733	Scoala Gimnaziala Ioan Opris	15	\N	\N
37734	Academia De Muzica Gh. Dima	15	\N	\N
37735	Scoala Gimnaziala Unguras	15	\N	\N
37736	Liceul De Informatica Tiberiu Popoviciu	15	\N	\N
37737	Colegiul Tehnic Victor Ungureanu	15	\N	\N
37738	Scoala Gimnaziala Valea Ierii	15	\N	\N
37739	Gradinita Cu Program Prelungit Universitatii Babes- Bolyai	15	\N	\N
37740	Scoala Gimnaziala Ion Agarbiceanu	15	\N	\N
37741	Scoala Gimnaziala Borsa	15	\N	\N
37742	Gradinita Cu Program Prelungit Floresti	15	\N	\N
37743	Liceul Teoretic Eugen Pora	15	\N	\N
37744	Colegiul Tehnic De Comunicatii Augustin Maior	15	\N	\N
37745	Scoala Gimnaziala Lia Manoliu Cornesti Comuna Cornesti	15	\N	\N
37746	Colegiul National  Mihai Viteazul Turda	15	\N	\N
37747	Scoala Gimnaziala Ion Creanga Cluj Napoca	15	\N	\N
37748	Scoala Gimnaziala Mircea Luca Baisoara	15	\N	\N
37749	Colegiul Tehnic Ana Aslan	15	\N	\N
37750	Liceul Teoretic Gelu Voievod	15	\N	\N
37751	Scoala Gimnaziala Horea	15	\N	\N
37752	Liceul Special Pentru Deficienti De Vedere	15	\N	\N
37753	Scoala Gimnaziala Sacuieu	15	\N	\N
37754	Gradinita Cu Program Prelungit Lizuca	15	\N	\N
37755	Colegiul Tehnic Anghel Saligny	15	\N	\N
37756	Scoala Gimnaziala Horea Closca Si Crisan	15	\N	\N
37757	Liceul De Muzica Sigismund Toduta	15	\N	\N
37758	Gradinita Cu Program Prelungit Poienita	15	\N	\N
37759	Scoala Gimnziala Ioan Bujor Petrestii De Jos	15	\N	\N
37760	Scoala Gimnaziala Ploscos Com. Ploscos	15	\N	\N
37761	Scoala Gimnaziala Cojocna	15	\N	\N
37762	Scoala Gimnaziala Nicolae Titulescu	15	\N	\N
37763	Colegiul Tehnic Raluca Ripan	15	\N	\N
37764	Scoala Gimnaziala Octavian Goga Ciucea	15	\N	\N
37765	Gradinita Cu Program Prelungit Neghinita	15	\N	\N
37766	Scoala Gimnaziala Iclod	15	\N	\N
37767	Gradinita Cu Program Prelungit Arlechino	15	\N	\N
37768	Scoala Gimnaziala Catina	15	\N	\N
37769	Scoala Gimnaziala Calatele Comcalatele	15	\N	\N
37770	Gradinita Cu Program Prelungit Aschiuta	15	\N	\N
37771	Scoala Gimnaziala Pelaghia Rosu Marisel . Com Marisel	15	\N	\N
37772	Scoala Gimnaziala Traian Darjan	15	\N	\N
37773	Liceul Teoretic Mihai  Eminescu	15	\N	\N
37774	Scoala Postliceala Sanitara Sfantul Bartolomeu	15	\N	\N
37775	Scoala Gimnaziala Aghiresu-fabrici	15	\N	\N
37776	Scoala Gimnaziala Luna De Sus	15	\N	\N
37777	Scoala Gimnaziala Bobilna	15	\N	\N
37778	Colegiul National Emil Racovita	15	\N	\N
37779	Gradinita Cu Program Prelungit Sfanta Maria	15	\N	\N
37780	Scoala Gimnaziala Vad	15	\N	\N
37781	Scoala Gimnaziala Iuliu Hatieganu Cluj-napoca	15	\N	\N
37782	Colegiul Tehnic Energetic	15	\N	\N
37783	Liceul De Coregrafie Si Arta Dramatica Octavian Stroia	15	\N	\N
37784	Scoala Gimnaziala Moldovenesti	15	\N	\N
37785	Scoala Gimnaziala George Baritiu Jucu De Sus	15	\N	\N
37786	Liceul Teoretic  Brassai  Samuel	15	\N	\N
37787	Scoala Gimnaziala Ceanu Mare	15	\N	\N
37788	Scoala Gimnaziala Pavel Dan Tritenii De Jos	15	\N	\N
37789	Liceul Teologic Baptist Emanuel	15	\N	\N
37790	Scoala Gimnaziala Baciu	15	\N	\N
37791	Scoala Gimnaziala Speciala Huedin	15	\N	\N
37792	Scoala Gimnaziala Kos Karoly Izvoru Crisului	15	\N	\N
37793	Scoala Gimnaziala Luna Com.luna	15	\N	\N
37794	Liceul Teoretic Liviu Rebreanu	15	\N	\N
37795	Colegiul National George Cosbuc	15	\N	\N
37796	Liceul Tehnologic Stefan Pascu Apahida	15	\N	\N
37797	Gradinita Cu Program Prelungit Micul Print	15	\N	\N
37798	Colegiul Tehnic Napoca	15	\N	\N
37799	Gradinita Cu Program Prelungit Lumea Prichindeilor Campia Turzii	15	\N	\N
37800	Scoala Gimnaziala Speciala Dej	15	\N	\N
37801	Scoala  Gimnaziala  Hasdate-finisel	15	\N	\N
37802	Scoala Gimnaziala Speciala Centru De Resurse Si Documentare Privind Educatia Incluziva Integrata	15	\N	\N
37803	Scoala Gimnaziala Maguri-racatau	15	\N	\N
37804	Scoala Gimnaziala Tureni Com.tureni	15	\N	\N
37805	Liceul Teoretic Petru Maior	15	\N	\N
37806	Universitatea Tehnica Din Cluj-napoca	15	\N	\N
37807	Gradinita Cu Program Prelungit Zana Zorilor	15	\N	\N
37808	Scoala Gimnaziala Sic	15	\N	\N
37809	Scoala Gimnaziala Negreni Com. Negreni	15	\N	\N
37810	Liceul Teologic Reformat Cluj	15	\N	\N
37811	Gradinita Cu Program Prelungit Dumbrava Minunata	15	\N	\N
37812	Gradinita Cu Program Prelungit Prichindelul Istet	15	\N	\N
37813	Gradinita Cu Program Prelungit Alba Ca Zapada	15	\N	\N
37814	Liceul Teoretic Octavian Goga Huedin	15	\N	\N
37815	Liceul Teoretic Gheorghe Sincai	15	\N	\N
37816	Gradinita Speciala Pentru Copii Cu Deficiente	15	\N	\N
37817	Scoala De Agenti De Politie Septimiu Mureșan Cluj-napoca	15	\N	\N
37818	Liceul Teoretic Lucian Blaga	15	\N	\N
37819	Scoala Gimnaziala Citcau	15	\N	\N
37820	Liceul Teologic Adventist Maranatha	15	\N	\N
37821	Gradinita Cu Program Prelungit Veseliei	15	\N	\N
37822	Gradinita Cu Program Prelungit Parfum De Tei	15	\N	\N
37823	Gradinita Cu Program Prelungit Licurici Cluj-napoca	15	\N	\N
37824	Scoala Gimaziala Chiuiesti	15	\N	\N
37825	Scoala Gimnaziala Speciala Pentru Deficienti De Auz Kozmutza Flora	15	\N	\N
37826	Scoala Gimnaziala Garbau	15	\N	\N
37827	Liceul Teoretic Bathory Istvan Cluj-napoca	15	\N	\N
37828	Scoala Gimnaziala Borbely Jozsef Savadisla	15	\N	\N
37829	Gradinita Cu Program Prelungit Raza De Soare	15	\N	\N
37830	Gradinita Cu Program Prelungit Degetica	15	\N	\N
37831	Scoala Gimnaziala Teodor Murasanu	15	\N	\N
37832	Scoala Gimnaziala Ioan Bob	15	\N	\N
37833	Scoala Gimnaziala  Constantin Brancusi Cluj-napoca	15	\N	\N
37834	Liceul Tehnologic Constantin Brancusi	15	\N	\N
37835	Liceul Tehnologic Aurel Vlaicu	15	\N	\N
37836	Scoala Gimnaziala Alexandru Vaida-voevod	15	\N	\N
37837	Scoala Gimnaziala Simion Balint Copaceni Com Sandulesti	15	\N	\N
37838	Gradinita Cu Program Prelungit Trenuletul Veseliei	15	\N	\N
37839	Scoala Gimnaziala Gelu Romanul Dabaca	15	\N	\N
37840	Scoala Gimnaziala Aschileu Mare	15	\N	\N
37841	Gradinita Cu Program Prelungit Poiana Cu Castani	15	\N	\N
37842	Liceul Tehnologic Nrj	15	\N	\N
37843	Scoala Gimnaziala Rachitele	15	\N	\N
37844	Liceul Tehnologic Gherla	15	\N	\N
37845	Scoala Gimnaziala Ioan Alexandru	15	\N	\N
37846	Scoala Gimnaziala Mihai Eminescu Dej	15	\N	\N
37847	Liceul Teoretic Alexandru Papiu Ilarian	15	\N	\N
37848	Colegiul National George Baritiu	15	\N	\N
37849	Colegiul Tehnic Dr. Ioan Ratiu	15	\N	\N
37850	Liceul Teoretic Avram Iancu Cluj-napoca	15	\N	\N
37851	Gradinita Cu Pragram Prelungit Casuta Povestilor	15	\N	\N
37852	Liceul Tehnologic Vladeasa Huedin	15	\N	\N
37853	Scoala Gimnaziala Emil Isac	15	\N	\N
37854	Liceul Cu Program Sportiv Cluj Napoca	15	\N	\N
37855	Scoala Primara Fizesu Gherlii	15	\N	\N
37856	Colegiul Tehnic Edmond Nicolau	15	\N	\N
37857	Scoala Gimnaziala Caseiu	15	\N	\N
37858	Scoala Gimnaziala Camarasu	15	\N	\N
37859	Scoala Gimnaziala Nicolae Iorga	15	\N	\N
37860	Liceul Teoretic Pavel Dan Campia Turzii	15	\N	\N
37861	Scoala Gimnaziala Liviu Rebreanu	15	\N	\N
37862	Liceul Janos Zsigmond	15	\N	\N
37863	Scoala Gimnaziala Avram Iancu Campia Turzii	15	\N	\N
37864	Gradinita Cu Program Prelungit Floare De Iris	15	\N	\N
37865	Scoala Gimnaziala Capusu Mare	15	\N	\N
37866	Liceul Teoretic Josika Miklos	15	\N	\N
37867	Gradinita Cu Program Prelungit Pinocchio Campia Turzii	15	\N	\N
37868	Scoala Gimnaziala Avram Iancu Dej	15	\N	\N
37869	Scoala Gimnaziala Cuzdrioara	15	\N	\N
37870	Scoala Gimnaziala Nr.1 Gherla	15	\N	\N
37871	Colegiul Economic Iulian Pop	15	\N	\N
37872	Scoala Gimnaziala Cutca	15	\N	\N
37873	Scoala Gimnaziala Andrei Saguna	15	\N	\N
37874	Scoala Gimnaziala Avram Iancu Belis	15	\N	\N
37875	Gradinita Cu Program Prelungit Buburuza	15	\N	\N
37876	Scoala Gimnaziala Iara	15	\N	\N
37877	Scoala Gimnaziala Viisoara	15	\N	\N
37878	Universitatea De Arta Si Design Cluj Napoca	15	\N	\N
37879	Scoala Gimnaziala  Avram Iancu Turda	15	\N	\N
37880	Gradinita Cu Program Prelungit Piticot Dej	15	\N	\N
37881	Scoala Gimnaziala Suatu Com Suatu	15	\N	\N
37882	Scoala Gimnaziala Frata	15	\N	\N
37883	Gradinita Cu Program Prelungit  Lumea Copiilor	15	\N	\N
37884	Gradinita Cu Program Prelungit Mica Sirena	15	\N	\N
37885	Liceul Waldorf	15	\N	\N
37886	Universitatea De Medicina Si Famacie Iuliu Hatieganu	15	\N	\N
37887	Gradinita Cu Program Prelungit Casuta Fermecata	15	\N	\N
37888	Gradinita Cu Program Prelungit Universul Copiilor	15	\N	\N
37889	Gradinita Cu Program Prelungit Lumea Piticilor Dej	15	\N	\N
37890	Scoala Gimnaziala George Cosbuc 23 August	16	\N	\N
37891	Universitatea Andrei Șaguna	16	\N	\N
37892	Universitatea Maritimă	16	\N	\N
37893	Academia Navală Micrea cel Bătrân	16	\N	\N
37894	Scoala Gimnaziala Il Caragiale  Medgidia	16	\N	\N
37895	Liceul Teoretic George Calinescu	16	\N	\N
37896	Scoala Gimnaziala  Wilhelm Moldovan	16	\N	\N
37897	Gradinita Cu Program Prelungit Lumea Copiilor	16	\N	\N
37898	Gradinita Cu Program Prelungit Albatros	16	\N	\N
37899	Scoala Gimnaziala Nr.1  Pestera	16	\N	\N
37900	Liceul Tehnologic Nicolae Dumitrescu Cumpana	16	\N	\N
37901	Colegiul National Mircea Cel Batran	16	\N	\N
37902	Scoala Gimnaziala Nr 1  Poarta Alba	16	\N	\N
37903	Liceul Teoretic Traian Constanța	16	\N	\N
37904	Liceul Teoretic Ioan Cotovu Harsova	16	\N	\N
37905	Scoala Gimnaziala Nr.1 Tuzla	16	\N	\N
37906	Scoala Gimnaziala Nr 18 Jean Bart	16	\N	\N
37907	Liceul Tehnologic Cogealac	16	\N	\N
37908	Liceul Tehnologic  Axiopolis	16	\N	\N
37909	Liceul Tehnologic I.c.bratianu Nicolae Balcescu	16	\N	\N
37910	Scoala Gimnaziala A.ghencea Sacele	16	\N	\N
37911	Liceul Tehnologic Ucecom  Spiru Haret	16	\N	\N
37912	Liceul Teoretic Murfatlar	16	\N	\N
37913	Gradinita Cu Program Prelungit Azur	16	\N	\N
37914	Seminarul Teologic Ortodox Sfantul Cuvios Dionisie Exiguul	16	\N	\N
37915	Scoala Gimnaziala Nr.33 Anghel Saligny	16	\N	\N
37916	Scoala Gimnaziala Nr.1omihail Koiciu	16	\N	\N
37917	Liceul Teoretic Decebal	16	\N	\N
37918	Scoala Gimnaziala Nr.1 Silistea	16	\N	\N
37919	Scoala Gimnaziala Nr.17 Ion Minulescu Constanța	16	\N	\N
37920	Gradinita Cu Program Prelungit Florilor	16	\N	\N
37921	Liceul Tehnologic Ion  Podaru	16	\N	\N
37922	Gradinita Cu Program Prelungit Lucian Grigorescu	16	\N	\N
37923	Liceul Tehnologic Mihai Viteazul	16	\N	\N
37924	Scoala Gimnaziala Nr. 2 Ovidiu	16	\N	\N
37925	Gradinita Cu Program Prelungit Nr.8 Constanța	16	\N	\N
37926	Scoala Gimnaziala Nr. 40  Aurel Vlaicu	16	\N	\N
37927	Scoala Gimnaziala Nr.43 Ferdinand	16	\N	\N
37928	Gradinita Cu Program Prelungit Nr 42	16	\N	\N
37929	Liceul Tehnologic Gheorghe Duca	16	\N	\N
37930	Liceul Tehnologic Ion Banescu	16	\N	\N
37931	Scoala Gimnaziala Grigore Moisil Navodari	16	\N	\N
37932	Scoala Gimnaziala Nr. 1 Gradina	16	\N	\N
37933	Scoala Gimnaziala Mircea Eliade	16	\N	\N
37934	Scoala Gimnaziala Nr. 1 Rasova	16	\N	\N
37935	Scoala Gimnaziala S.a. Esenin Ghindaresti	16	\N	\N
37936	Liceul Tehnologic Gheorghe Miron Costin	16	\N	\N
37937	Gradinita Cu Program Prelungit Nr.2	16	\N	\N
37938	Scoala Gimnaziala Nr.1 Oltina	16	\N	\N
37939	Scoala Gimnaziala Gala Galaction	16	\N	\N
37940	Scoala Gimnaziala Nr 1 Fantanele	16	\N	\N
37941	Scoala Gimnaziala Nichita Stanescu Mereni	16	\N	\N
37942	Liceul Teoretic Callatis	16	\N	\N
37943	Scoala Gimnaziala George Enescu	16	\N	\N
37944	Gradinita Cu Program Prelungit Lumea Florilor	16	\N	\N
37945	Liceul Tehnologic Ca Rosetti  Constanța	16	\N	\N
37946	Gradinita Nr.3 Mangalia Jud. Constanța	16	\N	\N
37947	Scoala Gimnaziala Nr.2	16	\N	\N
37948	Liceul Tehnologic Dimitrie Leonida	16	\N	\N
37949	Colegiul Tehnic Energetic Constanța	16	\N	\N
37950	Scoala Gimnaziala Nr 1 Mangalia	16	\N	\N
37951	Scoala Gimnaziala Tu Dor Arghezi	16	\N	\N
37952	Colegiul Tehnic Nicolae Titu Lescu	16	\N	\N
37953	Gradinita Cu Orar Normal Nr 1 Valu Lui Traian	16	\N	\N
37954	Liceul Tehnologic Crucea	16	\N	\N
37955	Scoala Gimnaziala Nr.6 Nicolae Titulescu	16	\N	\N
37956	Scoala Gimnaziala Lucian Grigorescu	16	\N	\N
37957	Scoala Gimnaziala Nr. 14 Constanța	16	\N	\N
37958	Gradinita Cu Program Normal Veseliei Navodari	16	\N	\N
37959	Liceul Teoretic George Emil Palade Constanța	16	\N	\N
37960	Scoala Gimnaziala Ion Creanga Albesti	16	\N	\N
37961	Colegiul National De Arte Regina Maria	16	\N	\N
37962	Colegiul Agricol	16	\N	\N
37963	Scoala Gimnaziala Sf. Andrei	16	\N	\N
37964	Gradinita Cu Program Prelungit Perlutele Marii	16	\N	\N
37965	Liceul Teoretic Lucian Blaga	16	\N	\N
37966	Scoala Gimnaziala Adrian V Radulescu	16	\N	\N
37967	Scoala Gimnaziala Nr.16 Marin Ionescu Dobrogianu	16	\N	\N
37968	Scoala Gimnaziala Nr. 30 Gheorghe Titeica	16	\N	\N
37969	Scoala Gimaziala Nr38 Dimitrie Cantemir	16	\N	\N
37970	Gradinita Cu Program Prelungit Nr 53	16	\N	\N
37971	Gradinita Cu Program Prelungit Lumea Povestilor	16	\N	\N
37972	Gradinita Cu Program Prelungit Stelute Marii	16	\N	\N
37973	Colegiul National Kemal Atatu Rk	16	\N	\N
37974	Scoala Gimnaziala Nr.8 Constanța	16	\N	\N
37975	Gradinita Cu Program Prelungit Nr. 6 Constanța	16	\N	\N
37976	Scoala Gimnaziala Nr. 12 B.p.hasdeu Constanța	16	\N	\N
37977	Colegiul National Mihai Eminescu	16	\N	\N
37978	Liceul Cu Program Sportiv Nicolae Rotaru	16	\N	\N
37979	Liceul Tehnologic Dragomir Hurmuzescu	16	\N	\N
37980	Scoala Gimnaziala Nr.1 Chirnogeni	16	\N	\N
37981	Scoala Gimnaziala Nr.37 Constanța	16	\N	\N
37982	Gradinita Cu Program Prelungit Dumbrava Minunata	16	\N	\N
37983	Liceul Teoretic Mihail Kogalniceanu	16	\N	\N
37984	Gradinita Cu Program Normal Pestisorul De Aur Navodari	16	\N	\N
37985	Scoala Gimnaziala Nr 1 Seimeni	16	\N	\N
37986	Scoala Gimnaziala Nr.22 I.c.bratianu	16	\N	\N
37987	Liceul Tehnologic Lazar Edeleanu	16	\N	\N
37988	Scoala Gimnaziala Nr 24 Ion Jalea Constanța	16	\N	\N
37989	Colegiul Tehnic Tomis Constanța	16	\N	\N
37990	Scoala Gimnaziala Nr. 31	16	\N	\N
37991	Scoala Gimnaziala Emil Garleanu Baraganu	16	\N	\N
37992	Gradinita Cu Program Prelungit Sfanta Maria Cumpana	16	\N	\N
37993	Scoala Gimnaziala „ Dan Spataru„ Aliman	16	\N	\N
37994	Scoala Gimnaziala Nr.1  Eforie Nord	16	\N	\N
37995	Gradinita Cu Program Prelungit Nr 44	16	\N	\N
37996	Scoala Gimnaziala Nr 1 Limanu	16	\N	\N
37997	Scoala Gimnaziala Nr. 1 Saligny	16	\N	\N
37998	Liceul Tehnologic Virgil Madgearu Constanța	16	\N	\N
37999	Liceul Teoretic Ovidius Constanța	16	\N	\N
38000	Liceul Teoretic Baneasa	16	\N	\N
38001	Scoala Gimnaziala Nr.1  Istria	16	\N	\N
38002	Scoala Gimnaziala Nr. 23 Constantin Brancoveanu	16	\N	\N
38003	Gradinita Cu Program Prelungit Amicii Constanța	16	\N	\N
38004	Scoala Gimnaziala Ioan Ayanasiu Lipnita	16	\N	\N
38005	Gradinita Cu Program Prelungit Nr.33	16	\N	\N
38006	Scoala Gimnaziala Ion Borcea Agigea	16	\N	\N
38007	Scoala Gimnaziala Dumitru Gavrilesu Garliciu	16	\N	\N
38008	Liceul Tehnologic Radu Priscu Dobromir	16	\N	\N
38009	Liceul Regele Carol I Ostrov	16	\N	\N
38010	Scoala Gimnaziala  Iuliu Valaori Nisipari	16	\N	\N
38011	Liceul Teoretic Carmen Sylva Eforie Sud	16	\N	\N
38012	Scoala Gimnaziala Nr. 1 Harsova	16	\N	\N
38013	Liceul Tehnologic De Electrotehnica Si Telecomunicatii Constanța	16	\N	\N
38014	Scoala  Gimnaziala Mihail Sadoveanu Medgidia	16	\N	\N
38015	Gradinita Cu Program Prelungit Mugurel Constanța	16	\N	\N
38016	Liceul Tehnologic Topraisar	16	\N	\N
38017	Scoala Gimnaziala Nr.1 Valu Lui Traian	16	\N	\N
38018	Gradinita Cu Program Prelungit Casuta De Tu Rta Dulce Constanța	16	\N	\N
38019	Gradinita Cu Program Prelungit Nr. 45 Constanța	16	\N	\N
38020	Universitatea Ovidius Constanța	16	\N	\N
38021	Liceul Tehnologic Independenta	16	\N	\N
38022	Scoala Gimnaziala Spiru Haret	16	\N	\N
38023	Scoala Gimnaziala Nr. 29 Mihai Viteazul	16	\N	\N
38024	Scoala Gimnaziala Czetz Janos	17	\N	\N
38025	Scoala Gimnaziala Romulus Cioflec	17	\N	\N
38026	Scoala Gimnaziala Nicolae Colan	17	\N	\N
38027	Scoala Gimnaziala Kicsi Antal	17	\N	\N
38028	Scoala Populara De Arte Si Meserii Sfantu Gheorghe Muveszeti Nepiskola Sepsiszentgyorgy	17	\N	\N
38029	Liceul Teologic  Reformat Tg.secuiesc	17	\N	\N
38030	Scoala Gimnaziala Horn David	17	\N	\N
38031	Liceul Tehnologic Apor Peter	17	\N	\N
38032	Scoala Gimnaziala Molnar Jozsias Tg.secuiesc	17	\N	\N
38033	Scoala Gimnaziala Avram Iancu Covasna	17	\N	\N
38034	Colegiul National Mihai Viteazul Municipiul Sfantu Gheorghe	17	\N	\N
38035	Gradinita De Copii Ben Edek Elek Cu Program Prelungit	17	\N	\N
38036	Scoala Gimnaziala Nr.1	17	\N	\N
38037	Scoala Gimnaziala Kriza Janos	17	\N	\N
38038	Scoala Gimnaziala Mikes Armin	17	\N	\N
38039	Scoala Gimnaziala Boloni Farkas Sandor	17	\N	\N
38040	Gradinita De Copii Csipike Cu Program Prelungit Sfantu Gheorghe	17	\N	\N
38041	Scoala Gimnaziala Mathe Janos	17	\N	\N
38042	Scoala Gimnaziala Kelemen Didak	17	\N	\N
38043	Scoala Gimnaziala Mihai Eminescu Si Gradinita Cu Program Normal Valea Mare	17	\N	\N
38044	Liceul Tehnologic Kos Karoly	17	\N	\N
38045	Scoala Gimnaziala Tatrangi Sandor	17	\N	\N
38046	Scoala Gimnaziala Comenius	17	\N	\N
38047	Scoala Gimnaziala Vegh Antal	17	\N	\N
38048	Scoala Gimnaziala Godri Ferenc	17	\N	\N
38049	Scoala Gimnaziala Apor Istvan	17	\N	\N
38050	Scoala Gimnaziala Balint Gabor Catalina	17	\N	\N
38051	Liceul Korosi Csoma Sandor	17	\N	\N
38052	Scoala Gimnaziala Neri Szent Fulop Sfantu Gheorghe	17	\N	\N
38053	Scoala Gimnaziala Barcani	17	\N	\N
38054	Scoala Gimnaziala Ady Endre	17	\N	\N
38055	Scoala Gimnaziala Nicolae Russu	17	\N	\N
38056	Scoala Gimnaziala Henter Karoly	17	\N	\N
38057	Scoala Gimnazila Borbath Karoly Varghis	17	\N	\N
38058	Scoala Gimnaziala Darko Jeno—comdalnic	17	\N	\N
38059	Scoala Gimnaziala Mihail Sadoveanu	17	\N	\N
38060	Scoala Gimnaziala Varadi Jozsef	17	\N	\N
38061	Scoala Gimnaziala Fejer Akos	17	\N	\N
38062	Scoala Gimnaziala Bartha Karoly	17	\N	\N
38063	Liceul Tehnologic Puskas Tivdar	17	\N	\N
38064	Scoala Gimnaziala Bem Jozsef	17	\N	\N
38065	Gradinita De Copii Gulliver Cu Program Prelungit Sfantu Gheorghe	17	\N	\N
38066	Liceul Tehnologic Baroti Szabo David	17	\N	\N
38067	Scoala Gimnaziala Nagy Mozes Estelnic	17	\N	\N
38068	Scoala Gimnaziala Benko Jozsef	17	\N	\N
38069	Liceul Teoretic Nagy Mozes Tg.secuiesc	17	\N	\N
38070	Liceul Tehnologic Economic Administrativ Berde Aron	17	\N	\N
38071	Gradinita De Copii Hofeherke Cu Program Prelungit Sfantu Gheorghe	17	\N	\N
38072	Scoala Gimnaziala Laszlo Lu Kacs	17	\N	\N
38073	Scoala Gimnaziala Bibo Jozsef Brates	17	\N	\N
38074	Liceul Pedagogic Bod Peter	17	\N	\N
38075	Liceul Teologic Reformat	17	\N	\N
38076	Scoala Gimnaziala Prof.paul Banica	18	\N	\N
38077	Scoala Gimnaziala Ciocan Esti	18	\N	\N
38078	Scoala Cu Clasele I —viii Man Esti	18	\N	\N
38079	Liceul Tehnologic De Transporturi Auto Targoviste	18	\N	\N
38080	Scoala Gimnaziala Valea Mare	18	\N	\N
38081	Universitatea Valahia	18	\N	\N
38082	Gradinita Prichindel	18	\N	\N
38083	Scoala Gimnaziala Razvad	18	\N	\N
38084	Colegiul National Nicolae Titulescu Pucioasa	18	\N	\N
38085	Gradinita Cu Program Prelungit Nr.4 Moreni	18	\N	\N
38086	Scoala Gimnaziala Raciu	18	\N	\N
38087	Scoala Cu Clasele I-viii Buica Ionescu	18	\N	\N
38088	Scoala Gimnaziala Gura Foii	18	\N	\N
38089	Scoala Gimnaziala Rascaieti	18	\N	\N
38090	Scoala Gimnaziala Iedera De Jos	18	\N	\N
38091	Scoala Gimnaziala Potlogi	18	\N	\N
38092	Scoala Gimnaziala Radu Cel Mare	18	\N	\N
38093	Gradinita Cu Program Prelungit Inocenta	18	\N	\N
38094	Scoala Gimnaziala Mihai Viteazul	18	\N	\N
38095	Scoala Cu Clasele I-viii Aninoasa	18	\N	\N
38096	Liceul De Arte Balasa Doamna	18	\N	\N
38097	Scoala Cu Clasele I-viii Dora Dalles	18	\N	\N
38098	Scoala Gimnaziala Grigore Radulescu Bezdead	18	\N	\N
38099	Scoala Gimnaziala Gura Sutii	18	\N	\N
38100	Scoala Gimnaziala Niculesti	18	\N	\N
38101	Scoala Gimnaziala Varfuri	18	\N	\N
38102	Scoala Gimnaziala Butimanu	18	\N	\N
38103	Scoala Gimnaziala Petresti	18	\N	\N
38104	Scoala Gimnaziala Costestii Din Vale	18	\N	\N
38105	Scoala Gimnaziala Persinari	18	\N	\N
38106	Scoala Gimnaziala Nr.4 Elena Donici Cantacuzino	18	\N	\N
38107	Scoala Gimnaziala Nr1  Il Caragiale	18	\N	\N
38108	Gradinita De Copii Nr.14 Cu Program Prelungit Cu Plata Cu Cresa	18	\N	\N
38109	Grup Scolar Agricol	18	\N	\N
38110	Scoala Gimnaziala Nr.3 Moreni	18	\N	\N
38111	Scoala Gimnaziala Iosif Gabrea Valeni	18	\N	\N
38112	Gradinita  Nr.13 Targoviste	18	\N	\N
38113	Scoala Gimnaziala Crevedia	18	\N	\N
38114	Scoala Gimnaziala Tu Dor Vladimirescu	18	\N	\N
38115	Scoala Gimnaziala Romanesti	18	\N	\N
38116	Liceul Teoretic Petru Cercel Targoviste	18	\N	\N
38117	Gradinita Cu Program Prelungit Nr.2	18	\N	\N
38118	Scoala Gimnaziala Produlesti	18	\N	\N
38119	Scoala Gimnaziala Cricov Valea Lunga	18	\N	\N
38120	Liceul Tehnologic Nicolae Mihaescu	18	\N	\N
38121	Scoala Gimnaziala Slobozia Moara	18	\N	\N
38122	Scoala Gimnaziala Iancu Vacarescu	18	\N	\N
38123	Scoala Gimnaziala Radu Cel Mare Gaesti	18	\N	\N
38124	Scoala Gimnaziala Ghinesti	18	\N	\N
38125	Gradinita Cu Program Normal Nr.8 Moreni	18	\N	\N
38126	Colegiul National Ion Luca Caragiale	18	\N	\N
38127	Scoala Cu Clasele I Viii Tatarani	18	\N	\N
38128	Gradinita De Copii Nr 3	18	\N	\N
38129	Scoala Gimnaziala Vulcana Pandele	18	\N	\N
38130	Scoala Gimnaziala Corbii Mari	18	\N	\N
38131	Scoala Gimnaziala Panait Georgescu Dobra	18	\N	\N
38132	Gradinita Cu Program Prelungit Alexandrina Simionescu Ghica	18	\N	\N
38133	Liceul Tehnologic Nucet	18	\N	\N
38134	Scoala Gimnaziala Nr.1	18	\N	\N
38135	Liceul Tehnologic Udrea Baleanu	18	\N	\N
38136	Scoala Gimnaziala Matasaru	18	\N	\N
38137	Scoala Gimnaziala Fantanele	18	\N	\N
38138	Liceul Teoretic Iancu C. Vissarion	18	\N	\N
38139	Liceul  Ion Heliade Radulescu Targoviste	18	\N	\N
38140	Scoala Gimnaziala Profjlie Popescu	18	\N	\N
38141	Liceul Tehnologic De Petrol Moreni	18	\N	\N
38142	Scoala Cu Clasele I-viii Matei Gr. Vladeanu Candesti-vale	18	\N	\N
38143	Colegiul National Constantin Cantacuzino	18	\N	\N
38144	Scoala Gimnaziala Ulmi	18	\N	\N
38145	Scoala Cu Clasele I-viii Spiru Haret	18	\N	\N
38146	Colegiul National Ienachita Vacarescu	18	\N	\N
38147	Scoala Gimnaziala Tartasesti	18	\N	\N
38148	Scoala Gimnaziala Pictor Nicolae Grigorescu Titu	18	\N	\N
38149	Scoala Gimnaziala Morteni	18	\N	\N
38150	Colegiul Economic Ion Ghica	18	\N	\N
38151	Scoala Gimnaziala Nicolae Vlad Pucheni	18	\N	\N
38152	Gradinita De Copii Nr. 1	18	\N	\N
38153	Scoala Gimnaziala Brezoaia-brezoaele	18	\N	\N
38154	Liceul Tehnologic Goga Ionescu Titu	18	\N	\N
38155	Scoala Gimnaziala Pietrari	18	\N	\N
38156	Gradinita Cu Program Prelungit Dumbrava Minunata	18	\N	\N
38157	Colegiul National Constantin Carabella Targoviste	18	\N	\N
38158	Scoala Gimnaziala Cornesti	18	\N	\N
38159	Scoala Gimnaziala Mogosani	18	\N	\N
38160	Liceul Teoretic Mihai Viteazul Visina	18	\N	\N
38161	Scoala Gimnaziala Ion Cioranescu Moroeni	18	\N	\N
38162	Scoala Gimnaziala Nr.1  Poiana	18	\N	\N
38163	Gradinita Raza De Soare	18	\N	\N
38164	Scoala Gimnaziala Raul Alb De Jos	18	\N	\N
38165	Scoala Gimnaziala Visinesti	18	\N	\N
38166	Scoala Gimnaziala Smaranda Dumitru Roman Vizuresti	18	\N	\N
38167	Scoala Gimnaziala Cojasca	18	\N	\N
38168	Scoala Gimnaziala Diaconu Coresi Fieni	18	\N	\N
38169	Liceul Tehnologic Constantin Brancoveanu Targoviste	18	\N	\N
38170	Scoala Gimnaziala Finta	18	\N	\N
38171	Scoala Gimnaziala Stan Stefan Vladeni	18	\N	\N
38172	Scoala Gimnaziala Nr 3 Doicesti	18	\N	\N
38173	Scoala Gimnaziala Ioan Alexandru Bratescu-voinesti	18	\N	\N
38174	Scoala Gimnaziala Rancaciov	18	\N	\N
38175	Scoala Cu Clasele I-viii Vasile Carlova	18	\N	\N
38176	Scoala Primara Motaieni	18	\N	\N
38177	Scoala Gimnaziala Nr.2 Titu Targ	18	\N	\N
38178	Scoala Gimnaziala Dr. Mioara Mincu	18	\N	\N
38179	Liceul Tehnologic Aurel Rainu	18	\N	\N
38180	Scoala Gimnaziala Patroaia—vale	18	\N	\N
38181	Scoala Cu Clasele I-viii Cornatelu	18	\N	\N
38182	Liceul Teoretic Racari	18	\N	\N
38183	Scoala Gimnaziala Nr. 4 Moreni	18	\N	\N
38184	Scoala Gimnaziala Matei Basarab	18	\N	\N
38185	Gradinita De Copii Nr.2 Targoviste	18	\N	\N
38186	Scoala Gimnaziala Lucieni	18	\N	\N
38187	Scoala Gimnaziala Gura Barbu Letului	18	\N	\N
38188	Gradinita Cu Program Prelungit Nr.15	18	\N	\N
38189	Scoala Gimnaziala Smaranda Gheorghiu	18	\N	\N
38190	Liceul Teoretic Adrian Paunescu Barca	19	\N	\N
38191	Scoala Profesionala Constantin Argetoianu	19	\N	\N
38192	Scoala Gimnaziala Castranova	19	\N	\N
38193	Scoala Gimnaziala Ghidici	19	\N	\N
38194	Scoala Gimnaziala Cerat	19	\N	\N
38195	Scoala Gimnaziala  Cosoveni	19	\N	\N
38196	Universitatea Din Craiova	19	\N	\N
38197	Universitatea Mihai Viteazul	19	\N	\N
38198	Liceul Tehnologic Ucecom Spiru Haret Craiova	19	\N	\N
38199	Scoala Gimnaziala Salcuta	19	\N	\N
38200	Scoala Gimnaziala Segarcea	19	\N	\N
38201	Scoala Gimnaziala Murgasi	19	\N	\N
38202	Scoala Gimnaziala Ghercesti	19	\N	\N
38203	Scoala Gimnaziala Galiciuica	19	\N	\N
38204	Gradinita Cu Program Prelungit Floarea Soarelui Craiova	19	\N	\N
38205	Scoala Gimnaziala Nr. 1 Mirsani	19	\N	\N
38206	Liceul Teoretic George St Marincu Poiana Mare	19	\N	\N
38207	Scoala Gimnaziala Afumati	19	\N	\N
38208	Gradinita Cu Program Prelungit Piticot Craiova	19	\N	\N
38209	Scoala Gimnziala Petre Manarcescu Lipovu	19	\N	\N
38210	Gradinita Cu Program Prelungit Voiniceii Craiova	19	\N	\N
38211	Liceul Tehnologic Alexandru Macedonski Melinesti	19	\N	\N
38212	Scoala Gimnaziala Dobrotesti	19	\N	\N
38213	Liceul Tehnologic Stefan Anghel Bailesti	19	\N	\N
38214	Scoala Gimnaziala Verbita	19	\N	\N
38215	Scoala Gimnaziala Sadova	19	\N	\N
38216	Liceul Voltaire Craiova	19	\N	\N
38217	Scoala Gimnaziala Ion Creanga Craiova	19	\N	\N
38218	Scoala Gimnaziala Dranic	19	\N	\N
38219	Liceul Charles Laugier Craiova	19	\N	\N
38220	Scoala Gimnaziala Secu	19	\N	\N
38221	Scoala Gimnaziala Nicolae Balcescu	19	\N	\N
38222	Liceul Tehnologic Ing. Ionete Aurelian Malu Mare	19	\N	\N
38223	Gradinita Cu Program Prelungit  Sf. Ana  Craiova	19	\N	\N
38224	Scoala Gimnaziala Podari	19	\N	\N
38225	Scoala Gimnaziala Varvoru De Jos	19	\N	\N
38226	Gradinita Cu Program Prelungit Petrache Poenaru Craiova	19	\N	\N
38227	Gradinita Cu Program Prelungit Elena Farago Craiova	19	\N	\N
38228	Scoala Gimnaziala Vartop	19	\N	\N
38229	Liceul Teoretic Mihai Viteazul Bailesti	19	\N	\N
38230	Scoala Gimnaziala Nr 3 Bailesti	19	\N	\N
38231	Liceul Traian Vuia Craiova	19	\N	\N
38232	Gradinita Cu Program Prelungit Ion Creanga Craiova	19	\N	\N
38233	Seminarul Teologic Ortodox Sf Grigorie Teologul Craiova	19	\N	\N
38234	Scoala Gimnaziala Talpas	19	\N	\N
38235	Colegiul Tehnic Energetic	19	\N	\N
38236	Scoala Gimnaziala Carol Al Ii-lea Diosti	19	\N	\N
38237	Scoala Profesionala Speciala Craiova	19	\N	\N
38238	Scoala Gimnaziala Elena Farago Craiova	19	\N	\N
38239	Scoala Gimnaziala Caraula	19	\N	\N
38240	Scoala Gimnaziala Ghindeni	19	\N	\N
38241	Scoala Gimnaziala Bistret	19	\N	\N
38242	Scoala Gimnaziala Cotofenii Din Fata	19	\N	\N
38243	Scoala Gimnaziala Nr. 5 Av. P. Ivanovici Bailesti	19	\N	\N
38244	Liceul Cu Program Sportiv Petrache Triscu	19	\N	\N
38245	Gradinita Cu Program Prelungit Casuta Fermecata Craiova	19	\N	\N
38246	Scoala Gimnaziala Unirea	19	\N	\N
38247	Scoala Gimnaziala Pielesti	19	\N	\N
38248	Liceul Tehnologic De Transporturi Auto Craiova	19	\N	\N
38249	Scoala Gimnaziala Teasc	19	\N	\N
38250	Colegiul National Elena Cuza	19	\N	\N
38251	Scoala Gimnaziala Breasta	19	\N	\N
38252	Scoala Gimnaziala CioroIași	19	\N	\N
38253	Scoala Gimnaziala Terpezita	19	\N	\N
38254	Scoala Profesionala Valea Stanciului	19	\N	\N
38255	Scoala Gimnaziala Gheorghe Bibescu Craiova	19	\N	\N
38256	Scoala Gimnaziala Stefan Ispas Maglavit	19	\N	\N
38257	Liceul Teoretic Tudor Arghezi	19	\N	\N
38258	Scoala Gimnaziala Amza Pellea Bailesti	19	\N	\N
38259	Liceul Teoretic Gheorghe Vasilichi	19	\N	\N
38260	Liceul Tehnologic Transporturi Cai Ferate Craiova	19	\N	\N
38261	Liceul Tehnologic Horia Vintila Segarcea	19	\N	\N
38262	Scoala Gimnaziala Giurgita	19	\N	\N
38263	Scoala Gimnaziala Fratostita	19	\N	\N
38264	Colegiul Stefan Odobleja	19	\N	\N
38265	Scoala Gimnaziala Barbu Ionescu	19	\N	\N
38266	Gradinita Cu Program Prelungit Nicolae Romanescu	19	\N	\N
38267	Scoala Gimnaziala Opsichie Cazacu Seaca De Padure	19	\N	\N
38268	Scoala Gimnaziala Anton Pann Craiova	19	\N	\N
38269	Colegiul Tehnic De Industrie Alimentara Craiova	19	\N	\N
38270	Scoala  Gimnaziala  Negoi	19	\N	\N
38271	Scoala Gimnaziala Orodel	19	\N	\N
38272	Scoala Gimnaziala Damian-sadova	19	\N	\N
38273	Scoala Gimnaziala Nr.1 Bailesti	19	\N	\N
38274	Scoala Gimnaziala Speciala Sf.vasile	19	\N	\N
38275	Scoala Gimnaziala Mihai Viteazul Craiova	19	\N	\N
38276	Scoala Gimnaziala Speciala Sf. Mina Craiova	19	\N	\N
38277	Scoala Gimnaziala Piscu Vechi	19	\N	\N
38278	Scoala Gimnaziala Sf. Dumitru	19	\N	\N
38279	Gradinita Cu Program Prelungit Paradisul Copiilor Craiova	19	\N	\N
38280	Liceul Tehnologic Constantin Ianculescu Carcea	19	\N	\N
38281	Colegiul National Nicolae Titu Lescu	19	\N	\N
38282	Scoala Gimnaziala Apele Vii	19	\N	\N
38283	Gradinita Cu Program Prelungit Casuta Cu Povesti Craiova	19	\N	\N
38284	Liceul Tehnologic Dimitrie Filisanu	19	\N	\N
38285	Gradinita Cu Program Prelungit Tudor Vladimirescu Craiova	19	\N	\N
38286	Scoala Gimnaziala Nr.1 Motatei	19	\N	\N
38287	Liceul Tehnologic George Bibescu Craiova	19	\N	\N
38288	Gradinita Cu Program Prelungit Curcubeul Copilariei Craiova	19	\N	\N
38289	Gradinita Cu Program Prelungit Dumbrava Minunata Craiova	19	\N	\N
38290	Scoala Gimnaziala Radovan	19	\N	\N
38291	Scoala Gimnaziala Bratovoesti	19	\N	\N
38292	Scoala Gimnaziala Nicolae Romanescu Craiova	19	\N	\N
38293	Scoala Gimnaziala Petrache Cernatescu	19	\N	\N
38294	Gradinita Cu Program Prelungit Sf.lucia Craiova	19	\N	\N
38295	Scoala Gimnaziala Robanestii De Jos	19	\N	\N
38296	Universitatea De Medicina Si Farmacie Craiova	19	\N	\N
38297	Liceul De Arte Marin Sorescu Craiova	19	\N	\N
38298	Scoala Gimnaziala Alecsandru Nicolaid Mischii	19	\N	\N
38299	Scoala Gimnaziala Rojiste	19	\N	\N
38300	Liceul Tehnologic Constantin Nicolaescu Plopsor Plenita	19	\N	\N
38301	Gradinita Cu Program Prelungit Phoenix Craiova	19	\N	\N
38302	Colegiul National Pedagogic Stefan Velovan	19	\N	\N
38303	Scoala Gimnaziala Plesoi	19	\N	\N
38304	Liceul Tehnologic Auto Craiova	19	\N	\N
38305	Colegiul Tehnic Costin D. Nenitescu	19	\N	\N
38306	Scoala Gimnaziala Marin Sorescu Bulzesti	19	\N	\N
38307	Scoala Gimnaziala Teslui	19	\N	\N
38308	Liceul Tehnologic Special Beethoven	19	\N	\N
38309	Scoala Gimnaziala Dobresti	19	\N	\N
38310	Scoala Gimnaziala Galicea Mare	19	\N	\N
38311	Scoala Gimnaziala Nr.1 Dabuleni	19	\N	\N
38312	Scoala Gimnaziala Nicolae Gh.popescu Intorsura	19	\N	\N
38313	Liceul Teoretic Amarastii De Jos	19	\N	\N
38314	Scoalagimnazialabelot	19	\N	\N
38315	Scoala Gimnaziala Lesile	19	\N	\N
38316	Scoala Gimnaziala Ion Tuculescu Craiova	19	\N	\N
38317	Scoala Gimnaziala Gighera	19	\N	\N
38318	Scoala Gimnaziala Ca Rna	19	\N	\N
38319	Scoala Gimnaziala Desa	19	\N	\N
38320	Scoala Gimnaziala Amarastii De Sus	19	\N	\N
38321	Scoala Gimnaziala Ilie Martin Brabova	19	\N	\N
38322	Liceul Matei Basarab Craiova	19	\N	\N
38323	Scoala Gimnaziala Izvoare	19	\N	\N
38324	Scoala Gimnaziala Mihai Eminescu	19	\N	\N
38325	Scoala Gimnaziala Goiesti	19	\N	\N
38326	Scoala Gimnaziala Tuglui	19	\N	\N
38327	Scoala Gimnaziala Sf. Gheorghe Craiova	19	\N	\N
38328	Scoala Gimnaziala Gogosu	19	\N	\N
38329	Scoala Gimnaziala Lascar Catargiu Craiova	19	\N	\N
38330	Scoala Gimnaziala Nica Barbu Locusteanu  Leu	19	\N	\N
38331	Scoala Gimnaziala Gh. Jienescu Rast	19	\N	\N
38332	Scoala Gimnaziala Eu Frosina Popescu	19	\N	\N
38333	Gradinita Cu Rpogram Prelungit Prichindel	20	\N	\N
38334	Gradinita Cu Program Prelungit Nr. 7	20	\N	\N
38335	Scoala Gimnaziala N.1 Independenta	20	\N	\N
38336	Scoala Postliceala Christiana	20	\N	\N
38337	Scoala Gimnaziala Nr. 1 Blanzi	20	\N	\N
38338	Scoala Gimnaziala Grigore Hagiu	20	\N	\N
38339	Scoala Gimnaziala Nr.1 Umbraresti	20	\N	\N
38340	Seminarul Teologic Ortodox Sf.andrei	20	\N	\N
38341	Scoala Gimnaziala Nr. 1 Liesti	20	\N	\N
38342	Universitatea Dunarea De Jos	20	\N	\N
38343	Scoala  Gimnaziala Nr 18	20	\N	\N
38344	Scoala Gimnaziala Miron Costin	20	\N	\N
38345	Scoala Gimnaziala Unirea Branistea	20	\N	\N
38346	Universitatea Danubius	20	\N	\N
38347	Scoala Gimnaziala Elena Doamna Cuza Voda	20	\N	\N
38348	Liceul Tehnologic Anghel Saligny	20	\N	\N
38349	Scoala Gimnaziala Nr.25	20	\N	\N
38350	Colegiul National Calistrat Hogas Tecuci	20	\N	\N
38351	Scoala Gimnaziala Vasile Seicaru Oancea	20	\N	\N
38352	Liceul De Arte Dimitrie Cuclin Galați	20	\N	\N
38353	Scoala Gimnaziala Lascar Catargiu	20	\N	\N
38354	Liceul Tehnologic Costache Conachi Pechea	20	\N	\N
38355	Scoala Gimnaziala Nr.24 Galați	20	\N	\N
38356	Scoala Gimnaziala Nr.1  Draguseni	20	\N	\N
38357	Scoala Gimnaziala Dimitrie Luchian	20	\N	\N
38358	Scoala Gimnaziala Nr. 1 Baleni	20	\N	\N
38359	Scoala Gimnaziala General Dumitru Damaceanu	20	\N	\N
38360	Gradinita Cu Program Prelungit Nr 64	20	\N	\N
38361	Scoala Gimnaziala Nr 1 Poiana	20	\N	\N
38362	Liceul Tehnologic Transporturi Cai Ferate	20	\N	\N
38363	Gradinita Cu Program Prelungit Licurici Galați	20	\N	\N
38364	Scoala Gimnaziala Alexei Mateevici Movileni	20	\N	\N
38365	Liceul Teoretic Emil Racovita Galați	20	\N	\N
38366	Scoala Gimnaziala Constantin Gh. Marinescu	20	\N	\N
38367	Scoala Gimnaziala Stefan  0. Iosif	20	\N	\N
38368	Gradinita Cu Program Prelungit Sf.stelian Galați	20	\N	\N
38369	Scoala Gimnaziala Negoita Danaila Bucesti	20	\N	\N
38370	Liceul Cu Program Sportiv	20	\N	\N
38371	Scoala Gimnaziala Nr. 1 Comuna Slobozia Conachi	20	\N	\N
38372	Scoala Gimnaziala Alexandru Moruzi	20	\N	\N
38373	Scoala Gimnaziala Natalia Negru Buciumeni	20	\N	\N
38374	Scoala Gimnaziala Nr. 1 Brahasesti	20	\N	\N
38375	Scoala Gimnaziala Victor Ion Popa Ivesti	20	\N	\N
38376	Colegiul National Mihail Kogalniceanu	20	\N	\N
38377	Gradinita Cu Program Prelungit Camil Ressu	20	\N	\N
38378	Gradinita Cu Program Prelungit Nr.9 Galați	20	\N	\N
38379	Scoala Gimnaziala Vasile Burlui	20	\N	\N
38380	Scoala Gimnaziala Nr 1 Grivita	20	\N	\N
38381	Gradinita Cu Program Prelungit Nr. 14 Tecuci	20	\N	\N
38382	Liceul Tehnologic Simion Mehedinți	20	\N	\N
38383	Scoala Gimnaziala Speciala Emil Garlenu Galați	20	\N	\N
38384	Scoala Gimnaziala Sfantul Nicolae Vinatori	20	\N	\N
38385	Liceul Teoretic Mircea Eliade Galați	20	\N	\N
38386	Scoala Gimnaziala Nr. 1 Sat Toflea	20	\N	\N
38387	Scoala Gimnaziala Nr.1	20	\N	\N
38388	Scoala Gimnaziala Sf.stelian Umbraresti-deal	20	\N	\N
38389	Scoala Gimnaziala Gabriel Dragan Nicoresti	20	\N	\N
38390	Scoala Gimnaziala Nr 1 Priponesti	20	\N	\N
38391	Scoala Gimnaziala Ion Petrovici Tecuci	20	\N	\N
38392	Scoala Gimnaziala Sfintii Imparati	20	\N	\N
38393	Colegiul Tehnic Traian Vuia	20	\N	\N
38394	Scoala Gimnaziala Nr.17	20	\N	\N
38395	Scoala Gimnaziala Nr.1 Adam	20	\N	\N
38396	Scoala Gimnaziala Ludovic Cosma Galați	20	\N	\N
38397	Scoala Gimnaziala Mihail Sadoveanu	20	\N	\N
38398	Colegiul Economic Virgil Madgearu	20	\N	\N
38399	Scoala Gimnaziala Speciala Constantin Pufan	20	\N	\N
38400	Gradinita Cu Program Preliungit Nr 36	20	\N	\N
38401	Colegiul De Industrie Alimentara Elena Doamna	20	\N	\N
38402	Scoala Gimnaziala Sfantul Grigorie Teologul	20	\N	\N
38403	Scoala Gimnaziala Nr. 26 Galați	20	\N	\N
38404	Colegiul Tehnic Radu Negru	20	\N	\N
38405	Gradinita Cu Program  Prelungit Codruta	20	\N	\N
38406	Scoala Gimnaziala Nr.22 Galați	20	\N	\N
38407	Scoala Gimnaziala Dimitrie Sturdza Tecuci	20	\N	\N
38408	Scoala Gimnaziala Dimitrie Cantemir Matca	20	\N	\N
38409	Gradinita Cu Program Prelungit Motanul Incaltat	20	\N	\N
38410	Scoala Gimnaziala Nr 1 Suhurlui	20	\N	\N
38411	Scoala Gimnaziala  Prof.emil Panaitescu Cudalbi	20	\N	\N
38412	Liceul Tehnologic Eremia Grigorescu Tg. Bujor	20	\N	\N
38413	Scoala Gimnaziala Gheorghe Poalelungi Mastacani	20	\N	\N
38414	Scoala Gimnaziala Nr 1 Jorasti	20	\N	\N
38415	Scoala Gimnaziala Petru Rares Frumusita	20	\N	\N
38416	Scoala Gimnaziala Tudor Pamfile Tepu	20	\N	\N
38417	Scoala Gimnaziala Sfantul Nicolae Liesti	20	\N	\N
38418	Scoala Gimnaziala Nr.1 Sat Slivna	20	\N	\N
38419	Scoala Gimnaziala Dan Barbilian Galați	20	\N	\N
38420	Scoala Gimnaziala Nr.28 Galați	20	\N	\N
38421	Scoala Gimnaziala Nr.5	20	\N	\N
38422	Scoala Gimnaziala Doamna Nica	20	\N	\N
38423	Scoala Gimnaziala Nr.1  Balasesti	20	\N	\N
38424	Gradinita Cu Program Prelungit Croitorasul Cel Viteaz Galați	20	\N	\N
38425	Scoala Gimnaziala Nr 1 Firtanesti	20	\N	\N
38426	Colegiul National Costache Negri Galați	20	\N	\N
38427	Gradinita Cu Program Prelungit Nr 1 Matca	20	\N	\N
38428	Scoala Gimnaziala Grigore Moisil	20	\N	\N
38429	Scoala Gimnaziala Stefan Cel Mare Galați	20	\N	\N
38430	Scoala Gimnaziala Anghel Rugina Tecuci	20	\N	\N
38431	Scoala Gimnaziala Nr.1 Fintinele	20	\N	\N
38432	Scoala Gimnaziala Ene Patriciu Smulti	20	\N	\N
38433	Liceul Tehnologic Paul Bujor	20	\N	\N
38434	Scoala Gimnaziala Nr 1 Matca	20	\N	\N
38435	Scoala Gimnaziala  George Ivascu Certesti	20	\N	\N
38436	Gradinita Cu Program Prelungit Nr.1 Galați	20	\N	\N
38437	Scoala Gimnaziala Nr. 1	20	\N	\N
38438	Scoala Gimnaziala Nr 1 Malu Alb	20	\N	\N
38439	Scoala Gimnaziala Iorgu Iordan Tecuci	20	\N	\N
38440	Scoala Gimnaziala Sf.trei Ierarhihanu Conachi	20	\N	\N
38441	Gradinita Cu Program Prelungit Nr. 30 Galați	20	\N	\N
38442	Scoala Gimnaziala Nr1  Draganesti	20	\N	\N
38443	Scoala Gimnaziala Nr 1 Sat Corni	20	\N	\N
38444	Colegiul National Alexandru Ioan Cuza	20	\N	\N
38445	Colegiul National Vasile Alecsandri Galați	20	\N	\N
38446	Colegiul Tehnic De Alimentatie Si Turism Dumitru Motoc	20	\N	\N
38447	Scoala Gimnaziala Ion Creanga Talpigi	20	\N	\N
38448	Liceul Tehnologic Elena Caragiani	20	\N	\N
38449	Colegiul National De Agricultura Si Economie Tecuci	20	\N	\N
38450	Scoala Gimnaziala Nr 29	20	\N	\N
38451	Scoala Gimnaziala Nr 10	20	\N	\N
38452	Gradinita Cu Program Prelungit Prichindel Tecuci	20	\N	\N
38453	Scoala Gimnaziala  Mihai Viteazul	20	\N	\N
38454	Scoala Gimnaziala Nr. 3	20	\N	\N
38455	Scoala Gimnaziala Nr.1 Negrilesti	20	\N	\N
38456	Colegiul Tehnic Aurel Vlaicu	20	\N	\N
38457	Scoala Gimnaziala Nr.1 Gaiseni	21	\N	\N
38458	Colegiul National Ion Maiorescu	21	\N	\N
38459	Scoala Gimnaziala Nr.1 Slobozia	21	\N	\N
38460	Scoala Gimnaziala Numarul 5	21	\N	\N
38461	Scoala Gimnaziala Nr.1  Fratesti	21	\N	\N
38462	Scoala Gimnaziala Nr. 1 Singureni	21	\N	\N
38463	Scoala Gimnaziala Nr.1 Calugareni Judetul Giurgiu	21	\N	\N
38464	Scoala Gimnaziala Marin Gh Popescu	21	\N	\N
38465	Scoala Gimnaziala Anghel Mares Gostinu	21	\N	\N
38466	Scoala Gimnaziala Academician Marin Voiculescu	21	\N	\N
38467	Scoala Gimnaziala Nr.1	21	\N	\N
38468	Scoala Gimnaziala Sfantul Gheorghe	21	\N	\N
38469	Scoala Gimnaziala Nr1 Stoen Esti	21	\N	\N
38470	Scoala Gimnaziala Nr. 1 Greaca	21	\N	\N
38471	Gradinita Cu Program Prelungit Dumbrava Minunata Giurgiu	21	\N	\N
38472	Scoala Gimnaziala Nr 1	21	\N	\N
38473	Scoala Gimnaziala Nichifor Crainic	21	\N	\N
38474	Scoala Gimnaziala Nr.1 Iepuresti	21	\N	\N
38475	Scoala Gimnaziala Mihai Eminescu	21	\N	\N
38476	Liceul Tehnologic Mihai Viteazul Comcalugareni Jud.giurgiu	21	\N	\N
38477	Scoala Gimnaziala Nr.2 Cartojani	21	\N	\N
38478	Scoala Gimnaziala Nr.1  Putineiu	21	\N	\N
38479	Gradinita Cu Program Prelungit Prichindeii	21	\N	\N
38480	Liceul Tehnologic Tiu  Dumitrescu	21	\N	\N
38481	Scoala Gimnaziala Nr.1 Gostinari	21	\N	\N
38482	Liceul Udriste Nastu Rel	21	\N	\N
38483	Scoala Gimnaziala Nr.1  Floresti	21	\N	\N
38484	Scoala Gimnaziala  Draghici Davila	21	\N	\N
38485	Scoala Gimnaziala Banu Baleanu	21	\N	\N
38486	Seminarul Teologic Ortodox Teoctst Patriarhul	21	\N	\N
38487	Liceul Teoretic Nicolae Cartojan	21	\N	\N
38488	Colegiul Tehnic Viceamiral Ioan Balanescu	21	\N	\N
38489	Scoala Gimnaziala Stolnicul Constantin  Cantacuzino Isvoarele	21	\N	\N
38490	Scoala Gimnaziala Nr.1  Prundu	21	\N	\N
38491	Scoala Gimnaziala Nr.1 Letca Noua	21	\N	\N
38492	Scoala Gimnaziala Nr. 1 Joita	21	\N	\N
38493	Scoala Gimnaziala Mircea Cel Batran Giurgiu	21	\N	\N
38494	Liceul Tehnologic Miron  Nicolescu	21	\N	\N
38495	Liceul Tehnologic Ion  Barbu	21	\N	\N
38496	Scoala Gimnaziala Marin M.ticulescu Baneasa	21	\N	\N
38497	Scoala Gimnaziala Nicolae Crevedia	21	\N	\N
38498	Scoala Gimnaziala Speciala Nr.1  Giurgiu	21	\N	\N
38499	Scoala Gimnaziala Constantin Stancescu	21	\N	\N
38500	Scoala Gimnaziala Nr. 1	21	\N	\N
38501	Scoala Gimnaziala Nr. 1 Vanatorii Mici	21	\N	\N
38502	Scoala Gimnaziala Nr. 3	21	\N	\N
38503	Liceul Tehnologic Nrj  Prundu	21	\N	\N
38504	Scoala Gimnaziala Nr.1 Ad.copaceni	21	\N	\N
38505	Scoala Gimnaziala Ioan Badila Malu	21	\N	\N
38506	Scoala Gimnaziala Nr.1 Ghimpati	21	\N	\N
38507	Scoala Gimnaziala Elina Basarab	21	\N	\N
38508	Scoala Gimnaziala Nr.1 Clfjani	21	\N	\N
38509	Scoala Gimnaziala Dumitru Constantin	21	\N	\N
38510	Liceul Tehnologic Giurgiu	21	\N	\N
38511	Gradinita Cu Program Prelungit Casuta Fermecata Giurgiu	21	\N	\N
38512	Scoala Gimnaziala Nr. 1 Buturugeni	21	\N	\N
38513	Scoala Gimnaziala Nr.7	21	\N	\N
38514	Scoala Gimnaziala Aurel Solacolu	21	\N	\N
38515	Scoala Gimnaziala Nr.1 Cosoba	21	\N	\N
38516	Scoala Gimnaziala Nr 1  Bolintin Vale	21	\N	\N
38517	Scoala Gimnaziala Nr. 1 Gradinari	21	\N	\N
38518	Scoala Gimnaziala De Arta Victor Karpis	21	\N	\N
38519	Scoala Gimnaziala Nr.1  Izvoarele	21	\N	\N
38520	Scoala Gimnaziala Numarul 10	21	\N	\N
38521	Liceul Tehnologic Nrj Comana	21	\N	\N
38522	Gradinita Cu Program Prelungit Nr.1 Tg Jiu	22	\N	\N
38523	Scoala Gimnaziala Nr.1  Danesti	22	\N	\N
38524	Liceul Teoretic Novaci	22	\N	\N
38525	Scoala Gimnaziala Nr 1 Motru	22	\N	\N
38526	Scoala Gimnaziala Slivilesti	22	\N	\N
38527	Scoala Gimnaziala Constantin Brancusi Tg Jiu	22	\N	\N
38528	Liceul Tehnologic Baia De Fier	22	\N	\N
38529	Liceul Tehnologic Gen Eralconstantin Sandru Bilta	22	\N	\N
38530	Liceul Tehnologic  Birsesti	22	\N	\N
38531	Scoala Gimnaziala Sfantul Nicolae	22	\N	\N
38532	Scoala Gimnaziala Mazilu Vipie Gheorghe	22	\N	\N
38533	Scoala Gimnaziala Sacelu	22	\N	\N
38534	Scoala Gimnaziala Nicolae Tomovici Plopsor	22	\N	\N
38535	Scoala Gimnaziala Balcesti	22	\N	\N
38536	Scoala Gimnaziala Nr.1  Bumbesti-jiu	22	\N	\N
38537	Colegiul Economic Virgil Madgearu	22	\N	\N
38538	Colegiul National Spiru Haret	22	\N	\N
38539	Liceul De Arte Constantin Brailoiu  Tg-jiu	22	\N	\N
38540	Scoala Gimnaziala Lihulesti	22	\N	\N
38541	Liceul Tehnologic Rosia De Amaradia	22	\N	\N
38542	Colegiul Auto Traian Vuia	22	\N	\N
38543	Colegiul Gheorghe Tatarescu	22	\N	\N
38544	Colegiul Mihai Viteazul	22	\N	\N
38545	Scoala Gimnaziala Ecaterina Teodoroiu	22	\N	\N
38546	Liceul Tehnologic Rosia Jiu	22	\N	\N
38547	Scoala Gimnaziala Antonie Mogos Ceau Ru	22	\N	\N
38548	Colegiul Tehnic Matasari	22	\N	\N
38549	Scoala Gimnaziala Nr.1 Albeni	22	\N	\N
38550	Colegiul Tehnic Nr.2 Tg Jiu	22	\N	\N
38551	Liceul Tehnologic Ticleni	22	\N	\N
38552	Scoala Gimnaziala Cruset	22	\N	\N
38553	Scoala Gimnaziala Voievod Litovoi	22	\N	\N
38554	Colegiul Tehnic  Henri Coanda	22	\N	\N
38555	Scoala Gimnaziala Ionesti	22	\N	\N
38556	Colegiul Tehnic General Gheorghe Magheru	22	\N	\N
38557	Scoala Gimnaziala Prof Nicolae Caranda	22	\N	\N
38558	Scoala Gimnaziala Cornelius Radu	22	\N	\N
38559	Scoala Gimnaziala Nr.1 Andreesti	22	\N	\N
38560	Scoala Gimnaziala Nr.1  Polovragi	22	\N	\N
38561	Colegiul National  Ecaterina Teodoroiu Tg-jiu	22	\N	\N
38562	Scoala  Gimnaziala Pompiliu Marcea Tg-jiu	22	\N	\N
38563	Scoala Gimnaziala Jupinesti	22	\N	\N
38564	Scoala Gimnaziala Constantin Savoiu	22	\N	\N
38565	Liceul Tehnologic Tu Rbu Rea	22	\N	\N
38566	Scoala Gimnaziala Capu Dealului	22	\N	\N
38567	Scoala Gimnaziala Capreni	22	\N	\N
38568	Scoala Gimnaziala Gheorghe Tatarascu	22	\N	\N
38569	Colegiul National Tu Dor Arghezi	22	\N	\N
38570	Gradinita Cu Program Prelungit Vis De Copil Tg-jiu	22	\N	\N
38571	Gradinita Cu Program Prelungit Mihai Eminescu Tg-jiu	22	\N	\N
38572	Scoala Gimnaziala Nr.1 Telesti	22	\N	\N
38573	Scoala Gimnaziala Pades	22	\N	\N
38574	Scoala Gimnaziala Alimpesti	22	\N	\N
38575	Scoala Gimnaziala Hurezani	22	\N	\N
38576	Liceul Tehnologic Bilteni	22	\N	\N
38577	Scoala Gimnaziala Ion Popescu Barbatesti	22	\N	\N
38578	Scoala Gimnaziala Negreni	22	\N	\N
38579	Colegiul National George Cosbuc Motru	22	\N	\N
38580	Gradinita Cu Program Prelungit Rovinari	22	\N	\N
38581	Scoala Gimnaziala Nr.3 Rovinari	22	\N	\N
38582	Scoala Gimnaziala Grigore Geamanu Turcinesti	22	\N	\N
38583	Liceul Teologic Tg-jiu	22	\N	\N
38584	Scoala Gimnaziala Prigoria	22	\N	\N
38585	Scoala Gimnaziala Nr.1 Stejari	22	\N	\N
38586	Liceul Cu Program Sportiv Tgjiu	22	\N	\N
38587	Scoala Gimnaziala Aninoasa	22	\N	\N
38588	Liceul Tehnologic Stoina	22	\N	\N
38589	Scoala Gimnaziala Nr.1  Rovinari	22	\N	\N
38590	Liceul Tehnologic Bustuchin	22	\N	\N
38591	Scoala Gimnaziala Stanesti	22	\N	\N
38592	Gradinita Cu Program Prelungit Nr.8 Tg-jiu	22	\N	\N
38593	Scoala Gimnaziala Cilnic	22	\N	\N
38594	Scoala Gimnaziala Nicolae Costescu	22	\N	\N
38595	Scoala Gimnaziala Sau Lesti	22	\N	\N
38596	Scoala Gimnaziala Tintareni	22	\N	\N
38597	Scoala Gimnaziala Godinesti	22	\N	\N
38598	Scoala Gimnaziala Nr 1 Urdari	22	\N	\N
38599	Scoala Gimnaziala Nr 1 Vagiulesti	22	\N	\N
38600	Scoala Gimnaziala Nr.1 Ticleni	22	\N	\N
38601	Liceul Tehnologic Tismana	22	\N	\N
38602	Scoala Gimnaziala Simbotin	22	\N	\N
38603	Scoala Gimnaziala Bumbesti Pitic	22	\N	\N
38604	Scoala Gimnaziala Corobai	22	\N	\N
38605	Universitatea Constantin Brancusi Din Targu Jiu	22	\N	\N
38606	Colegiul Tehnic Banyai Janos	23	\N	\N
38607	Scoala Gimnaziala Nyiro Jozsef Frumoasa	23	\N	\N
38608	Scoala Gimnaziala Siklodi Lorinc	23	\N	\N
38609	Scoala Gimnaziala Tu Lghes	23	\N	\N
38610	Scoala Gimnaziala Martonffy Gyorgy	23	\N	\N
38611	Gradinita Aranyalma	23	\N	\N
38612	Scoala Gimnaziala Dumitru Gafton	23	\N	\N
38613	Scoala Gimnaziala Gal Sandor Ciucsingeorgiu	23	\N	\N
38614	Gradinita Mesevar Cristuru Secuiesc	23	\N	\N
38615	Liceul De Arta Pallo Imre Odorheiu Secuiesc	23	\N	\N
38616	Scoala Gimnaziala Benedek Elek	23	\N	\N
38617	Scoala Gimnaziala Tompa Laszlo	23	\N	\N
38618	Liceul Miron Cristea	23	\N	\N
38619	Scoala Gimnaziala Dr Lukacs Mihaly	23	\N	\N
38620	Scoala Gimnaziala Oc.taslauanu	23	\N	\N
38621	Liceul Teoretic Salamon Erno Gh Eorgheni	23	\N	\N
38622	Colegiul Tehnic Batthyany Ignac Gheorgheni	23	\N	\N
38623	Liceul Tehnologic Gabor Aron Vlahita	23	\N	\N
38624	Scoala Gimnaziala Orban Balazs	23	\N	\N
38625	Liceul Teoretic Orban Balazs Cristuru Secuiesc	23	\N	\N
38626	Liceul Teologic Romano-catolic Szent Erzsebet	23	\N	\N
38627	Colegiul Reformat Baczkamadarasi Kis Gergely	23	\N	\N
38628	Scoala Gimnaziala Jokai Mor	23	\N	\N
38629	Gradinita Villanytelep Odorheiu Secuiesc	23	\N	\N
38630	Scoala Gimnaziala Valea Rece	23	\N	\N
38631	Liceul Tehnologic Kos Karoly	23	\N	\N
38632	Colegiul National Marton Aron Miercurea Ciuc	23	\N	\N
38633	Scoala Gimnaziala Roman Viktor	23	\N	\N
38634	Scoala Gimnaziala Nagy Istvan Misentea	23	\N	\N
38635	Liceul Teoretic Tamasi Aron Odorheiu Secuiesc	23	\N	\N
38636	Gradinita Csillagvar Odorheiu Secuiesc	23	\N	\N
38637	Scoala Gimnaziala Xantus Janos	23	\N	\N
38638	Scoala Gimnaziala Josika Miklos Atid	23	\N	\N
38639	Scoala Gimnaziala Korosi Csoma Sandor	23	\N	\N
38640	Scoala Gimnaziala Nyiro Jozef	23	\N	\N
38641	Gradinita Kis Herceg	23	\N	\N
38642	Liceul Tehnologic Zimmethausen	23	\N	\N
38643	Scoala Gimnaziala Arany Janos Santimbru	23	\N	\N
38644	Scoala Gimnaziala Miron Cristea Toplita	23	\N	\N
38645	Scoala Gimnaziala Petofi Sandor	23	\N	\N
38646	Gradinita Ficanka Odorheiu Secuiesc	23	\N	\N
38647	Scoala Profesionala Speciala Szent Anna Miercurea Ciuc	23	\N	\N
38648	Colegiul National Mihai Eminescu Toplita	23	\N	\N
38649	Scoala Gimnaziala  Kiss Ferenc	23	\N	\N
38650	Scoala Gimnaziala Kollo Miklos	23	\N	\N
38651	Scoala  Gimnaziala Vitos Mozes	23	\N	\N
38652	Scoala Gimnaziala Tamasi Aron Lupeni	23	\N	\N
38653	Scoala Gimnaziala Teodor Chindea	23	\N	\N
38654	Scoala Gimnaziala Maj Lath Gusztav Karoly Lunca De Jos	23	\N	\N
38655	Liceul Tehnologic Liviu  Rebreanu	23	\N	\N
38656	Scoala Gimnaziala Jozsef Attila Miercurea Ciuc	23	\N	\N
38657	Scoala Gimnaziala Andrei Saguna Toplita	23	\N	\N
38658	Scoala Gimnaziala Frater Gyorgy	23	\N	\N
38659	Scoala Gimnaziala Dr. Boga Alajos	23	\N	\N
38660	Liceul Pedagogic Benedek Elek	23	\N	\N
38661	Liceul Tehnologic Tivai  Nagy Imre	23	\N	\N
38662	Liceul Tehnologic Sover Elek Joseni	23	\N	\N
38663	Liceul Tehnologic Fogarasy Mihaly	23	\N	\N
38664	Gradinita Kipi-kopi Odorheiu-secuiesc	23	\N	\N
38665	Scoala Gimnaziala Janos Zsigmond	23	\N	\N
38666	Gradinita Zsibongo Odorheiu-secuiesc	23	\N	\N
38667	Liceul Teologic Romano Catolic Segito Maria Miercurea Ciuc	23	\N	\N
38668	Liceul Teoretic Sfantu Nicolae	23	\N	\N
38669	Gradinita Voinicel Toplita	23	\N	\N
38670	Scoala Gimnaziala Sacel	23	\N	\N
38671	Gradinita Eszterlanc Odorheiu Secuiesc	23	\N	\N
38672	Liceul Teologic Unitarian Berde Mozes	23	\N	\N
38673	Scoala Gimnaziala Vaskertes	23	\N	\N
38674	Scoala Gimnaziala Cserei Mihaly	23	\N	\N
38675	Liceul Tehnologic Eotvos Jozsef	23	\N	\N
38676	Scoala Gimnziala Nagy Imre	23	\N	\N
38677	Scoala Populara De Arta Si Meserii A Judetului Harghita	23	\N	\N
38678	Scoala Gimnaziala Szekely Mozes	23	\N	\N
38679	Colegiul National Octavian Goga Miercurea Ciuc	23	\N	\N
38680	Scoala Gimnaziala Elekes Vencel	23	\N	\N
38681	Scoala Gimnaziala Kajoni Janos	23	\N	\N
38682	Scoala Gimnaziala Arany Janos	23	\N	\N
38683	Scoala Gimnaziala Balintvilmos Tomesti	23	\N	\N
38684	Liceul Tehnologic Petofi Sandor Danesti	23	\N	\N
38685	Scoala Gimnaziala Porumbenii Mari	23	\N	\N
38686	Liceul Tehnologic Szekely Karoly	23	\N	\N
38687	Scoala Gimnaziala Liviu Rebreanu Miercurea Ciuc	23	\N	\N
38688	Scoala Gimnaziala Marosi Gergely	23	\N	\N
38689	Scoala Gimnaziala Mircea Santimbreanu	24	\N	\N
38690	Scoala Gimnaziala I.g. Duca Petrosani	24	\N	\N
38691	Scoala Gimnaziala Sarmizegetusa	24	\N	\N
38692	Liceul Tehnologic Ovid Densusianu Calan	24	\N	\N
38693	Colegiul National Decebal	24	\N	\N
38694	Scoala Primara Lelese	24	\N	\N
38695	Scoala Gimnaziala Sfanta Varvara Aninoasa	24	\N	\N
38696	Scoala Gimnaziala Densus	24	\N	\N
38697	Scoala Gimnaziala Dominic Stanca Orastie	24	\N	\N
38698	Scoala Gimnaziala Baita	24	\N	\N
38699	Scoala Gimnaziala Zam	24	\N	\N
38700	Scoala Gimnaziala Vata De Jos	24	\N	\N
38701	Scoala Primara Hasdau	24	\N	\N
38702	Scoala Gimnaziala Nr. 3 Lupeni	24	\N	\N
38703	Colegiul Tehnic Agricol Alexandru Borza Geoagiu	24	\N	\N
38704	Scoala Gimnaziala Nr.7 Petrosani	24	\N	\N
38705	Scoala Primara Cerbal	24	\N	\N
38706	Scoala Primara Tomesti	24	\N	\N
38707	Colegiul National I.c.bratianu Hateg	24	\N	\N
38708	Scoala Gimnaziala Nr.2 Hunedoara	24	\N	\N
38709	Liceul Teoretic Ghelari	24	\N	\N
38710	Scoala Gimnaziala Bosorod	24	\N	\N
38711	Scoala Gimnaziala Horea Closca Si Crisan Brad	24	\N	\N
38712	Scoala Gimnaziala Rau De Mori	24	\N	\N
38713	Scoala Primara Burjuc	24	\N	\N
38714	Colegiul National De Informatica Traian Lalescu Hunedoara	24	\N	\N
38715	Scoala Gimnaziala Valisoara	24	\N	\N
38716	Scoala Gimnaziala Lunca Cernii De Jos	24	\N	\N
38717	Scoala Gimnaziala Romos	24	\N	\N
38718	Colegiul Tehnic Constantin Brancusi	24	\N	\N
38719	Liceul Tehnologic Grigore Moisil Deva	24	\N	\N
38720	Colegiul Economic Emanuil Gojdu	24	\N	\N
38721	Scoala Gimnaziala Bacia	24	\N	\N
38722	Scoala Gimnaziala Banita	24	\N	\N
38723	Scoala Gimnaziala I.d. Sirbu Petrila	24	\N	\N
38724	Scoala Gimnaziala Nr 1 Hunedoara	24	\N	\N
38725	Colegiul National Mihai Eminescu Petrosani	24	\N	\N
38726	Scoala Primara Pricaz	24	\N	\N
38727	Scoala Gimnaziala Nr 4 Vulcan	24	\N	\N
38728	Scoala Gimnaziala Ion Buteanu Buces	24	\N	\N
38729	Gradinita Cu Program Prelungit Nr.7 Deva	24	\N	\N
38730	Scoala Gimnaziala Rapoltu Mare	24	\N	\N
38731	Scoala Gimnaziala Harau	24	\N	\N
38732	Universitatea Ecologică Traian	24	\N	\N
38733	Gradinita Cu Program Prelungit Dumbrava Minunata Hunedoara	24	\N	\N
38734	Scoala Primara Reea	24	\N	\N
38735	Colegiul Tehnic Transilvania	24	\N	\N
38736	Scoala Primara Martinesti	24	\N	\N
38737	Scoala Gimnaziala Rachitova	24	\N	\N
38738	Gradinita Casuta Cu Povesti Orastie	24	\N	\N
38739	Universitatea Din Petrosani	24	\N	\N
38740	Colegiul National Iancu De Hunedoara	24	\N	\N
38741	Scoala Primara General Berthelot	24	\N	\N
38742	Colegiul Tehnic Dimitrie Leonida Petrosani	24	\N	\N
38743	Colegiul National Sportiv Cetate Deva	24	\N	\N
38744	Colegiul National Pedagogic Regina Maria Deva	24	\N	\N
38745	Colegiul Economic Hermes Petrosani	24	\N	\N
38746	Gradinita Cu Program Normal Lumea Copiilor Lupeni	24	\N	\N
38747	Scoala Gimnaziala Avram Iancu Baia De Cris	24	\N	\N
38748	Scoala Gimnaziala Petros	24	\N	\N
38749	Scoala Gimnaziala Hadrian Daicoviciu Orastioara De Sus	24	\N	\N
38750	Scoala Primara Balsa	24	\N	\N
38751	Liceul Tehnologic Nicolaus Olah Us Orastie	24	\N	\N
38752	Scoala Gimnaziala Ohaba	24	\N	\N
38753	Scoala Gimnaziala Sabin Oprean Bucuresci	24	\N	\N
38754	Colegiul Tehnic Matei Corvin	24	\N	\N
38755	Scoala Gimnaziala Teliucu Inferior	24	\N	\N
38756	Liceul Tehnologic Crisan Criscior	24	\N	\N
38757	Scoala Gimnaziala Luncoiu De Jos	24	\N	\N
38758	Colegiul National Aurel Vlaicu Orastie	24	\N	\N
38759	Colegiul Tehnic De Transport Feroviar Anghel Saligny Simeria	24	\N	\N
38760	Liceul Tehnologic Constantin Bursan Hunedoara	24	\N	\N
38761	Scoala Gimnaziala Dr. Aurel Vlad Orastie	24	\N	\N
38762	Scoala Gimnaziala Andrei Saguna Deva	24	\N	\N
38763	Gradinita Cu Program Prelungit Floare De Colt Brad	24	\N	\N
38764	Scoala Gimnaziala Bretea Romana	24	\N	\N
38765	Liceul Teoretic Mircea Eliade Lupeni	24	\N	\N
38766	Liceul Tehnologic Retezat Uricani	24	\N	\N
38767	Scoala Gimnaziala Soimus	24	\N	\N
38768	Scoala Gimnaziala Giurgeni	25	\N	\N
38769	Scoala Gimnaziala Ciochina	25	\N	\N
38770	Scoala Gimnaziala Movilita	25	\N	\N
38771	Scoala Gimnaziala Colelia	25	\N	\N
38772	Scoala Gimnaziala Alexandru Radu Lescu Marculesti	25	\N	\N
38773	Scoala Gimnaziala Salcioara	25	\N	\N
38774	Liceul Tehnologic Sfanta Ecaterina	25	\N	\N
38775	Liceul Tehnologic Inaltarea Domnului Slobozia	25	\N	\N
38776	Scoala Gimnaziala Barbulesti	25	\N	\N
38777	Scoala Profesionala Reviga	25	\N	\N
38778	Scoala Gimnaziala  Capitan  Aviator Constantin M Cantacuzino	25	\N	\N
38779	Gradinita Cu Program Prelungit Nr.2	25	\N	\N
38780	Scoala Gimnazialaionel Perlea Ograda	25	\N	\N
38781	Scoala Primara Buesti	25	\N	\N
38782	Scoala  Primara Sarateni	25	\N	\N
38783	Scoala Gimnaziala Roman Ialomiteanul	25	\N	\N
38784	Gradinita Cu Program Prelungit Voinicelul	25	\N	\N
38785	Scoala Gimnaziala  Alexandru Aldea Voievod	25	\N	\N
38786	Scoala Gimnaziala Arhanghelii Mihail Si Gavriil Munteni-Buzău	25	\N	\N
38787	Scoala Profesionala Traian	25	\N	\N
38788	Liceul Tehnologic  Fierbinti-targ	25	\N	\N
38789	Scoala Gimnaziala Perieti	25	\N	\N
38790	Scoala Gimnaziala  Valea Macrisului	25	\N	\N
38791	Liceul Tehnologic Cazan Esti	25	\N	\N
38792	Scoala Gimnaziala Platonesti	25	\N	\N
38793	Scoala Gimnaziala Facaeni	25	\N	\N
38794	Scoala Gimnaziala Vladeni	25	\N	\N
38795	Scoala Gimnaziala Ion Heliade Radulescu	25	\N	\N
38796	Scoala Profesionala Mihail Kogalniceanu	25	\N	\N
38797	Gradinita Cu Program Prelungit Dumbrava Minunata	25	\N	\N
38798	Seminarul Teologic Ortodox Sf.ioan Gura De Aur	25	\N	\N
38799	Liceul Tehnologic Anghel Saligny Fetesti	25	\N	\N
38800	Liceul De Arte Ionel Perlea Slobozia	25	\N	\N
38801	Scoala Gimnaziala Stefan Copoiu An Drasesti	25	\N	\N
38802	Liceul Teoretic Carol I Fetesti	25	\N	\N
38803	Scoala Gimnaziala Gheorghe Doja	25	\N	\N
38804	Scoala Gimnaziala Manasia	25	\N	\N
38805	Gradinita Cu Program Prelungit Alba Ca Zapada  Fetesti	25	\N	\N
38806	Colegiul National Mihai Viteazul Slobozia	25	\N	\N
38807	Scoala Gimnaziala Dimitrie Cantemir Fetesti	25	\N	\N
38808	Colegiul National Grigore Moisil-urziceni	25	\N	\N
38809	Scoala Gimnaziala Gheorghe Lazar Slobozia	25	\N	\N
38810	Liceul Tehnologic Al. Ioan Cuza Slobozia	25	\N	\N
38811	Scoala Gimnaziala Alexandru Odobescu Urziceni	25	\N	\N
38812	Liceul Tehnologic Urziceni	25	\N	\N
38813	Liceul Pedagogic Matei Basarab Slobozia	25	\N	\N
38814	Scoala Gimnaziala Dridu	25	\N	\N
38815	Scoala Gimnaziala  Sf. Andrei Slobozia	25	\N	\N
38816	Liceul Tehnologic De Industrie Alimentara Fetesti	25	\N	\N
38817	Scoala Gimnaziala Constantin Gurgu  Nr 1 Gura Ialomitei	25	\N	\N
38818	Scoala Gimnaziala Ciulnita	25	\N	\N
38819	Liceul Tehnologic Iordache Zossima	25	\N	\N
38820	Gradinita Cu Program Prelungit Amara	25	\N	\N
38821	Scoala Gimnaziala Constantin Stefan Albesti	25	\N	\N
38822	Scoala Gimnaziala Spiru Haret Tandarei	25	\N	\N
38823	Liceul Tehnologic Tandarei	25	\N	\N
38824	Scoala Gimnaziala Cosambesti	25	\N	\N
38825	Scoala Gimnaziala Gheorghe Lazar	25	\N	\N
38826	Gradinita Cu Program Prelungitjunior Slobozia	25	\N	\N
38827	Scoala Gimnaziala George Valsan Amara	25	\N	\N
38828	Scoala Gimnaziala Barbu Catargiu Maia	25	\N	\N
38829	Scoala Gimnaziala Milosesti	25	\N	\N
38830	Scoala Gimnaziala Valea Ciorii	25	\N	\N
38831	Scoala Postliceala Sanitara-slobozia	25	\N	\N
38832	Scoala Gimnaziala Cocora	25	\N	\N
38833	Scoala Gimnaziala Sinesti	25	\N	\N
38834	Liceul Tehnologic Areta Teodorescu Grivita	25	\N	\N
38835	Colegiul National Garabet Ibraileanu Iași	26	\N	\N
38836	Institutul de Studii Europene	26	\N	\N
38837	Universitatea Apollonia	26	\N	\N
38838	Universitatea Petre Andrei	26	\N	\N
38839	Universitatea Gheorghe Zane	26	\N	\N
38840	Institutul Teologic Romano-Catolic Sfântul Iosif	26	\N	\N
38841	Universitatea Națională de Arte George Enescu	26	\N	\N
38842	Scoala Gimnaziala Ion Haulica Ipatele	26	\N	\N
38843	Universitatea de Medicină și Farmacie Grigore T. Popa	26	\N	\N
38844	Scoala Gimnaziala Iordache Cantacuzino Pascani	26	\N	\N
38845	Scoala Gimnaziala Helesteni	26	\N	\N
38846	Scoala Gimnaziala Letcani	26	\N	\N
38847	Scoala Gimnaziala Chiscareni	26	\N	\N
38848	Scoala Gimnaziala Crucea	26	\N	\N
38849	Colegiul Tehnic De Cai Ferate Unirea Pascani	26	\N	\N
38850	Gradinita Cu Program Prelungit Nr.2 6	26	\N	\N
38851	Liceul Tehnologic Lespezi	26	\N	\N
38852	Scoala Gimnaziala Popricani	26	\N	\N
38853	Scoala Gimnaziala Constantin Erbiceanu Erbiceni	26	\N	\N
38854	Scoala Gimnaziala Nr. 1 Todiresti	26	\N	\N
38855	Colegiul Tehnic De Electronica Si Telecomunicatii Gheorghe Marzescu Iași	26	\N	\N
38856	Scoala Gimnaziala Alecu Russo Iași	26	\N	\N
38857	Academia Romana Filiala Iași	26	\N	\N
38858	Scoala Gimnaziala Ciurea	26	\N	\N
38859	Scoala Gimnaziala Pircovaci	26	\N	\N
38860	Scoala De Formare Initiala Si Continua A Personalului Politiei De Frontiera Iași	26	\N	\N
38861	Liceul Tehnologic Valea Seaca	26	\N	\N
38862	Gradinita Cu Program Prelungit Nr.1	26	\N	\N
38863	Scoala Primara Gheorghe Asachi Iași	26	\N	\N
38864	Liceul Tehnologic De Mecatronica Si Automatizari Iași	26	\N	\N
38865	Scoala Gimnaziala Petru Poni Iași	26	\N	\N
38866	Liceul Teoretic Lascar Rosetti Raducaneni	26	\N	\N
38867	Scoala Gimnaziala Aron-voda Aroneanu	26	\N	\N
38868	Scoala Gimnaziala Buzn Ea	26	\N	\N
38869	Colegiul National Emil Racovita	26	\N	\N
38870	Scoala Gimnaziala Speciala Constantin Paunescu	26	\N	\N
38871	Scoala Gimnaziala Nr1 Comarna	26	\N	\N
38872	Colegiul National Iași	26	\N	\N
38873	Scoala Gimnaziala Liteni	26	\N	\N
38874	Scoala Gimnaziala Storn Esti	26	\N	\N
38875	Scoala Gimnaziala Ion Creanga Iași	26	\N	\N
38876	Institutul Teologic Romano Catolic	26	\N	\N
38877	Liceul Tehnologic Focuri	26	\N	\N
38878	Scoala Gimnaziala Birnova	26	\N	\N
38879	Liceul Tehnologic Braesti	26	\N	\N
38880	Scoala Gimnaziala Pausesti	26	\N	\N
38881	Gradinita P.p. Sf. Sava	26	\N	\N
38882	Liceul Teoretic Ion Neculce Targu Frumos	26	\N	\N
38883	Scoala Gimnaziala Madirjac	26	\N	\N
38884	Scoala Gimnaziala Cezar Petrescu Hodora	26	\N	\N
38885	Colegiul Economic Administrativ	26	\N	\N
38886	Liceul Tehnologic De Industrie Alimentara Tibana	26	\N	\N
38887	Scoala Gimnaziala Titu Maiorescu Iași	26	\N	\N
38888	Scoala Gimnaziala Scobinti	26	\N	\N
38889	Scoala Gimnaziala Ioanid Romanescu Romanesti	26	\N	\N
38890	Colegiul Tehnic Dimitrie Leonida	26	\N	\N
38891	Liceul Tehnologic Coarnele Caprei	26	\N	\N
38892	Scoala Gimnaziala Ionel Teodoreanu	26	\N	\N
38893	Liceul Tehnologic Vm Craiu Belcesti	26	\N	\N
38894	Scoala Primara Carol I	26	\N	\N
38895	Liceul Tehnologic Mihai Busuioc Pascani	26	\N	\N
38896	Scoala Gimnaziala Sipote	26	\N	\N
38897	Scoala Gimnaziala  Muncelu De Sus	26	\N	\N
38898	Scoala Gimnaziala Nr. 1 Costesti	26	\N	\N
38899	Scoala Gimnaziala Nr. 1  Lunca Cetatuii	26	\N	\N
38900	Scoala Gimnaziala Dimitrie A. Sturdza Iași	26	\N	\N
38901	Liceul Tehnologic Cozmesti	26	\N	\N
38902	Scoala Gimnaziala Cirjoaia	26	\N	\N
38903	Liceul Tehnologic Stolniceni-prajescu	26	\N	\N
38904	Scoala Gimnaziala Ciohorani	26	\N	\N
38905	Gradinita Cu Program Prelungit Nr.3	26	\N	\N
38906	Scoala Gimnaziala Ion Ghica	26	\N	\N
38907	Scoala Gimnaziala Siretel	26	\N	\N
38908	Scoala Gimnaziala Constantin Teodorescu Razboieni	26	\N	\N
38909	Liceul Tehnologic Special Vasile Pavelcu	26	\N	\N
38910	Scoala Gimnaziala Bogdan Petriceicu Hasdeu	26	\N	\N
38911	Scoala Gimnaziala Mosna	26	\N	\N
38912	Scoala Gimnaziala Dolh Esti	26	\N	\N
38913	Scoala Gimnaziala Golaiesti	26	\N	\N
38914	Colegiul Costache Negruzzi Iași	26	\N	\N
38915	Scoala Gimnaziala Alexandru Cel Bun Iași	26	\N	\N
38916	Scoala Gimnaziala Ciortesti	26	\N	\N
38917	Scoala Gimnaziala Dd Patrascanu Tomesti	26	\N	\N
38918	Scoala Gimnaziala Colon El Constantin Langa Miroslava	26	\N	\N
38919	Colegiul National Stefan Cel Mare	26	\N	\N
38920	Scoala Gimnaziala Gheorghe Ciobanu Andrieseni	26	\N	\N
38921	Scoala Populara De Arte Titel Popovici	26	\N	\N
38922	Scoala Gimnaziala Vasile Conta	26	\N	\N
38923	Scoala Gimnaziala Gistesti Pascani	26	\N	\N
38924	Liceul Tehnologic Nicolae Balauta Scheia	26	\N	\N
38925	Gradinita Cu Program Prelungit Nr.2 Pascani	26	\N	\N
38926	Gradinita Cu Program Prelungit Nr. 4	26	\N	\N
38927	Colegiul National Mihai Eminescu Iași	26	\N	\N
38928	Scoala Gimnaziala Harmanestii Vechi	26	\N	\N
38929	Scoala Gimnaziala Draguseni	26	\N	\N
38930	Scoala Gimnaziala Motca	26	\N	\N
38931	Scoala Gimnaziala Sirca	26	\N	\N
38932	Scoala Gimnaziala Prisacani	26	\N	\N
38933	Gradinita Cu Program Prelungit Nr.3 Pascani	26	\N	\N
38934	Scoala Gimnaziala Mihai Codreanu	26	\N	\N
38935	Scoala Gimnaziala Speciala Pascani	26	\N	\N
38936	Scoala Gimnaziala Petru Anghel Probota	26	\N	\N
38937	Gradinita Cu Program Prelungit Nr.13	26	\N	\N
38938	Scoala Gimnaziala Gh. I. Bratianu Iași	26	\N	\N
38939	Scoala Gimnaziala Otilia Cazimir Iași	26	\N	\N
38940	Liceul Tehnologic Petre P Carp Tibanesti	26	\N	\N
38941	Scoala Gimnaziala Rediu	26	\N	\N
38942	Scoala Gimnaziala Vasile Alecsandri Mircesti	26	\N	\N
38943	Scoala Gimnaziala Stefan Barsanescu Iași	26	\N	\N
38944	Gradinita Cu Program Prelungit Nr.16	26	\N	\N
38945	Liceul Special Moldova	26	\N	\N
38946	Scoala Gimnaziala Poieni	26	\N	\N
38947	Scoala Gimnaziala Veronica Micle	26	\N	\N
38948	Scoala Gimnaziala Carmen Sylva	26	\N	\N
38949	Scoala Gimnaziala Dimitrie Sturdza Popesti	26	\N	\N
38950	Scoala Gimnaziala Topile	26	\N	\N
38951	Scoala Gimnaziala Slobozia Deal	26	\N	\N
38952	Colegiul National Mihail Sadoveanu Pascani	26	\N	\N
38953	Scoala Gimnaziala Tutora	26	\N	\N
38954	Scoala Gimnaziala Girbesti	26	\N	\N
38955	Gradinita Cu Program Prelungit Nr.22	26	\N	\N
38956	Liceul Tehnologic Vladeni	26	\N	\N
38957	Scoala Gimnaziala Valea Lupului Iași	26	\N	\N
38958	Liceul Tehnologic Plugari	26	\N	\N
38959	Seminarul Teologic Ortodox Sf. Vasile Cel Mare Iași	26	\N	\N
38960	Liceul Tehnologic Ionel Teodoreanu Victoria	26	\N	\N
38961	Scoala Gimnaziala Al. I. Cuza	26	\N	\N
38962	Scoala Gimnaziala Bodesti	26	\N	\N
38963	Gradinita Cu Program Prelungit Nr.12	26	\N	\N
38964	Scoala Gimnaziala Grajduri	26	\N	\N
38965	Scoala Gimnaziala Butea	26	\N	\N
38966	Liceul Tehnologic Agricol M.kogalniceanu Miroslava	26	\N	\N
38967	Liceul Teoretic Miron Costin Pascani	26	\N	\N
38968	Universitatea Alexandru Ioan Cuza Din Iași	26	\N	\N
38969	Scoala Gimnaziala Hadimbu	26	\N	\N
38970	Scoala Gimnaziala Bosia	26	\N	\N
38971	Gradinita Cu Program Prelungit Nr 14 Iași	26	\N	\N
38972	Scoala Gimnaziala Nicolae Iorga Buhalnita	26	\N	\N
38973	Scoala Gimnaziala Rachiteni	26	\N	\N
38974	Scoala Gimnaziala Grozesti	26	\N	\N
38975	Liceul Tehnologic Dumitru Popa Mogosesti	26	\N	\N
38976	Scoala Gimnaziala Chicerea	26	\N	\N
38977	Scoala Gimnaziala Rusi	26	\N	\N
38978	Scoala Gimnaziala Iacob Negruzzi	26	\N	\N
38979	Scoala Gimnaziala Costache Antoniu	26	\N	\N
38980	Scoala Gimnaziala Domnita	26	\N	\N
38981	Scoala Gimnaziala Veniamin Costachi Sinesti	26	\N	\N
38982	Scoala Gimnaziala Larga Jijia	26	\N	\N
38983	Gradinita Pp Cuv.parascheva	26	\N	\N
38984	Scoala Gimnaziala Sticlaria	26	\N	\N
38985	Scoala Gimnaziala Gorban	26	\N	\N
38986	Liceul Tehnologic Gropnita	26	\N	\N
38987	Liceul Tehnologic Tatarusi	26	\N	\N
38988	Scoala Gimnaziala Stefan Cel Mare Si Sfant  Dobrovat	26	\N	\N
38989	Colegiul Tehnic Gheorghe Asachi	26	\N	\N
38990	Liceul Tehnologic Haralamb Vasiliu	26	\N	\N
38991	Scoala Gimnaziala Poiana	26	\N	\N
38992	Gradinita Cu Program Prelungit Nr 21  Iași	26	\N	\N
38993	Universitatea De Stiinte Agricole Si Medicina Veterinara Ion Ionescu De la Brad Iași	26	\N	\N
38994	Scoala Gimnaziala Costuleni	26	\N	\N
38995	Scoala Gimnaziala George Cosbuc Iași	26	\N	\N
38996	Scoala Gimnaziala Nicolae Iorga	26	\N	\N
38997	Scoala Gimnaziala Horlesti	26	\N	\N
38998	Scoala Gimnaziala Bivolari	26	\N	\N
38999	Scoala Gimnaziala Maxut	26	\N	\N
39000	Universitatea Tehnica Gheorghe Asachi Din Iași	26	\N	\N
39001	Gradinita Cu Program Prelungit Nr. 18	26	\N	\N
39002	Scoala Gimnaziala Lunca	26	\N	\N
39003	Colegiul Agricol Si De Industrie Alimentara Vasile Adamachi Iași	26	\N	\N
39004	Scoala Gimnaziala Elena Cuza	26	\N	\N
39005	Scoala Gimnaziala Ioanid Romanescu Voinesti	26	\N	\N
39006	Gradinita Cu Program Prelungit Nr. 25	26	\N	\N
39007	Scoala Gimnaziala Satu Nou	26	\N	\N
39008	Colegiul Tehnic De Transporturi Si Constructii	26	\N	\N
39009	Liceul Tehnologic Economic De Turism Iași	26	\N	\N
39010	Scoala  Gimnaziala Garabet Ibraileanu Targu Frumos	26	\N	\N
39011	Liceul Tehnologic Dumesti	26	\N	\N
39012	Liceul Tehnologic Doamna Chiajna	27	\N	\N
39013	Scoala Primara Optima	27	\N	\N
39014	Universitatea Adventus	27	\N	\N
39015	Scoala Gimnaziala Nr 2	27	\N	\N
39016	Scoala Gimnaziala Nr.1	27	\N	\N
39017	Scoala Gimnaziala Alexandru Odobescu	27	\N	\N
39018	Liceul Teoretic Nr. 1	27	\N	\N
39019	Scoala Gimnaziala Nr.1  Nuci	27	\N	\N
39020	Liceul Teoretic Ioan Petrus Otopeni	27	\N	\N
39021	Liceul Tehnologic Cezar Nicolau	27	\N	\N
39022	Scoala Gimnaziala Nr.2 Fundeni Dobroesti	27	\N	\N
39023	Liceul Tehnologic Dumitru Dumitrescu	27	\N	\N
39024	Scoala Gimnaziala Nr.3 Voluntari	27	\N	\N
39025	Scoala Gimnaziala Nr. 1 Berceni	27	\N	\N
39026	Gradinita Nr.2	27	\N	\N
39027	Scoala Gimnaziala Nr.1  Dobroesti	27	\N	\N
39028	Gradinita Nr 1  Otopeni	27	\N	\N
39029	Scoala Gimnaziala Nr.1 Voluntari	27	\N	\N
39030	Liceul Tehnologic Pamfil Seicaru	27	\N	\N
39031	Seminarul Teologic Liceal Ortodox Sfanta Filofteia	27	\N	\N
39032	Scoala Gimnaziala Nr.1  Darasti-ilfov	27	\N	\N
39033	Scoala Gimnaziala Prof Ion Visoiu	27	\N	\N
39034	Scoala Gimnaziala Nr.3	27	\N	\N
39035	Scoala Gimnaziala Gruiu	27	\N	\N
39036	Scoala Gimnaziala Nr. 1	27	\N	\N
39037	Gradinita Voinicel	27	\N	\N
39038	Liceul Tehnologic Nicolae Balcescu	27	\N	\N
39039	Scoala Gimnaziala Ioan Badescu	27	\N	\N
39040	Scoala Gimnaziala Nr.2	27	\N	\N
39041	Liceul Teoretic Mihail Kogalniceanu	27	\N	\N
39042	Liceul Teoretic Traian Lalescu	27	\N	\N
39043	Colegiul Silvic Theodor Pietraru	27	\N	\N
39044	Liceul Cu Program Sportiv Cu Cls. I-xii	27	\N	\N
39045	Scoala Gimnaziala Gheorghe Corneliu Domnesti	27	\N	\N
39046	Gradinita Nrj	27	\N	\N
39047	Scoala Gimnaziala Nr. 1 Afumati	27	\N	\N
39048	Gradinita Nr	27	\N	\N
39049	Scoala Gimnaziala Nr. 2 Jilava	27	\N	\N
39050	Gradinita Nrj Magurele	27	\N	\N
39051	Liceul Teoretic Alexandru Rosetti Vidra	27	\N	\N
39052	Scoala Gimnaziala Mihai Eminescu	27	\N	\N
39053	Scoala Gimnaziala Nr.1 Copaceni	27	\N	\N
39054	Scoala Gimnaziala Nr.2 Voluntari	27	\N	\N
39055	Scoala Gimnaziala Nr.3 Buftea	27	\N	\N
39056	Gradinita Rita Gargarita	27	\N	\N
39057	Gradinita Nr 2 Otopeni	27	\N	\N
39058	Gradinita Cu Program Normal Nrj	27	\N	\N
39059	Liceul Teoretic George Pop De Baseşti Baia Mare	28	\N	\N
39060	Universitatea de Arte Vatra	28	\N	\N
39061	Universitatea Tehnică Baia Mare	28	\N	\N
39062	Scoala Gimnaziala Coroieni	28	\N	\N
39063	Liceul Borsa	28	\N	\N
39064	Scoala Gimnaziala Viseu De Jos	28	\N	\N
39065	Liceul Tehnologic Ruscova	28	\N	\N
39066	Liceul Tehnologic Poienile De Sub Munte	28	\N	\N
39067	Scoala Gimnaziala Calinesti	28	\N	\N
39068	Scoala Gimnaziala Nichita Stanescu Baia Mare	28	\N	\N
39069	Colegiul De Arte	28	\N	\N
39070	Seminarul Teologic Liceal Sf. Iosif Marturisitorul Baia Mare	28	\N	\N
39071	Gradinita Cu Program Prelungit Nr 10 Baia Mare	28	\N	\N
39072	Scoala Gimnaziala Nr.5 Sighetu Marmatiei	28	\N	\N
39073	Liceul Tehnologic Ocna Sugatag	28	\N	\N
39074	Scoala Gimnaziala Alexandru Ivasiuc Baia Mare	28	\N	\N
39075	Scoala Gimnaziala Remetea Chioaru Lui	28	\N	\N
39076	Scoala Gimnaziala Nr.18 Baia Mare	28	\N	\N
39077	Scoala Gimnaziala Poienile Izei	28	\N	\N
39078	Colegiul Economic Nicolae Titulescu	28	\N	\N
39079	Scoala Gimnaziala Oncesti	28	\N	\N
39080	Scoala Gimnaziala Nr.1 Stramtura	28	\N	\N
39081	Scoala Gimnaziala Cupseni	28	\N	\N
39082	Scoala Gimnaziala Kos Karoly Arduzel	28	\N	\N
39083	Colegiul National Vasile Lucaciu	28	\N	\N
39084	Scoala Gimnaziala George Cosbuc Sighetu Marmatiei	28	\N	\N
39085	Colegiul Tehnic  Anghel Saligny	28	\N	\N
39086	Liceul Tehnologic Nr.4 Viseu De Sus	28	\N	\N
39087	Scoala Gimnaziala Florea Mureșanu Suciu De Sus	28	\N	\N
39088	Scoala Gimnaziala Finteusu Mic	28	\N	\N
39089	Scoala Gimnaziala Speciala Baia Mare	28	\N	\N
39090	Scoala Gimnaziala Nr.2 Sighetu Marmatiei	28	\N	\N
39091	Scoala Gimnaziala Nr.7 Viseu De Sus	28	\N	\N
39092	Scoala Gimnaziala Nr.1 Leordina	28	\N	\N
39093	Liceul Cu Program Sportiv Baia Mare	28	\N	\N
39094	Scoala Gimnaziala Baia Sprie	28	\N	\N
39095	Liceul Tehnologic Alexandru Filipascu Petrova	28	\N	\N
39096	Scoala Gimnaziala Nr. 4 Borsa	28	\N	\N
39097	Scoala Gimaziala Ben Corlaciu	28	\N	\N
39098	Scoala Gimnaziala Desesti	28	\N	\N
39099	Scoala Gimnaziala Octavian Goga Baia Mare	28	\N	\N
39100	Scoala Gimnaziala Nr.1 Sighetu Marmatiei	28	\N	\N
39101	Scoala Gimnaziala Copalnic Manastur	28	\N	\N
39102	Colegiul Tehnic Transilvania	28	\N	\N
39103	Scoala Gimnaziala Nr.4 Poienile De Sub Munte	28	\N	\N
39104	Scoala Gimnaziala Nr.1o Sighetu Marmatiei	28	\N	\N
39105	Scoala Gimnaziala Craciunesti	28	\N	\N
39106	Gradinita Cu Program Prelungit Ion Creanga	28	\N	\N
39107	Scoala Gimnaziala Dumbravita	28	\N	\N
39108	Scoala Gimnaziala Simion Barn Utiu Baia Mare	28	\N	\N
39109	Scoala Gimnaziala Rona De Sus	28	\N	\N
39110	Liceul Pedagogic Taras Sevcen Ko	28	\N	\N
39111	Scoala Gimnaziala De Arte Sighetu Marmatiei	28	\N	\N
39112	Scoala Gimnaziala Dr.ioan Mihalyi De Apsa Sighetu Marmatiei	28	\N	\N
39113	Liceul Tehnologic Marmatia	28	\N	\N
39114	Scoala Gimnaziala Sacel	28	\N	\N
39115	Liceul Tehnologic Forestier Sighetu Marmatiei	28	\N	\N
39116	Scoala Gimnaziala George Cosbuc Baia Mare	28	\N	\N
39117	Scoala Gimnaziala Asuaju De Sus	28	\N	\N
39118	Scoala Gimnaziala Bogdan Voda	28	\N	\N
39119	Liceul Teologic Penticostal Baia Mare	28	\N	\N
39120	Gradinita Cu Program Normal Nr 4 Baia Mare	28	\N	\N
39121	Liceul Tehnologic Agricol Alexiu Berinde Seini	28	\N	\N
39122	Scoala Gimnaziala Miresu Mare	28	\N	\N
39123	Colegiul National Dragos Voda	28	\N	\N
39124	Scoala Gimnaziala Gardani	28	\N	\N
39125	Liceul Teoretic Bogdan Voda	28	\N	\N
39126	Scoala Gimnaziala Crasna Viseului	28	\N	\N
39127	Scoala Gimnaziala Dr. Teodor Mihali Boiu Mare	28	\N	\N
39128	Scoala Gimnaziala Oarta De Sus	28	\N	\N
39129	Liceul Teoretic Nemeth Laszlo	28	\N	\N
39130	Gradinita Cu Program Prelungit Nr.28 Baia Mare	28	\N	\N
39131	Scoala Gimnaziala Lucian Blaga Farcasa	28	\N	\N
39132	Scoala Gimnaziala Dr Ilie Lazar Giulesti	28	\N	\N
39133	Scoala Gimnaziala Chelinta	28	\N	\N
39134	Scoala Gimnaziala Petre Dulfu Baia Mare	28	\N	\N
39135	Scoala Gimnaziala Laurentiu Ulici Rona De Jos	28	\N	\N
39136	Scoala Gimnaziala Lapus	28	\N	\N
39137	Scoala Gimnaziala Nicolae Balcescu Baia Mare	28	\N	\N
39138	Colegiul Tehnic De Transporturi Auto Baia Sprie	28	\N	\N
39139	Liceul Tehnologic Dr. Florian Ulmeanu Ulmeni	28	\N	\N
39140	Scoala Gimnaziala Sieu	28	\N	\N
39141	Liceul Tehnologic Traian Vuia Tautii Magheraus	28	\N	\N
39142	Gradinita Cu Program Prelungit Tirgu Lapus	28	\N	\N
39143	Gradinita Cu Program Prelungit Nr.12 Sighetu Marmatiei	28	\N	\N
39144	Colegiul Tehnic C.d. Nenitescu	28	\N	\N
39145	Scoala Gimnaziala Nr. 1 Moisei	28	\N	\N
39146	Gradinita Cu Program Prelungit.25 Baia Mare	28	\N	\N
39147	Scoala Gimnaziala Regina Elisabeta Baiut	28	\N	\N
39148	Scoala Gimnaziala Nicolae Iorga Baia Mare	28	\N	\N
39149	Scoala Gimnaziala Ion Luca Caragiale Baia Mare	28	\N	\N
39150	Liceul Tehnologic Grigore C Moisil Targu Lapus	28	\N	\N
39151	Scoala Gimnaziala Vasile Alecsandri Baia Mare	28	\N	\N
39152	Gradinita Cu Program Prelungit Step By Step Baia Mare	28	\N	\N
39153	Scoala Gimnaziala Cicirlau	28	\N	\N
39154	Gradinita Cu Program Prelungit Nr.8 Sighetu Marmatiei	28	\N	\N
39155	Gradinita Cu Program Prelungit Otilia Cazimir	28	\N	\N
39156	Scoala Gimnaziala Ardusat	28	\N	\N
39157	Liceul Tehnologic Viseu De Sus	28	\N	\N
39158	Scoala Gimnaziala Nicolae Steinhard Rohia	28	\N	\N
39159	Colegiul National Mihai Eminescu	28	\N	\N
39160	Scoala Gimnaziala Ieud	28	\N	\N
39161	Scoala Gimnaziala Sacalaseni	28	\N	\N
39162	Scoala Gimnaziala Remeti	28	\N	\N
39163	Scoala Gimnaziala Basesti	28	\N	\N
39164	Scoala Gimnaziala Benko Ferenc Damacuseni	28	\N	\N
39165	Gradinita Cu Program Prelungit Nr 10 Borsa	28	\N	\N
39166	Liceul Teoretic Petru Rares	28	\N	\N
39167	Gradinita Cu Program Prelungit Nr.2 Baia Sprie	28	\N	\N
39168	Scoala Gimnaziala Satu Lung	28	\N	\N
39169	Colegiul Tehnic De Transporturi Auto	29	\N	\N
39170	Scoala Gimnaziala Dimitrie Grecescu	29	\N	\N
39171	Liceul Teoretic Traian Lalescu	29	\N	\N
39172	Scoala Gimnaziala Isverna	29	\N	\N
39173	Scoala Gimnaziala Constantin Negreanu	29	\N	\N
39174	Scoala Cu Clasele I-viii Balacita	29	\N	\N
39175	Scoala Gimnaziala Petre Sergescu	29	\N	\N
39176	Scoala Cu Clasele I-viii Constantin Radulescu Motru Butoiesti	29	\N	\N
39177	Colegiul National Economic Theodor Costescu	29	\N	\N
39178	Scoala Gimnaziala Ilovat	29	\N	\N
39179	Scoala Primara Siroca Godeanu	29	\N	\N
39180	Scoala Gimnaziala Stingaceaua	29	\N	\N
39181	Liceul Tehnologic Halinga	29	\N	\N
39182	Scoala Gimnaziala Cazanesti	29	\N	\N
39183	Scoala Gimnaziala Branistea	29	\N	\N
39184	Scoala Gimnaziala Girla Mare	29	\N	\N
39185	Scoala Gimnaziala Nr.14	29	\N	\N
39186	Gradinita Cu Program Prelungit Nr.19	29	\N	\N
39187	Liceul Tehnologic Tu Dor Vladimirescu	29	\N	\N
39188	Scoala Gimnaziala Gogosu	29	\N	\N
39189	Liceul Tehnologic Matei Basarab Strehaia	29	\N	\N
39190	Scoala Gimnaziala Nr.15	29	\N	\N
39191	Scoala Gimnaziala Pamfil Seicaru	29	\N	\N
39192	Scoala Gimnaziala Regele Mihai I	29	\N	\N
39193	Scoala Gimnaziala Greci	29	\N	\N
39194	Scoala Gimnaziala Podeni	29	\N	\N
39195	Scoala Gimnaziala Oprisor	29	\N	\N
39196	Scoala Gimnaziala Eselnita	29	\N	\N
39197	Colegiul Tehnic  Domnul Tudor	29	\N	\N
39198	Colegiul National Pedagogic Stefan Odobleja	29	\N	\N
39199	Scoala Gimnaziala Bala	29	\N	\N
39200	Scoala Gimnaziala Dumbrava	29	\N	\N
39201	Scoala Gimnaziala Corcova	29	\N	\N
39202	Liceul Tehnologic Constantin Brancoveanu	29	\N	\N
39203	Scoala Gimnaziala Ilovita	29	\N	\N
39204	Scoala Gimnaziala Dumitru Crasoveanu	29	\N	\N
39205	Gradinita Cu Program Prelungit Nr. 3	29	\N	\N
39206	Scoala Gimnaziala Hinova	29	\N	\N
39207	Scoala Gimnaziala Nr.6	29	\N	\N
39208	Liceul De Arte I.st.paulian	29	\N	\N
39209	Scoala Gimnaziala Alice Voinescu	29	\N	\N
39210	Scoala Postliceala Sanitara	29	\N	\N
39211	Gradinita Cu Program Prelungit Nr.7	29	\N	\N
39212	Scoala Profesionala Corlatel	29	\N	\N
39213	Scoala Gimnaziala Obarsia—de-camp	29	\N	\N
39214	Scoala Gimnaziala Mihai Viteazu Strehaia	29	\N	\N
39215	Scoala  Gimnaziala	29	\N	\N
39216	Scoala Gimnaziala Constantin Trusca	29	\N	\N
39217	Scoala Gimnaziala Ponoarele	29	\N	\N
39218	Scoala Gimnaziala Ciresu	29	\N	\N
39219	Scoala Gimnaziala Eibenthal	29	\N	\N
39220	Scoala Gimnaziala Vanju Mare	29	\N	\N
39221	Liceul Teoretic Cujmir	29	\N	\N
39222	Gradinita Cu Program Prelungit Nr. 1 Orsova	29	\N	\N
39223	Scoala Gimnaziala Breznita Motru	29	\N	\N
39224	Scoala Gimnaziala Floresti	29	\N	\N
39225	Gradinita Cu Program Prelungit Nr.22	29	\N	\N
39226	Scoala Primara Padina Mare	29	\N	\N
39227	Colegiul National Traian Drobeta Turnu Severin	29	\N	\N
39228	Scoala Gimnaziala Pristol	29	\N	\N
39229	Scoala Cu Clasele I-viii Sovarna	29	\N	\N
39230	Liceul Tehnologic Special Drobeta	29	\N	\N
39231	Scoala Gimnaziala	29	\N	\N
39232	Scoala Gimnaziala Breznita Ocol	29	\N	\N
39233	Scoala Gimnaziala Simian	29	\N	\N
39234	Scoala Gimnaziala Dirvari	29	\N	\N
39235	Scoala Gimnaziala Husnicioara	29	\N	\N
39236	Scoala Gimnaziala Nr 5	29	\N	\N
39237	Gradinita Cu Program Prelungit Nr 20	29	\N	\N
39238	Colegiul National Gheorghe Titeica	29	\N	\N
39239	Scoala Gimnaziala Devesel	29	\N	\N
39240	Gradinita Cu Program Prelungit Nr. 21	29	\N	\N
39241	Scoala Gimnaziala Petru Dumitriu Orsova	29	\N	\N
39242	Scoala Gimnaziala Cerneti	29	\N	\N
39243	Scoala Gimnaziala Bilvanesti	29	\N	\N
39244	Liceul Tehnologic Constantin Brancusi Targu Mureș	30	\N	\N
39245	Scoala Gimnaziala Tholdalagi Mihaly Corunca	30	\N	\N
39246	Scoala Gimnaziala Cristesti	30	\N	\N
39247	Universitatea de Medicină, Farmacie, Știință și Tehnologie George Emil Palade	30	\N	\N
39248	Scoala Gimnaziala Europa Municipiul Targu Mureș	30	\N	\N
39249	Scoala Gimnaziala Comuna Sarateni	30	\N	\N
39250	Scoala Gimnaziala Comuna Zagar	30	\N	\N
39251	Scoala Gimnaziala Comuna Sanger	30	\N	\N
39252	Scoala Gimnaziala  Torok Janos Comuna Balauseri	30	\N	\N
39253	Scoala Gimnaziala Apafi Mihaly Ernei	30	\N	\N
39254	Scoala Gimnaziala Adorjani Karoly Glodeni	30	\N	\N
39255	Scoala Gimnaziala  Comuna Valea Larga	30	\N	\N
39256	Gradinita Cu Program  Prelungit Manpel Tg.Mureș	30	\N	\N
39257	Scoala Gimnaziala Iuliu Grama Comuna Chiheru De Jos	30	\N	\N
39258	Colegiul Tehnic Tarnaveni	30	\N	\N
39259	Liceul Vocational Pedagogic Mihai Eminescu Municipiul Targu Mureș	30	\N	\N
39260	Scoala Gimnaziala Comuna Chetani	30	\N	\N
39261	Liceul Teologic Romano-catolic	30	\N	\N
39262	Scoala Gimnaziala Wesselenyi Miklos Ghindari	30	\N	\N
39263	Scoala Gimnaziala Sat Deaj  Comuna Mica	30	\N	\N
39264	Scoala Gimnaziala Vasile Pop Comuna Grebenisu De Cimpie	30	\N	\N
39265	Liceul Tehnologic Ioan Bojor Reghin	30	\N	\N
39266	Gradinita Casuta Fermecata Din Ludus	30	\N	\N
39267	Scoala Gimnaziala Comuna Cuci	30	\N	\N
39268	Scoala Gimnaziala Liviu Rebreanu Municipiul Tg.Mureș	30	\N	\N
39269	Liceul Teoretic Andrei Barseanu	30	\N	\N
39270	Scoala Gimnaziala Comuna Taureni	30	\N	\N
39271	Scoala Gimnaziala Kadar Marton Comuna Pan Et	30	\N	\N
39272	Liceul Teologic Romano-catolic Ii Rakoczi Ferenc	30	\N	\N
39273	Scoala Gimnaziala  Comuna Ogra	30	\N	\N
39274	Scoala Gimnaziala Nr.01 Orasul Ludus	30	\N	\N
39275	Scoala Gimnaziala Aurel Mosora Municipiul Sighisoara	30	\N	\N
39276	Scoala Gimnaziala Comuna Sincai	30	\N	\N
39277	Scoala Gimnaziala S.illyes Lajos Sovata	30	\N	\N
39278	Liceul Tehnologic Traian Vuia Municipiul Targu Mureș	30	\N	\N
39279	Scoala Gimnaziala Dr Nyulas Ferenc Comuna Eremitu	30	\N	\N
39280	Scoala Gimnaziala Cornel Regman Comuna Danes	30	\N	\N
39281	Scoala Gimnaziala Comuna Faragau	30	\N	\N
39282	Scoala Gimnaziala Comuna Beica De Jos	30	\N	\N
39283	Scoala Gimnaziala Comuna Apold	30	\N	\N
39284	Scoala Gimaziala Comuna Adamus	30	\N	\N
39285	Scoala Gimnaziala Nr.7 Targu Mureș	30	\N	\N
39286	Liceul Tehnologic Lucian Blaga Reghin	30	\N	\N
39287	Liceul Tehnologic Nr 1  Municipiul Sighisoara	30	\N	\N
39288	Scoala  Gimnaziala Serafim Duicu Targu Mureș	30	\N	\N
39289	Scoala Gimnaziala Comuna Cozma	30	\N	\N
39290	Scoala Gimnaziala Avram Iancu Tarnaveni	30	\N	\N
39291	Scoala Gimnaziala Gheorghe Sincai Comuna Raciu	30	\N	\N
39292	Liceul Tehnologic Aurel Persu Municipiul Târgu Mureș	30	\N	\N
39293	Scoala Gimnaziala Vatava	30	\N	\N
39294	Scoala Gimnaziala Sau Lia	30	\N	\N
39295	Scoala Gimnaziala Comuna Breaza	30	\N	\N
39296	Scoala Gimnaziala Nr. 01  Comuna Craciunesti	30	\N	\N
39297	Colegiul National Alexandru Papiu Ilarian Targu Mureș	30	\N	\N
39298	Scoala Gimnaziala Comuna Batos	30	\N	\N
39299	Scoala Gimnaziala Danila Stupar Comuna Rusii-munti	30	\N	\N
39300	Scoala Gimnaziala Teleki Domokos Comuna Gornesti	30	\N	\N
39301	Scoala Gimnaziala Comuna Pogaceaua	30	\N	\N
39302	Universitatea De Arte Din Târgu Mureș	30	\N	\N
39303	Scoala Gimnaziala Seulia De Mureș Comuna Cucerdea	30	\N	\N
39304	Scoala Gimnaziala Comuna Bichis	30	\N	\N
39305	Colegiul Economic Transilvania	30	\N	\N
39306	Scoala Gimnaziala Comuna Acatari	30	\N	\N
39307	Scoala Gimnaziala Ion Chinezu Santana De Mureș	30	\N	\N
39308	Scoala Gimnaziala Comuna Ideciu De Jos	30	\N	\N
39309	Scoala Gimnaziala  Sfantul Petru Comuna Sampetru De Campie	30	\N	\N
39310	Scoala Gimnaziala Bahnea	30	\N	\N
39311	Scoala Gimnaziala Romulus Guga Tg.Mureș	30	\N	\N
39312	Scoala Gimnaziala Alexandru Ceusianu Municipiul Reghin	30	\N	\N
39313	Scoala Gimnaziala Kiss Gergely Pasareni	30	\N	\N
39314	Scoala Gimnaziala Comuna Sancraiu De Mureș	30	\N	\N
39315	Scoala Gimnaziala Comuna Papiu Ilarian	30	\N	\N
39316	Liceul Tehnologic Sfantul Gheorghe  Sangeorgiu De Padure	30	\N	\N
39317	Scoala Gimnaziala Comuna Viisoara	30	\N	\N
39318	Scoala Gimnaziala Sfantul Gheorghe Comuna Sangeorgiu De Mureș	30	\N	\N
39319	Liceul Tehnologic Nrj  Lu Dus	30	\N	\N
39320	Liceul Tehnologic Gheorghe Sincai Municipiul Targu Mureș	30	\N	\N
39321	Scoala Gimnaziala Comuna Vetca	30	\N	\N
39322	Scoala Gimnaziala Comuna Atintis	30	\N	\N
39323	Scoala Gimnaziala Comuna Suseni	30	\N	\N
39324	Liceul Teoretic Gheorghe Marinescu Municipiul Targu Mureș	30	\N	\N
39325	Scoala Gimnaziala Comuna Coroisinmartin	30	\N	\N
39326	Scoala Gimnaziala Pataky Agotha	30	\N	\N
39327	Scoala Gimnaziala Palko Attila Din Alunis	30	\N	\N
39328	Scoala Gimnaziala Benedek Elek Livezeni	30	\N	\N
39329	Colegiul National Mircea Eliade Sighisoara	30	\N	\N
39330	Scoala Gimnaziala Sat Iclandu Mare Comuna Iclanzel	30	\N	\N
39331	Scoala Gimnaziala Szentivani Mihaly Comuna Galesti	30	\N	\N
39332	Liceul Vocational De Arta Municipiul Tg.Mureș	30	\N	\N
39333	Scoala Gimnaziala Petres Kalman Sambrias	30	\N	\N
39334	Liceul Vocational Reformat	30	\N	\N
39335	Scoala Gimnaziala Comuna Hodac	30	\N	\N
39336	Scoala Gimnaziala Comuna Mihesu De Cimpie	30	\N	\N
39337	Scoala Gimnaziala Friedrich Schiller Municiupiul Targu Mureș	30	\N	\N
39338	Liceul Tehnologic Vasile Netea Comuna Deda	30	\N	\N
39339	Scoala Gimnaziala Zaharia Boiu Municipiul Sighisoara	30	\N	\N
39340	Liceul Teoretic Joseph  Haltrich	30	\N	\N
39341	Liceul Tehnologic Sat Dumbravioara Comuna Ernei	30	\N	\N
39342	Scoala Gimnaziala Nr 3 Tarnaveni	30	\N	\N
39343	Scoala Gimnaziala Comuna Lunca	30	\N	\N
39344	Liceul Tehnologic Domokos Kazmer Orasul Sovata	30	\N	\N
39345	Liceul Tehnologic Ion Vlasiu	30	\N	\N
39346	Scoala Gimnaziala Vargata	30	\N	\N
39347	Scoala Gimnaziala Traian Tarnaveni	30	\N	\N
39348	Scoala Gimnaziala Mihai Viteazul Municipiul Targu Mureș	30	\N	\N
39349	Scoala Gimnaziala Comuna Iban Esti	30	\N	\N
39350	Scoala Gimnaziala Comuna Ceuasu De Cimpie	30	\N	\N
39351	Scoala Gimnaziala Ioan Vladutiu Orasul Ludus	30	\N	\N
39352	Gradinita Cu Program Prelungit Nr.16 Tg.Mureș	30	\N	\N
39353	Scoala Gimnaziala Comuna Petelea	30	\N	\N
39354	Scoala Gimnaziala Comuna Stanceni	30	\N	\N
39355	Scoala Gimnaziala Comuna Fantanele	30	\N	\N
39356	Scoala Gimnaziala Magherani	30	\N	\N
39357	Scoala Gimnaziala Comuna Neaua	30	\N	\N
39358	Liceul Cu Program Sportiv Szasz Adalbert	30	\N	\N
39359	Scoala Gimnaziala Sf Nicolae Satul Laslau Mare Comuna Suplac	30	\N	\N
39360	Scoala Gimnaziala Radu Popa Municipiul Sighisoara	30	\N	\N
39361	Scoala Gimnaziala Rakossi Lajos Gheorghe Doja	30	\N	\N
39362	Scoala Gimnaziala Ion Dacian Comuna Saschiz	30	\N	\N
39363	Gradinita Cu Program Prelungit Nr.5 Reghin	30	\N	\N
39364	Scoala Gimnaziala Comuna Lunca Bradului	30	\N	\N
39365	Liceul Teoretic Bocskai Istvan Orasul Miercurea Nirajului	30	\N	\N
39366	Scoala Gimnaziala Victor Jinga Municipiul Sighisoara	30	\N	\N
39367	Scoala Gimnaziala Nades	30	\N	\N
39368	Scoala Gimnaziala George Cosbuc Municipiul Targu Mureș	30	\N	\N
39369	Scoala Cu Clasele I - Viii Mastacan	31	\N	\N
39370	Grădinița cu program prelungit Elisei - Piatra Neamț	31	\N	\N
39371	Școala Gimnazială Nr. 2 Piatra Neamț	31	\N	\N
39372	Liceul de Arte Victor Brauner - Piatra Neamț	31	\N	\N
39373	Colegiul Tehnic Forestier	31	\N	\N
39374	Grupul Școlar Economic-Administrativ Piatra Neamț	31	\N	\N
39375	Colegiul Național de Informatică Piatra Neamț	31	\N	\N
39376	Colegiul Național Petru Rareș	31	\N	\N
39377	Scoala Gimnaziala Comuna Bodesti	31	\N	\N
39378	Scoala Gimnaziala Vasile Mitru Tasca	31	\N	\N
39379	Liceul Tehnologic Ion Creanga	31	\N	\N
39380	Colegiul National Gheorghe Asachi	31	\N	\N
39381	Liceul Tehnologic Damuc	31	\N	\N
39382	Scoala Gimnaziala Nr.2	31	\N	\N
39383	Scoala Gimnaziala Comuna Trifesti Judetul Neamț	31	\N	\N
39384	Scoala Gimnaziala Nicu Albu	31	\N	\N
39385	Scoala Gimnaziala Alexandru Podoleanu	31	\N	\N
39386	Scoala Gimnaziala  Mihai Eminescu  Roman	31	\N	\N
39387	Scoala Gimnaziala Calistrat Hogas Roman	31	\N	\N
39388	Scoala Gimnaziala Nr.1 Bicaz	31	\N	\N
39389	Scoala Gimnaziala  Comuna Moldoveni  Judetul Neamț	31	\N	\N
39390	Scoala Gimnaziala I.i.mronescu Tazlau	31	\N	\N
39391	Colegiul Tehnic Miron Costin Roman	31	\N	\N
39392	Colegiul Tehnic Ion Creanga	31	\N	\N
39393	Colegiul National Stefan Cel Mare	31	\N	\N
39394	Scoala Gimnaziala Vadu Ri	31	\N	\N
39395	Scoala Gimnaziala Comuna Pastraveni	31	\N	\N
39396	Scoala Gimnaziala Nr 1 Raucesti	31	\N	\N
39397	Scoala Gimnaziala Pr.gheorghe Sandulescu Dragomiresti	31	\N	\N
39398	Scoala Gimnaziala Nr.1	31	\N	\N
39399	Scoala Gimnaziala Elena Cuza	31	\N	\N
39400	Scoala Gimnaziala Prof.gheorghe Dumitreasa	31	\N	\N
39401	Scoala Gimnaziala Comuna Dobreni	31	\N	\N
39402	Scoala Gimnaziala . Comuna Borlesti. Judetul Neamț	31	\N	\N
39403	Scoala Gimnaziala Gheorghe Nicolau Romani	31	\N	\N
39404	Scoala Gimnaziala Grigore Ungureanu Ceahlau	31	\N	\N
39405	Scoala Gimnaziala Nr. 1 . Sat Pildesti. Comuna Cordun. Judetul Neamț	31	\N	\N
39406	Scoala Gimnaziala  Vasile Alecsandri Roman	31	\N	\N
39407	Scoala Gimnaziala Comuna Birgauani Judetul Neamț	31	\N	\N
39408	Scoala Gimnaziala Alexandru Ioan Cuza Roman	31	\N	\N
39409	Scoala Gimnaziala Nr. I.comuna Cordun. Judetul Neamț	31	\N	\N
39410	Scoala Gimnaziala Antonie Mureșianu Comuna Bira	31	\N	\N
39411	Liceul Tehnologic Dimitrie Leonida	31	\N	\N
39412	Scoala Gimnaziala Comuna Costisa Judetul Neamț	31	\N	\N
39413	Liceul Tehnologic  Ion Ionescu De La Brad	31	\N	\N
39414	Scoala Gimnaziala Episcop Melchisedec Stefanescu	31	\N	\N
39415	Scoala Gimnaziala Vlad Danulescu Comuna Pancesti Judetul Neamț	31	\N	\N
39416	Scoala Gimnaziala Nr.1 Comuna Bicazu Ardelean	31	\N	\N
39417	Scoala Gimnaziala Comuna Valeni Judetul Neamț	31	\N	\N
39418	Scoala Gimnaziala Comuna Stanita Judetul Neamț	31	\N	\N
39419	Colegiul Tehnologic Spiru Haret	31	\N	\N
39420	Liceul Tehnologic Petricani	31	\N	\N
39421	Liceul Cu Program Sportiv Css Roman	31	\N	\N
39422	Liceul Tehnologic Gh Ruset Roznovanu	31	\N	\N
39423	Scoala Gimnaziala Gheorghe Savinescu Comuna Cracaoani Judetul Neamț	31	\N	\N
39424	Scoala Gimnaziala Comuna Bozieni Judetul Neamț	31	\N	\N
39425	Liceul Teologic Episcop Melchisedec Roman	31	\N	\N
39426	Scoala Gimnaziala Nicolae Iorga Pingarati	31	\N	\N
39427	Scoala Gimnaziala Timișesti	31	\N	\N
39428	Scoala Gimnaziala Barticesti	31	\N	\N
39429	Scoala Gimnaziala Draganesti	31	\N	\N
39430	Liceul Tehnologic Arhimandrit Chiriac Nicolau	31	\N	\N
39431	Scoala Gimnaziala Tamaseni	31	\N	\N
39432	Liceul Tehnologic  Vasile Sav	31	\N	\N
39433	Liceul Teologic Ortodox Sfintii Imparati Constantin Si Elena	31	\N	\N
39434	Colegiul National Calistrat Hogas	31	\N	\N
39435	Liceul Vasile Conta	31	\N	\N
39436	Scoala Gimnaziala Nicolae Apostol Comuna Ruginoasa Judetul Neamț	31	\N	\N
39437	Scoala Gimnaziala Nicolae Buleu Comuna Margineni	31	\N	\N
39438	Scoala Gimnaziala Comuna Oniceni Judetul Neamț	31	\N	\N
39439	Scoala Gimnaziala Nr1 Comuna Tibucani Judetul Neamț	31	\N	\N
39440	Scoala Gimnaziala Ioan Grigore Teodorescu Sat Ruseni Comuna Borlesti	31	\N	\N
39441	Scoala Gimnaziala Comuna Sagna Judetul Neamț	31	\N	\N
39442	Scoala Gimnaziala Hangu	31	\N	\N
39443	Scoala Gimnaziala I. Gervescu	31	\N	\N
39444	Scoala Gimnaziala Constantin Pantiru Grinties	31	\N	\N
39445	Scoala Gimnaziala Iustin Pirvu Poiana Teiului	31	\N	\N
39446	Scoala Gimnaziala Nr.5  Piatra Neamț	31	\N	\N
39447	Scoala Gimnaziala Nr. 1 Piatra Neamț	31	\N	\N
39448	Liceul Tehnologic Nisiporesti Com Botesti	31	\N	\N
39449	Scoala Gimnaziala Nr 1 Comuna Zanesti Judetul Neamț	31	\N	\N
39450	Liceul Tehnologic Adjudeni	31	\N	\N
39451	Scoala Gimnaziala Boghicea Judetul Neamț	31	\N	\N
39452	Scoala Gimnaziala Comuna Rediu Judetul Neamț	31	\N	\N
39453	Scoala Gimnaziala Ioan Luca	31	\N	\N
39454	Scoala Gimnaziala  Constantin Virgil Gheorghiu	31	\N	\N
39455	Scoala Gimnaziala Comuna Doljesti Judetul Neamț	31	\N	\N
39456	Scoala Gimnaziala Ion Creanga Tg.Neamț	31	\N	\N
39457	Scoala Gimnaziala Nr 1 Comuna  Bicaz-chei	31	\N	\N
39458	Liceul Teoretic  Vasile Alecsandri  Comuna Sabaoani Judetul Neamț	31	\N	\N
39459	Scoala Gimnaziala Dumitru Almas Negresti	31	\N	\N
39460	Liceul Teologic Romano Catolic „sfantul Francisc De Assisi..	31	\N	\N
39461	Scoala Gimnaziala Comuna Piatra Soimului Judetul Neamț	31	\N	\N
39462	Liceul Carol I Bicaz	31	\N	\N
39463	Scoala Gimnaziala Comuna Ion Creanga	31	\N	\N
39464	Scoala Gimnaziala Nr.11 Piatra Neamț	31	\N	\N
39465	Scoala Gimnaziala Comuna Tupilati	31	\N	\N
39466	Liceul Tehnologic Valea Ursului	31	\N	\N
39467	Scoala Gimnaziala Dr.emanuiel Rigler	31	\N	\N
39468	Scoala Gimnaziala Comuna Faurei Judet Neamț	31	\N	\N
39469	Colegiul Tehnic De Transporturi	31	\N	\N
39470	Scoala Gimnaziala Com Secuieni Jud Neamț	31	\N	\N
39471	Liceul Tehnologic Oglinzi	31	\N	\N
39472	Scoala Gimnaziala Comuna Baltatesti	31	\N	\N
39473	Scoala Gimnaziala Nr.1 Comuna Dumbrava Rosiejudetui Neamț	31	\N	\N
39474	Liceul Cu Program Sportiv Piatra Neamț	31	\N	\N
39475	Liceul Tehnologic Ion Popescu Cilieni Comuna Cilieni	32	\N	\N
39476	Scoala Gimnaziala Comuna Vadastra	32	\N	\N
39477	Scoala Gimnaziala Leonida Marineanu Comuna Tia Mare	32	\N	\N
39478	Scoala Gimnaziala Comuna Farcasele	32	\N	\N
39479	Scoala Gimnaziala Comuna Gircov	32	\N	\N
39480	Scoala Gimnaziala Comuna Dobrun	32	\N	\N
39481	Scoala Gimnaziala Comuna Vilcele	32	\N	\N
39482	Colegiul National Radu Greceanu	32	\N	\N
39483	Scoala Gimnaziala Nr.1  Loccaracal Jud.olt	32	\N	\N
39484	Colegiul National Agricol Carol I	32	\N	\N
39485	Scoala Gimnaziala Comuna Schitu	32	\N	\N
39486	Colegiul Tehnic Danubius	32	\N	\N
39487	Liceul Tehnologic Comuna Iancu Jianu	32	\N	\N
39488	Scoala Gimnaziala Comuna Verguleasa	32	\N	\N
39489	Scoala Gimnaziala Comuna Stoican Esti	32	\N	\N
39490	Scoala Gimnaziala Comuna Gradinari	32	\N	\N
39491	Liceul Teoretic Tu Dor Vladimirescu	32	\N	\N
39492	Scoala Gimnaziala Comuna Poboru	32	\N	\N
39493	Scoala Gimnaziala Comuna Bobicesti	32	\N	\N
39494	Scoala Gimnaziala Comuna Baldovinesti	32	\N	\N
39495	Liceul Tehnologic Constantin Filipescu Loc Caracal Jud Olt	32	\N	\N
39496	Scoala Gimnaziala Comuna Morunglav	32	\N	\N
39497	Scoala Gimnaziala Comuna Strej Esti	32	\N	\N
39498	Scoala Gimnaziala Comuna Vulturesti	32	\N	\N
39499	Scoala Gimnaziala Comuna Priseaca	32	\N	\N
39500	Scoala Gimnaziala Comuna Vadastrita	32	\N	\N
39501	Scoala Gimnaziala Comuna Calui	32	\N	\N
39502	Scoala Gimnaziala Comuna Izbiceni	32	\N	\N
39503	Liceul Tehnologic Comuna Valeni	32	\N	\N
39504	Liceul Tehnologic Comuna Crimpoia	32	\N	\N
39505	Scoala Gimnaziala Comuna Visina	32	\N	\N
39506	Scoala Gimnaziala Constantin Brancoveanu Municipiul Slatina	32	\N	\N
39507	Colegiul Tehnic Alexe Marin	32	\N	\N
39508	Scoala Gimnaziala Comuna Fagetelu	32	\N	\N
39509	Colegiul National Ionita Asan	32	\N	\N
39510	Scoala Gimnaziala Comuna Dobrosloveni	32	\N	\N
39511	Scoala Gimnaziala Comuna Stoenesti	32	\N	\N
39512	Colegiul National Al I Cuza	32	\N	\N
39513	Scoala Gimnaziala Comuna Deveselu	32	\N	\N
39514	Colegiul Tehnic Metalurgic	32	\N	\N
39515	Colegiul National Ion Minulescu	32	\N	\N
39516	Liceul Tehnologic Comuna Vitomiresti	32	\N	\N
39517	Scoala Gimnaziala Mihai Viteazul Comuna Babiciu	32	\N	\N
39518	Scoala Gimnaziala Nr 1 Oras Bals	32	\N	\N
39519	Scoala Gimnaziala Cart.comani Orasul Draganesti Olt	32	\N	\N
39520	Scoala Gimnaziala Comuna Pirscoveni	32	\N	\N
39521	Liceul Tehnologic Orasul Draganesti-olt	32	\N	\N
39522	Scoala Gimnaziala Sat Viespesti Comuna Sprincenata	32	\N	\N
39523	Scoala Gimnaziala Comuna Gostavatu	32	\N	\N
39524	Scoala Gimnaziala Comuna Barastii De Vede	32	\N	\N
39525	Scoala Gimnaziala Comuna Vladila	32	\N	\N
39526	Colegiul Tehnic Matei Basarab	32	\N	\N
39527	Scoala Gimnaziala Cart.bircii Orasul Scornicesti	32	\N	\N
39528	Scoala Postliceala Sanitara	32	\N	\N
39529	Scoala Gimnaziala Comuna Gura Padinii	32	\N	\N
39530	Scoala Gimnaziala Nr.3 Municipiul Slatina	32	\N	\N
39531	Scoala Gimnaziala Comuna Corbu	32	\N	\N
39532	Scoala Gimnaziala Comuna Visina Noua	32	\N	\N
39533	Scoala Gimnaziala Comuna Movileni	32	\N	\N
39534	Scoala Gimnaziala Florian Dituleasa Sat Vitanesti Comuna Sarbii Magura	32	\N	\N
39535	Scoala Gimnaziala Comuna Milcov	32	\N	\N
39536	Liceul Tehnologic Comuna Tu Feni	32	\N	\N
39537	Scoala Gimnaziala  Aviator Alexandru Serbanescu Comuna Colon Esti	32	\N	\N
39538	Scoala Gimnaziala Comuna Ganeasa	32	\N	\N
39539	Scoala Gimnaziala Comuna Dobroteasa	32	\N	\N
39540	Scoala Gimnaziala Pan M. Vizirescu Sat Branet	32	\N	\N
39541	Scoala Gimnaziala Comuna Urzica	32	\N	\N
39542	Gradinita Cu Program Normal Dumbrava Minunata	32	\N	\N
39543	Scoala Gimnaziala Comuna Teslui	32	\N	\N
39544	Scoala Gimnaziala Comuna Brastavatu	32	\N	\N
39545	Scoala Gimnaziala Comuna Falcoiu	32	\N	\N
39546	Scoala Gimnaziala Comuna Simburesti	32	\N	\N
39547	Scoala Gimnaziala Comuna Redea	32	\N	\N
39548	Gradinita Cu Program Prelungit Nr 1 Slatina	32	\N	\N
39549	Scoala Gimnaziala Comuna Oboga	32	\N	\N
39550	Scoala Gimnaziala Decebal Comuna Dobretu	32	\N	\N
39551	Gradinita Cu Program Prelungit Ion Creanga Slatina	32	\N	\N
39552	Scoala Gimnaziala Mihail Drumes Bals	32	\N	\N
39553	Scoala Gimnaziala Comuna Coteana	32	\N	\N
39554	Colegiul Economic P.s. Aurelian	32	\N	\N
39555	Gradinita Cu Program Prelungit Nr 3 Slatina	32	\N	\N
39556	Scoala Gimnaziala Comuna Cungrea	32	\N	\N
39557	Scoala Gimnaziala Comuna Perieti	32	\N	\N
39558	Scoala Gimnaziala Nicolae Titu Lescu	32	\N	\N
39559	Scoala Gimnaziala Nr. 1 Slatina	32	\N	\N
39560	Gradinita Cu Program Normal Ion Creanga	32	\N	\N
39561	Scoala Gimnaziala Comuna Traian	32	\N	\N
39562	Liceul Tehnologic Orasul Piatra Olt	32	\N	\N
39563	Scoala Gimnaziala Comuna Tatu Lesti	32	\N	\N
39564	Scoala Gimnaziala Comuna Topana	32	\N	\N
39565	Scoala Gimnaziala Comuna Draghiceni	32	\N	\N
39566	Scoala Gimnaziala Comuna Ghimpeteni	32	\N	\N
39567	Scoala Gimnaziala Comuna Nicolae Titu Lescu	32	\N	\N
39568	Scoala Gimnaziala Comuna Leleasca	32	\N	\N
39569	Scoala Profesionala Speciala Bals	32	\N	\N
39570	Scoala Gimnaziala Buna Vestire	32	\N	\N
39571	Scoala Gimnaziala Comuna  Grojdibodu	32	\N	\N
39572	Gradinita Cu Program Prelungit Nr 8	32	\N	\N
39573	Scoala Gimnaziala Comuna Slatioara	32	\N	\N
39574	Scoala Gimnaziala Comuna Optasi Magura	32	\N	\N
39575	Scoala Gimnaziala Nr.2 Loc. Caracal Jud. Olt	32	\N	\N
39576	Scoala Gimnaziala Vlaicu Voda Municipiul Slatina	32	\N	\N
39577	Liceul Teoretic Petre Pan Drea	32	\N	\N
39578	Scoala Gimnaziala Comuna Radomiresti	32	\N	\N
39579	Scoala Gimnaziala  Comuna Stefan Cel Mare	32	\N	\N
39580	Gradinita Cu Program Prelungit Nr 7 Slatina	32	\N	\N
39581	Scoala Gimnaziala Nicolae Marineanu Comuna Cezieni	32	\N	\N
39582	Gradinita Cu Program Prelungit Nr.5 Slatina	32	\N	\N
39583	Scoala Gimnaziala Sat Alunisu Comuna Spineni	32	\N	\N
39584	Scoala Gimnaziala Comuna Mihaesti	32	\N	\N
39585	Scoala Gimnaziala Sat Margaritesti Comuna Voineasa	32	\N	\N
39586	Scoala Gimnaziala Comuna Soparlita	32	\N	\N
39587	Scoala Gimnaziala Gheorghe Magheru Loc.caracal Jud.olt	32	\N	\N
39588	Scoala Gimnaziala Ion I. Graure Comuna Balteni	32	\N	\N
39589	Gradinita Cu Program Prelungit Nr. 33 Municipiul Ploiesti	33	\N	\N
39590	Scoala Postliceala Sanitara Sf. Vasile Cel Mare	33	\N	\N
39591	Colegiul Tehnic Constantin Istrati Municipiul Campina	33	\N	\N
39592	Scoala Gimnaziala Comuna Gura Vadu Lui	33	\N	\N
39593	Liceul Tehnologic Ludovic Mrazek	33	\N	\N
39594	Scoala Gimnaziala Comuna Jugureni	33	\N	\N
39595	Scoala Gimnaziala George Cosbuc Municipiul Ploiesti	33	\N	\N
39596	Scoala Gimnaziala Canuta Ionescu Orasul Urlati	33	\N	\N
39597	Scoala Profesionala Speciala Orasul Breaza	33	\N	\N
39598	Scoala Gimnaziala Comuna Calugareni	33	\N	\N
39599	Scoala Gimnaziala Comuna Brazi	33	\N	\N
39600	Liceul Tehnologic Comuna Filipestii De Padure	33	\N	\N
39601	Gradinita Step By Step Cu Program Prelungit Si Program Normal Raza De Soare Municipiul Plc	33	\N	\N
39602	Scoala Gimnaziala Eroilor Comuna Lipanesti	33	\N	\N
39603	Scoala Gimnaziala Comuna Gornet	33	\N	\N
39604	Colegiul National Nicolae Iorga Orasul Valenii De Munte	33	\N	\N
39605	Scoala Gimnaziala Profdinu Mihail Dan Sat Magula Comuna Tomsani	33	\N	\N
39606	Scoala Gimnaziala Manastireanu Mihai Comuna Predeal Sarari	33	\N	\N
39607	Scoala Gimnaziala Comuna Cocorastii Colt	33	\N	\N
39608	Scoala Gimnaziala Elena Doamna Municipiul Ploiesti	33	\N	\N
39609	Liceul Tehnologic Energetic Municipiul Campina	33	\N	\N
39610	Scoala Gimnaziala Speciala Orasul Valenii De Munte	33	\N	\N
39611	Scoala Gimnaziala Comuna Dumbravesti	33	\N	\N
39612	Liceul Tehnologic Comuna Starchiojd	33	\N	\N
39613	Scoala Gimnaziala Nichita Stanescu Comuna Ceptura	33	\N	\N
39614	Colegiul National Nicolae Grigorescu	33	\N	\N
39615	Scoala Gimnaziala Nestor Urechia Orasul Busteni	33	\N	\N
39616	Scoala Gimnaziala Comuna Poienarii Burchii	33	\N	\N
39617	Scoala Gimnaziala Invatator Dinu Nicolae Comuna Dumbrava	33	\N	\N
39618	Scoala Gimnaziala Traian Savu Lescu Comuna Izvoarele	33	\N	\N
39619	Scoala Gimnaziala Radu Tu Doran Comuna Blejoi	33	\N	\N
39620	Scoala Gimnaziala Sfantul Nicolae Orasul Mizil	33	\N	\N
39621	Scoala Gimnaziala I.a. Bassarabescu Municipiul Ploiesti	33	\N	\N
39622	Scoala Gimnaziala  Principesa Maria Orasul Sinaia	33	\N	\N
39623	Scoala Gimnaziala Speciala Nr.1 Municipiul Ploiesti	33	\N	\N
39624	Scoala Gimnaziala  Gheorghe Dibos Comuna Manesti	33	\N	\N
39625	Colegiul Tehnic Gheorghe Lazar  Orasul Plopeni	33	\N	\N
39626	Scoala Gimnaziala Comuna Plopu	33	\N	\N
39627	Scoala Gimnaziala Sat Posestii Paminteni	33	\N	\N
39628	Scoala Gimnaziala Comuna Cocorastii Mislii	33	\N	\N
39629	Liceul Tehnologic De Transporturi Municipiul Ploiesti	33	\N	\N
39630	Universitatea Petrol-Gaze	33	\N	\N
39631	Gradinita Cu Program Prelungit Nr.2 Comuna Filipestii De Padure	33	\N	\N
39632	Scoala Gimnaziala Comuna Olari	33	\N	\N
39633	Scoala Gimnaziala Profesor Oprea Mihai Sat Negoiesti Comuna Brazi	33	\N	\N
39634	Gradinita Cu Program Prelungit Nr.28 Municipiul Ploiesti	33	\N	\N
39635	Scoala Gimnaziala Platon Mocanu Sat Drajna De Jos Comuna Drajna	33	\N	\N
39636	Scoala Gimnaziala Comuna Sotrile	33	\N	\N
39637	Scoala Gimnaziala Comuna Fantanele	33	\N	\N
39638	Scoala Gimnaziala Comuna Cosminele	33	\N	\N
39639	Scoala Profesionala Speciala Orasul Plopeni	33	\N	\N
39640	Gradinita Cu Program Prelungit Nr. 21 Municipiul Ploiesti	33	\N	\N
39641	Liceul Tehnologic Sat Cioranii De Jos Comuna Ciorani	33	\N	\N
39642	Liceul Tehnologic De Servicii Sfantul Apostol Andrei	33	\N	\N
39643	Gradinita Cu Program Prelungit Nr.9 Municipiul Campina	33	\N	\N
39644	Scoala Gimnaziala Grigore Moisil Municipiul Ploiesti	33	\N	\N
39645	Scoala Gimnaziala Ion Campineanu Municipiul Campina	33	\N	\N
39646	Scoala Gimnaziala Comuna Talea	33	\N	\N
39647	Scoala Gimnaziala Comuna Stefesti	33	\N	\N
39648	Scoala Gimnaziala Comuna Carbunesti	33	\N	\N
39649	Scoala Gimnaziala Comuna Vilcan Esti	33	\N	\N
39650	Colegiul Economic Virgil Madgearu	33	\N	\N
39651	Scoala Gimnaziala Nicolae Titulescu Municipiul Ploiesti	33	\N	\N
39652	Scoala Gimnaziala Sat Buda Comuna Rifov	33	\N	\N
39653	Colegiul National Ion Luca Caragiale Municipiul Ploiesti	33	\N	\N
39654	Scoala Gimnaziala George Emil Palade Municipiul Ploiesti	33	\N	\N
39655	Liceul Tehologic Constantin Cantacuzino Orasul Baicoi	33	\N	\N
39656	Scoala De Subofiteri De Pompieri Si Protectie Civila Pavel Zagan Escu  Boldesti	33	\N	\N
39657	Scoala Gimnaziala Gheorghe Costescu Comuna Alunis	33	\N	\N
39658	Liceul Tehnologic 1 Mai Municipiul Ploiesti	33	\N	\N
39659	Scoala Gimnaziala Comuna Tinosu	33	\N	\N
39660	Liceul Tehnologic Comuna Cerasu	33	\N	\N
39661	Scoala Gimnaziala Comuna Gura Vitioarei	33	\N	\N
39662	Scoala Gimnaziala Nr 1 Orasul Mizil	33	\N	\N
39663	Liceul Tehnologic Mecanic Municipiul Campina	33	\N	\N
39664	Scoala Gimnaziala Comuna Lapos	33	\N	\N
39665	Scoala Gimnaziala Andrei Mureșanu	33	\N	\N
39666	Scoala Gimnaziala Profesor Nicolae Simache Municipiul Ploiesti	33	\N	\N
39667	Scoala Gimnaziala Comuna Berceni	33	\N	\N
39668	Scoala Gimnaziala Comuna Floresti	33	\N	\N
39669	Scoala Gimnaziala Comuna Batrani	33	\N	\N
39670	Scoala Gimnaziala Comuna Bertea	33	\N	\N
39671	Scoala Gimnaziala Comuna Soimari	33	\N	\N
39672	Scoala Gimnaziala Comuna Magureni	33	\N	\N
39673	Scoala Gimnaziala Gheorghe Lazar Comuna Barcanesti	33	\N	\N
39674	Scoala Gimnaziala Comuna Apostolache	33	\N	\N
39675	Scoala Gimnaziala Sat Varbila Comuna Iordacheanu	33	\N	\N
39676	Scoala Gimnaziala Comuna Su Rani	33	\N	\N
39677	Scoala Gimnaziala  Sat Maneciu Pamanteni Comuna Maneciu	33	\N	\N
39678	Liceul Simion Stolnicu Orasul Comarnic	33	\N	\N
39679	Scoala Gimnaziala Comuna Vadu  Sapat	33	\N	\N
39680	Scoala Gimnaziala Comuna Tirgsoru Vechi	33	\N	\N
39681	Scoala Gimnaziala Carol I Orasul Plopeni	33	\N	\N
39682	Scoala Gimnaziala Sat Marginenii De Jos Comuna Filipestii De Tirg	33	\N	\N
39683	Scoala Gimnaziala Laurentiu Fulga	33	\N	\N
39684	Gradinita Cu Program Prelungit Scufita Rosie Municipiul Ploiesti	33	\N	\N
39685	Liceul Teoretic Comuna Filipestii De Padure	33	\N	\N
39686	Scoala  Gimnaziala Comuna Gornet-cricov	33	\N	\N
39687	Scoala Gimnaziala Comuna Gherghita	33	\N	\N
39688	Scoala Gimnaziala Mitropolit Pimen Georgescu Comuna Provita De Sus	33	\N	\N
39689	Scoala Gimnaziala Centrala Municipiul Campina	33	\N	\N
39690	Scoala Gimnaziala Comuna Magurele	33	\N	\N
39691	Scoala Gimnaziala Ioan Duhovnicul Comuna Banesti	33	\N	\N
39692	Gradinita Cu Program Prelungit Nr. 38 Municipiul Ploiesti	33	\N	\N
39693	Liceul Tehnologic Agricol Comuna Barcanesti	33	\N	\N
39694	Scoala De Agenti De Politie Vasile Lascar	33	\N	\N
39695	Scoala Gimnaziala Nr. 2 Orasul Boldesti-scaeni	33	\N	\N
39696	Scoala Gimnaziala Inv. Athanasiejan Stoicescu  Comuna Aricestii Zeletin	33	\N	\N
39697	Scoala Gimnaziala Anton Pann Municipiul Ploiesti	33	\N	\N
39698	Liceul Teoretic Aurel Vlaicu Orasul Breaza	33	\N	\N
39699	Liceul Teoretic Brancoveanu Voda Orasul Urlati	33	\N	\N
39700	Scoala Gimnaziala Liliesti Orasul Baicoi	33	\N	\N
39701	Scoala Gimnaziala Comuna Iordacheanu	33	\N	\N
39702	Scoala Gimnaziala Comuna Draganesti	33	\N	\N
39703	Scoala Gimnaziala Nr.1  Comuna Telega	33	\N	\N
39704	Scoala Gimnaziala Sfintii Imparati Comuna Balta Doamnei	33	\N	\N
39705	Colegiul National Alexandru Ioan Cuza  Municipiul Ploiesti	33	\N	\N
39706	Liceul Teoretic Serban Voda	33	\N	\N
39707	Scoala Gimnaziala  Ioan Grigorescu Municipiul Ploiesti	33	\N	\N
39708	Scoala Gimnaziala Mihai Viteazul Orasul Boldesti-scaeni	33	\N	\N
39709	Gradinita Cu Program Prelungit Nr.35 Ploiesti	33	\N	\N
39710	Scoala Gimnaziala Constantin Brancoveanu	33	\N	\N
39711	Scoala Gimnaziala Sfanta Maria Orasul Mizil	33	\N	\N
39712	Liceul Tehnologic Administrativ Si De Servicii Victor Slavescu Municipiul Ploiesti	33	\N	\N
39713	Scoala Gimnaziala Sat Slon Comuna Cerasu	33	\N	\N
39714	Scoala Gimnaziala Comuna Podenii Noi	33	\N	\N
39715	Scoala Gimnaziala Ioan Moga Sat Ditesti Comuna Filipestii De Padure	33	\N	\N
39716	Scoala Gimnaziala Comuna Baba Ana	33	\N	\N
39717	Liceul Tehnologic Carol I	33	\N	\N
39718	Scoala Gimnaziala Matei Basarab Comuna Brebu	33	\N	\N
39719	Liceul Tehnologic Tase Dumitrescu Orasul Mizil	33	\N	\N
39720	Scoala Gimnaziala Comuna Varbilau	33	\N	\N
39721	Scoala Gimnaziala Profesor Eugeniu Corbu Sat Podgoria	33	\N	\N
39722	Colegiul National Nichita Stanescu Municipiul Ploiesti	33	\N	\N
39723	Liceul Tehnologic  Teodor Diamant Orasul Boldesti-scaeni	33	\N	\N
39724	Gradinita Cu Program Prelungit Nr.32 Municipiul Ploiesti	33	\N	\N
39725	Gradinita Cu Program Prelungit Dumbrava Minunata  Municipiul Ploiesti	33	\N	\N
39726	Scoala Gimnaziala Toma T. Socolescu Comuna Paulesti	33	\N	\N
39727	Scoala Gimnaziala Alexandru Ioan Cuza Municipiul Campina	33	\N	\N
39728	Scoala Gimnaziala Sat Dirvari Comuna Valea Calugareasca	33	\N	\N
39729	Gradinita Cu Program Prelungit Nr. 23 Municipiul Ploiesti	33	\N	\N
39730	Liceul Tehnologic Anghel Saligny Municipiul Ploiesti	33	\N	\N
39731	Scoala Gimnaziala George Enescu Orasul Sinaia	33	\N	\N
39732	Scoala Gimnaziala Iuliu Maniu Zalau	35	\N	\N
39733	Scoala Postliceala Sanitara Christiana	35	\N	\N
39734	Scoala Gimnaziala Nr 1 Babeni	35	\N	\N
39735	Scoala Gimnaziala Nr 1 Simisna	35	\N	\N
39736	Scoala Gimnaziala Nr. 1 Romanasi	35	\N	\N
39737	Scoala Gimnaziala Nr. 1 Somes Odorhei	35	\N	\N
39738	Scoala Gimnaziala Nr 1 Cristolt	35	\N	\N
39739	Gradinita Cu Program Normal N. 8 Zalau	35	\N	\N
39740	Gradinita Cu Program Prelungit Casuta Cu Povesti Zalau	35	\N	\N
39741	Liceul Tehnologic Nr 1 Sarmasag	35	\N	\N
39742	Gradinita Cu Program Prelungit Piticii Isteti Zalau	35	\N	\N
39743	Liceul Reformat Wesselenyi	35	\N	\N
39744	Liceul Tehnologic Nr 1  Gilgau	35	\N	\N
39745	Scoala Gimnaziala Nr1  Banisor	35	\N	\N
39746	Liceul Cu Program Sportiv Avram Iancu	35	\N	\N
39747	Gradinita Cu Program Prelungit Nr. 5 Zalau	35	\N	\N
39748	Scoala Gimnaziala Aurelia Si Lazar Cosma Treznea	35	\N	\N
39749	Scoala Gimnaziala Nr 1 Marca	35	\N	\N
39750	Scoala Postliceala Sanitara Zalau	35	\N	\N
39751	Scoala Gimnaziala Nr.1  Dragu	35	\N	\N
39752	Scoala Gimnaziala Nr.1 Almasu	35	\N	\N
39753	Gradinita Cu Program Prelungit Nr.1 Zalau	35	\N	\N
39754	Scoalagimnaziala Nr 1 Mirsid	35	\N	\N
39755	Scoala Gimnaziala Nr 1 Ip	35	\N	\N
39756	Scoala Gimnaziala Nr.1 Virsolt	35	\N	\N
39757	Scoala Gimnaziala  Nr.1 Valcau De Jos	35	\N	\N
39758	Liceul Teoretic Ion Agarbiceanu	35	\N	\N
39759	Liceul Tehnologic Voievodul Gelu Zalau	35	\N	\N
39760	Gradinita Cu Program Prelungit Ion Creanga Zalau	35	\N	\N
39761	Scoala Gimnaziala Nr 1 Pericei	35	\N	\N
39762	Scoala Gimnaziala Traian Cretu Napradea	35	\N	\N
39763	Scoala Gimnaziala Nr 1 Zimbor	35	\N	\N
39764	Scoala Gimnaziala Gheorghe Lazar Zalau	35	\N	\N
39765	Scoala Gimnaziala Nr.1  Borla	35	\N	\N
39766	Scoala Gimnaziala Nr.1  Panic	35	\N	\N
39767	Scoala Gimnaziala Vasile Breban Criseni	35	\N	\N
39768	Gradinita Cu Program Prelungit Nr 3 Simleul Silvaniei	35	\N	\N
39769	Liceul Tehnologic Nr. 1 Nusfalau	35	\N	\N
39770	Scoala Gimnaziala Gheorghe Sincai	35	\N	\N
39771	Scoala Gimnaziala Gyulaffy Laszlo	35	\N	\N
39772	Scoala Gimnaziala Nr.1  Fildu De Mijloc	35	\N	\N
39773	Scoala Gimnaziala Nr.1  Horoatu Crasnei	35	\N	\N
39774	Scoala Gimnaziala Andrei Mureșanu	35	\N	\N
39775	Gradinita Cu Program Preungit Voinicel	35	\N	\N
39776	Liceul Tehnologic Ioan Ossian	35	\N	\N
39777	Gradinita Cu Program Prelungit Nr. 12 Zalau	35	\N	\N
39778	Scoala Gimnaziala Nr. 1 Lozna	35	\N	\N
39779	Scoala Gimnaziala Nr. 1 Coseiu	35	\N	\N
39780	Liceul Tehnologic Nr. 1 Sig	35	\N	\N
39781	Scoala Gimnaziala Petre Dulfu Salatig	35	\N	\N
39782	Liceul Tehnologic Mihai Viteazul	35	\N	\N
39783	Gradinita Cu Program Prelungit Prichindel	35	\N	\N
39784	Scoala Gimnaziala Nr.1 Jebucu	35	\N	\N
39785	Scoala Gimnaziala Horea	35	\N	\N
39786	Scoala Gimnaziala Nr.1 Maeriste	35	\N	\N
39787	Scoala Gimnaziala Nr.1 Deja	35	\N	\N
39788	Scoala Gimnaziala Nr. 1 Zalha	35	\N	\N
39789	Scoala Gimnaziala Nr.1 Boghis	35	\N	\N
39790	Scoala Gimnaziala Nr 1 Chiesd	35	\N	\N
39791	Scoala Gimnaziala Nr.1 Cuzaplac	35	\N	\N
39792	Scoala Gimnaziala Petri Mor Nusfalau	35	\N	\N
39793	Scoala Gimnaziala Nr.1 Sinmihaiu Almasu Lui	35	\N	\N
39794	Scoala Gimnaziala Nr.1  Balan	35	\N	\N
39795	Gradinita Cu Program Prelungit Nr 2	35	\N	\N
39796	Scoala Gimnaziala Lucian Blaga Jibou	35	\N	\N
39797	Gradinita Cu Program Prelungit Nr.6 Satu Mare	34	\N	\N
39798	Scoala Gimnaziala Pomi	34	\N	\N
39799	Scoala Gimnaziala Porumbesti	34	\N	\N
39800	Gradinita Cu Program Prelungit Nr.13 Satu Mare	34	\N	\N
39801	Gradinita Cu Program Saptamanal Floarea De Lotus Odoreu	34	\N	\N
39802	Scoala Gimnaziala Poiana Codrului	34	\N	\N
39803	Scoala Gimnaziala Calinesti Oas	34	\N	\N
39804	Gradinita Cu Program Prelungit Nr.5	34	\N	\N
39805	Scoala Gimnaziala Pir	34	\N	\N
39806	Scoala Gimnaziala Santau	34	\N	\N
39807	Scoala Gimnaziala Tiream	34	\N	\N
39808	Scoala Gimnaziala Nr. 3	34	\N	\N
39809	Scoala Gimnaziala Camin	34	\N	\N
39810	Scoala  Gimnaziala  Batarci	34	\N	\N
39811	Scoala Gimnaziala Vama	34	\N	\N
39812	Colegiul National Ioan Slavici Satu Mare	34	\N	\N
39813	Gradinita Cu Program Prelungit Nr.1 Tasnad	34	\N	\N
39814	Liceul Tehnologic George Baritiu Livada	34	\N	\N
39815	Scoala Gimnaziala Tasnad	34	\N	\N
39816	Liceul Teologic Ortodox Nicolae Steinhardt	34	\N	\N
39817	Liceul Tehnologic Ionita G. Andron Negresti Oas	34	\N	\N
39818	Scoala De Arte Satu Mare	34	\N	\N
39819	Scoala Gimnaziala Dorolt	34	\N	\N
39820	Gradinita Cu Program Prelungit Guliver	34	\N	\N
39821	Gradinita Cu Program Prelungit Dumbrava Minunata	34	\N	\N
39822	Colegiul National Mihai Eminescu	34	\N	\N
39823	Scoala Gimnaziala George Cosbuc  Mediesu Aurit	34	\N	\N
39824	Liceul Teologic Romano Catolic Ham Janos	34	\N	\N
39825	Liceul Romano Catolic Josephus Calasantius	34	\N	\N
39826	Scoala     Gimnaziala   Valea  Vinului	34	\N	\N
39827	Scoala Gimnaziala Grigore Moisil	34	\N	\N
39828	Scoala Gimnaziala Ciumesti	34	\N	\N
39829	Scoala Gimnaziala Doba	34	\N	\N
39830	Scoala Gimnaziala Dr.vasile Lucaciu Satu Mare	34	\N	\N
39831	Liceul Cu Program Sportiv Satu Mare	34	\N	\N
39832	Liceul Tehnologic Anghel Saligny Turt	34	\N	\N
39833	Colegiul Tehnic Iuliu Maniu	34	\N	\N
39834	Colegiul Economic Gheorghe Dragos	34	\N	\N
39835	Scoala Gimnaziala Lucian Blaga	34	\N	\N
39836	Scoala Gimnaziala Oar	34	\N	\N
39837	Scoala Gimnaziala Nr.1	34	\N	\N
39838	Scoala Gimnaziala Cu Lciu Mare	34	\N	\N
39839	Scoala Gimnaziala Foieni	34	\N	\N
39840	Liceul Teoretic Carei	34	\N	\N
39841	Gradinita Cu Program Prelungit Nr.1 Negresti Oas	34	\N	\N
39842	Scoala Gimnaziala Acas	34	\N	\N
39843	Scoala  Gimnaziala  Vasile Lucaciu  Apa	34	\N	\N
39844	Scoala Gimnaziala Orasu Nou	34	\N	\N
39845	Scoala Gimnaziala „ Vasile Lucaciu „ Lucaceni	34	\N	\N
39846	Scoala Gimnaziala Sauca	34	\N	\N
39847	Scoala Gimnaziala Odoreu	34	\N	\N
39848	Gradinita Cu Program Prelungit Nr.7	34	\N	\N
39849	Scoala Gimnaziala Vasile Lucaciu	34	\N	\N
39850	Scoala Gimnaziala Octavian Goga	34	\N	\N
39851	Scoala Gimnaziala Socond	34	\N	\N
39852	Scoala Gimnaziala Andrid	34	\N	\N
39853	Scoala Gimnaziala Berveni	34	\N	\N
39854	Scoala Gimnaziala Ion Creanga	34	\N	\N
39855	Scoala Gimnaziala Balcescu Petofi	34	\N	\N
39856	Scoala Gimnaziala Ratesti	34	\N	\N
39857	Gradinita Cu Program Prelungit Voinicelul	34	\N	\N
39858	Scoala Gimnaziala Tirsolt	34	\N	\N
39859	Liceul Tehnologic Tarna Mare	34	\N	\N
39860	Scoala Gimnaziala Aurel Haiduc Trip	34	\N	\N
39861	Colegiul Tehnic De Transporturi Si Telecomunicatii Ion I.c.bratianu Satu Mare	34	\N	\N
39862	Scoala Gimnaziala Halmeu	34	\N	\N
39863	Gradinita Cu Program Prelungit Ardud	34	\N	\N
39864	Gradinita Cu Programprlungit Nr.7	34	\N	\N
39865	Scoala Gimnaziala Avram Iancu	34	\N	\N
39866	Liceul Tehnologic Petofi Sandor Lazuri	34	\N	\N
39867	Scoala Gimnaziala Nr.1 Carei	34	\N	\N
39868	Scoala Gimnaziala Gheorghe Bulgar Sanislau	34	\N	\N
39869	Liceul Teoreticnegresti Oas	34	\N	\N
39870	Scoala Gimnaziala Tempfli Jozsef Urziceni	34	\N	\N
39871	Scoala Gimnaziala Botiz	34	\N	\N
39872	Scoala Gimnaziala Viorel Salagean-beltiug	34	\N	\N
39873	Liceul Tehnologic Constantin Brancusi	34	\N	\N
39874	Colegiul National Doamna Stanca	34	\N	\N
39875	Gradinita Cu Program Prelungit Draga Mea Satu Mare	34	\N	\N
39876	Colegiul Tehnic Unio-traian Vuia Satu Mare	34	\N	\N
39877	Scoala Gimnaziala Terebesti	34	\N	\N
39878	Gradinita Cu Program Prelungit Nr.1	34	\N	\N
39879	Colegiul Tehnic Elisa Zamfirescu	34	\N	\N
39880	Scoala Gimnaziala Paulesti	34	\N	\N
39881	Scoala Gimnaziala Mircea Eliade	34	\N	\N
39882	Scoala Gimnaziala Piscolt	34	\N	\N
39883	Scoala Gimnaziala Gherta Mica	34	\N	\N
39884	Liceul Tehnologic Ardud	34	\N	\N
39885	Liceul Tehnologic Petru Cupcea Supuru De Jos	34	\N	\N
39886	Liceul Tehnologic Tasnad	34	\N	\N
39887	Scoala Gimnaziala Gellert Sandor Micu La	34	\N	\N
39888	Scoala Gimnaziala Craidorolt	34	\N	\N
39889	Scoala Gimnaziala Cehal	34	\N	\N
39890	Scoala Gimnaziala Certeze	34	\N	\N
39891	Scoala Gimnaziala Constantin Brancoveanu	34	\N	\N
39892	Liceul Tehnologic Nicolae Teclu Copsa Mica	36	\N	\N
39893	Academia Forțelor Terestre Nicolae Bălcescu	36	\N	\N
39894	Gradinita Cu Program Prelungit Nr.17 Sibiu	36	\N	\N
39895	Scoala Gimnaziala Mihai Viteazu Selimbar	36	\N	\N
39896	Universitatea Lucian Blaga	36	\N	\N
39897	Scoala Gimnaziala Ion Pop Reteganul Orlat	36	\N	\N
39898	Liceul Tehnologic Scoala Nationala De Gaz Medias	36	\N	\N
39899	Scoala Gimnaziala Cristian	36	\N	\N
39900	Liceul Tehnologic Cisnadie	36	\N	\N
39901	Scoala Gimnaziala Radu Selejan Sibiu	36	\N	\N
39902	Scoala Gimnaziala Bruiu	36	\N	\N
39903	Gradinita Cu Program  Prelungit Nr. 43 Sibiu	36	\N	\N
39904	Scoala Gimnaziala Stephan  Ludwig Roth Mosna	36	\N	\N
39905	Scoala  Gimnaziala Nr.23 Sibiu	36	\N	\N
39906	Scoala Gimnaziala Sura Mica	36	\N	\N
39907	Scoala Gimnaziala -viorel Cucu Paltin- Arpasu De Jos	36	\N	\N
39908	Scoala Gimnaziala Rosia	36	\N	\N
39909	Liceul Teoretic Gustav Gundisch Cisnadie	36	\N	\N
39910	Scoala Gimnaziala Seica Mica	36	\N	\N
39911	Scoala Gimnaziala Matei Basarab Turnu Rosu	36	\N	\N
39912	Gradinita Cu Program Prelungit Dumbrava Minunata Medias	36	\N	\N
39913	Scoala Gimnaziala Altina	36	\N	\N
39914	Colegiul National Samuel Von Brukenthal Sibiu	36	\N	\N
39915	Scoala Gimnaziala Apoldu De Jos	36	\N	\N
39916	Scoala Gimnaziala Corneliu Pacurariu Micasasa	36	\N	\N
39917	Liceul Teoretic Axente Sever Medias	36	\N	\N
39918	Gradinita Cu Program Prelungit Nr. 28 Sibiu	36	\N	\N
39919	Scoala Gimnaziala  Chirpar	36	\N	\N
39920	Gradinita Cu Program Prelungit Nr.18 Sibiu	36	\N	\N
39921	Scoala Gimnaziala Axente Sever	36	\N	\N
39922	Gradinita Cu Program Prelungit  Pinocchio  Medias	36	\N	\N
39923	Gradinita Cu Program Prelungit Bucuria Copiilor Medias	36	\N	\N
39924	Scoala Gimnaziala  Biertan	36	\N	\N
39925	Scoala Gimnaziala Regele Ferdinand Sibiu	36	\N	\N
39926	Liceul  Tehnologic  Iacobeni	36	\N	\N
39927	Scoala  Gimnaziala Ighisu Nou	36	\N	\N
39928	Gradinita Cu Program Prelungit Nr. 42 Sibiu	36	\N	\N
39929	Scoala Gimnaziala Ioan Slavici Sibiu	36	\N	\N
39930	Gradinita Cu Program Prelungit Nr.14 Sibiu	36	\N	\N
39931	Scoala Gimnaziala Georg Daniel Teutsch Agnita	36	\N	\N
39932	Scoala Gimnaziala Ocna Sibiului	36	\N	\N
39933	Scoala Gimnaziala Constantin Ioan Motas Medias	36	\N	\N
39934	Scoala Gimnaziala Mihaileni	36	\N	\N
39935	Gradinita Cu Program Prelungit Piticot Medias	36	\N	\N
39936	Gradinita Cu Program Prelungit Nr. 37 Sibiu	36	\N	\N
39937	Scoala Gimnaziala Aurel Decei Gura Raului	36	\N	\N
39938	Scoala Gimnaziala Pauca	36	\N	\N
39939	Liceul De Arta Sibiu	36	\N	\N
39940	Scoala Gimnaziala Nr.10 Sibiu	36	\N	\N
39941	Scoala Gimnaziala Avrig	36	\N	\N
39942	Liceul Tehnologic Constructii Si Arhitectura Carol I Sibiu	36	\N	\N
39943	Scoala Gimnaziala Nr.2 Cisnadie	36	\N	\N
39944	Scoala Gimnaziala Nicolae Iorga Sibiu	36	\N	\N
39945	Gradinita Cu Program Prelungit Raza De Soare Medias	36	\N	\N
39946	Scoala Gimnaziala  Andrei Saguna Sura Mare	36	\N	\N
39947	Scoala Gimnaziala Nr.2 Sibiu	36	\N	\N
39948	Scoala Gimnaziala Bathory Istvan Medias	36	\N	\N
39949	Colegiul National Octavian Goga Sibiu	36	\N	\N
39950	Colegiul National Pedagogic Andrei Saguna Sibiu	36	\N	\N
39951	Scoala Gimnaziala Nr. 5 Medias	36	\N	\N
39952	Liceul Tehnologic Automecanica Medias	36	\N	\N
39953	Gradinita Cu Program Prelungit Nr.33 Sibiu	36	\N	\N
39954	Scoala Gimnaziala Nr.7 Medias	36	\N	\N
39955	Liceul Teoretic Constantin Noica Sibiu	36	\N	\N
39956	Scoala  Gimnaziala  Blajel	36	\N	\N
39957	Liceul Tehnologic  Ilie Macelariu Miercurea Sibiului	36	\N	\N
39958	Scoala Gimnaziala Porumbacu De Jos	36	\N	\N
39959	Scoala Gimnaziala Vurpar	36	\N	\N
39960	Gradinita Cu Program Prelungit Nr. 16 Sibiu	36	\N	\N
39961	Scoala Gimnaziala Badea Cirtan Cirtisoara	36	\N	\N
39962	Scoala Gimnaziala Sava Popovici Barcianu Rasinari	36	\N	\N
39963	Gradinita Cu Program Prelungit Nr. 26 Sibiu	36	\N	\N
39964	Scoala Gimnaziala Marpod	36	\N	\N
39965	Universitatea Lucian Blaga Din Sibiu	36	\N	\N
39966	Colegiul Tehnic Mediensis Medias	36	\N	\N
39967	Scoala Gimnaziala Tilisca	36	\N	\N
39968	Colegiul Tehnic Cibinium Sibiu	36	\N	\N
39969	Scoala Gimnaziala Nr. 25 Sibiu	36	\N	\N
39970	Scoala Gimnaziala Birghis	36	\N	\N
39971	Scoala Gimnaziala Regina Maria Sibiu	36	\N	\N
39972	Gradinita Cu Program Prelungit Nr.19 Sibiu	36	\N	\N
39973	Scoala Gimnaziala Mihai Eminescu Medias	36	\N	\N
39974	Scoala Gimnaziala Ioan Moraru Dirlos	36	\N	\N
39975	Gradinita Cu Program Prelungit Fratii Grimm Sibiu	36	\N	\N
39976	Scoala Gimnaziala Hermann Oberth Medias	36	\N	\N
39977	Scoala Gimnaziala Nr 18 Sibiu	36	\N	\N
39978	Scoala Gimnaziala Poplaca	36	\N	\N
39979	Gradinita Cu Program Prelungit Elefantelul Curios Sibiu	36	\N	\N
39980	Liceul Tehnologic Ioan Lupas Saliste	36	\N	\N
39981	Colegiul Tehnic Energetic Sibiu	36	\N	\N
39982	Scoala Gimnaziala Seica Mare	36	\N	\N
39983	Gradinita Cu Program Prelungit Nr.15 Sibiu	36	\N	\N
39984	Gradinita Cu Program Prelungit Micul Print Medias	36	\N	\N
39985	Colegiul Tehnic August Treboniu Laurian Agnita	36	\N	\N
39986	Scoala Gimnaziala Merghindeal	36	\N	\N
39987	Scoala Gimnaziala Slimnic	36	\N	\N
39988	Scoala Gimnaziala Alma	36	\N	\N
39989	Scoala Gimnaziala Ilie Micu Ludos	36	\N	\N
39990	Liceul Tehnologic Henri Coanda Sibiu	36	\N	\N
39991	Scoala Gimnaziala Riu Sadului	36	\N	\N
39992	Scoala Gimnaziala Ciresarii Medias	36	\N	\N
39993	Scoala Gimnaziala Racovita	36	\N	\N
39994	Scoala Gimnaziala Nocrich	36	\N	\N
39995	Liceul Teoretic Onisifor Ghibu Sibiu	36	\N	\N
39996	Scoala Gimnaziala Bradeni	36	\N	\N
39997	Scoala Gimnaziala Ion Albescu Boita	36	\N	\N
39998	Scoala Gimnaziala Nr.21 Sibiu	36	\N	\N
39999	Scoala Gimnaziala Nr.8 Sibiu	36	\N	\N
40000	Colegiul Tehnic Independenta Sibiu	36	\N	\N
40001	Scoala Gimnaziala  George Popa Medias	36	\N	\N
40002	Scoala Gimnaziala  Martian Negrea  Valea Viilor	36	\N	\N
40003	Scoala Gimnaziala Nr 1 Sibiu	36	\N	\N
40004	Universitatea Stefan Cel Mare Din Suceava	37	\N	\N
40005	Scoala Gimnaziala Dimitrie Gusti	37	\N	\N
40006	Scoala Gimnaziala Maritei	37	\N	\N
40007	Scoala Gimnaziala Siminicea	37	\N	\N
40008	Scoala Gimnaziala Nr 2 Iaslovat	37	\N	\N
40009	Scoala Gimnaziala Mihai Eminescu Radauti	37	\N	\N
40010	Scoala Gimnaziala Simion Florea Marian Ilisesti	37	\N	\N
40011	Scoala  Gimnaziala Iulian  Vesper  Horodnic De  Sus	37	\N	\N
40012	Gradinita Samariteanul Nr. 20 Suceava	37	\N	\N
40013	Gradinita Cu Program Normal Tandarica	37	\N	\N
40014	Gradinita Cu Program Prelungi Prichindelul Radauti	37	\N	\N
40015	Scoala Gimnaziala Moara Nica	37	\N	\N
40016	Colegiul National Stefan Cel Mare	37	\N	\N
40017	Scoala Gimnaziala Nr.1 Vicovu De Sus	37	\N	\N
40018	Scoala Postliceala Sanitara Suceava	37	\N	\N
40019	Scoala Gimnaziala Rotu Nda	37	\N	\N
40020	Scoala Gimnaziala Nr. 2 Vicovu De Sus	37	\N	\N
40021	Gradinita Cu Program Prelungit Casuta Piticilor	37	\N	\N
40022	Scoala Gimnaziala  Constantin Tomescu Plesesti	37	\N	\N
40023	Scoala  Gimnaziala  Pahomie C Vasiliu  Gramesti	37	\N	\N
40024	Scoala Gimnaziala Partestii De Sus	37	\N	\N
40025	Scoala Gimnaziala Salcea	37	\N	\N
40026	Scoala Gimnaziala Sadova	37	\N	\N
40027	Scoala  Gimnaziala Hatmanul Sendrea Dolh Esti	37	\N	\N
40028	Scoala Gimnaziala Volovat	37	\N	\N
40029	Scoala Gimnaziala Dimitrie Onciul Straja	37	\N	\N
40030	Scoala Gimnaziala Poieni-solca	37	\N	\N
40031	Scoala Gimnaziala  Dimitrie Vatamaniuc Sucevita	37	\N	\N
40032	Scoala Gimnaziala Berchisesti	37	\N	\N
40033	Scoala Gimnaziala Ipotesti	37	\N	\N
40034	Scoala Gimnaziala Nr 1 Vadu Moldovei	37	\N	\N
40035	Scoala Gimnaziala Vornicu Simion Tautu  Comanesti	37	\N	\N
40036	Liceul Tehnologic Iorgu Varnav Liteanu	37	\N	\N
40037	Colegiul National Petru Rares Suceava	37	\N	\N
40038	Scoala Gimnaziala Ulma	37	\N	\N
40039	Scoala Gimnaziala Grigore Ghica Voievod Suceava	37	\N	\N
40040	Scoala Gimnaziala Ostra	37	\N	\N
40041	Scoala Gimnaziala Ioan Ciurea Falticeni	37	\N	\N
40042	Scoala Gimnaziala Preutesti	37	\N	\N
40043	Colegiul National Mihai Eminescu Suceava	37	\N	\N
40044	Colegiul National De Informatica Spiru Haret	37	\N	\N
40045	Scoala Gimnaziala Dorn Esti	37	\N	\N
40046	Scoala Gimnaziala Pojorita	37	\N	\N
40047	Gradinita Cu Program Normal Lumea Copilariei  Gura Humorului	37	\N	\N
40048	Scoala Gimnaziala Brodina	37	\N	\N
40049	Gradinita Cu Program Prelungit Alba Ca Zapada Vatra Dornei	37	\N	\N
40050	Gradinita Cu Program Prelungit Micul Print	37	\N	\N
40051	Scoala  Gimnaziala Voitinel	37	\N	\N
40052	Scoala Gimnaziala Stefan Cel Mare Cirlibaba	37	\N	\N
40053	Scoala Gimnaziala Calafindesti	37	\N	\N
40054	Scoala Gimnaziala Nr 4 Vatra Dornei	37	\N	\N
40055	Scoala Gimnaziala Bogdan Voda	37	\N	\N
40056	Liceul Teoretic Ion Luca Vatra Dornei	37	\N	\N
40057	Scoala Gimnaziala Mihai Halunga Hantesti	37	\N	\N
40058	Scoala Gimnaziala Nicolae Labis Malini	37	\N	\N
40059	Scoala Gimnaziala Bosanci	37	\N	\N
40060	Liceul Tehnologic Oltea Doamna Dolhasca	37	\N	\N
40061	Colegiul Tehnic Mihai Bacescu Falticeni	37	\N	\N
40062	Gradinita Cu Program Prelungit1-2-3	37	\N	\N
40063	Scoala Gimnaziala Nr. 4 Suceava	37	\N	\N
40064	Colegiul Andronic Motrescu	37	\N	\N
40065	Scoala Gimnaziala Bainet	37	\N	\N
40066	Scoala Gimnaziala Dragoiesti	37	\N	\N
40067	Scoala Gimnaziala Nr 1 Iaslovat	37	\N	\N
40068	Scoala Gimnaziala Academician Haralambie Mihaescu Udesti	37	\N	\N
40069	Scoala Gimnaziala Cosna	37	\N	\N
40070	Scoala Gimnaziala Ion Pintilie Maneuti	37	\N	\N
40071	Gradinita Cu Program Normal Casuta Povestilor Vatra Dornei	37	\N	\N
40072	Scoala Gimnaziala Vatra Moldovitei	37	\N	\N
40073	Scoala Gimnaziala Mitocu Dragomirnei	37	\N	\N
40074	Liceul Tehnologic Mihai Eminescu Dumbraveni	37	\N	\N
40075	Scoala Gimnaziala Artur Gorovei Bunesti	37	\N	\N
40076	Scoala Gimnaziala Nr. 8 Suceava	37	\N	\N
40077	Scoala Gimnaziala Risca	37	\N	\N
40078	Scoala Gimnaziala Nr.2 Vatra Dornei	37	\N	\N
40079	Scoala Gimnaziala Dorna Arini	37	\N	\N
40080	Scoala Gimnaziala Fratautii Vechi	37	\N	\N
40081	Scoala Gimnaziala Nr 6 Suceava	37	\N	\N
40082	Scoala Gimnaziala George Tofan Bilca	37	\N	\N
40083	Scoala Gimnaziala Ion Barbir	37	\N	\N
40084	Scoala Gimnaziala Veresti	37	\N	\N
40085	Scoala Gimnaziala Nr. 1 Vatra Dornei	37	\N	\N
40086	Scoala Gimnaziala  Mihai Eminescu  Banesti	37	\N	\N
40087	Colegiul Tehnic Latcu Voda Siret	37	\N	\N
40088	Scoala Gimnaziala Burla	37	\N	\N
40089	Scoala Gimnaziala Constantin Morariu Patrauti	37	\N	\N
40090	Scoala Gimnaziala Nr.1gura Humorului	37	\N	\N
40091	Scoala Gimnaziala Speciala Sf Stelian Radauti	37	\N	\N
40092	Scoala Gimnaziala ..i.g.sbiera.. Horodnic De Jos	37	\N	\N
40093	Scoala Gimnaziala Gainesti	37	\N	\N
40094	Scoala Gimnaziala Herla	37	\N	\N
40095	Scoala Gimnaziala Mihail Sadoveanu Granicesti	37	\N	\N
40096	Colegiul Alexandru Cel Bun Gura Humorului	37	\N	\N
40097	Liceul Tehnologic Nicanor Morosan Pirtestii De Jos	37	\N	\N
40098	Liceul Tehnologic Special Bivolarie	37	\N	\N
40099	Scoala Gimnaziala Nr. 2 Marginea	37	\N	\N
40100	Scoala Gimnaziala Iraclie Porumbescu Fratautii Noi	37	\N	\N
40101	Colegiul National Nicu Gane Falticeni	37	\N	\N
40102	Scoala Gimnaziala Stroiesti	37	\N	\N
40103	Scoala Gimnaziala Ion Lovinescu Radaseni	37	\N	\N
40104	Gradinita Cu Program Normal Voinicelul Falticeni	37	\N	\N
40105	Gradinita Cu Program Prelungit Prichindel	37	\N	\N
40106	Scoala Gimnaziala Teodor V Stefanelli Campulung Moldovenesc	37	\N	\N
40107	Liceul Tehnologic Ion Nistor Vicovu De Sus	37	\N	\N
40108	Scoala Gimnaziala Neagra Sarului	37	\N	\N
40109	Scoala Gimnaziala Panaci	37	\N	\N
40110	Liceul Tehnologic Tomsa Voda Solca	37	\N	\N
40111	Scoala Gimnaziala Baisesti	37	\N	\N
40112	Scoala Gimnaziala Cornu Luncii	37	\N	\N
40113	Colegiul Economic Dimitrie Cantemir Suceava	37	\N	\N
40114	Scoala Gimnaziala Ion Muceleanu Fantana Mare	37	\N	\N
40115	Scoala Profesionala Speciala Campulung Moldovenesc	37	\N	\N
40116	Scoala Gimnaziala Teodor Balan	37	\N	\N
40117	Scoala Gimnaziala Bivolarie	37	\N	\N
40118	Scoala Gimnaziala Crucea	37	\N	\N
40119	Liceul Tehnologic Vasile Gherasim Marginea	37	\N	\N
40120	Scoala Gimnaziala Regina Elisabeta Radauti	37	\N	\N
40121	Scoala Gimnaziala Krystyna Bochenek Poiana Micului	37	\N	\N
40122	Liceul Tehnologic Liviu Suhar Iacobeni	37	\N	\N
40123	Colegiul Tehnic Samuil Isopescu Suceava	37	\N	\N
40124	Scoala Gimnaziala Bogdan Voda Campulung Moldovenesc	37	\N	\N
40125	Colegiul National Eudoxiu Hurmuzachi Radauti	37	\N	\N
40126	Scoala Gimnaziala Cristofor Simionescu Plopeni	37	\N	\N
40127	Colegiul National Dragos Voda	37	\N	\N
40128	Colegiul Tehnic Al.i.cuza Suceava	37	\N	\N
40129	Scoala Gimnaziala Petru Musat Siret	37	\N	\N
40130	Scoala Gimnaziala Satu Mare	37	\N	\N
40131	Scoala Gimnaziala Ciocanesti	37	\N	\N
40132	Gradinita Cu Program Normal Nr.1 Cajvana	37	\N	\N
40133	Colegiul Tehnic Anghel Saligny	38	\N	\N
40134	Scoala Gimnaziala Fantanele	38	\N	\N
40135	Liceul Tehnologic Andrei Saguna	38	\N	\N
40136	Scoala Gimnaziala Segarcea-vale	38	\N	\N
40137	Scoala Gimnaziala	38	\N	\N
40138	Liceul Teoretic Zimnicea	38	\N	\N
40139	Scoala Gimnaziala Tatarastii De Sus	38	\N	\N
40140	Scoala Gimnaziala Nr. 4	38	\N	\N
40141	Scoala Gimnaziala Comuna Dracsenei	38	\N	\N
40142	Scoala Gimnaziala Zaharia Stancu	38	\N	\N
40143	Scoala  Gimnaziala   Alexandru Deparateanu	38	\N	\N
40144	Colegiul National Unirea	38	\N	\N
40145	Scoala Gimnaziala Salcia	38	\N	\N
40146	Scoala Gimnaziala Nr.1	38	\N	\N
40147	Scoala Gimnaziala Lisa	38	\N	\N
40148	Gradinita Cu Program Prelungit Nr.1	38	\N	\N
40149	Scoala Gimnaziala Mihai Eminescu	38	\N	\N
40150	Liceul Teoretic Constantin Noica	38	\N	\N
40151	Scoala Gimnaziala Cervenia	38	\N	\N
40152	Scoala Gimnaziala Bascoveni	38	\N	\N
40153	Scoala Gimnaziala Mihai Viteazul	38	\N	\N
40154	Scoala Gimnaziala Dan Berindei	38	\N	\N
40155	Liceul Tehnologic Virgil Madgearu	38	\N	\N
40156	Scoala Gimnaziala Scurtu Mare	38	\N	\N
40157	Liceul Tehnologic Nicolae Balcescu	38	\N	\N
40158	Scoala Gimnaziala Plosca	38	\N	\N
40159	Scoala Gimnaziala Nr.2	38	\N	\N
40160	Scoala Gimnaziala Traian	38	\N	\N
40161	Scoala Gimnaziala Vasile Racotfa	38	\N	\N
40162	Scoala Gimnaziala Vedea	38	\N	\N
40163	Liceul Tehnologic	38	\N	\N
40164	Gradinita Cu Program Prelungit Nr.5	38	\N	\N
40165	Scoala Gimnaziala Nr. 5	38	\N	\N
40166	Scoala Gimnaziala Miron Radu Paraschivescu	38	\N	\N
40167	Gradinita Cu Program Prelungit Ion Creanga	38	\N	\N
40168	Scoala Gimnaziala Puranii De Sus	38	\N	\N
40169	Scoala Gimnaziala Tatarastii De Jos	38	\N	\N
40170	Scoala Gimnaziala Plopii Slavitesti	38	\N	\N
40171	Gradinita Nr 7	38	\N	\N
40172	Scoala Gimnaziala Comuna Talpa	38	\N	\N
40173	Scoala Postliceala Sanitara Alexandria	38	\N	\N
40174	Scoala Gimnaziala Nenciulesti	38	\N	\N
40175	Scoala Gimnaziala Slobozia Mandra	38	\N	\N
40176	Scoala Gimnaziala Ion Preotu	38	\N	\N
40177	Gradinita Cu Program Prelungit Nr.4	38	\N	\N
40178	Scoala Gimnaziala Nr. 1	38	\N	\N
40179	Liceul Pedagogic Mircea Scarlat	38	\N	\N
40180	Scoala Gimnaziala I.gh.duca	38	\N	\N
40181	Liceul Tehnologic Nrj	38	\N	\N
40182	Scoala Gimnaziala Saceni	38	\N	\N
40183	Liceul Teoretic Marin Preda	38	\N	\N
40184	Scoala Gimnaziala Grigore Dimitrie Ghica	38	\N	\N
40185	Scoala Gimnaziala Nr 3	38	\N	\N
40186	Scoala Gimnaziala Alexandru Colfescu	38	\N	\N
40187	Liceul Tehnologic Emil Racovita	38	\N	\N
40188	Scoala Gimnaziala Silistea	38	\N	\N
40189	Scoala Gimnaziala Comuna Poroschia	38	\N	\N
40190	Scoala Gimnaziala Comuna Seaca	38	\N	\N
40191	Scoala  Gimnaziala	38	\N	\N
40192	Scoala Gimnaziala Nr 1 Comuna Dobrotesti	38	\N	\N
40193	Scoala Gimnaziala Smardioasa	38	\N	\N
40194	Gradinita Cu Program Prelungit Nr.6	38	\N	\N
40195	Scoala Gimnaziala Marin Preda	38	\N	\N
40196	Scoala Gimnaziala Nr.7	38	\N	\N
40197	Scoala Gimnaziala Nr.1 Cosmesti	38	\N	\N
40198	Colegiul Nationaiaid. Ghica	38	\N	\N
40199	Scoala Gimnaziala Stejaru	38	\N	\N
40200	Scoala Gimnaziala Nr. 2	38	\N	\N
40201	Gradinita Cu Program Prelungit Nr. 4	38	\N	\N
40202	Scoala  Gimnaziala  Nr.1	38	\N	\N
40203	Scoala Gimnaziala Balaci	38	\N	\N
40204	Scoala Gimnaziala Pietrosani	38	\N	\N
40205	Liceul Teoretic	38	\N	\N
40206	Scoala Gimnaziala Cringeni	38	\N	\N
40207	Scoala Gimnaziala Iecea Mare	39	\N	\N
40208	Academia Romana Filiala Timișoara	39	\N	\N
40209	Universitatea de Medicina și Farmacie Victor Babeș	39	\N	\N
40210	Universitatea De Vest	39	\N	\N
40211	Scoala Gimnaziala Nr. 30 Timișoara	39	\N	\N
40212	Universitatea Politehnica Timișoara	39	\N	\N
40213	Colegiul Tehnic Energetic Regele Ferdinand I	39	\N	\N
40214	Scoala Gimnaziala Remetea Mare	39	\N	\N
40215	Liceul Tehnologic Agricol Ortisoara	39	\N	\N
40216	Scoala Primara  Casa Sperantei	39	\N	\N
40217	Liceul Teoretic Dositei Obradovici Timișoara	39	\N	\N
40218	Scoala Gimnaziala Criciova	39	\N	\N
40219	Liceul Tepretic David Voniga Giroc	39	\N	\N
40220	Colegiul Tehnic Azu R	39	\N	\N
40221	Scoala Gimnaziala Curtea	39	\N	\N
40222	Scoala Gimnaziala Comuna Dudestii Noi	39	\N	\N
40223	Scoala Gimnaziala Firdea	39	\N	\N
40224	Liceul Teoretic Recas	39	\N	\N
40225	Gradinita Cu Program Prelungit Nr.33	39	\N	\N
40226	Gradinita Cu Program Prelungit Deta	39	\N	\N
40227	Liceul Teoretic Special  Iris	39	\N	\N
40228	Scoala Gimnaziala Nr.1 Timișoara	39	\N	\N
40229	Colegiul Tehnic Ion I.c.bratianu	39	\N	\N
40230	Scoala  Gimnaziala Sorin Titel Margina	39	\N	\N
40231	Scoala Gimnaziala Carpinis	39	\N	\N
40232	Scoala Gimnaziala Moravita	39	\N	\N
40233	Scoala Gimnaziala Theodor Bucurescu Nr 1 Sannicolau Mare	39	\N	\N
40234	Liceul Teoretic Periam	39	\N	\N
40235	Scoala Gimnaziala Nr.27 Timișoara	39	\N	\N
40236	Scoala Gimnaziala Comuna Giera	39	\N	\N
40237	Scoala Gimnaziala Nr.16 Take Ionescu	39	\N	\N
40238	Scoala Gimnaziala Eftimie Murgu Lugoj	39	\N	\N
40239	Universitatea Tibiscus	39	\N	\N
40240	Scoala Gimnaziala Nitchidorf	39	\N	\N
40241	Scoala Gimnaziala Birna	39	\N	\N
40242	Colegiul Tehnic Henri Coanda	39	\N	\N
40243	Scoala Gimnaziala Jamu Mare	39	\N	\N
40244	Universitatea De Stiinte Agricole Si Medicina Veterinara A Banatului Regele Mihai I Al Romaniei Din Timiș	39	\N	\N
40245	Liceul Teoretic Grigore Moisil	39	\N	\N
40246	Gradinita Cu Program Prelungit Nr.20	39	\N	\N
40247	Scoala Gimnaziala Nr.25	39	\N	\N
40248	Scoala Gimnaziala Nr.6	39	\N	\N
40249	Scoala Gimnaziala Ghilad	39	\N	\N
40250	Colegiul Economic F.s.nitti	39	\N	\N
40251	Scoala Gimnaziala Comuna Uivar	39	\N	\N
40252	Scoala Gimnaziala Comuna Padureni	39	\N	\N
40253	Scoala Gimnaziala Pischia	39	\N	\N
40254	Scoala Gimnaziala Comuna Belint	39	\N	\N
40255	Gradinita Cu Program Prelungit Nt.14 Timișoara	39	\N	\N
40256	Scoala Gimnaziala Speciala Buzias	39	\N	\N
40257	Gradinita Cu Program Prelungit Nr.22	39	\N	\N
40258	Scoala Gimnaziala Jimbolia	39	\N	\N
40259	Liceul Teoretic Sfintii Kiril Si Metodii Dudestii-vechi	39	\N	\N
40260	Scoala Gimnaziala Comuna Sinpetru Mare	39	\N	\N
40261	Liceul Teologic Romano Catolic Gerhardinum	39	\N	\N
40262	Scoala Gimnaziala Ch Ecea	39	\N	\N
40263	Gradinita Cu Program Prelungut Nr.26	39	\N	\N
40264	Scoala Gimnaziala Ghiroda	39	\N	\N
40265	Scoala Gimnaziala Anghel Saligny Banloc	39	\N	\N
40266	Scoala Gimnaziala Masloc	39	\N	\N
40267	Liceul Teoretic Bartok Bela	39	\N	\N
40268	Liceul Teoretic Jean Louis Calderon	39	\N	\N
40269	Scoala Gimnaziala Maria Brindea Pesac	39	\N	\N
40270	Scoala Gimnaziala Nr. 3	39	\N	\N
40271	Liceul Tehnologic De Industrie Alimentara	39	\N	\N
40272	Scoala Gimnaziala Comuna Saravale	39	\N	\N
40273	Gradinita Cu Program Prelungit Nikolaus Lenau	39	\N	\N
40274	Colegiul Tehnic Emanuil Ungureanu	39	\N	\N
40275	Gradinita Cu Program Prelungit Nr 25 Timișoara	39	\N	\N
40276	Colegiul Tehnic Dimitrie Leonida	39	\N	\N
40277	Scoala Primara Charlotten Bu Rg	39	\N	\N
40278	Scoala Gimnaziala Birda	39	\N	\N
40279	Liceul Teoretic Nikolaus Lenau Timișoara	39	\N	\N
40280	Scoala Gimnaziala Ch Everesu Mare	39	\N	\N
40281	Colegiul National Banatean Timișoara	39	\N	\N
40282	Scoala Gimnaziala Com Sinandrei	39	\N	\N
40283	Gradinita Cu Program Prelungit Nr.23 Timișoara	39	\N	\N
40284	Scoala Gimnaziala Sandra	39	\N	\N
40285	Scoala Gimnaziala George Garda Manastiur	39	\N	\N
40286	Scoala Gimnaziala Gotflob	39	\N	\N
40287	Colegiul National Iulia Hasdeu	39	\N	\N
40288	Liceul Teoretic Gataia	39	\N	\N
40289	Liceul Tehnologic Special Gheorghe Atanasiu Timișoara	39	\N	\N
40290	Scoala Gimnaziala Comuna Ghizela	39	\N	\N
40291	Gradinita Cu Program Prelungit Nr 38 Timișoara	39	\N	\N
40292	Scoala Primara Bara	39	\N	\N
40293	Scoala Gimnaziala Comuna Parta	39	\N	\N
40294	Scoala Gimnaziala Tomnatic	39	\N	\N
40295	Scoala Gimnaziala Beba Veche	39	\N	\N
40296	Liceul Tehnologic  Transporturi Auto Timișoara	39	\N	\N
40297	Liceul Tehnologic Sfantu Nicolae Deta	39	\N	\N
40298	Liceul Teoretic Com Peciu Nou	39	\N	\N
40299	Scoala Gimnaziala Nr 15	39	\N	\N
40300	Scoala Gimnaziala Comuna Sinmihaiu Roman	39	\N	\N
40301	Scoala Gimnaziala Comuna Balint	39	\N	\N
40302	Scoala Gimnaziala Denta	39	\N	\N
40303	Scoala Gimnaziala Nr.19avram Iancu Timișoara	39	\N	\N
40304	Scoala Gimnaziala Racovita	39	\N	\N
40305	Liceul Teoretic Vlad Tepes Timișoara	39	\N	\N
40306	Scoala Gimnaziala Comuna Darova	39	\N	\N
40307	Gradinita Cu Program Prelungit Nr.11	39	\N	\N
40308	Liceul Teologic Baptist	39	\N	\N
40309	Scoala Gimnaziala De Muzica Filaret Barbu Lugoj	39	\N	\N
40310	Scoala Gimnaziala Lenauheim	39	\N	\N
40311	Scoala Gimnaziala Stiuca	39	\N	\N
40312	Scoala Gimnaziala Nr 12	39	\N	\N
40313	Scoala Gimnaziala Comuna Dumbravita	39	\N	\N
40314	Liceul Teoretic William Shakespeare	39	\N	\N
40315	Gradinita Cu Program Prelungit Nr.36	39	\N	\N
40316	Scoala Primara Comuna Secas	39	\N	\N
40317	Gradinita Cu Program Prelungit Nr.1 Sannicolau Mare	39	\N	\N
40318	Scoala Gimnaziala Nr.2 Lugoj	39	\N	\N
40319	Scoala Gimnaziala Gavojdia	39	\N	\N
40320	Gradinita Program Prelungit Nr 32	39	\N	\N
40321	Colegiul Tehnic De Vest Timișoara	39	\N	\N
40322	Liceul Waldorf Timișoara	39	\N	\N
40323	Scoala Gimnaziala Bethausen	39	\N	\N
40324	Scoala Gimnaziala Comuna Cenei	39	\N	\N
40325	Colegiul Silvic Casa Verde Timișoara	39	\N	\N
40326	Scoala Gimnaziala Comuna Cenad	39	\N	\N
40327	Scoala Gimnaziala Valcani	39	\N	\N
40328	Scoala Gimnaziala Satchinez	39	\N	\N
40329	Liceul Tehnologic Aurel Vlaicu  Lugoj	39	\N	\N
40330	Scoala Gimnaziala Topolovatu Mare	39	\N	\N
40331	Scoala Gimnaziala Nestor Oprean Nr.2 Sannicolau Mare	39	\N	\N
40332	Colegiul Tehnic V. Braniste	39	\N	\N
40333	Scoala Gimnaziala Nr 24 Timișoara	39	\N	\N
40334	Gradinita Cu Program Prelungit Nr.53	39	\N	\N
40335	Gradinita Cu Program Prelungit Nr. 4	39	\N	\N
40336	Liceul Tehnologic Traian Grozavescu Nadrag	39	\N	\N
40337	Scoala Gimnaziala Carcaliu	40	\N	\N
40338	Scoala Gimnaziala Ceatalchioi	40	\N	\N
40339	Gradinita Cu Program Prelungit Nr.18 Tulcea	40	\N	\N
40340	Liceul Teoretic Ion Creanga Tulcea	40	\N	\N
40341	Gradinita Cu Program Prelungit Nr.12 Tulcea	40	\N	\N
40342	Colegiul Economic Delta Dunarii Tulcea	40	\N	\N
40343	Liceul Dimitrie Cantemir	40	\N	\N
40344	Scoala Gimnaziala Grigore Antipa Tulcea	40	\N	\N
40345	Liceul Teoretic Constantin Bratescu	40	\N	\N
40346	Gradinita Cu Progrm Prelungit Nr.3 Tulcea	40	\N	\N
40347	Scoala Gimnaziala Ostrov	40	\N	\N
40348	Colegiul Brad Segal Tulcea	40	\N	\N
40349	Scoala Profesionala Danubius Tulcea	40	\N	\N
40350	Scoala Gimnaziala   Constantin Gavenea	40	\N	\N
40351	Scoala Gimnaziala Ceamurlia De Jos	40	\N	\N
40352	Scoala Gimnaziala Frecatei	40	\N	\N
40353	Scoala Gimnaziala Nr.12 Tulcea	40	\N	\N
40354	Colegiul Dobrogean Spiru Haret Tulcea	40	\N	\N
40355	Scoala Gimnaziala Mihail Kogalniceanu	40	\N	\N
40356	Scoala Gimnaziala Horia	40	\N	\N
40357	Scoala Gimnaziala Mihai Eminescu Valea Teilor	40	\N	\N
40358	Scoala Gimnaziala Maliuc	40	\N	\N
40359	Scoala  Gimnaziala Mircea Cel Batran	40	\N	\N
40360	Scoala Gimnaziala Bestepe	40	\N	\N
40361	Scoala Gimnaziala Jijila	40	\N	\N
40362	Scoala Gimnaziala Izvoarele	40	\N	\N
40363	Scoala Gimnaziala Ciucurova	40	\N	\N
40364	Liceul Tehnologic Vasile Bacalu Mahmudia	40	\N	\N
40365	Liceul Tehnologic Ion Mincu	40	\N	\N
40366	Scoala Gimnaziala Dorobantu	40	\N	\N
40367	Liceul Teoretic Jean Bart	40	\N	\N
40368	Scoala Gimnaziala Daeni	40	\N	\N
40369	Seminarul Teologic Ortodox Sf. Ioan Casian Tulcea	40	\N	\N
40370	Scoala Gimnaziala Maior Ioan Murgescu	40	\N	\N
40371	Scoala Gimnaziala Crisan	40	\N	\N
40372	Scoala Gimnaziala Valea Nucarilor	40	\N	\N
40373	Liceul Teoretic Grigore Moisil Tulcea	40	\N	\N
40374	Scoala Gimnaziala Ion Luca Caragiale Tulcea	40	\N	\N
40375	Scoala Gimnaziala Nr. 1 Macin	40	\N	\N
40376	Gradinita Cu Program Prelungit Numarul 17	40	\N	\N
40377	Scoala Gimnaziala Casimcea	40	\N	\N
40378	Scoala Gimnaziala Elena Doamna Tulcea	40	\N	\N
40379	Gradinita Cu Program Prelungit  Dumbrava Minunata	40	\N	\N
40380	Scoala Gimnaziala Greci	40	\N	\N
40381	Scoala Gimnaziala Baia	40	\N	\N
40382	Scoala Gimnaziala Stejaru	40	\N	\N
40383	Scoala Gimnaziala Vasile Alecsandri Nufaru	40	\N	\N
40384	Scoala Gimnaziala Slava Cercheza	40	\N	\N
40385	Scoala Gimnaziala Peceneaga	40	\N	\N
40386	Scoala Gimnaziala Ioan Nenitescu Tulcea	40	\N	\N
40387	Scoala Gimnaziala Ca Rosetfi	40	\N	\N
40388	Scoala Gimnaziala Nicolae Iorga Grindu	40	\N	\N
40389	Scoala Gimnaziala Ion Creanga Ic Bratianu	40	\N	\N
40390	Liceultghe M Murgoci Macin	40	\N	\N
40391	Scoala Gimnaziala Ctin Brancoveanu	40	\N	\N
40392	Scoala Gimnaziala Alexandru Ciucurencu Tulcea	40	\N	\N
40393	Liceul Tehnologic Topolog	40	\N	\N
40394	Scoala Gimnaziala Tu Rcoaia	40	\N	\N
40395	Scoala Gimnaziala Beidaud	40	\N	\N
40396	Scoala Gimnaziala Jurilovca	40	\N	\N
40397	Scoala Gimnaziala Chilia Veche	40	\N	\N
40398	Scoala Gimnaziala Nichifor Lu Dovig Niculitel	40	\N	\N
40399	Scoala Gimnaziala Sarichioi	40	\N	\N
40400	Scoala Gimnaziala Murighiol	40	\N	\N
40401	Liceul De Arte George Georgescu	40	\N	\N
40402	Scoala Gimnaziala Speciala Nr.14 Tulcea	40	\N	\N
40403	Gradinita Cu Program Prelungit Ostroveni 1	41	\N	\N
40404	Scoala Gimnaziala Costea Marinoiu Ocnele Mari	41	\N	\N
40405	Scoala Gimnaziala Comuna Lungesti	41	\N	\N
40406	Scoala Gimnaziala Comuna Creteni	41	\N	\N
40407	Gradinita Cu Program Prelungit Nord 1	41	\N	\N
40408	Liceul Constantin Brancoveanu Horezu	41	\N	\N
40409	Scoala Gimnaziala Comuna Titesti	41	\N	\N
40410	Liceul Preda Buzescu Oras Berbesti Judetul Vâlcea	41	\N	\N
40411	Gradinita Cu Program Prelungit Nord 2	41	\N	\N
40412	Scoala Gimnaziala Sat Tina Comuna Livezi Judetul Vâlcea	41	\N	\N
40413	Scoala Populara De Arte Si Meserii	41	\N	\N
40414	Scoala Gimnaziala Sat Ursi Comuna Stoilesti Jud Vâlcea	41	\N	\N
40415	Gradinita Cu Program Prelungit Cozia Rm Vâlcea	41	\N	\N
40416	Scoala Gimnaziala Comuna Mateesti Judetul Vâlcea	41	\N	\N
40417	Scoala Gimnaziala Nr 4 Municipiul Rm.Vâlcea	41	\N	\N
40418	Scoala Gimnazial Comuna Stoilesti Judetul Vâlcea	41	\N	\N
40419	Scoala Gimnaziala. Com. Stoen Esti. Judetul Vâlcea	41	\N	\N
40420	Scoala Gimnaziala Comuna Susani Judetul Vâlcea	41	\N	\N
40421	Liceul Teoretic Comuna Gradistea Judetul Vâlcea	41	\N	\N
40422	Colegiul National Gib Mihaescu	41	\N	\N
40423	Liceul Tehnologic Justinian Marina, Oras Baile Olanesti, Jud. Vâlcea	41	\N	\N
40424	Scoala Gimnaziala Sat Gura Vaii Comuna Bujoreni	41	\N	\N
40425	Scoala Gimnaziala Nr. 13  Mun. Rm Vâlcea	41	\N	\N
40426	Liceul Tehnologic Special Nr.1	41	\N	\N
40427	Colegiul National De Informatica Matei Basarab	41	\N	\N
40428	Scoala Gimnaziala, Sat Ulmetu, Comuna Copaceni, Judetul Vâlcea	41	\N	\N
40429	Scoala Gimnaziala Comuna Ionesti Judetul Vâlcea	41	\N	\N
40430	Liceul De Arte Victor Giuleanulic Arte	41	\N	\N
40431	Liceul Tehnologic Petrache Poenaru Oras Balcesti Judetul Vâlcea	41	\N	\N
40432	Gradinita Cu Program Prelungit Ostroveni 2 Mun. Rm	41	\N	\N
40433	Scoala Gimnaziala Batasani Sat Batasani Com. Valea Mare	41	\N	\N
40434	Scoala Gimnaziala Bartolomeu Valeriu Anania Comuna Glavile Judetul Vâlcea	41	\N	\N
40435	Scoala Gimnaziala Tu Dor Vladimirescu. Mun.dragasani. Judetul Vâlcea	41	\N	\N
40436	Scoala Gimnaziala Sat Udresti Comuna Danicei Judetul  Vâlcea	41	\N	\N
40437	Scoala Gimnaziala Olanu	41	\N	\N
40438	Liceul Tehnologic General Magheru Rm Vâlcea	41	\N	\N
40439	Scoala Gimnaziala Comuna Scundu Judetul Vâlcea	41	\N	\N
40440	Scoala Gimnaziala Babeni Oltetu Comuna Diculesti Judetul Vâlcea	41	\N	\N
40441	Colegiul Economic	41	\N	\N
40442	Scoala Gimnaziala Colonie  Mun. Rm. Vâlcea	41	\N	\N
40443	Colegiul De Silvicultura Si Protectia Mediului	41	\N	\N
40444	Scoala Gimnaziala Anton Pann Mun.rm.Vâlceajud.Vâlcea	41	\N	\N
40445	Scoala Gimnaziala Comuna Stanesti	41	\N	\N
40446	Scoala Gimnaziala Comuna Malaia	41	\N	\N
40447	Scoala Gimnaziala Comuna Sirineasa Judetul Vâlcea	41	\N	\N
40448	Scoala Gimnaziala Comuna Prundeni Judetul Vâlcea	41	\N	\N
40449	Scoala Gimnaziala Sat Magura Comuna  Mihaesti  Judetul  Vâlcea	41	\N	\N
40450	Scoala  Gimnaziala Comuna Ghioroiu Judetul Vâlcea	41	\N	\N
40451	Scoala Gimnaziala I.gh.duca Mu N.rm.Vâlcea Jud Vâlcea	41	\N	\N
40452	Scoala Gimnaziala Nr 10 Municipiul Rm Vâlcea Judetul Vâlcea	41	\N	\N
40453	Scoala Gimnaziala Comuna Pietrari	41	\N	\N
40454	Scoala Gimnaziala Comuna Bunesti Judetul Vâlcea	41	\N	\N
40455	Scoala Gimnaziala Pesceana Comuna Pesceana Judetul Vâlcea	41	\N	\N
40456	Scoala Gimnaziala Luca Solomon Comuna Vaideeni Judetul Vâlcea	41	\N	\N
40457	Scoala Gimnaziala Comuna Boisoara	41	\N	\N
40458	Scoala Gimnaziala Comuna Maldaresti Judetul Vâlcea	41	\N	\N
40459	Scoala Gimnaziala Comuna Ru Ncu Judetul Vâlcea	41	\N	\N
40460	Scoala Gimnaziala Sat Bungetani Comuna Fauresti  Judetul Vâlcea	41	\N	\N
40461	Liceul Gheorghe Surdu Orasul Brezoi Judetul Vâlcea	41	\N	\N
40462	Scoala Gimnaziala Capitan Marasanu Stroesti Comuna Stroesti Judetul Vâlcea	41	\N	\N
40463	Liceul Tehnologic Oltchim	41	\N	\N
40464	Scoala Gimnaziala Sat Popesti Comuna Golesti	41	\N	\N
40465	Scoala Ginmnaziala  Sat Madulari Comuna Cernisoara Judetul Vâlcea	41	\N	\N
40466	Liceul George Tarn Ea Babeni	41	\N	\N
40467	Scoala Gimaziala Sat Valea Mare Babeni	41	\N	\N
40468	Scoala Gimnaziala . Comuna Lacusteni . Judetul Vâlcea	41	\N	\N
40469	Scoala Gimnaziala Comua Milcoiu Judetul Vâlcea	41	\N	\N
40470	Scoala Gimnaziala Com. Sutesti, Jud. Vâlcea	41	\N	\N
40471	Scoala Gimnaziala Comuna Amarasti Judetul Vâlcea	41	\N	\N
40472	Scoala Gimnaziala Sat Tepesti  Com Tetoiu  Judetul Vâlcea	41	\N	\N
40473	Scoala Gimnaziala Ioan Didicescu Comuna Voicesti Judetul Vilcea	41	\N	\N
40474	Liceul Tehnologic Ferdinand I	41	\N	\N
40475	Gradinita Cu Pp Nr.1 Casuta Piticilor Horezu	41	\N	\N
40476	Scoala Gimnaziala Sat Bodesti  Comuna  Barbatesti Judetul Vâlcea	41	\N	\N
40477	Scoala Gimnaziala  Sat Copaceni Comu Na Racovita Ju Detul Vâlcea	41	\N	\N
40478	Liceul Tehnologic Bratianu Municipiul Dragasani Judetul Vâlcea	41	\N	\N
40479	Scoala Gimnaziala Comuna Francesti Judetul Vâlcea	41	\N	\N
40480	Scoala Gimnaziala Nicolae Balcescu, Municipiul Dragasani, Judetul Vâlcea	41	\N	\N
40481	Liceul Teoretic Comuna Ladesti Judetul Vâlcea	41	\N	\N
40482	Liceul Tehnologic Capitan Nicolae Plesoianu Rm Vâlcea Judetul Vâlcea	41	\N	\N
40483	Scoala Gimnaziala Com.voineasa	41	\N	\N
40484	Scoala Gimnaziala Rotarasti Comuna Nicolae Balcescu	41	\N	\N
40485	Colegiul National Alexandru Lahovari	41	\N	\N
40486	Scoala Gimnaziala Sat Pausesti-otasau Com. Pausesti Judetul Vâlcea	41	\N	\N
40487	Scoala Gimnaziala Teodor Balasel Comuna Stefanest Judetul Vâlcea	41	\N	\N
40488	Scoala Gimnaziala Com Rosiilejudetul Vâlcea	41	\N	\N
40489	Scoala Gimnaziala Com Tomsani Judetul Vâlcea	41	\N	\N
40490	Scoala Gimnaziala Comuna  Mitrofani Judetul Vâlcea	41	\N	\N
40491	Scoala Gimnaziala Comuna Budesti Judetul Vâlcea	41	\N	\N
40492	Scoala Gimnaziala Sat  Muereasca De Sus Com. Muereasca Judetul Vâlcea	41	\N	\N
40493	Scoala Gimnaziala Comuna Gusoeni Judetul Vâlcea	41	\N	\N
40494	Scoala Gimnaziala Take Ionescu Jud.Vâlcea Mun.ramnicu Vâlcea	41	\N	\N
40495	Scoala Gimnaziala Sat Rusan Esti Comuna Fartatesti Jud.Vâlcea	41	\N	\N
40496	Scoala Gimnaziala Comuna Lapusata Judetul Vâlcea	41	\N	\N
40497	Liceul Tehnologic  Henri  Coandamu N.rm-Vâlcea	41	\N	\N
40498	Scoala Gimnaziala Nicolae Ciubotaru	42	\N	\N
40499	Scoala Gimnaziala Nr.1  Sat Padureni	42	\N	\N
40500	Scoala Gimnaziala Adrian Porumboiu Muntenii De Jos	42	\N	\N
40501	Scoala Gimnaziala  Horia Stamatin Bogdan Esti	42	\N	\N
40502	Scoala Gimnaziala George Tutoveanu	42	\N	\N
40503	Colegiul National Cuza Voda	42	\N	\N
40504	Scoala Gimnaziala Nr 1 Sat Ivesti	42	\N	\N
40505	Scoala Gimnaziala Mihai David Negresti	42	\N	\N
40506	Scoala Gimnaziala Episcop Iacov Antonovici	42	\N	\N
40507	Scoala Gimnaziala Sfantul Ierarh Luca Sat Costesti	42	\N	\N
40508	Scoala Gimnaziala Nr.1  Hurdugi	42	\N	\N
40509	Gradinita Cu Program Prelungit Nr.2 Barlad	42	\N	\N
40510	Scoala Gimnaziala George C Dragu Coroiesti	42	\N	\N
40511	Scoala Gimnaziala Nr1	42	\N	\N
40512	Scoala Gimnaziala Constantin Asiminei Sat Epureni	42	\N	\N
40513	Scoala Gimnaziala Elena Cuza Vaslui	42	\N	\N
40514	Scoala Postliceala Sanitara Anastasie Fatu Vaslui	42	\N	\N
40515	Scoala Gimnaziala Nr.1  Bogdana	42	\N	\N
40516	Scoala Gimnaziala Victor Ion Popa Dodesti	42	\N	\N
40517	Gradinita Cu Program Prelungit Nr.9 Vaslui	42	\N	\N
40518	Scoala Gimnaziala Stefan Cel Mare	42	\N	\N
40519	Scoala Gimnaziala Stroe S Belloescu	42	\N	\N
40520	Scoala Gimnaziala Mihail Sadoveanu	42	\N	\N
40521	Scoala Gimnaziala Nr1 Malusteni	42	\N	\N
40522	Scoala Gimnaziala Nr. 1 Ivanesti	42	\N	\N
40523	Scoala Gimnaziala Nr.1  Sat Albesti	42	\N	\N
40524	Scoala Gimnaziala Nr.1  Sat Tanacu	42	\N	\N
40525	Gradinita Cu Program Prelungit Nr.11	42	\N	\N
40526	Scoala Gimnaziala Nr.1 Sat Lunca Banului	42	\N	\N
40527	Scoala Gimnaziala Teodor Medeleanu Sat Ciocani	42	\N	\N
40528	Scoala Gimnaziala Spiru C. Haret Viisoara	42	\N	\N
40529	Scoala Gimnaziala Nr. 1 Garceni	42	\N	\N
40530	Scoala Gimnaziala Alexandru Vlah Uta	42	\N	\N
40531	Scoala Gimnaziala Anastasie Panu	42	\N	\N
40532	Liceul Tehnologic Ion Mincu Vaslui	42	\N	\N
40533	Gradinita Cu Program Prelungit Nr.8	42	\N	\N
40534	Scoala Gimnaziala Mihai Eminescu Osesti	42	\N	\N
40535	Gradinita Cu Program Prelungit Nr.1o Husi	42	\N	\N
40536	Colegiul Tehnic Al.i.cuza	42	\N	\N
40537	Seminarul Teologic Ortodox Sf.ioan Gura De Aur Husi	42	\N	\N
40538	Gradinita Cu Program Prelungit Nr.17 Vaslui	42	\N	\N
40539	Scoala Gimnaziala Nr. 1 Sat Tutova	42	\N	\N
40540	Scoala Gimnaziala Nr. 1 Sat Stanilesti	42	\N	\N
40541	Liceul Tehnologic Petru Rares Barlad	42	\N	\N
40542	Gradinita Cu Program Prelungit Nr.18 Vaslui	42	\N	\N
40543	Scoala Gimnaziala Nr 1 Sat Cepesti	42	\N	\N
40544	Liceul Tehnologic Ioan Corivan	42	\N	\N
40545	Gradinita Cu Program Prelungit Nr.1 Husi	42	\N	\N
40546	Liceul Tehnologic Nicolae Iorga Negresti	42	\N	\N
40547	Scoala Gimnaziala  Alexandru Ioan Cuza Vaslui	42	\N	\N
40548	Scoala Gimnaziala Dimitrie Negrutiu Pogonesti	42	\N	\N
40549	Scoala Gimnaziala General Aviator  Inginer Gheorghe Negrescu Fruntiseni	42	\N	\N
40550	Scoala Gimnaziala Nr.1  Botesti	42	\N	\N
40551	Scoala Gimnaziala De Arte N. N. Tonitza	42	\N	\N
40552	Liceul Teoretic Mihail Kogalniceanu Vaslui	42	\N	\N
40553	Scoala Gimnaziala1 Deleni	42	\N	\N
40554	Scoala Gimnaziala Constantin Motas Vaslui	42	\N	\N
40555	Gradinita Cu Program Prelungit Norocel Negresti	42	\N	\N
40556	Scoala Gimnaziala Manolache Costache Epureanu	42	\N	\N
40557	Liceul Pedagogic Ioan Popescu	42	\N	\N
40558	Gradinita De Copii Cu Program Prelungit Nr. 12	42	\N	\N
40559	Scoala Gimnaziala Constantin Rotaru Tarzii	42	\N	\N
40560	Scoala Gimnaziala Nr. 1 Pungesti	42	\N	\N
40561	Scoala Gimnaziala Nr.1 Gh Ergh Esti	42	\N	\N
40562	Scoala Gimnaziala Mihai Eminescu	42	\N	\N
40563	Gradinita Cu Program Prelungit Nr.5	42	\N	\N
40564	Scoala Gimnaziala Nr. 1 Sat Iana	42	\N	\N
40565	Scoala Gimnaziala Nr.3 Sat Popeni	42	\N	\N
40566	Scoala Gimnaziala Nr. 1 Sat Voinesti	42	\N	\N
40567	Scoala Gimnaziala Stefan Ciobotarasu	42	\N	\N
40568	Scoala Gimnaziala N.ghe. Lupu Arsura	42	\N	\N
40569	Liceul Tehnologic Vladia	42	\N	\N
40570	Scoala Gimnaziala Theodor Rosetti Solesti	42	\N	\N
40571	Scoala Gimnaziala Nr. 1 Poienesti	42	\N	\N
40572	Scoala Gimnaziala Nr. 1 Sat Ibanesti	42	\N	\N
40573	Scoala Gimnaziala Iorgu Radu	42	\N	\N
40574	Gradinita Cu Program Prelungit Nr. 3 Vaslui	42	\N	\N
40575	Scoala Gimnaziala Nr.1 Sat Cretestii De Sus	42	\N	\N
40576	Scoala Gimnaziala Constantin Parfene	42	\N	\N
40577	Scoala Gimnaziala Mihai Eminescu Sat Laza	42	\N	\N
40578	Scoala Gimnaziala Ion Creanga Municipiul Husi	42	\N	\N
40579	Scoala Gimnaziala Nr. 1 Sat Salceni	42	\N	\N
40580	Scoala Gimnaziala Gheorghe Cioata Sat Todiresti	42	\N	\N
40581	Liceul Tehnologic Sat Puiesti	42	\N	\N
40582	Scoala Gimnaziala Nicolae Milescu Spataru	42	\N	\N
40583	Liceul Stefan  Procopiu	42	\N	\N
40584	Scoala Gimnaziala Nr. 1 Sat Gara Banca	42	\N	\N
40585	Scoala Gimnaziala Sfantul Andrei Tacuta	42	\N	\N
40586	Scoala Gimnaziala Stroe Belloescu Grivita	42	\N	\N
40587	Scoala Gimnaziala Nr.1  Puscasi	42	\N	\N
40588	Scoala Gimnaziala Nr. 1 Sat Blagesti	42	\N	\N
40589	Scoala Gimnaziala Principesa Elena Bibescu Barlad	42	\N	\N
40590	Scoala Gimnaziala Ion Artene Gagesti	42	\N	\N
40591	Scoala Gimnaziala Ion Agarici Muntenii De Sus	42	\N	\N
40592	Liceul Teoretic Emil Racovita Vaslui	42	\N	\N
40593	Liceul Tehnologic Special Sfanta Ecaterina	42	\N	\N
40594	Scoala Gimnaziala  Cezar Botez Fastaci	42	\N	\N
40595	Scoala Gimnaziala Nr.1	42	\N	\N
40596	Liceul Tehnologic Gh En Uta Coman	42	\N	\N
40597	Scoala Gimnaziala Nr.1 Zorleni	42	\N	\N
40598	Colegiul Economic Mihail Kogalniceanu Focsani	43	\N	\N
40599	Scoala Gimnaziala Nr.7 Focsani	43	\N	\N
40600	Scoala Gimnaziala Slobozia  Bradului	43	\N	\N
40641	Colegiul Tehnic Auto  Traian Vuia Focsani	43	\N	\N
40601	Scoala Gimnaziala Principele Serbanghica Si Principesa Aristitaghica Sihlea	43	\N	\N
40602	Colegiul Tehnic Ion Mincu Focsani	43	\N	\N
40603	Scoala Gimnaziala Neculai Jechianu Vrincioaia	43	\N	\N
40604	Scoala Gimnaziala Tanasoaia	43	\N	\N
40605	Scoala Gimnaziala  Alexandru Vlah Uta	43	\N	\N
40606	Scoala Gimnaziala Ruginesti	43	\N	\N
40607	Scoala Gimnaziala Stefan Cel Mare	43	\N	\N
40608	Scoala Gimnaziala Pu Festi	43	\N	\N
40609	Liceul Tehnologic Alexandru Ioan Cuza Panciu	43	\N	\N
40610	Scoala Gimnaziala Gura Calitei	43	\N	\N
40611	Scoala Gimnaziala Timboiesti	43	\N	\N
40612	Scoala Gimnaziala Jaristea	43	\N	\N
40613	Scoala Gimnaziala Duiliu Zamfirescu Dumbraveni	43	\N	\N
40614	Scoala Gimnaziala Chiojdeni	43	\N	\N
40615	Scoala Gimnaziala Maicanesti	43	\N	\N
40616	Gradinita Cu Program Prelungit Nr 23 Focsani	43	\N	\N
40617	Scoala Gimnaziala Fitionesti	43	\N	\N
40618	Scoala Gimnaziala  Ionel Sirbu Ciorasti	43	\N	\N
40619	Scoala Gimnaziala Nr. 3 Focsani	43	\N	\N
40620	Scoala Gimnaziala Urechesti	43	\N	\N
40621	Scoala Gimnaziala Tifesti	43	\N	\N
40622	Liceul  Simion Mehedinți Vidra	43	\N	\N
40623	Colegiul Tehnic Valeriu D.cotea Focsani	43	\N	\N
40624	Scoala Gimnaziala Sindrilari Nr 1	43	\N	\N
40625	Scoala Gimnaziala Ioan Cimpineanu	43	\N	\N
40626	Scoala Gimnaziala Paltin	43	\N	\N
40627	Scoala Gimnaziala Cimpuri	43	\N	\N
40628	Scoala Gimnaziala Paulesti	43	\N	\N
40629	Scoala Gimnaziala Vasile Iftimescu Valea Sarii	43	\N	\N
40630	Scoala Gimnaziala Dimitrie Gusti Nereju	43	\N	\N
40631	Scoala Gimnaziala Gagesti	43	\N	\N
40632	Scoala Gimnaziala Nr.2	43	\N	\N
40633	Scoala Nicolae Iorga Focsani	43	\N	\N
40634	Gradinita Cu Program Prelungit Nr.16 Focsani	43	\N	\N
40635	Liceul Teoretic Odobesti	43	\N	\N
40636	Scoala Gimnaziala Homocea	43	\N	\N
40637	Scoala Gimnaziala Alexandru Vlah Uta	43	\N	\N
40638	Scoala Gimnaziala Doctor Costica Balan Poiana Cristei	43	\N	\N
40639	Scoala Gimnaziala Nanesti	43	\N	\N
40640	Scoala Gimnaziala Balesti	43	\N	\N
40642	Colegiul National Al. I. Cuza Focsani	43	\N	\N
40643	Scoala Gimnaziala Vu Ltu Ru	43	\N	\N
40644	Scoala Gimnaziala Rastoaca	43	\N	\N
40645	Scoala Gimnaziala Invatator Gheorghe Asanache Bordesti	43	\N	\N
40646	Gradinita Cu Program Prelungit Nr. 2 Focsani	43	\N	\N
40647	Scoala Gimnaziala Serbanesti	43	\N	\N
40648	Scoala Gimnaziala Profesor Doctor General Gheorghe V.zaharia Popesti	43	\N	\N
40649	Scoala Gimnaziala Ploscuteni	43	\N	\N
40650	Scoala Gimnaziala Andreiasu De Jos	43	\N	\N
40651	Scoala Gimnaziala Barbu Stefanescu Delavrancea Naruja	43	\N	\N
40652	Scoala Gimnaziala Obrejita	43	\N	\N
40653	Scoala Gimnaziala Nistoresti	43	\N	\N
40654	Scoala Gimnaziala Duiliu Zamfirescu	43	\N	\N
40655	Liceul Cu Program Sportiv Focsani	43	\N	\N
40656	Scoala Gimnaziala Principele Radu Adjud	43	\N	\N
40657	Gradinita Cu Program Prelungit Numarul 13 Focsani	43	\N	\N
40658	Scoala Gimnaziala Paunesti	43	\N	\N
40659	Scoala Gimnaziala Maresal Alexandru Averescu Adjud	43	\N	\N
40660	Scoala Gimnaziala Suraia	43	\N	\N
40661	Scoala Gimnaziala Nr. 1 Straoane	43	\N	\N
40662	Liceul Tehnologic Odobesti	43	\N	\N
40663	Scoala Gimnaziala Dumitru Pricop Negrilesti	43	\N	\N
40664	Scoala Gimnaziala Victor Slavescu Cotesti	43	\N	\N
40665	Liceul Tehnologic G.g.  Longinescu	43	\N	\N
40666	Scoala Gimnaziala  Spulber	43	\N	\N
40667	Gradinita Cu Program Prelungit Nr.1 Focsani	43	\N	\N
40668	Scoala Gimnaziala Nr.1mera	43	\N	\N
40669	Colegiul National Emil Botta Adjud	43	\N	\N
40670	Scoala Gimnaziala Movilita	43	\N	\N
40671	Scoala Gimnaziala Ioan Voda Cel Viteaz Slobozia Ciorasti	43	\N	\N
40672	Scoala Gimnaziala Mihail Armencea Adjud	43	\N	\N
40673	Scoala Gimnaziala Vizantea Razaseasca	43	\N	\N
40674	Scoala Gimnaziala Virtescoiu	43	\N	\N
40675	Scoala Gimnaziala Racoasa	43	\N	\N
40676	Scoala Gimnaziala Simion Mehedinți Soveja	43	\N	\N
40677	Scoala Gimnaziala Emil Atanasiu Garoafa	43	\N	\N
40678	Colegiul National Unirea Focsani	43	\N	\N
\.


--
-- Data for Name: judete; Type: TABLE DATA; Schema: public; Owner: cosmin
--

COPY public.judete (id, denumire) FROM stdin;
2	Bucureşti
3	Alba
4	Arad
5	Arges
6	Bacău
7	Bihor
8	Bistriţa-Năsăud
9	Botoşani
10	Braşov
11	Brăila
12	Buzău
13	Caraş-Severin
14	Călăraşi
15	Cluj
16	Constanţa
17	Covasna
18	Dâmboviţa
19	Dolj
20	Galaţi
21	Giurgiu
22	Gorj
23	Harghita
24	Hunedoara
25	Ialomiţa
26	Iaşi
27	Ilfov
28	Maramureş
29	Mehedinţi
30	Mureş
31	Neamţ
32	Olt
33	Prahova
34	Satu Mare
35	Sălaj
36	Sibiu
37	Suceava
38	Teleorman
39	Timiş
40	Tulcea
41	Vâlcea
42	Vaslui
43	Vrancea
\.


--
-- Data for Name: like_comentarii; Type: TABLE DATA; Schema: public; Owner: cosmin
--

COPY public.like_comentarii (id, id_utilizator, id_comentariu) FROM stdin;
\.


--
-- Data for Name: lista_neagra; Type: TABLE DATA; Schema: public; Owner: cosmin
--

COPY public.lista_neagra (id, id_profesor, text) FROM stdin;
\.


--
-- Data for Name: materii; Type: TABLE DATA; Schema: public; Owner: cosmin
--

COPY public.materii (id, nume) FROM stdin;
\.


--
-- Data for Name: materii_profesori; Type: TABLE DATA; Schema: public; Owner: cosmin
--

COPY public.materii_profesori (id, id_profesor, id_materie) FROM stdin;
\.


--
-- Data for Name: profesori; Type: TABLE DATA; Schema: public; Owner: cosmin
--

COPY public.profesori (id, nume, id_institutie_activ, pensionat) FROM stdin;
\.


--
-- Data for Name: rating_institutii; Type: TABLE DATA; Schema: public; Owner: cosmin
--

COPY public.rating_institutii (id, nota_conditii, id_utilizator, id_institutie, text, nota_facilitati, nota_dotari, nota_utilitati) FROM stdin;
1	1	12	36268	asdsda	2	3	4
\.


--
-- Data for Name: rating_profesori; Type: TABLE DATA; Schema: public; Owner: cosmin
--

COPY public.rating_profesori (id, id_utilizator, nota_predare, data_creare, id_profesor, text, nota_ascultare, nota_personalitate, nota_pregatire, nota_indulgenta) FROM stdin;
\.


--
-- Data for Name: reclamatii; Type: TABLE DATA; Schema: public; Owner: cosmin
--

COPY public.reclamatii (id, titlu, text, id_profesor) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: cosmin
--

COPY public.sessions (id, token, creation_time, creation_date, id_utilizator) FROM stdin;
50	832854a9a937abd7601dfdd8a738ad4f	06:39:29.244721	2021-11-01	12
\.


--
-- Data for Name: utilizatori; Type: TABLE DATA; Schema: public; Owner: cosmin
--

COPY public.utilizatori (id, username, google_id, data_inregistrare, data_nastere, id_institutie_curenta, ban_status, email, profile_pic_url, prenume, nume) FROM stdin;
12	new-user	105182291093377536529	2021-10-24	2021-10-24	\N	f	techdubberstudio@gmail.com	https://lh3.googleusercontent.com/a-/AOh14GixDDOZhnwfQn6VkxKELuFwpuEpVKivr3wtjt8YDg=s96-c	Cosmin	Aruxandei
\.


--
-- Name: comentarii_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmin
--

SELECT pg_catalog.setval('public.comentarii_id_seq', 1, false);


--
-- Name: dislike_comentarii_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmin
--

SELECT pg_catalog.setval('public.dislike_comentarii_id_seq', 1, false);


--
-- Name: institutii_id_institutie_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmin
--

SELECT pg_catalog.setval('public.institutii_id_institutie_seq', 40678, true);


--
-- Name: judete_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmin
--

SELECT pg_catalog.setval('public.judete_id_seq', 43, true);


--
-- Name: like_comentarii_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmin
--

SELECT pg_catalog.setval('public.like_comentarii_id_seq', 1, false);


--
-- Name: lista_neagra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmin
--

SELECT pg_catalog.setval('public.lista_neagra_id_seq', 1, false);


--
-- Name: materii_id_materie_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmin
--

SELECT pg_catalog.setval('public.materii_id_materie_seq', 1, false);


--
-- Name: materii_profesori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmin
--

SELECT pg_catalog.setval('public.materii_profesori_id_seq', 1, false);


--
-- Name: profesori_id_profesor_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmin
--

SELECT pg_catalog.setval('public.profesori_id_profesor_seq', 1, false);


--
-- Name: rating_id_rating_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmin
--

SELECT pg_catalog.setval('public.rating_id_rating_seq', 1, true);


--
-- Name: rating_profesori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmin
--

SELECT pg_catalog.setval('public.rating_profesori_id_seq', 1, false);


--
-- Name: reclamatii_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmin
--

SELECT pg_catalog.setval('public.reclamatii_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmin
--

SELECT pg_catalog.setval('public.sessions_id_seq', 50, true);


--
-- Name: utilizatori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosmin
--

SELECT pg_catalog.setval('public.utilizatori_id_seq', 12, true);


--
-- Name: comentarii pk_comentarii_id; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.comentarii
    ADD CONSTRAINT pk_comentarii_id PRIMARY KEY (id);


--
-- Name: dislike_comentarii pk_dislike_comentarii_id; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.dislike_comentarii
    ADD CONSTRAINT pk_dislike_comentarii_id PRIMARY KEY (id);


--
-- Name: institutii pk_institutii_id_institutie; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.institutii
    ADD CONSTRAINT pk_institutii_id_institutie PRIMARY KEY (id);


--
-- Name: judete pk_judete_id; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.judete
    ADD CONSTRAINT pk_judete_id PRIMARY KEY (id);


--
-- Name: like_comentarii pk_like_comentarii_id; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.like_comentarii
    ADD CONSTRAINT pk_like_comentarii_id PRIMARY KEY (id);


--
-- Name: lista_neagra pk_lista_neagra_id; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.lista_neagra
    ADD CONSTRAINT pk_lista_neagra_id PRIMARY KEY (id);


--
-- Name: materii pk_materii_id_materie; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.materii
    ADD CONSTRAINT pk_materii_id_materie PRIMARY KEY (id);


--
-- Name: materii_profesori pk_materii_profesori_id; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.materii_profesori
    ADD CONSTRAINT pk_materii_profesori_id PRIMARY KEY (id);


--
-- Name: profesori pk_profesori_id_profesor; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.profesori
    ADD CONSTRAINT pk_profesori_id_profesor PRIMARY KEY (id);


--
-- Name: rating_institutii pk_rating_id_rating; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.rating_institutii
    ADD CONSTRAINT pk_rating_id_rating PRIMARY KEY (id);


--
-- Name: rating_profesori pk_rating_profesori_id; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.rating_profesori
    ADD CONSTRAINT pk_rating_profesori_id PRIMARY KEY (id);


--
-- Name: reclamatii pk_reclamatii_id; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.reclamatii
    ADD CONSTRAINT pk_reclamatii_id PRIMARY KEY (id);


--
-- Name: sessions pk_sessions_id; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT pk_sessions_id PRIMARY KEY (id);


--
-- Name: utilizatori pk_utilizatori_id; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.utilizatori
    ADD CONSTRAINT pk_utilizatori_id PRIMARY KEY (id);


--
-- Name: comentarii unq_comentarii_id_utilizator; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.comentarii
    ADD CONSTRAINT unq_comentarii_id_utilizator UNIQUE (id_utilizator);


--
-- Name: dislike_comentarii unq_dislike_comentarii_id_comentariu; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.dislike_comentarii
    ADD CONSTRAINT unq_dislike_comentarii_id_comentariu UNIQUE (id_comentariu);


--
-- Name: dislike_comentarii unq_dislike_comentarii_id_utilizator; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.dislike_comentarii
    ADD CONSTRAINT unq_dislike_comentarii_id_utilizator UNIQUE (id_utilizator);


--
-- Name: like_comentarii unq_like_comentarii_id_comentariu; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.like_comentarii
    ADD CONSTRAINT unq_like_comentarii_id_comentariu UNIQUE (id_comentariu);


--
-- Name: like_comentarii unq_like_comentarii_id_utilizator; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.like_comentarii
    ADD CONSTRAINT unq_like_comentarii_id_utilizator UNIQUE (id_utilizator);


--
-- Name: materii_profesori unq_materii_profesori_id_materie; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.materii_profesori
    ADD CONSTRAINT unq_materii_profesori_id_materie UNIQUE (id_materie);


--
-- Name: materii_profesori unq_materii_profesori_id_profesor; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.materii_profesori
    ADD CONSTRAINT unq_materii_profesori_id_profesor UNIQUE (id_profesor);


--
-- Name: profesori unq_profesori_id_institutie_activ; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.profesori
    ADD CONSTRAINT unq_profesori_id_institutie_activ UNIQUE (id_institutie_activ);


--
-- Name: rating_institutii unq_rating_id_institutie; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.rating_institutii
    ADD CONSTRAINT unq_rating_id_institutie UNIQUE (id_institutie);


--
-- Name: rating_institutii unq_rating_id_utilizator; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.rating_institutii
    ADD CONSTRAINT unq_rating_id_utilizator UNIQUE (id_utilizator);


--
-- Name: rating_profesori unq_rating_profesori_id_profesor; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.rating_profesori
    ADD CONSTRAINT unq_rating_profesori_id_profesor UNIQUE (id_profesor);


--
-- Name: rating_profesori unq_rating_profesori_id_utilizator; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.rating_profesori
    ADD CONSTRAINT unq_rating_profesori_id_utilizator UNIQUE (id_utilizator);


--
-- Name: utilizatori unq_utilizatori_id_institutie_curenta; Type: CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.utilizatori
    ADD CONSTRAINT unq_utilizatori_id_institutie_curenta UNIQUE (id_institutie_curenta);


--
-- Name: comentarii fk_comentarii_utilizatori; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.comentarii
    ADD CONSTRAINT fk_comentarii_utilizatori FOREIGN KEY (id_utilizator) REFERENCES public.utilizatori(id);


--
-- Name: dislike_comentarii fk_dislike_comentarii_comentarii; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.dislike_comentarii
    ADD CONSTRAINT fk_dislike_comentarii_comentarii FOREIGN KEY (id_comentariu) REFERENCES public.comentarii(id);


--
-- Name: dislike_comentarii fk_dislike_comentarii_utilizatori; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.dislike_comentarii
    ADD CONSTRAINT fk_dislike_comentarii_utilizatori FOREIGN KEY (id_utilizator) REFERENCES public.utilizatori(id);


--
-- Name: institutii fk_institutii_judete; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.institutii
    ADD CONSTRAINT fk_institutii_judete FOREIGN KEY (id_judet) REFERENCES public.judete(id);


--
-- Name: like_comentarii fk_like_comentarii_comentarii; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.like_comentarii
    ADD CONSTRAINT fk_like_comentarii_comentarii FOREIGN KEY (id_comentariu) REFERENCES public.comentarii(id);


--
-- Name: like_comentarii fk_like_comentarii_utilizatori; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.like_comentarii
    ADD CONSTRAINT fk_like_comentarii_utilizatori FOREIGN KEY (id_utilizator) REFERENCES public.utilizatori(id);


--
-- Name: lista_neagra fk_lista_neagra_profesori; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.lista_neagra
    ADD CONSTRAINT fk_lista_neagra_profesori FOREIGN KEY (id_profesor) REFERENCES public.profesori(id);


--
-- Name: materii_profesori fk_materii_profesori_materii; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.materii_profesori
    ADD CONSTRAINT fk_materii_profesori_materii FOREIGN KEY (id_materie) REFERENCES public.materii(id);


--
-- Name: materii_profesori fk_materii_profesori_profesori; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.materii_profesori
    ADD CONSTRAINT fk_materii_profesori_profesori FOREIGN KEY (id_profesor) REFERENCES public.profesori(id);


--
-- Name: profesori fk_profesori_institutii; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.profesori
    ADD CONSTRAINT fk_profesori_institutii FOREIGN KEY (id_institutie_activ) REFERENCES public.institutii(id);


--
-- Name: rating_institutii fk_rating_institutii_institutii; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.rating_institutii
    ADD CONSTRAINT fk_rating_institutii_institutii FOREIGN KEY (id_institutie) REFERENCES public.institutii(id);


--
-- Name: rating_institutii fk_rating_institutii_utilizatori; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.rating_institutii
    ADD CONSTRAINT fk_rating_institutii_utilizatori FOREIGN KEY (id_utilizator) REFERENCES public.utilizatori(id);


--
-- Name: rating_profesori fk_rating_profesori_profesori; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.rating_profesori
    ADD CONSTRAINT fk_rating_profesori_profesori FOREIGN KEY (id_profesor) REFERENCES public.profesori(id);


--
-- Name: rating_profesori fk_rating_profesori_utilizatori; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.rating_profesori
    ADD CONSTRAINT fk_rating_profesori_utilizatori FOREIGN KEY (id_utilizator) REFERENCES public.utilizatori(id);


--
-- Name: reclamatii fk_reclamatii_profesori; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.reclamatii
    ADD CONSTRAINT fk_reclamatii_profesori FOREIGN KEY (id_profesor) REFERENCES public.profesori(id);


--
-- Name: sessions fk_sessions_utilizatori; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT fk_sessions_utilizatori FOREIGN KEY (id_utilizator) REFERENCES public.utilizatori(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: utilizatori fk_utilizatori_institutii; Type: FK CONSTRAINT; Schema: public; Owner: cosmin
--

ALTER TABLE ONLY public.utilizatori
    ADD CONSTRAINT fk_utilizatori_institutii FOREIGN KEY (id_institutie_curenta) REFERENCES public.institutii(id);


--
-- PostgreSQL database dump complete
--

