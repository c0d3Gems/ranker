--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.1

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
-- Name: comentarii; Type: TABLE; Schema: public; Owner: cosminaruxandei
--

CREATE TABLE public.comentarii (
    id integer NOT NULL,
    data_creare date DEFAULT CURRENT_DATE NOT NULL,
    continut text NOT NULL,
    id_utilizator integer NOT NULL
);


ALTER TABLE public.comentarii OWNER TO cosminaruxandei;

--
-- Name: comentarii_id_seq; Type: SEQUENCE; Schema: public; Owner: cosminaruxandei
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
-- Name: dislike_comentarii; Type: TABLE; Schema: public; Owner: cosminaruxandei
--

CREATE TABLE public.dislike_comentarii (
    id integer NOT NULL,
    id_utilizator integer NOT NULL,
    id_comentariu integer NOT NULL
);


ALTER TABLE public.dislike_comentarii OWNER TO cosminaruxandei;

--
-- Name: dislike_comentarii_id_seq; Type: SEQUENCE; Schema: public; Owner: cosminaruxandei
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
-- Name: institutii; Type: TABLE; Schema: public; Owner: cosminaruxandei
--

CREATE TABLE public.institutii (
    id integer NOT NULL,
    denumire character varying(200) NOT NULL,
    id_judet integer NOT NULL
);


ALTER TABLE public.institutii OWNER TO cosminaruxandei;

--
-- Name: institutii_id_institutie_seq; Type: SEQUENCE; Schema: public; Owner: cosminaruxandei
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
-- Name: judete; Type: TABLE; Schema: public; Owner: cosminaruxandei
--

CREATE TABLE public.judete (
    id integer NOT NULL,
    denumire character varying(200) NOT NULL
);


ALTER TABLE public.judete OWNER TO cosminaruxandei;

--
-- Name: judete_id_seq; Type: SEQUENCE; Schema: public; Owner: cosminaruxandei
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
-- Name: like_comentarii; Type: TABLE; Schema: public; Owner: cosminaruxandei
--

CREATE TABLE public.like_comentarii (
    id integer NOT NULL,
    id_utilizator integer NOT NULL,
    id_comentariu integer NOT NULL
);


ALTER TABLE public.like_comentarii OWNER TO cosminaruxandei;

--
-- Name: like_comentarii_id_seq; Type: SEQUENCE; Schema: public; Owner: cosminaruxandei
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
-- Name: lista_neagra; Type: TABLE; Schema: public; Owner: cosminaruxandei
--

CREATE TABLE public.lista_neagra (
    id integer NOT NULL,
    id_profesor integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.lista_neagra OWNER TO cosminaruxandei;

--
-- Name: lista_neagra_id_seq; Type: SEQUENCE; Schema: public; Owner: cosminaruxandei
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
-- Name: materii; Type: TABLE; Schema: public; Owner: cosminaruxandei
--

CREATE TABLE public.materii (
    id integer NOT NULL,
    nume character varying(200) NOT NULL
);


ALTER TABLE public.materii OWNER TO cosminaruxandei;

--
-- Name: materii_id_materie_seq; Type: SEQUENCE; Schema: public; Owner: cosminaruxandei
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
-- Name: materii_profesori; Type: TABLE; Schema: public; Owner: cosminaruxandei
--

CREATE TABLE public.materii_profesori (
    id integer NOT NULL,
    id_profesor integer NOT NULL,
    id_materie integer NOT NULL
);


ALTER TABLE public.materii_profesori OWNER TO cosminaruxandei;

--
-- Name: materii_profesori_id_seq; Type: SEQUENCE; Schema: public; Owner: cosminaruxandei
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
-- Name: profesori; Type: TABLE; Schema: public; Owner: cosminaruxandei
--

CREATE TABLE public.profesori (
    id integer NOT NULL,
    nume character varying(200) NOT NULL,
    id_institutie_activ integer NOT NULL,
    pensionat boolean DEFAULT false NOT NULL
);


ALTER TABLE public.profesori OWNER TO cosminaruxandei;

--
-- Name: profesori_id_profesor_seq; Type: SEQUENCE; Schema: public; Owner: cosminaruxandei
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
-- Name: rating_institutii; Type: TABLE; Schema: public; Owner: cosminaruxandei
--

CREATE TABLE public.rating_institutii (
    id integer NOT NULL,
    nota integer DEFAULT 0 NOT NULL,
    id_utilizator integer NOT NULL,
    id_institutie integer,
    text text
);


ALTER TABLE public.rating_institutii OWNER TO cosminaruxandei;

--
-- Name: rating_id_rating_seq; Type: SEQUENCE; Schema: public; Owner: cosminaruxandei
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
-- Name: rating_profesori; Type: TABLE; Schema: public; Owner: cosminaruxandei
--

CREATE TABLE public.rating_profesori (
    id integer NOT NULL,
    id_utilizator integer NOT NULL,
    nota integer DEFAULT 1 NOT NULL,
    data_creare date DEFAULT CURRENT_DATE NOT NULL,
    id_profesor integer NOT NULL,
    text text
);


ALTER TABLE public.rating_profesori OWNER TO cosminaruxandei;

--
-- Name: rating_profesori_id_seq; Type: SEQUENCE; Schema: public; Owner: cosminaruxandei
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
-- Name: utilizatori; Type: TABLE; Schema: public; Owner: cosminaruxandei
--

CREATE TABLE public.utilizatori (
    id integer NOT NULL,
    username character varying(200) DEFAULT 'new-user'::character varying NOT NULL,
    google_id integer NOT NULL,
    data_inregistrare date DEFAULT CURRENT_DATE NOT NULL,
    data_nastere date DEFAULT CURRENT_DATE NOT NULL,
    id_institutie_curenta integer,
    ban_status boolean DEFAULT false NOT NULL
);


ALTER TABLE public.utilizatori OWNER TO cosminaruxandei;

--
-- Name: utilizatori_id_seq; Type: SEQUENCE; Schema: public; Owner: cosminaruxandei
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
-- Data for Name: comentarii; Type: TABLE DATA; Schema: public; Owner: cosminaruxandei
--

COPY public.comentarii (id, data_creare, continut, id_utilizator) FROM stdin;
\.


--
-- Data for Name: dislike_comentarii; Type: TABLE DATA; Schema: public; Owner: cosminaruxandei
--

COPY public.dislike_comentarii (id, id_utilizator, id_comentariu) FROM stdin;
\.


--
-- Data for Name: institutii; Type: TABLE DATA; Schema: public; Owner: cosminaruxandei
--

COPY public.institutii (id, denumire, id_judet) FROM stdin;
22291	Scoala Gimnaziala Nr.280	2
22292	Colegiul Tehnologic Grigore Cerch Ez	2
22293	Asociatia Scoala Europeana București	2
22294	Scoala Gimnaziala Nr. 144	2
22295	Colegiul National I.l.caragiale	2
22296	Gradinita Nr. 62	2
22297	Gradinita 101 Dalmatieni	2
22298	Scoala Gimnaziala Regele Mihai I	2
22299	Colegiul Tehnic De Aeronautica Henri Coanda	2
22300	Colegiul National Octav Onicescu	2
22301	Liceul Teoretic Constantin Brancoveanu	2
22302	Gradinita Nr.71	2
22303	Scoala Gimnaziala Nr. 162 București	2
22304	Gradinita Martisor	2
22305	Scoala Gimnaziala Nr.108	2
22306	Liceul Teoretic Hyperion Din București	2
22307	Academia De Stiinte Agricole Si Silvice	2
22308	Gradinita Colt De Rai	2
22309	Liceul Tehnologic Sf.antim  Ivireanu	2
22310	Scoala Gimnaziala Nr.280	2
22311	Academia De Studii Economice Din București	2
22312	Scoala Gimnaziala Nr.108	2
22313	Colegiul National Octav Onicescu	2
22314	Gradinita Nrj 33	2
22315	Academia De Stiinte Ale Securitatii Nationale	2
22316	Scoala Gimnaziala Mircea Santimbreanu	2
22317	Scoala Gimnaziala Nr.181	2
22318	Colegiul  Economic Virgil  Madgearu	2
22319	Gradinita Martisor	2
22320	Gradinita Nr.229	2
22321	Scoala Gimnaziala Nr. 163	2
22322	Institutul Teologic Penticostal Din Municipiul București	2
22323	Liceul Tehnologic Mircea Vulcanescu	2
22324	Scoala Gimnaziala  Ionel Teodoreanu	2
22325	Scoala Gimnaziala Sfantul Silvestru	2
22326	Gradinita Nr. 62	2
22327	Liceul Tehnologic Sfantul Pantelimon	2
22328	Scoala Gimnaziala Metropolitana Arc	2
22329	Gradinita Spiridusii	2
22330	Gradinita Nrj 33	2
22331	Liceul Teoretic T. Vladimirescu	2
22332	Scoala Gimnaziala Sfantul Silvestru	2
22333	Colegiul Tehnic Mircea Cel Batran	2
22334	Scoala Gimnaziala Ferdinand I	2
22335	Scoala Gimnaziala Sfantul Andrei	2
22336	Scoala Postliceala Sanitarasfantul Ioan	2
22337	Scoala Gimnaziala Speciala Pentru Surzi Nrj	2
22338	Academia De Stiinte Tehnice Din Romania	2
22339	Scoala Gimnaziala Speciala Nr. 4	2
22340	Scoala Gimnaziala Nr. 99	2
22341	Colegiul Tehnic De Industrie Alimentara Dumitru Motoc	2
22342	Colegiul National Octav Onicescu	2
22343	Scoala Gimnaziala Speciala Nr.9	2
22344	Colegiul Ucecom Spiru Haret	2
22345	Gradinita Nrj 16	2
22346	Scoala Gimnaziala Nr.198	2
22347	Gradinita Nr.50	2
22348	Scoala Gimnaziala Sfantul Andrei	2
22349	Gradinita Nr 178	2
22350	Colegiul Economic Hermes	2
22351	Academia De Stiinte Tehnice Din Romania	2
22352	Scoala Gimnaziala Speciala Nr. 4	2
22353	Gradinita Nr.97	2
22354	Scoala Gimnaziala Ienachita Vacarescu	2
22355	Scoala Gimnaziala Mircea Santimbreanu	2
22356	Scoala Gimnaziala Speciala Nr.9	2
22357	Scoala Gimnaziala Nr.112	2
22358	Universitatea Nationala De Arte Din București	2
22359	Scoala Gimnaziala Nr.181	2
22360	Scoala Gimnaziala Nr.5	2
22361	Liceul Teoretic Ion  Barbu	2
22362	Liceul Tehnologic Elie Radu	2
22363	Gradinita Nr. 248	2
22364	Scoala Gimnaziala Nr.145	2
22365	Gradinita Paradisul Piticilor	2
22366	Scoala Gimnaziala Sfantul Silvestru	2
22367	Colegiul Tehnic Mecanic Grivita	2
22368	Scoala Gimnaziala Metropolitana Arc	2
22369	Liceul Tehnologic Sfantul Pantelimon	2
22370	Scoala Gimnaziala De Arte Nr. 4	2
22371	Gradinita Nr. 43	2
22372	Scoala Gimnaziala Nr. 84	2
22373	Gradinita Spiridusii	2
22374	Scoala Gimnaziala Nr. 99	2
22375	Scoala Gimnaziala Alexandru Costescu	2
22376	Universitatea Politehnica Din București	2
22377	Liceul Teoretic T. Vladimirescu	2
22378	Gradinita Nr 178	2
22379	Gradinita Panseluta	2
22380	Scoala Gimnaziala Nr.198	2
22381	Colegiul Tehnic Mircea Cel Batran	2
22382	Scoala Gimnaziala Maria Rosetfi	2
22383	Colegiul Tehnic Costin D. Nenitescu	2
22384	Scoala Postliceala Sanitarasfantul Ioan	2
22385	Scoala Gimnaziala Sfantul Andrei	2
22386	Scoala Gimnaziala Speciala Constatin Paunescu	2
22387	Academia De Studii Economice Din București	2
22388	Colegiul Tehnic Mircea Cel Batran	2
22389	Colegiul National Mihai Eminescu	2
22390	Scoala Gimnaziala Uruguay	2
22391	Liceul Teoretic Bilingv Ita Wegman	2
22392	Scoala Gimnaziala Speciala Pentru Surzi Nrj	2
22393	Scoala Gimnaziala Speciala Nr. 4	2
22394	Gradinita Nr 24	2
22395	Gradinita Luminita	2
22396	Colegiul Tehnic De Industrie Alimentara Dumitru Motoc	2
22397	Scoala Gimnaziala Nr.311	2
22398	Colegiul National Spiru Haret	2
22399	Scoala Gimnaziala Nr.115	2
22400	Gradinita Nrj 16	2
22401	Scoala Gimnaziala Speciala Nr.9	2
22402	Gradinita Nr.276	2
22403	Academia De Stiinte Ale Securitatii Nationale	2
22404	Scoala Gimnaziala Geo Bogza	2
22405	Scoala Gimnaziala Nr 169	2
22406	Scoala Gimnaziala Nr 136	2
22407	Universitatea Romano-americana	2
22408	Scoala Gimnaziala Nr.81	2
22409	Scoala Gimnaziala Nr.103	2
22410	Scoala Gimnaziala Nr.46	2
22411	Academia De Studii Economice Din București	2
22412	Liceul Teoretic Nichita Stanescu	2
22413	Gradinita Nr 178	2
22414	Scoala Gimnaziala Nr.31	2
22415	Gradinita Luminita	2
22416	Scoala Gimnaziala Speciala Nr 5	2
22417	Colegiul National Mihai Eminescu	2
22418	Scoala Gimnaziala Nr. 41	2
22419	Academia De Stiinte Ale Securitatii Nationale	2
22420	Scoala Gimnazial Nr. 71	2
22421	Gradinita Nr.97	2
22422	Gradinita Nr.242	2
22423	Scoala Centrala	2
22424	Liceul Teoretic Alexandru Ioan Cuza	2
22425	Scoala Gimnaziala Nr.311	2
22426	Universitatea Ecologica Din București	2
22427	Gradinita Nr.231	2
22428	Colegiul Tehnic Gh. Asachi	2
22429	Gradinita Nr.41	2
22430	Scoala Gimnaziala  Ionel Teodoreanu	2
22431	Scoala Gimnaziala Nr.129	2
22432	Gradinita Nrj 38	2
22433	Universitatea Nationala De Arta Teatrala Si Cinematografica Ion Luca Caragiale	2
22434	Scoala Gimnaziala Nr.8o	2
22435	Gradinita Nr 54	2
22436	Gradinita Nr.208	2
22437	Gradinita Floare Albastra	2
22438	Scoala Gimnaziala Nr. 24	2
22439	Scoala Gimnaziala De Arte Nr.3	2
22440	Scoala Gimnaziala Nr.117	2
22441	Gradinita Nr.206	2
22442	Gradinita Planeta Copiilor	2
22443	Scoala Gimnaziala Nr. 131	2
22444	Colegiul National De Arte Dinu Lipatti	2
22445	Scoala Gimnaziala Nr. 184	2
22446	Scoala Gimnaziala Nr. 184	2
22447	Scoala Gimnaziala Grigore Tocilescu	2
22448	Liceul Tehnologic Sfantul Pantelimon	2
22449	Scoala Profesionala Speciala Nr.2	2
22450	Scoala Nationala De Studii Politice Si Administrative	2
22451	Scoala Gimnaziala Nr.85	2
22452	Scoala Gimnaziala Nr. 49	2
22453	Scoala Postliceala Sanitara Fundeni	2
22454	Liceul Tehnologic Mircea Vulcanescu	2
22455	Gradinita Nr.274	2
22456	Liceul Teoretic T. Vladimirescu	2
22457	Gradinita Nr.44	2
22458	Liceul Teoretic Sfintii Trei Ierarhi	2
22459	Scoala Gimnaziala Nr.25	2
22460	Scoala Gimnaziala Nr.103	2
22461	Gradinita Prichindel	2
22462	Liceul Tehnologic Special Regina Elisabeta	2
22463	Scoala Gimnaziala Nr 136	2
22464	Scoala Gimnaziala Sfantul Andrei	2
22465	Scoala Gimnaziala De Arte Iosif Sava	2
22466	Scoala Gimnaziala Nr 169	2
22467	Liceul Teoretic D. Bolintineanu	2
22468	Gradinita Nr. 246	2
22469	Gradinita Nr.185	2
22470	Liceul Tehnologic Elie Radu	2
22471	Gradinita Nr.72	2
22472	Liceul Tehnologic De Metrologie Traian Vuia	2
22473	Scoala Gimnaziala Nr.119	2
22474	Scoala Gimnaziala Nr 188	2
22475	Gradinita Nr. 149	2
22476	Colegiul National Bilingv George Cosbuc	2
22477	Liceul Tehnologic Constantin Brancusi	2
22478	Scoala Superioara Comerciala Nicolae Kretzulescu	2
22479	Gradinita Nr.111	2
22480	Gradinita Ciupecuta	2
22481	Gradinita Nr.211	2
22482	Scoala Gimnaziala Nr.164	2
22483	Scoala Gimnaziala Nr.308	2
22484	Gradinita Nr.4o	2
22485	Liceul Teoretic M.sadovean U	2
22486	Liceul Tehnologic Dragomir Hurmuzescu	2
22487	Scoala Gimnaziala Nr.153	2
22488	Scoala Gimnaziala Nr 125	2
22489	Scoala Gimnaziala Emil Racovita	2
22490	Scoala Gimnaziala De Arte Iosif Sava	2
22491	Scoala Gimnaziala Pia Bratianu	2
22492	Gradinita Scufita Rosie	2
22493	Scoala Gimnaziala Nr. 161	2
22494	Scoala Gimnaziala Alexandru Ioan Cuza	2
22495	Scoala Gimnaziala Sfantul Nicolae	2
22496	Scoala Gimnaziala Nr. 51	2
22497	Scoala Gimnaziala Nr. 200	2
22498	Gradinita Nr.191	2
22499	Liceul Tehnologic Dacia	2
22500	Scoala Gimnaziala Grigore Tocilescu	2
22501	Gradinita Nr. 35	2
22502	Gradinitanr. 280	2
22503	Gradinita Nr 30	2
22504	Colegiul National De Muzica George Enescu	2
22505	Colegiul National Cantemir Voda	2
22506	Gradinita Nr 24	2
22507	Gradinita Alba Ca Zapada Si Piticii	2
22508	Scoala Gimnaziala Herastrau	2
22509	Liceul Dimitrie Paciurea	2
22510	Scoala Gimnaziala Ienachita Vacarescu	2
22511	Gradinita Licurici	2
22512	Gradinita Nr 245	2
22513	Liceul Teologic Adventist Stefan Demetrescu	2
22514	Scoala Gimnaziala Nr.115	2
22515	Scoala Gimnaziala Martisor	2
22516	Gradinita Nr. 230	2
22517	Scoala Gimnaziala Nr 116	2
22518	Scoala Gimnaziala Nr.311	2
22519	Liceul De Arte Plastice Nicolae Tonitza	2
22520	Colegiul Tehnic Mihai  Bravu	2
22521	Scoala Gimnaziala Speciala Nr.8	2
22522	Gradinita Nr.276	2
22523	Liceul Teoretic D. Bolintineanu	2
22524	Universitatea Nationala De Arte Din București	2
22525	Gradinita Nr.185	2
22526	Universitatea Nationala De Arte Din București	2
22527	Scoala Gimnaziala Maica Domnului	2
22528	Scoala Gimnaziala Nr. 4	2
22529	Scoala Gimnaziala Nr.193	2
22530	Liceul Tehnologic Special Nr. 3	2
22531	Scoala Gimnaziala I.g. Duca	2
22532	Scoala Gimnaziala Cezar Bolliac	2
22533	Scoala Gimnaziala Nr. 62	2
22534	Scoala Gimnaziala Nr.5	2
22535	Scoala Gimnaziala Nr. 78	2
22536	Liceul Tehnologic Ion  I.c. Bratianu	2
22537	Colegiul Tehnic Energetic	2
22538	Gradinita Nr. 239	2
22539	Scoala Gimnaziala De Arte Nr. 2	2
22540	Gradinita Nr.21o	2
22541	Scoala Gimnaziala Nr. 194	2
22542	Liceul Tehnologic Elie Radu	2
22543	Scoala Gimnaziala Nr. 97	2
22544	Colegiul National Iulia Hasdeu	2
22545	Universitatea Nationala De Educatie Fizica Si Sport	2
22546	Gradinita M.ap.n.nr.1	2
22547	Scoala Gimnaziala Speciala Nr. 2	2
22548	Scoala Gimnaziala Nr.145	2
22549	Colegiul National Mihai Viteazul	2
22550	Scoala Gimnaziala Luceafarul	2
22551	Gradinita  Nr.34	2
22552	Academia De Stiinte Medicale	2
22553	Gradinita Nr 135	2
22554	Colegiul Tehnic Anghel Saligny	2
22555	Gradinita Nr.7o	2
22556	Scoala Superioara Comerciala Nicolae Kretzulescu	2
22557	Gradinita Dumbrava Minunilor	2
22558	Seminarul Teologic Ortodox București	2
22559	Scoala Gimnaziala Nr. 66	2
22560	Universitatea De Medicina Si Farmacie Carol Davila București	2
22561	Liceul Teoretic Waldorf	2
22562	Gradinita Nr.283	2
22563	Liceul Teoretic Dante Alighieri	2
22564	Universitatea Nationala De Muzica București	2
22565	Colegiul Economic A. D. Xenopol	2
22566	Scoala Gimnaziala Nr.13	2
22567	Liceul Teoretic Benjamin Franklin	2
22568	Gradinita Nr.185	2
22569	Scoala Nationala De Studii Politice Si Administrative	2
22570	Gradinita Paradisul Verde	2
22571	Colegiul Tehnic Miron Nicolescu	2
22572	Gradinita Nr.72	2
22573	Scoala Gimnaziala Nr. 7	2
22574	Scoala Gimnaziala Nr. 40	2
22575	Scoala Gimnaziala Nr. 183	2
22576	Scoala Gimnaziala Nr.119	2
22577	Gradinita Nr.69	2
22578	Colegiul Tehnic  Edmond Nicolau	2
22579	Colegiul National Ion Neculce	2
22580	Gradinita Nr. 149	2
22581	Scoala Gimnaziala Nicolae Labis	2
22582	Scoala Gimnaziala Nr.56	2
22583	Gradinita Nr 73	2
22584	Liceul Tehnologic Constantin Brancusi	2
22585	Liceul Teoretic Marin Preda	2
22586	Scoala Gimnaziala Ion Heliade Radulescu	2
22587	Gradinitanr. 280	2
22588	Gradinita Nr.21o	2
22589	Scoala Gimnaziala Eugen Barbu	2
22590	Scoala Gimnaziala George Bacovia	2
22591	Gradinita Insir Te Margarite	2
22592	Colegiul National Iulia Hasdeu	2
22593	Scoala Gimnaziala Nr. 142	2
22594	Scoala Gimnaziala Nr 86	2
22595	Liceul De Coregrafie Floria Capsali	2
22596	Gradinita Hillary Clinton	2
22597	Scoala Gimnaziala Liviu Rebreanu Fosta 21	2
22598	Gradinita Nr.52	2
22599	Colegiul National Aurel Vlaicu	2
22600	Gradinita Nr.154	2
22601	Liceul Cu Program Sportiv Mircea Eliade	2
22602	Gradinita Piticot	2
22603	Scoala Gimnaziala Nr. 192	2
22604	Liceul Toretic George Calinescu	2
22605	Scoala Nationala De Grefieri	2
22606	Scoala Gimnaziala Nr. 192	2
22607	Liceul Dimitrie Paciurea	2
22608	Gradinita Nr.69	2
22609	Gradinita Licurici	2
22610	Scoala Gimnaziala Petrache Poenaru	2
22611	Liceul Teologic Adventist Stefan Demetrescu	2
22612	Scoala Gimnaziala Nicolae Labis	2
22613	Scoala Gimnaziala Martisor	2
22614	Scoala Nationala De Grefieri	2
22615	Scoala Gimnaziala Nr 116	2
22616	Liceul Teoretic Marin Preda	2
22617	Liceul De Arte Plastice Nicolae Tonitza	2
22618	Scoala Gimnaziala Nr. 39	2
22619	Scoala Gimnaziala Speciala Nr.8	2
22620	Scoala Gimnaziala Nicolae Grigorescu	2
22621	Scoala Gimnaziala Nr.81	2
22622	Colegiul Tehnic Media	2
22623	Scoala Gimnaziala Nr 59	2
22624	Colegiul Tehnic De Arhitectura Si Lucrari Publice I.n. Socolescu	2
22625	Liceul Teoretic Nichita Stanescu	2
22626	Gradinita Nr.7o	2
22627	Universitatea Romano-americana	2
22628	Gradinita Dumbrava Minunilor	2
22629	Gradinita Floarea Soarelui	2
22630	Scoala Gimnaziala Nr. 66	2
22631	Colegiul Economic Hermes	2
22632	Liceul Teoretic Waldorf	2
22633	Gradinita Nr.47	2
22634	Liceul Teoretic Dante Alighieri	2
22635	Scoala Gimnaziala Ienachita Vacarescu	2
22636	Colegiul Economic A. D. Xenopol	2
22637	Scoala Gimnaziala Nr. 195	2
22638	Gradinita Nr. 42	2
22639	Universitatea Nationala De Arte Din București	2
22640	Colegiul Tehnic Iuliu Maniu	2
22641	Scoala Nationala De Studii Politice Si Administrative	2
22642	Gradinita Nr.225	2
22643	Liceul Tehnologic Elie Radu	2
22644	Liceul Teoretic Decebal	2
22645	Scoala Gimnaziala Nr. 7	2
22646	Scoala Gimnaziala De Arte Nr.5	2
22647	Scoala Gimnaziala Nr.88	2
22648	Colegiul National Elena Cuza	2
22649	Gradinita Nr 273	2
22650	Scoala Gimnaziala Speciala Nr. 10	2
22651	Gradinita Nr.168	2
22652	Universitatea Tehnica De Constructii București	2
22653	Scoala Gimnaziala Vasile Alecsandri	2
22654	Gradinita Casuta Fermecata	2
22655	Gradinita Nr.205	2
22656	Scoala Gimnaziala Speciala Nr.3	2
22657	Scoala Gimnaziala Constantin Brancusi	2
22658	Scoala Gimnaziala 189	2
22659	Gradinita Nr.216	2
22660	Scoala Superioara De Aviatie Civila	2
22661	Scoala Gimnaziala Speciala Nr.7	2
22662	Scoala Gimnaziala Nr 82	2
22663	Universitatea De Arhitectura Si Urbanism Ion Mincu	2
22664	Liceul Teoretic Nicolae Iorga	2
22665	Colegiul National Mihai Viteazul	2
22666	Gradinita Nr.7	2
22667	Scoala Gimnaziala Nr.129	2
22668	Scoala Gimnaziala Nr. 62	2
22669	Scoala Gimnaziala Speciala Nr. 2	2
22670	Scoala Gimnaziala Speciala  Pentru Deficienti De Auz Sfanta Maria	2
22671	Universitatea Nationala De Arta Teatrala Si Cinematografica Ion Luca Caragiale	2
22672	Colegiul Tehnic Energetic	2
22673	Gradinita  Nr.34	2
22674	Colegiul National Elena Cuza	2
22675	Gradinita Nr 54	2
22676	Scoala Gimnaziala Nr. 194	2
22677	Gradinita Nr.7o	2
22678	Universitatea Tehnica De Constructii București	2
22679	Gradinita Floare Albastra	2
22680	Universitatea Nationala De Educatie Fizica Si Sport	2
22681	Scoala Gimnaziala Nr. 66	2
22682	Scoala Gimnaziala Speciala Nr.3	2
22683	Scoala Gimnaziala De Arte Nr.3	2
22684	Gradinita Floarea Soarelui	2
22685	Gradinita Nr.206	2
22686	Scoala Gimnaziala De Arte Nr. 2	2
22687	Gradinita Nr.222	2
22688	Gradinita Brandusa	2
22689	Liceul Greco Catolic Timotei Cipariu	2
22690	Scoala Gimnaziala Nr. 97	2
22691	Scoala Gimnaziala Nr. 6	2
22692	Scoala Gimnaziala Nicolae Titulescu	2
22693	Scoala Gimnaziala Nr. 92	2
22694	Scoala Gimnaziala Nr.28	2
22695	Colegiul Tehnic Dinicu Golescu	2
22696	Gradinita Nr. 137	2
22697	Gradinita Zana Florilor	2
22698	Liceul Teoretic Ady Endre	2
22699	Liceul Tehnologic Petru  Poni	2
22700	Scoala Nationala De Sanatate Publica Management Si Perfectionare In Domeniul Sanitar Buc	2
22701	Gradinita Nr.231	2
22702	Gradinita Nr. 68	2
22703	Colegiul National De Informatica Tudor Vianu	2
22704	Scoala Profesionala Speciala Numarul 3	2
22705	Gradinita Nr.41	2
22706	Scoala Gimnaziala Nr. 6	2
22707	Scoala Gimnaziala Speciala Nr.8	2
22708	Scoala Gimnaziala Nr.28	2
22709	Colegiul Tehnic Dinicu Golescu	2
22710	Liceul Teoretic Ady Endre	2
22711	Liceul Tehnologic Petru  Poni	2
22712	Gradinita Nr. 68	2
22713	Colegiul National De Informatica Tudor Vianu	2
22714	Scoala Gimnaziala Iancului	2
22715	Scoala Gimnaziala Sfintii Voievozi	2
22716	Scoala Gimnaziala Speciala Nr. 2	2
22717	Gradinita Speciala Pentru Hipoacuzici  Nr.65	2
22718	Gradinita  Nr.34	2
22719	Gradinita Nr 272	2
22720	Gradinita Nr.7o	2
22721	Gradinita Strop De Roua	2
22722	Scoala Gimnaziala Nr. 66	2
22723	Scoala Gimnaziala Sfanta Treime	2
22724	Scoala Gimnaziala Mexic	2
22725	Scoala Gimnaziala Nr 167	2
22726	Gradinita Nr 54	2
22727	Gradinita Floare Albastra	2
22728	Scoala Gimnaziala De Arte Nr.3	2
22729	Gradinita Nr.206	2
22730	Scoala Gimnaziala Nr. 131	2
22731	Scoala Militara De Maistri Militari Si Subofiteri A Fortelor Aeriene Traian Vuia  U.m.01940	12
22732	Scoala Gimnaziala Nr 2	12
22733	Scoala Gimnaziala Valea Ramnicului	12
22734	Scoala Gimnaziala Pamfil Georgian Gura Teghii	12
22735	Scoala Gimnaziala Cochirleanca	12
22736	Scoala Gimnaziala Mihailesti	12
22737	Gradinita Cu Program Prelungit Nr.8	12
22738	Scoala Gimnaziala Costomiru	12
22739	Liceul Special Pentru Deficienti De Vedere Buzău	12
22740	Scoala Gimnaziala Nr.7 Buzău	12
22741	Gradinita Cu Program Prelungit Nr 6	12
22742	Liceul Tehnologic Costin Nenitescu	12
22743	Scoala Gimnaziala Magura	12
22744	Scoala Gimnaziala Puiesti	12
22745	Scoala Gimnaziala Prof.dr.ion Anghel Luciu	12
22746	Scoala Gimnaziala Prof.dr.ion Anghel Luciu	12
22747	Scoala Gimnaziala Inv. Clementa Beschea Capatinesti	12
22748	Scoala Gimnaziala Pietroasele	12
22749	Scoala Gimnaziala Boldu	12
22750	Scoala Gimnaziala Constantin Popescu Fundeni	12
22751	Scoala Gimnaziala  Nr.3	12
22752	Scoala Gimnaziala Cochirleanca	12
22753	Scoala Gimnaziala Nr. 1 Comuna Rimnicelu	12
22754	Liceul Teoretic Alexandru Marghiloman	12
22755	Scoala Gimnaziala Panatau	12
22756	Scoala Gimnaziala C.a. Rosetti	12
22757	Scoala Gimnaziala Margaritesti	12
22758	Gradinita Cu Program Normal Nr 18	12
22759	Liceul Tehnologic Agricol Smeeni	12
22760	Gradinita Cu Program Prelungit Nr 6	12
22761	Liceul De Arte Margareta Sterian	12
22762	Scoala Gimnaziala Colti	12
22763	Scoala Gimnaziala Grebanu	12
22764	Scoala Gimnaziala Dumitru N. Cristea	12
22765	Colegiul National  M.eminescu	12
22766	Scoala Gimnaziala Boldu	12
22767	Scoala Gimnaziala Galbinasi	12
22768	Liceul Tehnologic Grigore C. Moisil Buzău	12
22769	Scoala Gimnaziala Colti	12
22770	Gradinita Cu Program Prelungit Lumea Copilariei	12
22771	Liceul Teoretic Radu Vladescu Patarlagele	12
22772	Liceul Tehnologic  Patarlagele	12
22773	Scoala Gimnaziala Odaile	12
22774	Scoala Gimnaziala Nr. 1 Comuna Rimnicelu	12
22775	Liceul Teoretic Beceni	12
22776	Scoala Gimnaziala Sfantul Apostol Andrei Buzău	12
22777	Scoala Gimnaziala Gheorghe Munteanu-murgoci Bisoca	12
22778	Scoala Gimnaziala Magura	12
22779	Scoala Gimnaziala Prof.constantin Dinca	12
22780	Liceul Cu Program Sportiv Iolanda Balas Soter	12
22781	Scoala Gimnaziala Cernatesti	12
22782	Scoala Gimnaziala Margaritesti	12
22783	Scoala Gimnaziala Nr.1	12
22784	Scoala Gimnaziala Sapoca	12
22785	Scoala Gimnaziala Podgoria	12
22786	Scoala Gimnaziala  Nr.3	12
22787	Scoala Gimnaziala Bozioru	12
22788	Scoala Gimnaziala Merei	12
22789	Scoala Gimnaziala Episcop Dionisie Romano	12
22790	Scoala Gimnaziala Glodeanu Silistea	12
22791	Scoala Gimnaziala Smeeni	12
22792	Liceul De Arte Margareta Sterian	12
22793	Gradinita Cu Program Prelungit Nr.3 Buzău	12
22794	Scoala Gimnaziala Panatau	12
22795	Scoala Gimnaziala Comuna Amaru	12
22796	Scoala Gimnaziala Siriu	12
22797	Scoala Postliceala Sanitara Buzău	12
22798	Scoala Gimnaziala Robeasca	12
22799	Scoala Gimnaziala Cislau	12
22800	Colegiul National  M.eminescu	12
22801	Scoala Gimnaziala Valcelele	12
22802	Liceul Tehnologic Agricol Smeeni	12
22803	Scoala Gimnaziala Scortoasa	12
22804	Scoala Gimnaziala Topliceni	12
22805	Colegiul Agricol Dr.c.angelescu	12
22806	Scoala Gimnaziala Boldu	12
22807	Scoala Gimnaziala Topliceni	12
22808	Liceul Teoretic Radu Vladescu Patarlagele	12
22809	Scoala Gimnaziala Florica	12
22810	Scoala Gimnaziala Podgoria	12
22811	Scoala Gimnaziala Nicu Constantinescu Buzău	12
22812	Liceul Teoretic Beceni	12
22813	Scoala Gimnaziala Ing. Oprisan Iarca Unguriu	12
22814	Scoala Gimnaziala Nr. 1 Comuna Rimnicelu	12
22815	Liceul Teoretic Nicolae Iorga	12
22816	Scoala Gimnaziala Prof.constantin Dinca	12
22817	Scoala Gimnaziala Bozioru	12
22818	Scoala Gimnaziala Constantin Ivan Escu	12
22819	Scoala Gimnaziala Smeeni	12
22820	Scoala Gimnaziala Nr.1	12
22821	Scoala Gimnaziala Comuna Amaru	12
22822	Scoala Gimnaziala Margaritesti	12
22823	Scoala Gimnaziala Cislau	12
22824	Gradinita Cu Program Prelungit Mugurasii	12
22825	Scoala Gimnaziala Scortoasa	12
22826	Scoala Gimnaziala Comuna Stilpu	12
22827	Scoala Gimnaziala Nr. 1 Comuna Rimnicelu	12
22828	Scoala Gimnaziala Nehoiu	12
22829	Gradinita Cu Program Prelungit Mugurasii	12
22830	Liceul Tehnologic  Lopatari	12
22831	Scoala Gimnaziala Amara	12
22832	Liceul Tehnologic Vern Esti	12
22833	Gradinita Cu Program Prelungit Nr 1 Buau	12
22834	Liceul Pedagogic Spiru Haret	12
22835	Gradinita Cu Program Prelungit Cei Sapte Pitici	12
22836	Scoala Gimnaziala Sat Hales	12
22837	Scoala Gimnaziala Ghergheasa	12
22838	Scoala Gimnaziala Margaritesti	12
22839	Gradinita Cu Program Prelungit Nr.3 Buzău	12
22840	Liceul De Arte Margareta Sterian	12
22841	Scoala Gimnaziala Valcelele	12
22842	Colegiul National  M.eminescu	12
22843	Liceul Tehnologic Grigore C. Moisil Buzău	12
22844	Gradinita Cu Program Prelungit Orizont	12
22845	Liceul Tehnologic  Patarlagele	12
22846	Scoala Gimnaziala Capitan Aviator Mircea T. Badulescu	12
22847	Scoala Gimnaziala Naeni	12
22848	Scoala Gimnaziala Racoviteni	12
22849	Scoala Gimnaziala Cindesti	12
22850	Scoala Gimnaziala Nicolae Titulescu Municipiul Buzău	12
22851	Scoala Gimnaziala Chiliile	12
22852	Liceul Tehnologic Victor Frunza	12
22853	Gradinita Cu Program Prelungit Nr.9	12
22854	Liceul Tehnologic Sf.mucenic Sava Berca	12
22855	Liceul Teoretic Pogoanele	12
22856	Scoala Gimnaziala Constantin Giurescu	12
22857	Scoala Gimnaziala Gheraseni	12
22858	Colegiul Tehnic Buzău	12
22859	Scoala Gimnaziala Cozieni	12
22860	Liceul Tehnologic Special Pentru Copii Cu Deficiente Au Ditive Buzău	12
22861	Colegiul National B.p. Hasdeu	12
22862	Liceul Tehnologic Rusetu	12
22863	Scoala Gimnaziala Amara	12
22864	Scoala Gimnaziala Blajani	12
22865	Scoala Gimnaziala Viperesti	12
22866	Colegiul National Al.vlahuta	12
22867	Liceul Tehnologic Henri Coanda	12
22868	Scoala Gimnaziala Largu	12
22869	Liceul Tehnologic Dimitrie Filipescu	12
22870	Scoala Gimnaziala Breaza	12
22871	Scoala Gimnaziala Glodeanu Sarat	12
22872	Liceul  Stefan Cel Mare	12
22873	Scoala Gimnaziala  Nr.6	12
22874	Scoala Gimnaziala  Mihail Kogalniceanu	12
22875	Colegiul Economic	12
22876	Scoala Gimnaziala Alexandru Vlah Uta Oltenita	14
22877	Liceul Tehnologic Ion Ghica	14
22878	Liceul Tehnologic Nr.  1	14
22879	Gradinita Cu Program Normal Nr.11	14
22880	Scoala Gimnaziala Speciala Nr.1 Călărași	14
22881	Liceul Tehnologic Matei Basarab Manastirea	14
22882	Liceul Danubius Călărași	14
22883	Scoala Gimnaziala Mircea  Nedelciu Fundulea	14
22884	Scoala Gimnaziala Nr.1 Curcani	14
22885	Gradinita Cu Program Normal Elisabeta Rosetti	14
22886	Scoala Gimnaziala Mircea Voda Călărași	14
22887	Scoala Gimnaziala Nr1 Sarulesti Gara	14
22888	Scoala Gimnaziala George Valsan	14
22889	Gradinita Cu Program Prelungit Amicii	14
22890	Gradinita Cu Program Normal Elisabeta Rosetti	14
22891	Liceul Tehnologic Matei Basarab Manastirea	14
22892	Scoala Gimnaziala Nr. 1 Tamadau Mare	14
22893	Liceul Teoretic Neagoe Basarab Oltenita	14
22894	Gradinita Cu Program Normal  Nr. 1	14
22895	Scoala Gimnaziala Gheorghe Manu	14
22896	Scoala Gimnaziala Nr.2	14
22897	Scoala Gimnaziala Nr.1 Ciocan Esti	14
22898	Gradinita Cu Program Prelungit Voinicel Călărași	14
22899	Liceul Tehnologic Nr.  1	14
22900	Scoala Postliceala Sanitara Pompei Samarian	14
22901	Scoala Gimnaziala Prof.lucian Pavel	14
22902	Colegiul Agricol Sandu Aldea	14
22903	Scoala Gimnaziala Nr.2 Borcea	14
22904	Scoala Ginmaziana Nr. 1 Vlad Tepes	14
22905	Scoala Gimnaziala Nr.1  Perisoru	14
22906	Gradinita Cu Program Prelungit Rostogol Călărași	14
22907	Gradinita Cu Program Prelungit Amicii	14
22908	Liceul Tehnologic Duiliu Zamfirescu	14
22909	Gradinita Cu Program Normal  Nr. 1	14
22910	Scoala Gimnaziala Nr1 Gurbanesti	14
22911	Scoala Ginmaziana Nr. 1 Vlad Tepes	14
22912	Scoala Gimnaziala Nr 1 Razvani	14
22913	Scoala Gimnaziala George Valsan	14
22914	Gradinita Cu Program Prelungit Nr.2 Oltenita	14
22915	Liceul Teoretic Neagoe Basarab Oltenita	14
22916	Scoala Gimnaziala Nr.1  Frumusani	14
22917	Scoala Gimnaziala Nr. 1 Tamadau Mare	14
22918	Scoala Constantin Brancoveanu Călărași	14
22919	Scoala Gimnaziala Nr. 1 Belciugatele	14
22920	Scoala Gimnaziala Nr. 1 Fundeni	14
22921	Scoala Gimnaziala Nr.2	14
22922	Liceul Alexandru Odobescu Lehliu-gara	14
22923	Scoala Gimnaziala Nr.1 Ciocan Esti	14
22924	Scoala Gimnaziala Constantin Teodorescu Soldanu	14
22925	Scoala Gimnaziala Prof.lucian Pavel	14
22926	Scoala Gimnaziala Nr.1  Dalga-gara	14
22927	Scoala Gimnaziala Constantin Teodorescu Soldanu	14
22928	Scoala Gimnaziala Nr 1 Valea Argovei	14
22929	Scoala Gimnaziala Mircea Eliade Oltenita	14
22930	Scoala Gimnaziala N.1  Luica	14
22931	Scoala Gimnaziala Tu Dor Vladimirescu	14
22932	Scoala Gimnaziala Nr.1  Nicolae Balcescu	14
22933	Gradinita Cu Program Normal Nr10 Călărași	14
22934	Scoala Gimnaziala Nr.1  Ulmu	14
22935	Scoala Gimnaziala Nr.1 Sohatu	14
22936	Scoala Gimnaziala Nr.1  Lehliu	14
22937	Scoala Gimnaziala Florenta Albu	14
22938	Scoala Gimnaziala Nr.1 Galbinasi	14
22939	Scoala Gimnaziala Nr.1 Cascioarele	14
22940	Scoala Gimnaziala Nr.1	14
22941	Scoala Gimnaziala Nicolae Petrescu Crivat	14
22942	Liceul Tehnologic Constantin George Calinescu Gradistea	14
22943	Scoala Gimnaziala Nr.1  Plataresti	14
22944	Scoala Gimnaziala Nr.1  Lehliu-gara	14
22945	Gradinita Cu Program Prelungit Brotacel	14
22946	Scoala Gimnaziala Nr1  Unirea	14
22947	Colegiul Economic	14
22948	Scoala Gimnaziala Nr 1  Modelu	14
22949	Scoala Gimnaziala Dragos Marin	14
22950	Scoala Gimnaziala Nr.2 Stancea	14
22951	Scoala Gimnaziala Nr. 1 Valea Rosie	14
22952	Scoala Gimnaziala Nr. 1 Dichiseni	14
22953	Liceul Tehnologic Dan Mateescu Călărași	14
22954	Scoala Gimnaziala Nr 1 Nana	14
22955	Scoala Gimnaziala Nr. 1 Dorobantu	14
22956	Scoala Gimnaziala Nr.1 Jegalia	14
22957	Scoala Gimnaziala Nr 1 Stefan Voda	14
22958	Scoala Gimnaziala Spiru Haret Oltenita	14
22959	Liceul Teoretic Mihai  Eminescu	14
22960	Scoala Gimnaziala Nr 1  Radu Voda	14
22961	Colegiul National Barbu Stirbei Călărași	14
22962	Scoala Gimnaziala Nr.1 Chiselet	14
22963	Scoala Gimnaziala Constantin Brancoveanu Vasilati	14
22964	Liceul Tehnologic Nrj  Borcea	14
22965	Scoala Gimnaziala Nr. 1  Dragos Voda	14
22966	Scoala Gimnaziala Nr.3	14
22967	Gradinita Cu Program Prelungit Aricel	14
22968	Scoala Gimnaziala Iancu Rosetfi	14
22969	Scoala Gimnaziala Alexandru D.ghica	14
22970	Colegiul Stefan Banulescu	14
22971	Scoala Gimnaziala  Mihai Viteazul Călărași	14
22972	Scoala Gimnaziala Armenis	13
22973	Scoala Postliceala Sanitara  Banatul  Caransebes	13
22974	Scoala Gimnaziala  Slatina Timiș	13
22975	Colegiul Economic Al Banatului Montan	13
22976	Scoala Gimnaziala Obreja	13
22977	Liceul Teologic Baptist Resita	13
22978	Liceul Tehnologic  Iosif Coriolan Buracu Prigor	13
22979	Liceul Traian Vu Ia	13
22980	Liceul Tehnologic Dacia Caransebes	13
22981	Scoala Gimnaziala Sacu	13
22982	Scoala Gimnaziala Nr 2 Bocsa	13
22983	Scoala Gimnaziala Petrosnita	13
22984	Scoala Gimnaziala Poiana	13
22985	Scoala Gimnaziala Berzasca	13
22986	Scoala Gimnaziala Nrj Otelu Rosu	13
22987	Scoala Gimnaziala Dr.ion Sirbu Eftimie Murgu	13
22988	Gradinita Cu Program Prelungit Riki-priki Resita	13
22989	Scoala Gimnaziala Zorlentu-mare	13
22990	Scoala Gimnaziala Nr. 9 Resita	13
22991	Liceul Traian Vu Ia	13
22992	Scoala Gimnaziala Romul Ladea Oravita	13
22993	Gradinita Cu Program Prelungit Sfintul Stelian	13
22994	Liceul Tehnologic  Berzovia	13
22995	Colegiul Economic Al Banatului Montan	13
22996	Liceul Teoretic Traian Doda Caransebes	13
22997	Liceul Tehnologic Sfantul Dimitrie Teregova	13
22998	Scoala Gimnaziala Girnic	13
22999	Liceul De Arte Sabin Pauta	13
23000	Gradinita Cu Program Prelungit Nr.2 Caransebes	13
23001	Scoala Gimnaziala Iablanita	13
23002	Liceul Banatean	13
23003	Liceul Tehnologic Clisura Dunarii	13
23004	Scoala Gimnaziala Cornutel	13
23005	Scoala Gimnaziala Goruia	13
23006	Colegiul National Diaconovici Tietz Resita	13
23007	Gradinita Program Prelungit Bocsa	13
23008	Scoala Gimnaziala Goruia	13
23009	Scoala Gimnaziala Sopotu Nou	13
23010	Scoala Gimnaziala Zavoi	13
23011	Scoala Gimnaziala Mihai Novac Sasca Montana	13
23012	Scoala Gimnaziala Trandafir Tamas Marga	13
23013	Liceul Teoretic Tata Oancea Bocsa	13
23014	Scoala Gimnaziala Constantin Daicoviciu	13
23015	Gradinita Cu Program Prelungit Otelu Rosu	13
23016	Liceul Tehnologic Trandafir Cocarla Caransebes	13
23017	Scoala Gimnaziala Virciorova	13
23018	Scoala Gimnaziala Nrj Otelu Rosu	13
23019	Scoala Gimnaziala Ramna	13
23020	Liceul Hercules	13
23021	Scoala Gimnaziala Verendin	13
23022	Gradinita Cu Program Prelungit Riki-priki Resita	13
23023	Gradinita Cu Program Prelungit Palatul Fermecat Resita	13
23024	Scoala Gimnaziala Stefan Velovan Rusca Montana	13
23025	Scoala Gimnaziala Bautar	13
23026	Scoala Gimnaziala Carbunari	13
23027	Scoala Gimnaziala Firliug	13
23028	Scoala Gimnaziala Coronini	13
23029	Scoala Gimnaziala Iablanita	13
23030	Scoala Populara De Arte Si Meserii Ion Romanu	13
23031	Scoala Gimnaziala Mihai Peia Resita	13
23032	Scoala Gimnaziala Mehadica	13
23033	Scoala Gimnaziala Constantin Daicoviciu	13
23034	Scoala Gimnaziala Vrani	13
23035	Scoala Gimnaziala Nr.8 Resita	13
23036	Liceul Teoretic Bilingv Romano-croat Carasova	13
23037	Liceul Tehnologic Clisura Dunarii	13
23038	Gradinita Floare De Colt  Baile Herculane	13
23039	Seminarul Teologic Ortodox Episcop Ioan Popasu Caransebes	13
23040	Gradinita Cu Program Prelungit Nr.4 Caransebes	13
23041	Scoala Gimnaziala Nrj Otelu Rosu	13
23042	Scoala Gimnaziala Atanasie Cojocaru Pojejena	13
23043	Colegiul National Traian Lalescu	13
23044	Scoala Gimnaziala Toplet	13
23045	Scoala Gimnaziala Goruia	13
23046	Scoala Gimnaziala Tirnova	13
23047	Scoala Gimnaziala Gheorghe Guga Racasdia	13
23048	Scoala Gimnaziala Bautar	13
23049	Scoala Gimnaziala Maureni	13
23050	Colegiul Tehnic Resita	13
23051	Scoala Gimnaziala Nr 2 Resita	13
23052	Scoala  Gimnaziala Trandafir Cocirla Tu Rn U-ruieni	13
23053	Scoala Gimnaziala Sichevita	13
23054	Colegiul National Constantin Diaconovici Loga	13
23055	Scoala Gimnaziala Firliug	13
23056	Scoala Gimnaziala Petre Sava Baleanu Valiug	13
23057	Scoala Gimnaziala Mihai Peia Resita	13
23058	Scoala Gimnaziala Dalboset	13
23059	Scoala Gimnaziala Nr.8 Resita	13
23060	Scoala Gimnaziala Lapusnicel	13
23061	Seminarul Teologic Ortodox Episcop Ioan Popasu Caransebes	13
23062	Scoala Gimnaziala Coronini	13
23063	Colegiul National Traian Lalescu	13
23064	Scoala Gimnaziala Mehadica	13
23065	Scoala Gimnaziala Berliste	13
23066	Scoala Gimnaziala Pavel Bordan Gradinari	13
23067	Scoala Gimnaziala Bania	13
23068	Liceul Teoretic Tata Oancea Bocsa	13
23069	Scoala Gimnaziala Vermes	13
23070	Liceul Hercules	13
23071	Liceul Mathias Hammer Anina	13
23072	Liceul Tehnologic  Berzovia	13
23073	Colegiul National Mircea Eliade	13
23074	Scoala Gimnaziala Ocna De Fier	13
23075	Scoala Gimnaziala Romulus Fabian Varadia	13
23076	Scoala Gimnaziala Virciorova	13
23077	Scoala Gimnaziala Dognecea	13
23078	Scoala Gimnaziala Stefan Velovan Rusca Montana	13
23079	Scoala Gimnaziala Ciclova Romana	13
23080	Liceul Teoretic Traian Doda Caransebes	13
23081	Gradinita Cu Program Prelungit Floarea Soarelui	13
23082	Scoala Gimnaziala Lupac	13
23083	Scoala Gimnaziala Aurel Peia Ezeris	13
23084	Scoala Gimnaziala Girnic	13
23085	Liceul Teoretic General Dragalina	13
23086	Scoala Gimnaziala Ciclova Romana	13
23087	Gradinita Cu Program Prelungit Floarea Soarelui	13
23088	Scoala Gimnaziala Aurel Peia Ezeris	13
23089	Liceul Teoretic General Dragalina	13
23090	Gradinita Cu Program Normal Pinocchio	13
23091	Scoala Gimnaziala Buza	15
23092	Academia Romana Filiala Cluj	15
23093	Scoala  Gimnaziala Mociu	15
23094	Academia De Muzica Gheorghe Dima	15
23095	Colegiul National Andrei Mureșanu	15
23096	Universitatea De Stiinte Agricole Si Medicina Veterinara	15
23097	Scoala Gimnaziala Mihai Viteazu	15
23098	Scoala Gimnaziala Mintiu Gherlii	15
23099	Scoala Gimnaziala Ioan Opris	15
23100	Academia De Muzica Gh. Dima	15
23101	Scoala Gimnaziala Unguras	15
23102	Liceul De Informatica Tiberiu Popoviciu	15
23103	Colegiul Tehnic Victor Ungureanu	15
23104	Scoala Gimnaziala Valea Ierii	15
23105	Gradinita Cu Program Prelungit Universitatii Babes- Bolyai	15
23106	Liceul De Informatica Tiberiu Popoviciu	15
23107	Scoala Gimnaziala Ion Agarbiceanu	15
23108	Academia De Muzica Gh. Dima	15
23109	Scoala Gimnaziala Borsa	15
23110	Gradinita Cu Program Prelungit Floresti	15
23111	Liceul Teoretic Eugen Pora	15
23112	Scoala  Gimnaziala Mociu	15
23113	Colegiul Tehnic De Comunicatii Augustin Maior	15
23114	Scoala Gimnaziala Lia Manoliu Cornesti Comuna Cornesti	15
23115	Colegiul National  Mihai Viteazul Turda	15
23116	Scoala Gimnaziala Ion Creanga Cluj Napoca	15
23117	Scoala Gimnaziala Mircea Luca Baisoara	15
23118	Scoala Gimnaziala Valea Ierii	15
23119	Colegiul Tehnic Ana Aslan	15
23120	Liceul Teoretic Gelu Voievod	15
23121	Scoala Gimnaziala Horea	15
23122	Liceul Special Pentru Deficienti De Vedere	15
23123	Scoala Gimnaziala Sacuieu	15
23124	Gradinita Cu Program Prelungit Lizuca	15
23125	Colegiul Tehnic Anghel Saligny	15
23126	Scoala Gimnaziala Horea Closca Si Crisan	15
23127	Scoala Gimnaziala Valea Ierii	15
23128	Liceul De Muzica Sigismund Toduta	15
23129	Liceul Teoretic Gelu Voievod	15
23130	Gradinita Cu Program Prelungit Poienita	15
23131	Scoala Gimnziala Ioan Bujor Petrestii De Jos	15
23132	Scoala Gimnaziala Ploscos Com. Ploscos	15
23133	Scoala Gimnaziala Cojocna	15
23134	Scoala Gimnaziala Nicolae Titulescu	15
23135	Colegiul Tehnic Raluca Ripan	15
23136	Scoala Gimnaziala Octavian Goga Ciucea	15
23137	Gradinita Cu Program Prelungit Floresti	15
23138	Gradinita Cu Program Prelungit Neghinita	15
23139	Scoala Gimnaziala Iclod	15
23140	Gradinita Cu Program Prelungit Arlechino	15
23141	Scoala Gimnaziala Catina	15
23142	Scoala Gimnaziala Calatele Comcalatele	15
23143	Gradinita Cu Program Prelungit Aschiuta	15
23144	Scoala Gimnaziala Pelaghia Rosu Marisel . Com Marisel	15
23145	Scoala Gimnaziala Traian Darjan	15
23146	Liceul Teoretic Mihai  Eminescu	15
23147	Scoala Gimnaziala Borsa	15
23148	Scoala Postliceala Sanitara Sfantul Bartolomeu	15
23149	Scoala Gimnaziala Aghiresu-fabrici	15
23150	Scoala Gimnaziala Luna De Sus	15
23151	Liceul Teoretic Eugen Pora	15
23152	Scoala Gimnaziala Bobilna	15
23153	Colegiul National Emil Racovita	15
23154	Gradinita Cu Program Prelungit Sfanta Maria	15
23155	Colegiul Tehnic De Comunicatii Augustin Maior	15
23156	Scoala Gimnaziala Vad	15
23157	Scoala Gimnaziala Iuliu Hatieganu Cluj-napoca	15
23158	Colegiul Tehnic Energetic	15
23159	Colegiul National  Mihai Viteazul Turda	15
23160	Liceul De Coregrafie Si Arta Dramatica Octavian Stroia	15
23161	Scoala Gimnaziala Moldovenesti	15
23162	Scoala Gimnaziala George Baritiu Jucu De Sus	15
23163	Scoala Gimnaziala Mircea Luca Baisoara	15
23164	Universitatea De Arta Si Design Cluj-napoca	15
23165	Liceul Teoretic  Brassai  Samuel	15
23166	Scoala Gimnaziala Ceanu Mare	15
23167	Scoala Gimnaziala Pavel Dan Tritenii De Jos	15
23168	Gradinita Cu Program Prelungit Neghinita	15
23169	Liceul Teologic Baptist Emanuel	15
23170	Scoala Gimnaziala Borsa	15
23171	Scoala Gimnaziala Baciu	15
23172	Gradinita Cu Program Prelungit Arlechino	15
23173	Scoala Gimnaziala Speciala Huedin	15
23174	Scoala Gimnaziala Aghiresu-fabrici	15
23175	Scoala Gimnaziala Kos Karoly Izvoru Crisului	15
23176	Scoala Gimnaziala Calatele Comcalatele	15
23177	Scoala Gimnaziala Luna Com.luna	15
23178	Liceul Teoretic Eugen Pora	15
23179	Liceul Teoretic Liviu Rebreanu	15
23180	Scoala Gimnaziala Pelaghia Rosu Marisel . Com Marisel	15
23181	Colegiul National George Cosbuc	15
23182	Colegiul National Emil Racovita	15
23183	Liceul Tehnologic Stefan Pascu Apahida	15
23184	Gradinita Cu Program Prelungit Micul Print	15
23185	Scoala Gimnaziala Luna De Sus	15
23186	Colegiul Tehnic Napoca	15
23187	Gradinita Cu Program Prelungit Lumea Prichindeilor Campia Turzii	15
23188	Colegiul National George Cosbuc	15
23189	Scoala Gimnaziala Speciala Dej	15
23190	Scoala  Gimnaziala  Hasdate-finisel	15
23191	Colegiul Tehnic Victor Ungureanu	15
23192	Scoala Gimnaziala Speciala Centru De Resurse Si Documentare Privind Educatia Incluziva Integrata	15
23193	Scoala Gimnaziala Luna De Sus	15
23194	Scoala Gimnaziala Horea Closca Si Crisan	15
23195	Scoala Gimnaziala Cojocna	15
23196	Scoala Gimnaziala Maguri-racatau	15
23197	Scoala Gimnaziala Tureni Com.tureni	15
23198	Liceul De Muzica Sigismund Toduta	15
23199	Gradinita Cu Program Prelungit Universitatii Babes- Bolyai	15
23200	Scoala Gimnaziala Ion Agarbiceanu	15
23201	Colegiul Tehnic Energetic	15
23202	Gradinita Cu Program Prelungit Poienita	15
23203	Scoala Gimnaziala Catina	15
23204	Scoala Gimnaziala Borsa	15
23205	Liceul Teoretic Petru Maior	15
23206	Universitatea Tehnica Din Cluj-napoca	15
23207	Gradinita Cu Program Prelungit Zana Zorilor	15
23208	Scoala Gimnaziala Sic	15
23209	Scoala Gimnaziala Negreni Com. Negreni	15
23210	Liceul Teologic Reformat Cluj	15
23211	Gradinita Cu Program Prelungit Dumbrava Minunata	15
23212	Gradinita Cu Program Prelungit Prichindelul Istet	15
23213	Scoala Gimnaziala Horea Closca Si Crisan	15
23214	Gradinita Cu Program Prelungit Alba Ca Zapada	15
23215	Liceul Teoretic Octavian Goga Huedin	15
23216	Liceul Teoretic Gheorghe Sincai	15
23217	Gradinita Speciala Pentru Copii Cu Deficiente	15
23218	Scoala De Agenti De Politie Septimiu Mureșan Cluj-napoca	15
23219	Liceul Teoretic Lucian Blaga	15
23220	Scoala Gimnaziala Citcau	15
23221	Liceul De Muzica Sigismund Toduta	15
23222	Liceul Teologic Adventist Maranatha	15
23223	Gradinita Cu Program Prelungit Veseliei	15
23224	Gradinita Cu Program Prelungit Parfum De Tei	15
23225	Gradinita Cu Program Prelungit Licurici Cluj-napoca	15
23226	Liceul De Muzica Sigismund Toduta	15
23227	Gradinita Cu Program Prelungit Parfum De Tei	15
23228	Scoala Gimaziala Chiuiesti	15
23229	Scoala Gimnaziala Speciala Pentru Deficienti De Auz Kozmutza Flora	15
23230	Gradinita Cu Program Prelungit Licurici Cluj-napoca	15
23231	Scoala Gimnaziala Garbau	15
23232	Liceul Teoretic Bathory Istvan Cluj-napoca	15
23233	Scoala Gimnaziala Borbely Jozsef Savadisla	15
23234	Gradinita Cu Program Prelungit Poienita	15
23235	Gradinita Cu Program Prelungit Raza De Soare	15
23236	Gradinita Cu Program Prelungit Degetica	15
23237	Scoala Gimnaziala Teodor Murasanu	15
23238	Scoala Gimnaziala Ioan Bob	15
23239	Scoala Gimnaziala  Constantin Brancusi Cluj-napoca	15
23240	Liceul Tehnologic Constantin Brancusi	15
23241	Liceul Tehnologic Aurel Vlaicu	15
23242	Scoala Gimnaziala Ploscos Com. Ploscos	15
23243	Scoala Gimnaziala Alexandru Vaida-voevod	15
23244	Scoala Gimnaziala Simion Balint Copaceni Com Sandulesti	15
23245	Gradinita Cu Program Prelungit Trenuletul Veseliei	15
23246	Scoala Gimnaziala Simion Balint Copaceni Com Sandulesti	15
23247	Scoala Gimnaziala Teodor Murasanu	15
23248	Scoala Gimnaziala Gelu Romanul Dabaca	15
23249	Scoala Gimnaziala Aschileu Mare	15
23250	Gradinita Cu Program Prelungit Poiana Cu Castani	15
23251	Scoala Gimnaziala  Constantin Brancusi Cluj-napoca	15
23252	Liceul Tehnologic Nrj	15
23253	Gradinita Cu Program Prelungit Arlechino	15
23254	Scoala Gimnaziala Rachitele	15
23255	Liceul Tehnologic Aurel Vlaicu	15
23256	Liceul Tehnologic Gherla	15
23257	Scoala Gimnaziala Ioan Alexandru	15
23258	Scoala Gimnaziala Mihai Eminescu Dej	15
23259	Scoala Gimnaziala Alexandru Vaida-voevod	15
23260	Liceul Teoretic Alexandru Papiu Ilarian	15
23261	Scoala Gimnaziala Calatele Comcalatele	15
23262	Colegiul National George Baritiu	15
23263	Gradinita Cu Program Prelungit Trenuletul Veseliei	15
23264	Colegiul Tehnic Dr. Ioan Ratiu	15
23265	Liceul Teoretic Avram Iancu Cluj-napoca	15
23266	Gradinita Cu Program Prelungit Trenuletul Veseliei	15
23267	Liceul Teoretic Avram Iancu Cluj-napoca	15
23268	Gradinita Cu Pragram Prelungit Casuta Povestilor	15
23269	Scoala Gimnaziala Pelaghia Rosu Marisel . Com Marisel	15
23270	Liceul Tehnologic Vladeasa Huedin	15
23271	Scoala Gimnaziala Emil Isac	15
23272	Liceul Cu Program Sportiv Cluj Napoca	15
23273	Gradinita Cu Program Prelungit Micul Print	15
23274	Scoala Primara Fizesu Gherlii	15
23275	Colegiul Tehnic Edmond Nicolau	15
23276	Gradinita Cu Program Prelungit Lumea Prichindeilor Campia Turzii	15
23277	Scoala Gimnaziala Caseiu	15
23278	Scoala Gimnaziala Speciala Dej	15
23279	Scoala Gimnaziala Camarasu	15
23280	Scoala Gimnaziala Nicolae Iorga	15
23281	Liceul Teoretic Pavel Dan Campia Turzii	15
23282	Scoala Gimnaziala Liviu Rebreanu	15
23283	Liceul Janos Zsigmond	15
23284	Scoala Gimnaziala Avram Iancu Campia Turzii	15
23285	Gradinita Cu Program Prelungit Floare De Iris	15
23286	Scoala Gimnaziala Capusu Mare	15
23287	Liceul Teoretic Josika Miklos	15
23288	Gradinita Cu Program Prelungit Pinocchio Campia Turzii	15
23289	Scoala Gimnaziala Avram Iancu Dej	15
23290	Scoala Gimnaziala Cuzdrioara	15
23291	Scoala Gimnaziala Nr.1 Gherla	15
23292	Colegiul Economic Iulian Pop	15
23293	Scoala Gimnaziala Cutca	15
23294	Scoala Gimnaziala Andrei Saguna	15
23295	Scoala Gimnaziala Avram Iancu Belis	15
23296	Gradinita Cu Program Prelungit Buburuza	15
23297	Scoala Gimnaziala Iara	15
23298	Scoala Gimnaziala Viisoara	15
23299	Universitatea De Arta Si Design Cluj Napoca	15
23300	Scoala Gimnaziala  Avram Iancu Turda	15
23301	Gradinita Cu Program Prelungit Piticot Dej	15
23302	Scoala Gimnaziala Suatu Com Suatu	15
23303	Scoala Gimnaziala Frata	15
23304	Gradinita Cu Program Prelungit  Lumea Copiilor	15
23305	Gradinita Cu Program Prelungit Mica Sirena	15
23306	Liceul Teoretic Alexandru Papiu Ilarian	15
23307	Universitatea De Arta Si Design Cluj Napoca	15
23308	Colegiul National George Baritiu	15
23309	Gradinita Cu Program Prelungit Piticot Dej	15
23310	Colegiul Tehnic Dr. Ioan Ratiu	15
23311	Scoala Gimnaziala Frata	15
23312	Liceul Waldorf	15
23313	Gradinita Cu Program Prelungit Mica Sirena	15
23314	Universitatea De Medicina Si Famacie Iuliu Hatieganu	15
23315	Gradinita Cu Program Prelungit Casuta Fermecata	15
23316	Gradinita Cu Program Prelungit Universul Copiilor	15
23317	Gradinita Cu Program Prelungit Lumea Piticilor Dej	15
23318	Scoala Gimnaziala George Cosbuc 23 August	16
23319	Scoala Gimnaziala Il Caragiale  Medgidia	16
23320	Liceul Teoretic George Calinescu	16
23321	Scoala Gimnaziala  Wilhelm Moldovan	16
23322	Gradinita Cu Program Prelungit Lumea Copiilor	16
23323	Gradinita Cu Program Prelungit Albatros	16
23324	Scoala Gimnaziala Nr.1  Pestera	16
23325	Liceul Tehnologic Nicolae Dumitrescu Cumpana	16
23326	Colegiul National Mircea Cel Batran	16
23327	Scoala Gimnaziala Nr 1  Poarta Alba	16
23328	Liceul Teoretic Traian Constanța	16
23329	Scoala Gimnaziala George Cosbuc 23 August	16
23330	Liceul Teoretic Ioan Cotovu Harsova	16
23331	Scoala Gimnaziala Nr.1 Tuzla	16
23332	Scoala Gimnaziala Nr 18 Jean Bart	16
23333	Liceul Tehnologic Cogealac	16
23334	Liceul Tehnologic  Axiopolis	16
23335	Liceul Tehnologic I.c.bratianu Nicolae Balcescu	16
23336	Scoala Gimnaziala A.ghencea Sacele	16
23337	Liceul Tehnologic Ucecom  Spiru Haret	16
23338	Liceul Teoretic Murfatlar	16
23339	Gradinita Cu Program Prelungit Azur	16
23340	Seminarul Teologic Ortodox Sfantul Cuvios Dionisie Exiguul	16
23341	Gradinita Cu Program Prelungit Albatros	16
23342	Scoala Gimnaziala Nr.33 Anghel Saligny	16
23343	Scoala Gimnaziala Nr.1omihail Koiciu	16
23344	Liceul Teoretic Decebal	16
23345	Scoala Gimnaziala Nr.1 Silistea	16
23346	Scoala Gimnaziala Nr.17 Ion Minulescu Constanța	16
23347	Gradinita Cu Program Prelungit Florilor	16
23348	Liceul Tehnologic Ion  Podaru	16
23349	Scoala Gimnaziala Il Caragiale  Medgidia	16
23350	Gradinita Cu Program Prelungit Lucian Grigorescu	16
23351	Liceul Tehnologic Mihai Viteazul	16
23352	Scoala Gimnaziala Nr. 2 Ovidiu	16
23353	Liceul Tehnologic  Axiopolis	16
23354	Gradinita Cu Program Prelungit Nr.8 Constanța	16
23355	Scoala Gimnaziala Nr. 40  Aurel Vlaicu	16
23356	Scoala Gimnaziala Nr.43 Ferdinand	16
23357	Gradinita Cu Program Prelungit Nr 42	16
23358	Liceul Tehnologic Gheorghe Duca	16
23359	Liceul Tehnologic Ion Banescu	16
23360	Scoala Gimnaziala Grigore Moisil Navodari	16
23361	Liceul Teoretic Murfatlar	16
23362	Scoala Gimnaziala Nr. 1 Gradina	16
23363	Scoala Gimnaziala Mircea Eliade	16
23364	Scoala Gimnaziala Nr. 1 Rasova	16
23365	Scoala Gimnaziala S.a. Esenin Ghindaresti	16
23366	Liceul Tehnologic Gheorghe Miron Costin	16
23367	Gradinita Cu Program Prelungit Nr.2	16
23368	Scoala Gimnaziala Nr.1 Oltina	16
23369	Liceul Teoretic Decebal	16
23370	Scoala Gimnaziala Gala Galaction	16
23371	Scoala Gimnaziala Nr 1 Fantanele	16
23372	Scoala Gimnaziala Nichita Stanescu Mereni	16
23373	Gradinita Cu Program Prelungit Florilor	16
23374	Liceul Teoretic Callatis	16
23375	Scoala Gimnaziala George Enescu	16
23376	Gradinita Cu Program Prelungit Lumea Florilor	16
23377	Liceul Tehnologic Ca Rosetti  Constanța	16
23378	Gradinita Nr.3 Mangalia Jud. Constanța	16
23379	Scoala Gimnaziala Nr.2	16
23380	Liceul Tehnologic Dimitrie Leonida	16
23381	Gradinita Cu Program Prelungit Albatros	16
23382	Colegiul Tehnic Energetic Constanța	16
23383	Scoala Gimnaziala Nr 1 Mangalia	16
23384	Scoala Gimnaziala Tu Dor Arghezi	16
23385	Colegiul Tehnic Nicolae Titu Lescu	16
23386	Gradinita Cu Orar Normal Nr 1 Valu Lui Traian	16
23387	Liceul Tehnologic Crucea	16
23388	Scoala Gimnaziala Nr.6 Nicolae Titulescu	16
23389	Colegiul Tehnic Nicolae Titu Lescu	16
23390	Scoala Gimnaziala Lucian Grigorescu	16
23391	Scoala Gimnaziala Nr.2	16
23392	Scoala Gimnaziala Nr. 14 Constanța	16
23393	Gradinita Cu Program Normal Veseliei Navodari	16
23394	Liceul Teoretic George Emil Palade Constanța	16
23395	Scoala Gimnaziala Ion Creanga Albesti	16
23396	Colegiul National De Arte Regina Maria	16
23397	Colegiul Agricol	16
23398	Scoala Gimnaziala Sf. Andrei	16
23399	Scoala Gimnaziala Nr 1 Mangalia	16
23400	Gradinita Cu Program Prelungit Perlutele Marii	16
23401	Liceul Teoretic Lucian Blaga	16
23402	Scoala Gimnaziala Adrian V Radulescu	16
23403	Scoala Gimnaziala Nr.16 Marin Ionescu Dobrogianu	16
23404	Scoala Gimnaziala Nr. 30 Gheorghe Titeica	16
23405	Scoala Gimaziala Nr38 Dimitrie Cantemir	16
23406	Gradinita Cu Program Prelungit Nr 53	16
23407	Scoala Gimnaziala Nr.16 Marin Ionescu Dobrogianu	16
23408	Gradinita Cu Program Prelungit Lumea Povestilor	16
23409	Scoala Gimnaziala Nr. 14 Constanța	16
23410	Gradinita Cu Program Prelungit Stelute Marii	16
23411	Scoala Gimaziala Nr38 Dimitrie Cantemir	16
23412	Colegiul National Kemal Atatu Rk	16
23413	Scoala Gimnaziala Nr.8 Constanța	16
23414	Gradinita Cu Program Prelungit Nr. 6 Constanța	16
23415	Scoala Gimnaziala Nr. 12 B.p.hasdeu Constanța	16
23416	Colegiul National Mihai Eminescu	16
23417	Colegiul National De Arte Regina Maria	16
23418	Liceul Cu Program Sportiv Nicolae Rotaru	16
23419	Liceul Tehnologic Dragomir Hurmuzescu	16
23420	Scoala Gimnaziala Nr.1 Chirnogeni	16
23421	Scoala Gimnaziala Nr.37 Constanța	16
23422	Gradinita Cu Program Prelungit Dumbrava Minunata	16
23423	Liceul Teoretic Mihail Kogalniceanu	16
23424	Gradinita Cu Program Normal Pestisorul De Aur Navodari	16
23425	Gradinita Cu Program Prelungit Perlutele Marii	16
23426	Gradinita Cu Program Prelungit Lumea Florilor	16
23427	Scoala Gimnaziala Nr 1 Seimeni	16
23428	Scoala Gimnaziala Nr.22 I.c.bratianu	16
23429	Liceul Tehnologic Lazar Edeleanu	16
23430	Gradinita Nr.3 Mangalia Jud. Constanța	16
23431	Liceul Tehnologic Ion Banescu	16
23432	Liceul Tehnologic Dimitrie Leonida	16
23433	Scoala Gimnaziala Nr 1 Fantanele	16
23434	Colegiul Tehnic Energetic Constanța	16
23435	Scoala Gimnaziala Nr 24 Ion Jalea Constanța	16
23436	Scoala Gimnaziala Tu Dor Arghezi	16
23437	Colegiul Tehnic Tomis Constanța	16
23438	Scoala Gimnaziala Nr. 31	16
23439	Liceul Tehnologic Crucea	16
23440	Scoala Gimnaziala George Enescu	16
23441	Scoala Gimnaziala Ion Creanga Albesti	16
23442	Scoala Gimnaziala Emil Garleanu Baraganu	16
23443	Scoala Gimnaziala Nr.16 Marin Ionescu Dobrogianu	16
23444	Scoala Gimnaziala Nr.2	16
23445	Scoala Gimnaziala Nr. 12 B.p.hasdeu Constanța	16
23446	Gradinita Cu Program Prelungit Sfanta Maria Cumpana	16
23447	Gradinita Cu Orar Normal Nr 1 Valu Lui Traian	16
23448	Scoala Gimnaziala Nr. 2 Ovidiu	16
23449	Scoala Gimnaziala „ Dan Spataru„ Aliman	16
23450	Scoala Gimnaziala Nr.1  Eforie Nord	16
23451	Scoala Gimnaziala Lucian Grigorescu	16
23452	Gradinita Cu Program Prelungit Nr.8 Constanța	16
23453	Gradinita Cu Program Prelungit Nr 44	16
23454	Scoala Gimnaziala Nr 1 Limanu	16
23455	Liceul Teoretic George Emil Palade Constanța	16
23456	Scoala Gimnaziala Nr.43 Ferdinand	16
23457	Scoala Gimnaziala Nr. 1 Saligny	16
23458	Liceul Tehnologic Virgil Madgearu Constanța	16
23459	Scoala Gimnaziala Sf. Andrei	16
23460	Liceul Tehnologic Gheorghe Duca	16
23461	Liceul Teoretic Ovidius Constanța	16
23462	Liceul Teoretic Baneasa	16
23463	Scoala Gimnaziala Adrian V Radulescu	16
23464	Scoala Gimnaziala Grigore Moisil Navodari	16
23465	Scoala Gimnaziala Nr.1  Istria	16
23466	Scoala Gimnaziala Nr. 23 Constantin Brancoveanu	16
23467	Gradinita Cu Program Prelungit Amicii Constanța	16
23468	Scoala Gimnaziala Ioan Ayanasiu Lipnita	16
23469	Liceul Teoretic George Emil Palade Constanța	16
23470	Gradinita Cu Program Prelungit Nr.33	16
23471	Liceul Cu Program Sportiv Nicolae Rotaru	16
23472	Scoala Gimnaziala Ion Borcea Agigea	16
23473	Liceul Teoretic Baneasa	16
23474	Scoala Gimnaziala Dumitru Gavrilesu Garliciu	16
23475	Liceul Tehnologic Radu Priscu Dobromir	16
23476	Liceul Regele Carol I Ostrov	16
23477	Scoala Gimnaziala Sf. Andrei	16
23478	Scoala Gimnaziala  Iuliu Valaori Nisipari	16
23479	Gradinita Cu Program Prelungit Dumbrava Minunata	16
23480	Liceul Teoretic Carmen Sylva Eforie Sud	16
23481	Scoala Gimnaziala Nr. 1 Harsova	16
23482	Liceul Tehnologic De Electrotehnica Si Telecomunicatii Constanța	16
23483	Scoala Gimnaziala Adrian V Radulescu	16
23484	Scoala  Gimnaziala Mihail Sadoveanu Medgidia	16
23485	Gradinita Cu Program Prelungit Mugurel Constanța	16
23486	Scoala Gimnaziala Nr.22 I.c.bratianu	16
23487	Scoala Gimnaziala Lucian Grigorescu	16
23488	Gradinita Nr.3 Mangalia Jud. Constanța	16
23489	Liceul Tehnologic Virgil Madgearu Constanța	16
23490	Liceul Tehnologic Dimitrie Leonida	16
23491	Liceul Teoretic George Emil Palade Constanța	16
23492	Colegiul Tehnic Energetic Constanța	16
23493	Liceul Teoretic Baneasa	16
23494	Scoala Gimnaziala Tu Dor Arghezi	16
23495	Scoala Gimnaziala Sf. Andrei	16
23496	Scoala Gimnaziala Nr. 31	16
23497	Scoala Gimnaziala Nr. 1 Harsova	16
23498	Scoala Gimnaziala Adrian V Radulescu	16
23499	Gradinita Cu Program Prelungit Mugurel Constanța	16
23500	Liceul Tehnologic Topraisar	16
23501	Scoala Gimnaziala Nr.1 Valu Lui Traian	16
23502	Gradinita Cu Program Prelungit Lumea Povestilor	16
23503	Gradinita Cu Program Prelungit Casuta De Tu Rta Dulce Constanța	16
23504	Colegiul National Kemal Atatu Rk	16
23505	Gradinita Cu Program Prelungit Nr. 45 Constanța	16
23506	Scoala Gimnaziala Nr.1 Valu Lui Traian	16
23507	Universitatea Ovidius Constanța	16
23508	Gradinita Cu Program Prelungit Casuta De Tu Rta Dulce Constanța	16
23509	Gradinita Cu Program Prelungit Nr. 45 Constanța	16
23510	Liceul Tehnologic Independenta	16
23511	Scoala Gimnaziala Spiru Haret	16
23512	Scoala Gimnaziala Nr. 29 Mihai Viteazul	16
23513	Scoala Gimnaziala Czetz Janos	17
23514	Scoala Gimnaziala Romulus Cioflec	17
23515	Scoala Gimnaziala Nicolae Colan	17
23516	Scoala Gimnaziala Kicsi Antal	17
23517	Scoala Populara De Arte Si Meserii Sfantu Gheorghe Muveszeti Nepiskola Sepsiszentgyorgy	17
23518	Liceul Teologic  Reformat Tg.secuiesc	17
23519	Scoala Gimnaziala Horn David	17
23520	Liceul Tehnologic Apor Peter	17
23521	Scoala Gimnaziala Molnar Jozsias Tg.secuiesc	17
23522	Scoala Gimnaziala Avram Iancu Covasna	17
23523	Colegiul National Mihai Viteazul Municipiul Sfantu Gheorghe	17
23524	Gradinita De Copii Ben Edek Elek Cu Program Prelungit	17
23525	Scoala Gimnaziala Nr.1	17
23526	Scoala Gimnaziala Horn David	17
23527	Scoala Gimnaziala Kriza Janos	17
23528	Scoala Gimnaziala Mikes Armin	17
23529	Scoala Gimnaziala Boloni Farkas Sandor	17
23530	Scoala Gimnaziala Molnar Jozsias Tg.secuiesc	17
23531	Gradinita De Copii Csipike Cu Program Prelungit Sfantu Gheorghe	17
23532	Scoala Gimnaziala Avram Iancu Covasna	17
23533	Scoala Gimnaziala Mathe Janos	17
23534	Colegiul National Mihai Viteazul Municipiul Sfantu Gheorghe	17
23535	Scoala Gimnaziala Kelemen Didak	17
23536	Liceul Tehnologic Apor Peter	17
23537	Scoala Gimnaziala Mihai Eminescu Si Gradinita Cu Program Normal Valea Mare	17
23538	Scoala Gimnaziala Nr.1	17
23539	Liceul Tehnologic Kos Karoly	17
23540	Scoala Gimnaziala Tatrangi Sandor	17
23541	Scoala Gimnaziala Comenius	17
23542	Gradinita De Copii Ben Edek Elek Cu Program Prelungit	17
23543	Scoala Gimnaziala Vegh Antal	17
23544	Scoala Gimnaziala Godri Ferenc	17
23545	Scoala Gimnaziala Apor Istvan	17
23546	Scoala Gimnaziala Balint Gabor Catalina	17
23547	Scoala Gimnaziala Molnar Jozsias Tg.secuiesc	17
23548	Liceul Korosi Csoma Sandor	17
23549	Scoala Gimnaziala Kriza Janos	17
23550	Scoala Gimnaziala Neri Szent Fulop Sfantu Gheorghe	17
23551	Colegiul National Mihai Viteazul Municipiul Sfantu Gheorghe	17
23552	Scoala Gimnaziala Barcani	17
23553	Scoala Gimnaziala Boloni Farkas Sandor	17
23554	Scoala Gimnaziala Ady Endre	17
23555	Scoala Gimnaziala Nr.1	17
23556	Scoala Gimnaziala Nicolae Russu	17
23557	Gradinita De Copii Csipike Cu Program Prelungit Sfantu Gheorghe	17
23558	Scoala Gimnaziala Henter Karoly	17
23559	Scoala Gimnaziala Comenius	17
23560	Scoala Gimnazila Borbath Karoly Varghis	17
23561	Scoala Gimnaziala Mathe Janos	17
23562	Scoala Gimnaziala Darko Jeno—comdalnic	17
23563	Scoala Gimnaziala Vegh Antal	17
23564	Scoala Gimnaziala Mihail Sadoveanu	17
23565	Scoala Gimnaziala Kelemen Didak	17
23566	Colegiul National Mihai Viteazul Municipiul Sfantu Gheorghe	17
23567	Scoala Gimnaziala Varadi Jozsef	17
23568	Scoala Gimnaziala Nr.1	17
23569	Scoala Gimnaziala Balint Gabor Catalina	17
23570	Scoala Gimnaziala Comenius	17
23571	Scoala Gimnaziala Fejer Akos	17
23572	Scoala Gimnaziala Vegh Antal	17
23573	Scoala Gimnaziala Neri Szent Fulop Sfantu Gheorghe	17
23574	Scoala Gimnaziala Apor Istvan	17
23575	Scoala Gimnaziala Bartha Karoly	17
23576	Liceul Tehnologic Puskas Tivdar	17
23577	Scoala Gimnaziala Ady Endre	17
23578	Scoala Gimnaziala Bem Jozsef	17
23579	Gradinita De Copii Gulliver Cu Program Prelungit Sfantu Gheorghe	17
23580	Scoala Gimnaziala Henter Karoly	17
23581	Liceul Tehnologic Baroti Szabo David	17
23582	Scoala Gimnaziala Darko Jeno—comdalnic	17
23583	Scoala Gimnaziala Nagy Mozes Estelnic	17
23584	Scoala Gimnaziala Benko Jozsef	17
23585	Liceul Teoretic Nagy Mozes Tg.secuiesc	17
23586	Liceul Tehnologic Economic Administrativ Berde Aron	17
23587	Gradinita De Copii Hofeherke Cu Program Prelungit Sfantu Gheorghe	17
23588	Scoala Gimnaziala Laszlo Lu Kacs	17
23589	Scoala Gimnaziala Bibo Jozsef Brates	17
23590	Liceul Pedagogic Bod Peter	17
23591	Liceul Teologic Reformat	17
23592	Scoala Gimnaziala Prof.paul Banica	18
23593	Scoala Gimnaziala Ciocan Esti	18
23594	Scoala Cu Clasele I —viii Man Esti	18
23595	Liceul Tehnologic De Transporturi Auto Targoviste	18
23596	Scoala Gimnaziala Valea Mare	18
23597	Gradinita Prichindel	18
23598	Scoala Gimnaziala Razvad	18
23599	Colegiul National Nicolae Titulescu Pucioasa	18
23600	Gradinita Cu Program Prelungit Nr.4 Moreni	18
23601	Scoala Gimnaziala Raciu	18
23602	Scoala Cu Clasele I-viii Buica Ionescu	18
23603	Scoala Gimnaziala Gura Foii	18
23604	Scoala Gimnaziala Rascaieti	18
23605	Scoala Gimnaziala Iedera De Jos	18
23606	Scoala Gimnaziala Potlogi	18
23607	Scoala Gimnaziala Valea Mare	18
23608	Scoala Gimnaziala Radu Cel Mare	18
23609	Gradinita Cu Program Prelungit Inocenta	18
23610	Scoala Gimnaziala Mihai Viteazul	18
23611	Scoala Cu Clasele I-viii Aninoasa	18
23612	Liceul De Arte Balasa Doamna	18
23613	Scoala Cu Clasele I-viii Dora Dalles	18
23614	Scoala Gimnaziala Grigore Radulescu Bezdead	18
23615	Scoala Gimnaziala Gura Sutii	18
23616	Scoala Gimnaziala Niculesti	18
23617	Scoala Gimnaziala Varfuri	18
23618	Scoala Gimnaziala Butimanu	18
23619	Scoala Gimnaziala Petresti	18
23620	Scoala Gimnaziala Costestii Din Vale	18
23621	Scoala Gimnaziala Persinari	18
23622	Scoala Gimnaziala Nr.4 Elena Donici Cantacuzino	18
23623	Scoala Gimnaziala Razvad	18
23624	Scoala Gimnaziala Nr1  Il Caragiale	18
23625	Gradinita De Copii Nr.14 Cu Program Prelungit Cu Plata Cu Cresa	18
23626	Grup Scolar Agricol	18
23627	Scoala Gimnaziala Nr.3 Moreni	18
23628	Scoala Gimnaziala Iosif Gabrea Valeni	18
23629	Gradinita  Nr.13 Targoviste	18
23630	Scoala Gimnaziala Crevedia	18
23631	Scoala Gimnaziala Tu Dor Vladimirescu	18
23632	Scoala Gimnaziala Romanesti	18
23633	Liceul Teoretic Petru Cercel Targoviste	18
23634	Gradinita Cu Program Prelungit Nr.2	18
23635	Scoala Gimnaziala Produlesti	18
23636	Scoala Gimnaziala Cricov Valea Lunga	18
23637	Liceul Tehnologic Nicolae Mihaescu	18
23638	Scoala Gimnaziala Slobozia Moara	18
23639	Scoala Gimnaziala Iancu Vacarescu	18
23640	Scoala Gimnaziala Radu Cel Mare Gaesti	18
23641	Scoala Gimnaziala Ghinesti	18
23642	Gradinita Cu Program Normal Nr.8 Moreni	18
23643	Colegiul National Ion Luca Caragiale	18
23644	Scoala Cu Clasele I Viii Tatarani	18
23645	Gradinita De Copii Nr 3	18
23646	Scoala Gimnaziala Vulcana Pandele	18
23647	Gradinita De Copii Nr 3	18
23648	Scoala Gimnaziala Corbii Mari	18
23649	Scoala Gimnaziala Panait Georgescu Dobra	18
23650	Gradinita Cu Program Prelungit Alexandrina Simionescu Ghica	18
23651	Scoala Gimnaziala Potlogi	18
23652	Liceul Tehnologic Nucet	18
23653	Scoala Gimnaziala Nr.1	18
23654	Liceul Tehnologic Udrea Baleanu	18
23655	Scoala Gimnaziala Matasaru	18
23656	Scoala Gimnaziala Fantanele	18
23657	Liceul Teoretic Iancu C. Vissarion	18
23658	Liceul  Ion Heliade Radulescu Targoviste	18
23659	Scoala Gimnaziala Radu Cel Mare	18
23660	Scoala Gimnaziala Profjlie Popescu	18
23661	Grup Scolar Agricol	18
23662	Liceul Tehnologic De Petrol Moreni	18
23663	Scoala Cu Clasele I-viii Matei Gr. Vladeanu Candesti-vale	18
23664	Colegiul National Constantin Cantacuzino	18
23665	Scoala Gimnaziala Iosif Gabrea Valeni	18
23666	Scoala Gimnaziala Ulmi	18
23667	Scoala Gimnaziala Iancu Vacarescu	18
23668	Scoala Cu Clasele I-viii Spiru Haret	18
23669	Colegiul National Ienachita Vacarescu	18
23670	Scoala Gimnaziala Tartasesti	18
23671	Colegiul National Ion Luca Caragiale	18
23672	Scoala Gimnaziala Pictor Nicolae Grigorescu Titu	18
23673	Scoala Gimnaziala Morteni	18
23674	Colegiul Economic Ion Ghica	18
23675	Scoala Gimnaziala Nicolae Vlad Pucheni	18
23676	Gradinita De Copii Nr. 1	18
23677	Scoala Gimnaziala Brezoaia-brezoaele	18
23678	Liceul Tehnologic Goga Ionescu Titu	18
23679	Scoala Gimnaziala Pietrari	18
23680	Gradinita Cu Program Prelungit Dumbrava Minunata	18
23681	Colegiul National Constantin Carabella Targoviste	18
23682	Scoala Gimnaziala Cornesti	18
23683	Scoala Gimnaziala Potlogi	18
23684	Scoala Gimnaziala Mogosani	18
23685	Liceul Teoretic Mihai Viteazul Visina	18
23686	Scoala Gimnaziala Ion Cioranescu Moroeni	18
23687	Scoala Gimnaziala Profjlie Popescu	18
23688	Scoala Gimnaziala Nr.1  Poiana	18
23689	Liceul Tehnologic De Petrol Moreni	18
23690	Scoala Cu Clasele I-viii Matei Gr. Vladeanu Candesti-vale	18
23691	Colegiul National Constantin Cantacuzino	18
23692	Gradinita Raza De Soare	18
23693	Scoala Gimnaziala Raul Alb De Jos	18
23694	Scoala Gimnaziala Visinesti	18
23695	Scoala Gimnaziala Smaranda Dumitru Roman Vizuresti	18
23696	Colegiul National Ienachita Vacarescu	18
23697	Scoala Gimnaziala Tartasesti	18
23698	Scoala Gimnaziala Morteni	18
23699	Scoala Gimnaziala Cojasca	18
23700	Scoala Gimnaziala Brezoaia-brezoaele	18
23701	Liceul Tehnologic Goga Ionescu Titu	18
23702	Colegiul National Constantin Carabella Targoviste	18
23703	Scoala Gimnaziala Diaconu Coresi Fieni	18
23704	Liceul Teoretic Mihai Viteazul Visina	18
23705	Liceul Tehnologic Constantin Brancoveanu Targoviste	18
23706	Scoala Gimnaziala Finta	18
23707	Gradinita Cu Program Normal Nr.8 Moreni	18
23708	Scoala Gimnaziala Stan Stefan Vladeni	18
23709	Scoala Gimnaziala Vulcana Pandele	18
23710	Scoala Gimnaziala Nr 3 Doicesti	18
23711	Scoala Gimnaziala Ioan Alexandru Bratescu-voinesti	18
23712	Scoala Gimnaziala Rancaciov	18
23713	Gradinita Cu Program Prelungit Alexandrina Simionescu Ghica	18
23714	Scoala Cu Clasele I-viii Vasile Carlova	18
23715	Scoala Primara Motaieni	18
23716	Scoala Gimnaziala Nr.2 Titu Targ	18
23717	Liceul Tehnologic Udrea Baleanu	18
23718	Scoala Gimnaziala Dr. Mioara Mincu	18
23719	Liceul Tehnologic Aurel Rainu	18
23720	Scoala Gimnaziala Patroaia—vale	18
23721	Liceul  Ion Heliade Radulescu Targoviste	18
23722	Scoala Cu Clasele I-viii Cornatelu	18
23723	Liceul Teoretic Racari	18
23724	Scoala Gimnaziala Nr. 4 Moreni	18
23725	Scoala Gimnaziala Profjlie Popescu	18
23726	Liceul Teoretic Mihai Viteazul Visina	18
23727	Scoala Gimnaziala Finta	18
23728	Scoala Gimnaziala Matei Basarab	18
23729	Scoala Gimnaziala Stan Stefan Vladeni	18
23730	Gradinita De Copii Nr.2 Targoviste	18
23731	Scoala Gimnaziala Nr 3 Doicesti	18
23732	Scoala Gimnaziala Lucieni	18
23733	Scoala Gimnaziala Rancaciov	18
23734	Scoala Gimnaziala Gura Barbu Letului	18
23735	Scoala Cu Clasele I-viii Vasile Carlova	18
23736	Scoala Gimnaziala Nr.2 Titu Targ	18
23737	Scoala Gimnaziala Dr. Mioara Mincu	18
23738	Scoala Gimnaziala Patroaia—vale	18
23739	Scoala Cu Clasele I-viii Cornatelu	18
23740	Scoala Gimnaziala Nr. 4 Moreni	18
23741	Gradinita Cu Program Prelungit Nr.15	18
23742	Scoala Gimnaziala Smaranda Gheorghiu	18
23743	Liceul Teoretic Adrian Paunescu Barca	19
23744	Scoala Profesionala Constantin Argetoianu	19
23745	Scoala Gimnaziala Castranova	19
23746	Scoala Gimnaziala Ghidici	19
23747	Scoala Gimnaziala Cerat	19
23748	Liceul Teoretic Adrian Paunescu Barca	19
23749	Scoala Gimnaziala  Cosoveni	19
23750	Liceul Tehnologic Ucecom Spiru Haret Craiova	19
23751	Scoala Gimnaziala Salcuta	19
23752	Scoala Gimnaziala Segarcea	19
23753	Scoala Gimnaziala Murgasi	19
23754	Scoala Gimnaziala Ghercesti	19
23755	Scoala Gimnaziala Galiciuica	19
23756	Scoala Profesionala Constantin Argetoianu	19
23757	Gradinita Cu Program Prelungit Floarea Soarelui Craiova	19
23758	Scoala Gimnaziala Nr. 1 Mirsani	19
23759	Liceul Teoretic George St Marincu Poiana Mare	19
23760	Scoala Gimnaziala Afumati	19
23761	Gradinita Cu Program Prelungit Piticot Craiova	19
23762	Scoala Gimnziala Petre Manarcescu Lipovu	19
23763	Gradinita Cu Program Prelungit Voiniceii Craiova	19
23764	Liceul Tehnologic Alexandru Macedonski Melinesti	19
23765	Scoala Gimnaziala Dobrotesti	19
23766	Liceul Tehnologic Stefan Anghel Bailesti	19
23767	Scoala Gimnaziala Verbita	19
23768	Scoala Gimnaziala Sadova	19
23769	Liceul Voltaire Craiova	19
23770	Scoala Gimnaziala  Cosoveni	19
23771	Scoala Gimnaziala Galiciuica	19
23772	Scoala Gimnaziala Ion Creanga Craiova	19
23773	Scoala Gimnaziala Dranic	19
23774	Liceul Charles Laugier Craiova	19
23775	Scoala Gimnaziala Secu	19
23776	Scoala Gimnaziala Nicolae Balcescu	19
23777	Liceul Tehnologic Ing. Ionete Aurelian Malu Mare	19
23778	Gradinita Cu Program Prelungit  Sf. Ana  Craiova	19
23779	Liceul Teoretic George St Marincu Poiana Mare	19
23780	Scoala Gimnaziala Podari	19
23781	Scoala Gimnaziala Varvoru De Jos	19
23782	Gradinita Cu Program Prelungit Petrache Poenaru Craiova	19
23783	Gradinita Cu Program Prelungit Elena Farago Craiova	19
23784	Scoala Gimnaziala Vartop	19
23785	Liceul Teoretic Mihai Viteazul Bailesti	19
23786	Scoala Gimnaziala Nr 3 Bailesti	19
23787	Liceul Traian Vuia Craiova	19
23788	Scoala Gimnaziala Dobrotesti	19
23789	Scoala Gimnziala Petre Manarcescu Lipovu	19
23790	Gradinita Cu Program Prelungit Ion Creanga Craiova	19
23791	Seminarul Teologic Ortodox Sf Grigorie Teologul Craiova	19
23792	Scoala Gimnaziala Talpas	19
23793	Colegiul Tehnic Energetic	19
23794	Scoala Gimnaziala Carol Al Ii-lea Diosti	19
23795	Scoala Profesionala Speciala Craiova	19
23796	Scoala Gimnaziala Elena Farago Craiova	19
23797	Scoala Gimnaziala Galiciuica	19
23798	Scoala Gimnaziala Caraula	19
23799	Scoala Gimnaziala Ghindeni	19
23800	Scoala Gimnaziala Bistret	19
23801	Scoala Gimnaziala Cotofenii Din Fata	19
23802	Scoala Gimnaziala Nr. 5 Av. P. Ivanovici Bailesti	19
23803	Liceul Cu Program Sportiv Petrache Triscu	19
23804	Gradinita Cu Program Prelungit Casuta Fermecata Craiova	19
23805	Scoala Gimnaziala Unirea	19
23806	Scoala Gimnaziala Pielesti	19
23807	Liceul Tehnologic De Transporturi Auto Craiova	19
23808	Scoala Gimnaziala Dranic	19
23809	Scoala Gimnaziala Teasc	19
23810	Colegiul National Elena Cuza	19
23811	Scoala Gimnaziala Breasta	19
23812	Scoala Gimnaziala CioroIași	19
23813	Scoala Gimnaziala Terpezita	19
23814	Scoala Profesionala Valea Stanciului	19
23815	Scoala Gimnaziala Gheorghe Bibescu Craiova	19
23816	Liceul Tehnologic Ing. Ionete Aurelian Malu Mare	19
23817	Scoala Gimnaziala Stefan Ispas Maglavit	19
23818	Liceul Teoretic Tudor Arghezi	19
23819	Scoala Gimnaziala Amza Pellea Bailesti	19
23820	Liceul Teoretic Gheorghe Vasilichi	19
23821	Liceul Tehnologic Transporturi Cai Ferate Craiova	19
23822	Liceul Tehnologic Horia Vintila Segarcea	19
23823	Scoala Gimnaziala Giurgita	19
23824	Scoala Gimnaziala Varvoru De Jos	19
23825	Scoala Gimnaziala Fratostita	19
23826	Colegiul Stefan Odobleja	19
23827	Scoala Gimnaziala Barbu Ionescu	19
23828	Gradinita Cu Program Prelungit Nicolae Romanescu	19
23829	Scoala Gimnaziala Opsichie Cazacu Seaca De Padure	19
23830	Scoala Gimnaziala Anton Pann Craiova	19
23831	Scoala Gimnaziala Nr 3 Bailesti	19
23832	Colegiul Tehnic De Industrie Alimentara Craiova	19
23833	Liceul Traian Vuia Craiova	19
23834	Scoala  Gimnaziala  Negoi	19
23835	Scoala Gimnaziala Orodel	19
23836	Scoala Gimnaziala Damian-sadova	19
23837	Scoala Gimnaziala Nr.1 Bailesti	19
23838	Scoala Gimnaziala Speciala Sf.vasile	19
23839	Gradinita Cu Program Prelungit Ion Creanga Craiova	19
23840	Scoala Gimnaziala Mihai Viteazul Craiova	19
23841	Seminarul Teologic Ortodox Sf Grigorie Teologul Craiova	19
23842	Scoala Gimnaziala Speciala Sf. Mina Craiova	19
23843	Colegiul Tehnic Energetic	19
23844	Scoala Gimnaziala Piscu Vechi	19
23845	Scoala Gimnaziala Sf. Dumitru	19
23846	Gradinita Cu Program Prelungit Paradisul Copiilor Craiova	19
23847	Liceul Tehnologic Constantin Ianculescu Carcea	19
23848	Colegiul National Nicolae Titu Lescu	19
23849	Scoala Gimnaziala Apele Vii	19
23850	Gradinita Cu Program Prelungit Casuta Cu Povesti Craiova	19
23851	Liceul Tehnologic Dimitrie Filisanu	19
23852	Gradinita Cu Program Prelungit Tudor Vladimirescu Craiova	19
23853	Colegiul National Elena Cuza	19
23854	Scoala Gimnaziala Nr.1 Motatei	19
23855	Liceul Tehnologic George Bibescu Craiova	19
23856	Gradinita Cu Program Prelungit Curcubeul Copilariei Craiova	19
23857	Liceul Teoretic George St Marincu Poiana Mare	19
23858	Gradinita Cu Program Prelungit Dumbrava Minunata Craiova	19
23859	Colegiul Stefan Odobleja	19
23860	Scoala Gimnaziala Radovan	19
23861	Liceul Teoretic Tudor Arghezi	19
23862	Scoala Gimnaziala Bratovoesti	19
23863	Scoala Gimnaziala Anton Pann Craiova	19
23864	Scoala Gimnaziala Nicolae Romanescu Craiova	19
23865	Scoala Gimnaziala Petrache Cernatescu	19
23866	Gradinita Cu Program Prelungit Sf.lucia Craiova	19
23867	Liceul Tehnologic De Transporturi Auto Craiova	19
23868	Scoala Gimnaziala Robanestii De Jos	19
23869	Universitatea De Medicina Si Farmacie Craiova	19
23870	Liceul De Arte Marin Sorescu Craiova	19
23871	Scoala Gimnaziala Breasta	19
23872	Scoala Gimnaziala Alecsandru Nicolaid Mischii	19
23873	Scoala Gimnaziala Rojiste	19
23874	Liceul Tehnologic Constantin Nicolaescu Plopsor Plenita	19
23875	Scoala Gimnaziala Gheorghe Bibescu Craiova	19
23876	Gradinita Cu Program Prelungit Phoenix Craiova	19
23877	Colegiul National Pedagogic Stefan Velovan	19
23878	Scoala Gimnaziala Plesoi	19
23879	Scoala Gimnaziala Amza Pellea Bailesti	19
23880	Liceul Tehnologic Auto Craiova	19
23881	Colegiul Tehnic Costin D. Nenitescu	19
23882	Scoala Gimnaziala Marin Sorescu Bulzesti	19
23883	Scoala Gimnaziala Giurgita	19
23884	Liceul Tehnologic Constantin Ianculescu Carcea	19
23885	Scoala Gimnaziala Teslui	19
23886	Universitatea De Medicina Si Farmacie Craiova	19
23887	Gradinita Cu Program Prelungit Paradisul Copiilor Craiova	19
23888	Liceul Tehnologic Special Beethoven	19
23889	Colegiul National Nicolae Titu Lescu	19
23890	Scoala Gimnaziala Breasta	19
23891	Gradinita Cu Program Prelungit Casuta Cu Povesti Craiova	19
23892	Scoala Gimnaziala Dobresti	19
23893	Gradinita Cu Program Prelungit Tudor Vladimirescu Craiova	19
23894	Scoala Gimnaziala Rojiste	19
23895	Scoala Gimnaziala Nr.1 Motatei	19
23896	Scoala Gimnaziala Galicea Mare	19
23897	Gradinita Cu Program Prelungit Curcubeul Copilariei Craiova	19
23898	Scoala Gimnaziala Gheorghe Bibescu Craiova	19
23899	Gradinita Cu Program Prelungit Dumbrava Minunata Craiova	19
23900	Scoala Gimnaziala Nr.1 Dabuleni	19
23901	Scoala Gimnaziala Radovan	19
23902	Colegiul National Pedagogic Stefan Velovan	19
23903	Scoala Gimnaziala Bratovoesti	19
23904	Scoala Gimnaziala Nicolae Gh.popescu Intorsura	19
23905	Scoala Gimnaziala Nicolae Romanescu Craiova	19
23906	Liceul Teoretic Amarastii De Jos	19
23907	Scoalagimnazialabelot	19
23908	Scoala Gimnaziala Lesile	19
23909	Scoala Gimnaziala Ion Tuculescu Craiova	19
23910	Scoala Gimnaziala Gighera	19
23911	Scoala Gimnaziala Ca Rna	19
23912	Scoala Gimnaziala Desa	19
23913	Scoala Gimnaziala Amarastii De Sus	19
23914	Scoala Gimnaziala Ilie Martin Brabova	19
23915	Liceul Matei Basarab Craiova	19
23916	Gradinita Cu Program Prelungit Paradisul Copiilor Craiova	19
23917	Colegiul National Nicolae Titu Lescu	19
23918	Gradinita Cu Program Prelungit Casuta Cu Povesti Craiova	19
23919	Gradinita Cu Program Prelungit Tudor Vladimirescu Craiova	19
23920	Scoala Gimnaziala Nr.1 Motatei	19
23921	Gradinita Cu Program Prelungit Curcubeul Copilariei Craiova	19
23922	Gradinita Cu Program Prelungit Dumbrava Minunata Craiova	19
23923	Scoala Gimnaziala Radovan	19
23924	Scoala Gimnaziala Bratovoesti	19
23925	Scoala Gimnaziala Nicolae Romanescu Craiova	19
23926	Scoala Gimnaziala Izvoare	19
23927	Scoala Gimnaziala Mihai Eminescu	19
23928	Scoala Gimnaziala Goiesti	19
23929	Scoala Gimnaziala Sf. Dumitru	19
23930	Scoala Gimnaziala Tuglui	19
23931	Scoala Gimnaziala Sf. Gheorghe Craiova	19
23932	Scoala Gimnaziala Gogosu	19
23933	Scoala Gimnaziala Lascar Catargiu Craiova	19
23934	Scoala Gimnaziala Nica Barbu Locusteanu  Leu	19
23935	Scoala Gimnaziala Gh. Jienescu Rast	19
23936	Scoala Gimnaziala Eu Frosina Popescu	19
23937	Gradinita Cu Rpogram Prelungit Prichindel	20
23938	Gradinita Cu Program Prelungit Nr. 7	20
23939	Scoala Gimnaziala N.1 Independenta	20
23940	Scoala Postliceala Christiana	20
23941	Scoala Gimnaziala Nr. 1 Blanzi	20
23942	Scoala Gimnaziala Grigore Hagiu	20
23943	Scoala Gimnaziala Nr.1 Umbraresti	20
23944	Seminarul Teologic Ortodox Sf.andrei	20
23945	Scoala Gimnaziala Nr. 1 Liesti	20
23946	Scoala Gimnaziala Nr. 1 Blanzi	20
23947	Universitatea Dunarea De Jos	20
23948	Scoala  Gimnaziala Nr 18	20
23949	Scoala Gimnaziala Miron Costin	20
23950	Scoala Gimnaziala Nr.1 Umbraresti	20
23951	Scoala Gimnaziala Unirea Branistea	20
23952	Scoala Gimnaziala Elena Doamna Cuza Voda	20
23953	Universitatea Dunarea De Jos	20
23954	Scoala Gimnaziala Nr. 1 Liesti	20
23955	Liceul Tehnologic Anghel Saligny	20
23956	Scoala Gimnaziala Nr.25	20
23957	Colegiul National Calistrat Hogas Tecuci	20
23958	Scoala Gimnaziala Vasile Seicaru Oancea	20
23959	Liceul De Arte Dimitrie Cuclin Galați	20
23960	Scoala Gimnaziala Lascar Catargiu	20
23961	Liceul Tehnologic Costache Conachi Pechea	20
23962	Scoala Gimnaziala Nr.24 Galați	20
23963	Scoala Gimnaziala Nr.1  Draguseni	20
23964	Scoala Gimnaziala Dimitrie Luchian	20
23965	Scoala Gimnaziala Nr. 1 Baleni	20
23966	Scoala Gimnaziala General Dumitru Damaceanu	20
23967	Gradinita Cu Program Prelungit Nr 64	20
23968	Seminarul Teologic Ortodox Sf.andrei	20
23969	Scoala Gimnaziala Nr 1 Poiana	20
23970	Liceul Tehnologic Transporturi Cai Ferate	20
23971	Gradinita Cu Program Prelungit Licurici Galați	20
23972	Liceul Tehnologic Anghel Saligny	20
23973	Scoala Gimnaziala Alexei Mateevici Movileni	20
23974	Liceul Teoretic Emil Racovita Galați	20
23975	Scoala Gimnaziala Constantin Gh. Marinescu	20
23976	Colegiul National Calistrat Hogas Tecuci	20
23977	Scoala Gimnaziala Stefan  0. Iosif	20
23978	Scoala Gimnaziala N.1 Independenta	20
23979	Gradinita Cu Program Prelungit Sf.stelian Galați	20
23980	Scoala Gimnaziala Nr.1  Draguseni	20
23981	Scoala Gimnaziala Negoita Danaila Bucesti	20
23982	Liceul Cu Program Sportiv	20
23983	Scoala Gimnaziala Nr. 1 Comuna Slobozia Conachi	20
23984	Scoala Gimnaziala Nr. 1 Baleni	20
23985	Scoala Gimnaziala Alexandru Moruzi	20
23986	Scoala Gimnaziala Natalia Negru Buciumeni	20
23987	Scoala Gimnaziala Nr. 1 Brahasesti	20
23988	Scoala Gimnaziala Victor Ion Popa Ivesti	20
23989	Colegiul National Mihail Kogalniceanu	20
23990	Scoala Gimnaziala Alexei Mateevici Movileni	20
23991	Gradinita Cu Program Prelungit Camil Ressu	20
23992	Scoala Gimnaziala Nr.1  Draguseni	20
23993	Gradinita Cu Program Prelungit Nr.9 Galați	20
23994	Scoala Gimnaziala Vasile Burlui	20
23995	Scoala Gimnaziala Nr 1 Grivita	20
23996	Gradinita Cu Program Prelungit Nr. 14 Tecuci	20
23997	Liceul Tehnologic Simion Mehedinți	20
23998	Scoala Gimnaziala Constantin Gh. Marinescu	20
23999	Scoala Gimnaziala Speciala Emil Garlenu Galați	20
24000	Scoala Gimnaziala Nr.1 Umbraresti	20
24001	Scoala Gimnaziala Sfantul Nicolae Vinatori	20
24002	Liceul Teoretic Mircea Eliade Galați	20
24003	Scoala Gimnaziala Nr. 1 Sat Toflea	20
24004	Scoala Gimnaziala Nr.1	20
24005	Gradinita Cu Program Prelungit Nr 64	20
24006	Scoala Gimnaziala Sf.stelian Umbraresti-deal	20
24007	Liceul Tehnologic Costache Conachi Pechea	20
24008	Scoala Gimnaziala Gabriel Dragan Nicoresti	20
24009	Scoala Gimnaziala Nr 1 Priponesti	20
24010	Scoala Gimnaziala Ion Petrovici Tecuci	20
24011	Scoala Gimnaziala Victor Ion Popa Ivesti	20
24012	Scoala Gimnaziala Sfintii Imparati	20
24013	Scoala Gimnaziala Natalia Negru Buciumeni	20
24014	Colegiul Tehnic Traian Vuia	20
24015	Universitatea Dunarea De Jos	20
24016	Scoala Gimnaziala Nr.17	20
24017	Scoala Gimnaziala Nr.1 Adam	20
24018	Scoala Gimnaziala Ludovic Cosma Galați	20
24019	Gradinita Cu Program Prelungit Nr. 14 Tecuci	20
24020	Scoala Gimnaziala Mihail Sadoveanu	20
24021	Scoala Gimnaziala Vasile Burlui	20
24022	Colegiul Economic Virgil Madgearu	20
24023	Liceul Teoretic Emil Racovita Galați	20
24024	Scoala Gimnaziala Speciala Constantin Pufan	20
24025	Gradinita Cu Program Preliungit Nr 36	20
24026	Colegiul De Industrie Alimentara Elena Doamna	20
24027	Scoala Gimnaziala Speciala Constantin Pufan	20
24028	Scoala Gimnaziala Sfantul Grigorie Teologul	20
24029	Scoala Gimnaziala Nr. 26 Galați	20
24030	Colegiul Tehnic Radu Negru	20
24031	Gradinita Cu Program  Prelungit Codruta	20
24032	Scoala Gimnaziala Nr.22 Galați	20
24033	Scoala Gimnaziala Dimitrie Sturdza Tecuci	20
24034	Scoala Gimnaziala Dimitrie Cantemir Matca	20
24035	Gradinita Cu Program Prelungit Motanul Incaltat	20
24036	Scoala Gimnaziala Nr 1 Suhurlui	20
24037	Scoala Gimnaziala  Prof.emil Panaitescu Cudalbi	20
24038	Liceul Tehnologic Eremia Grigorescu Tg. Bujor	20
24039	Scoala Gimnaziala Gheorghe Poalelungi Mastacani	20
24040	Scoala Gimnaziala Nr 1 Jorasti	20
24041	Scoala Gimnaziala Petru Rares Frumusita	20
24042	Scoala Gimnaziala Tudor Pamfile Tepu	20
24043	Scoala Gimnaziala Sfantul Nicolae Liesti	20
24044	Scoala Gimnaziala Nr.1 Sat Slivna	20
24045	Scoala Gimnaziala Dan Barbilian Galați	20
24046	Scoala Gimnaziala Nr.28 Galați	20
24047	Scoala Gimnaziala Nr.5	20
24048	Scoala Gimnaziala Doamna Nica	20
24049	Scoala Gimnaziala Nr.1  Balasesti	20
24050	Gradinita Cu Program Prelungit Croitorasul Cel Viteaz Galați	20
24051	Scoala Gimnaziala Nr 1 Grivita	20
24052	Scoala Gimnaziala Nr 1 Firtanesti	20
24053	Colegiul National Costache Negri Galați	20
24054	Gradinita Cu Program Prelungit Nr 1 Matca	20
24055	Scoala Gimnaziala Grigore Moisil	20
24056	Scoala Gimnaziala Nr.1	20
24057	Scoala Gimnaziala Stefan Cel Mare Galați	20
24058	Scoala Gimnaziala Anghel Rugina Tecuci	20
24059	Scoala Gimnaziala Speciala Emil Garlenu Galați	20
24060	Scoala Gimnaziala Nr.1 Fintinele	20
24061	Scoala Gimnaziala Ene Patriciu Smulti	20
24062	Liceul Tehnologic Paul Bujor	20
24063	Scoala Gimnaziala Nr 1 Matca	20
24064	Scoala Gimnaziala  George Ivascu Certesti	20
24065	Gradinita Cu Program Prelungit Nr.1 Galați	20
24066	Scoala Gimnaziala Nr. 1	20
24067	Liceul Tehnologic Paul Bujor	20
24068	Scoala Gimnaziala Nr 1 Malu Alb	20
24069	Scoala Gimnaziala Iorgu Iordan Tecuci	20
24070	Scoala Gimnaziala Sf.trei Ierarhihanu Conachi	20
24071	Gradinita Cu Program Prelungit Nr. 30 Galați	20
24072	Scoala Gimnaziala Nr1  Draganesti	20
24073	Scoala Gimnaziala Nr 1 Sat Corni	20
24074	Colegiul National Alexandru Ioan Cuza	20
24075	Colegiul National Vasile Alecsandri Galați	20
24076	Colegiul Tehnic De Alimentatie Si Turism Dumitru Motoc	20
24077	Scoala Gimnaziala Ion Creanga Talpigi	20
24078	Scoala Gimnaziala Nr.1  Balasesti	20
24079	Liceul Tehnologic Elena Caragiani	20
24080	Colegiul National Costache Negri Galați	20
24081	Colegiul National De Agricultura Si Economie Tecuci	20
24082	Scoala Gimnaziala Stefan Cel Mare Galați	20
24083	Colegiul De Industrie Alimentara Elena Doamna	20
24084	Scoala Gimnaziala Ene Patriciu Smulti	20
24085	Colegiul Tehnic Radu Negru	20
24086	Scoala Gimnaziala Sfintii Imparati	20
24087	Scoala Gimnaziala Nr.1	20
24088	Colegiul Tehnic Traian Vuia	20
24089	Scoala Gimnaziala Nr.1 Fintinele	20
24090	Scoala Gimnaziala Nr.17	20
24091	Scoala Gimnaziala  George Ivascu Certesti	20
24092	Scoala Gimnaziala Ludovic Cosma Galați	20
24093	Scoala Gimnaziala Nr 29	20
24094	Scoala Gimnaziala Mihail Sadoveanu	20
24095	Scoala Gimnaziala Nr 10	20
24096	Colegiul Economic Virgil Madgearu	20
24097	Gradinita Cu Program Prelungit Prichindel Tecuci	20
24098	Scoala Gimnaziala Speciala Constantin Pufan	20
24099	Scoala Gimnaziala  Mihai Viteazul	20
24100	Scoala Gimnaziala Nr. 26 Galați	20
24101	Scoala Gimnaziala Nr. 3	20
24102	Gradinita Cu Program  Prelungit Codruta	20
24103	Scoala Gimnaziala Nr.1 Negrilesti	20
24104	Scoala Gimnaziala Dimitrie Sturdza Tecuci	20
24105	Colegiul Tehnic Aurel Vlaicu	20
24106	Liceul Tehnologic Simion Mehedinți	20
24107	Gradinita Cu Program Prelungit Nr 64	20
24108	Scoala Gimnaziala Nr 1 Poiana	20
24109	Gradinita Cu Program Prelungit Licurici Galați	20
24110	Scoala Gimnaziala Nr.1 Gaiseni	21
24111	Colegiul National Ion Maiorescu	21
24112	Scoala Gimnaziala Nr.1 Slobozia	21
24113	Scoala Gimnaziala Numarul 5	21
24114	Scoala Gimnaziala Nr.1  Fratesti	21
24115	Scoala Gimnaziala Nr. 1 Singureni	21
24116	Scoala Gimnaziala Nr.1 Calugareni Judetul Giurgiu	21
24117	Scoala Gimnaziala Marin Gh Popescu	21
24118	Scoala Gimnaziala Anghel Mares Gostinu	21
24119	Scoala Gimnaziala Academician Marin Voiculescu	21
24120	Scoala Gimnaziala Nr.1	21
24121	Scoala Gimnaziala Sfantul Gheorghe	21
24122	Scoala Gimnaziala Nr.1	21
24123	Scoala Gimnaziala Nr1 Stoen Esti	21
24124	Scoala Gimnaziala Nr. 1 Greaca	21
24125	Gradinita Cu Program Prelungit Dumbrava Minunata Giurgiu	21
24126	Scoala Gimnaziala Nr 1	21
24127	Scoala Gimnaziala Nichifor Crainic	21
24128	Scoala Gimnaziala Nr.1 Iepuresti	21
24129	Scoala Gimnaziala Mihai Eminescu	21
24130	Liceul Tehnologic Mihai Viteazul Comcalugareni Jud.giurgiu	21
24131	Scoala Gimnaziala Sfantul Gheorghe	21
24132	Scoala Gimnaziala Nr.2 Cartojani	21
24133	Gradinita Cu Program Prelungit Dumbrava Minunata Giurgiu	21
24134	Scoala Gimnaziala Nr.1  Putineiu	21
24135	Scoala Gimnaziala Nr.1 Calugareni Judetul Giurgiu	21
24136	Gradinita Cu Program Prelungit Prichindeii	21
24137	Liceul Tehnologic Tiu  Dumitrescu	21
24138	Scoala Gimnaziala Nr.1 Gostinari	21
24139	Scoala Gimnaziala Nr.1  Fratesti	21
24140	Scoala Gimnaziala Nr.1	21
24141	Liceul Udriste Nastu Rel	21
24142	Scoala Gimnaziala Nr.1  Floresti	21
24143	Scoala Gimnaziala  Draghici Davila	21
24144	Scoala Gimnaziala Nr. 1 Greaca	21
24145	Scoala Gimnaziala Banu Baleanu	21
24146	Seminarul Teologic Ortodox Teoctst Patriarhul	21
24147	Liceul Teoretic Nicolae Cartojan	21
24148	Colegiul Tehnic Viceamiral Ioan Balanescu	21
24149	Scoala Gimnaziala Nr.1 Gostinari	21
24150	Scoala Gimnaziala Stolnicul Constantin  Cantacuzino Isvoarele	21
24151	Liceul Tehnologic Mihai Viteazul Comcalugareni Jud.giurgiu	21
24152	Scoala Gimnaziala Nr.1  Prundu	21
24153	Scoala Gimnaziala Nr.1 Letca Noua	21
24154	Scoala Gimnaziala Nr. 1 Joita	21
24155	Scoala Gimnaziala Mircea Cel Batran Giurgiu	21
24156	Liceul Tehnologic Miron  Nicolescu	21
24157	Scoala Gimnaziala Nr.1	21
24158	Liceul Tehnologic Ion  Barbu	21
24159	Scoala Gimnaziala Nr.2 Cartojani	21
24160	Scoala Gimnaziala Marin M.ticulescu Baneasa	21
24161	Scoala Gimnaziala Nr.1	21
24162	Scoala Gimnaziala Nicolae Crevedia	21
24163	Scoala Gimnaziala Speciala Nr.1  Giurgiu	21
24164	Scoala Gimnaziala Constantin Stancescu	21
24165	Scoala Gimnaziala Nr.1  Floresti	21
24166	Scoala Gimnaziala Nr. 1	21
24167	Scoala Gimnaziala Nr. 1 Vanatorii Mici	21
24168	Scoala Gimnaziala Nr. 3	21
24169	Liceul Tehnologic Nrj  Prundu	21
24170	Scoala Gimnaziala Nr.1 Ad.copaceni	21
24171	Scoala Gimnaziala Ioan Badila Malu	21
24172	Scoala Gimnaziala Nr.1 Ghimpati	21
24173	Scoala Gimnaziala Elina Basarab	21
24174	Scoala Gimnaziala Nr.1 Clfjani	21
24175	Scoala Gimnaziala Dumitru Constantin	21
24176	Liceul Tehnologic Giurgiu	21
24177	Gradinita Cu Program Prelungit Casuta Fermecata Giurgiu	21
24178	Scoala Gimnaziala Nr. 1 Buturugeni	21
24179	Scoala Gimnaziala Nr.7	21
24180	Scoala Gimnaziala Aurel Solacolu	21
24181	Scoala Gimnaziala Nr.1 Cosoba	21
24182	Scoala Gimnaziala Nr 1  Bolintin Vale	21
24183	Scoala Gimnaziala Nr. 1 Gradinari	21
24184	Scoala Gimnaziala De Arta Victor Karpis	21
24185	Scoala Gimnaziala Nr.1  Izvoarele	21
24186	Scoala Gimnaziala Nr.1  Prundu	21
24187	Scoala Gimnaziala Numarul 10	21
24188	Scoala Gimnaziala Nr. 1 Joita	21
24189	Liceul Tehnologic Nrj Comana	21
24190	Liceul Tehnologic Miron  Nicolescu	21
24191	Scoala Gimnaziala Nr. 1 Vanatorii Mici	21
24192	Liceul Tehnologic Ion  Barbu	21
24193	Liceul Tehnologic Nrj  Prundu	21
24194	Scoala Gimnaziala Marin M.ticulescu Baneasa	21
24195	Scoala Gimnaziala Nicolae Crevedia	21
24196	Scoala Gimnaziala Constantin Stancescu	21
24197	Gradinita Cu Program Prelungit Nr.1 Tg Jiu	22
24198	Scoala Gimnaziala Nr.1  Danesti	22
24199	Liceul Teoretic Novaci	22
24200	Scoala Gimnaziala Nr 1 Motru	22
24201	Scoala Gimnaziala Slivilesti	22
24202	Scoala Gimnaziala Constantin Brancusi Tg Jiu	22
24203	Liceul Tehnologic Baia De Fier	22
24204	Liceul Tehnologic Gen Eralconstantin Sandru Bilta	22
24205	Liceul Tehnologic  Birsesti	22
24206	Scoala Gimnaziala Slivilesti	22
24207	Scoala Gimnaziala Sfantul Nicolae	22
24208	Scoala Gimnaziala Mazilu Vipie Gheorghe	22
24209	Scoala Gimnaziala Sacelu	22
24210	Scoala Gimnaziala Nicolae Tomovici Plopsor	22
24211	Scoala Gimnaziala Balcesti	22
24212	Scoala Gimnaziala Nr.1  Bumbesti-jiu	22
24213	Colegiul Economic Virgil Madgearu	22
24214	Liceul Tehnologic  Birsesti	22
24215	Colegiul National Spiru Haret	22
24216	Liceul Tehnologic Baia De Fier	22
24217	Liceul De Arte Constantin Brailoiu  Tg-jiu	22
24218	Scoala Gimnaziala Lihulesti	22
24219	Liceul Tehnologic Rosia De Amaradia	22
24220	Colegiul Auto Traian Vuia	22
24221	Colegiul Gheorghe Tatarescu	22
24222	Scoala Gimnaziala Constantin Brancusi Tg Jiu	22
24223	Colegiul Mihai Viteazul	22
24224	Scoala Gimnaziala Ecaterina Teodoroiu	22
24225	Liceul Tehnologic Rosia Jiu	22
24226	Scoala Gimnaziala Antonie Mogos Ceau Ru	22
24227	Colegiul Tehnic Matasari	22
24228	Colegiul Mihai Viteazul	22
24229	Scoala Gimnaziala Nr.1 Albeni	22
24230	Colegiul Tehnic Nr.2 Tg Jiu	22
24231	Scoala Gimnaziala Ecaterina Teodoroiu	22
24232	Liceul Tehnologic Ticleni	22
24233	Scoala Gimnaziala Cruset	22
24234	Scoala Gimnaziala Voievod Litovoi	22
24235	Colegiul Tehnic  Henri Coanda	22
24236	Scoala Gimnaziala Ionesti	22
24237	Colegiul Tehnic General Gheorghe Magheru	22
24238	Scoala Gimnaziala Sfantul Nicolae	22
24239	Scoala Gimnaziala Prof Nicolae Caranda	22
24240	Scoala Gimnaziala Cornelius Radu	22
24241	Scoala Gimnaziala Nr.1 Andreesti	22
24242	Scoala Gimnaziala Nr.1  Polovragi	22
24243	Colegiul National  Ecaterina Teodoroiu Tg-jiu	22
24244	Scoala  Gimnaziala Pompiliu Marcea Tg-jiu	22
24245	Scoala Gimnaziala Jupinesti	22
24246	Scoala Gimnaziala Constantin Savoiu	22
24247	Liceul Tehnologic Tu Rbu Rea	22
24248	Scoala Gimnaziala Capu Dealului	22
24249	Scoala Gimnaziala Capreni	22
24250	Scoala Gimnaziala Gheorghe Tatarascu	22
24251	Colegiul National Tu Dor Arghezi	22
24252	Gradinita Cu Program Prelungit Vis De Copil Tg-jiu	22
24253	Gradinita Cu Program Prelungit Mihai Eminescu Tg-jiu	22
24254	Scoala Gimnaziala Nr.1 Telesti	22
24255	Scoala Gimnaziala Pades	22
24256	Scoala Gimnaziala Alimpesti	22
24257	Scoala Gimnaziala Hurezani	22
24258	Liceul Tehnologic Bilteni	22
24259	Scoala Gimnaziala Ion Popescu Barbatesti	22
24260	Colegiul Mihai Viteazul	22
24261	Scoala Gimnaziala Negreni	22
24262	Colegiul National George Cosbuc Motru	22
24263	Gradinita Cu Program Prelungit Rovinari	22
24264	Scoala Gimnaziala Ionesti	22
24265	Scoala Gimnaziala Nr.3 Rovinari	22
24266	Scoala Gimnaziala Grigore Geamanu Turcinesti	22
24267	Liceul Teologic Tg-jiu	22
24268	Colegiul Tehnic Matasari	22
24269	Scoala Gimnaziala Prigoria	22
24270	Scoala Gimnaziala Nr.1 Stejari	22
24271	Scoala Gimnaziala Balcesti	22
24272	Liceul Cu Program Sportiv Tgjiu	22
24273	Scoala Gimnaziala Antonie Mogos Ceau Ru	22
24274	Scoala Gimnaziala Aninoasa	22
24275	Colegiul Economic Virgil Madgearu	22
24276	Liceul Tehnologic Stoina	22
24277	Colegiul Tehnic  Henri Coanda	22
24278	Scoala Gimnaziala Nr.1  Rovinari	22
24279	Colegiul National Spiru Haret	22
24280	Scoala Gimnaziala Voievod Litovoi	22
24281	Liceul De Arte Constantin Brailoiu  Tg-jiu	22
24282	Colegiul National  Ecaterina Teodoroiu Tg-jiu	22
24283	Scoala Gimnaziala Nr.1  Polovragi	22
24284	Liceul Tehnologic Bustuchin	22
24285	Scoala Gimnaziala Stanesti	22
24286	Gradinita Cu Program Prelungit Nr.8 Tg-jiu	22
24287	Scoala Gimnaziala Cilnic	22
24288	Scoala Gimnaziala Nicolae Costescu	22
24289	Liceul De Arte Constantin Brailoiu  Tg-jiu	22
24290	Scoala Gimnaziala Sau Lesti	22
24291	Scoala Gimnaziala Tintareni	22
24292	Scoala Gimnaziala Godinesti	22
24293	Scoala Gimnaziala Nr 1 Urdari	22
24294	Scoala Gimnaziala Constantin Savoiu	22
24295	Scoala Gimnaziala Nr 1 Vagiulesti	22
24296	Scoala Gimnaziala Gheorghe Tatarascu	22
24297	Scoala Gimnaziala Nr.1 Ticleni	22
24298	Scoala Gimnaziala Nr.1 Telesti	22
24299	Liceul Tehnologic Tismana	22
24300	Liceul Tehnologic Bilteni	22
24301	Scoala Gimnaziala Simbotin	22
24302	Scoala Gimnaziala Bumbesti Pitic	22
24303	Scoala Gimnaziala Corobai	22
24304	Universitatea Constantin Brancusi Din Targu Jiu	22
24305	Liceul Teologic Tg-jiu	22
24306	Scoala Gimnaziala Nicolae Costescu	22
24307	Colegiul Tehnic Banyai Janos	23
24308	Scoala Gimnaziala Nyiro Jozsef Frumoasa	23
24309	Scoala Gimnaziala Siklodi Lorinc	23
24310	Scoala Gimnaziala Tu Lghes	23
24311	Scoala Gimnaziala Martonffy Gyorgy	23
24312	Gradinita Aranyalma	23
24313	Scoala Gimnaziala Dumitru Gafton	23
24314	Scoala Gimnaziala Gal Sandor Ciucsingeorgiu	23
24315	Gradinita Mesevar Cristuru Secuiesc	23
24316	Liceul De Arta Pallo Imre Odorheiu Secuiesc	23
24317	Scoala Gimnaziala Benedek Elek	23
24318	Scoala Gimnaziala Tompa Laszlo	23
24319	Liceul Miron Cristea	23
24320	Scoala Gimnaziala Dr Lukacs Mihaly	23
24321	Scoala Gimnaziala Oc.taslauanu	23
24322	Liceul Teoretic Salamon Erno Gh Eorgheni	23
24323	Colegiul Tehnic Batthyany Ignac Gheorgheni	23
24324	Liceul Tehnologic Gabor Aron Vlahita	23
24325	Scoala Gimnaziala Orban Balazs	23
24326	Liceul Teoretic Orban Balazs Cristuru Secuiesc	23
24327	Liceul Teologic Romano-catolic Szent Erzsebet	23
24328	Colegiul Reformat Baczkamadarasi Kis Gergely	23
24329	Scoala Gimnaziala Jokai Mor	23
24330	Gradinita Aranyalma	23
24331	Gradinita Villanytelep Odorheiu Secuiesc	23
24332	Scoala Gimnaziala Valea Rece	23
24333	Liceul Tehnologic Kos Karoly	23
24334	Colegiul National Marton Aron Miercurea Ciuc	23
24335	Scoala Gimnaziala Roman Viktor	23
24336	Scoala Gimnaziala Nagy Istvan Misentea	23
24337	Liceul Teoretic Tamasi Aron Odorheiu Secuiesc	23
24338	Scoala Gimnaziala Siklodi Lorinc	23
24339	Gradinita Csillagvar Odorheiu Secuiesc	23
24340	Scoala Gimnaziala Xantus Janos	23
24341	Scoala Gimnaziala Josika Miklos Atid	23
24342	Scoala Gimnaziala Korosi Csoma Sandor	23
24343	Scoala Gimnaziala Nyiro Jozef	23
24344	Gradinita Kis Herceg	23
24345	Liceul Tehnologic Kos Karoly	23
24346	Liceul Teoretic Orban Balazs Cristuru Secuiesc	23
24347	Liceul Tehnologic Zimmethausen	23
24348	Scoala Gimnaziala Arany Janos Santimbru	23
24349	Scoala Gimnaziala Miron Cristea Toplita	23
24350	Scoala Gimnaziala Jokai Mor	23
24351	Scoala Gimnaziala Petofi Sandor	23
24352	Gradinita Ficanka Odorheiu Secuiesc	23
24353	Scoala Profesionala Speciala Szent Anna Miercurea Ciuc	23
24354	Scoala Gimnaziala Dumitru Gafton	23
24355	Colegiul National Marton Aron Miercurea Ciuc	23
24356	Liceul Teoretic Tamasi Aron Odorheiu Secuiesc	23
24357	Colegiul National Mihai Eminescu Toplita	23
24358	Gradinita Mesevar Cristuru Secuiesc	23
24359	Scoala Gimnaziala  Kiss Ferenc	23
24360	Liceul Tehnologic Kos Karoly	23
24361	Scoala Gimnaziala Kollo Miklos	23
24362	Scoala Gimnaziala Benedek Elek	23
24363	Scoala Gimnaziala Korosi Csoma Sandor	23
24364	Scoala  Gimnaziala Vitos Mozes	23
24365	Scoala Gimnaziala Tamasi Aron Lupeni	23
24366	Scoala Gimnaziala Roman Viktor	23
24367	Scoala Gimnaziala Teodor Chindea	23
24368	Scoala Gimnaziala  Kiss Ferenc	23
24369	Scoala Gimnaziala Maj Lath Gusztav Karoly Lunca De Jos	23
24370	Gradinita Csillagvar Odorheiu Secuiesc	23
24371	Liceul Tehnologic Liviu  Rebreanu	23
24372	Scoala Gimnaziala Korosi Csoma Sandor	23
24373	Scoala Gimnaziala Jozsef Attila Miercurea Ciuc	23
24374	Scoala Gimnaziala Nyiro Jozef	23
24375	Scoala Gimnaziala Andrei Saguna Toplita	23
24376	Scoala Gimnaziala Tamasi Aron Lupeni	23
24377	Scoala Gimnaziala Frater Gyorgy	23
24378	Scoala Gimnaziala Dr. Boga Alajos	23
24379	Liceul Pedagogic Benedek Elek	23
24380	Liceul Tehnologic Tivai  Nagy Imre	23
24381	Liceul Tehnologic Sover Elek Joseni	23
24382	Liceul Tehnologic Fogarasy Mihaly	23
24383	Gradinita Kipi-kopi Odorheiu-secuiesc	23
24384	Colegiul Reformat Baczkamadarasi Kis Gergely	23
24385	Scoala Gimnaziala Janos Zsigmond	23
24386	Gradinita Csillagvar Odorheiu Secuiesc	23
24387	Gradinita Zsibongo Odorheiu-secuiesc	23
24388	Liceul Tehnologic Gabor Aron Vlahita	23
24389	Liceul Teologic Romano Catolic Segito Maria Miercurea Ciuc	23
24390	Scoala Gimnaziala Nyiro Jozef	23
24391	Liceul Teoretic Sfantu Nicolae	23
24392	Gradinita Mesevar Cristuru Secuiesc	23
24393	Gradinita Voinicel Toplita	23
24394	Scoala Gimnaziala Dr. Boga Alajos	23
24395	Scoala Gimnaziala Sacel	23
24396	Scoala Gimnaziala Arany Janos Santimbru	23
24397	Gradinita Eszterlanc Odorheiu Secuiesc	23
24398	Liceul Tehnologic Fogarasy Mihaly	23
24399	Liceul Teologic Unitarian Berde Mozes	23
24400	Scoala Gimnaziala Benedek Elek	23
24401	Scoala Gimnaziala Vaskertes	23
24402	Scoala Gimnaziala Cserei Mihaly	23
24403	Liceul Tehnologic Eotvos Jozsef	23
24404	Gradinita Ficanka Odorheiu Secuiesc	23
24405	Scoala Gimnziala Nagy Imre	23
24406	Scoala Populara De Arta Si Meserii A Judetului Harghita	23
24407	Liceul Tehnologic Liviu  Rebreanu	23
24408	Scoala Gimnaziala Szekely Mozes	23
24409	Scoala Gimnaziala Jozsef Attila Miercurea Ciuc	23
24410	Colegiul National Octavian Goga Miercurea Ciuc	23
24411	Scoala Gimnaziala Andrei Saguna Toplita	23
24412	Scoala Gimnaziala Elekes Vencel	23
24413	Scoala Gimnaziala Frater Gyorgy	23
24414	Scoala Gimnaziala Kajoni Janos	23
24415	Liceul Pedagogic Benedek Elek	23
24416	Scoala Gimnaziala Arany Janos	23
24417	Liceul Tehnologic Sover Elek Joseni	23
24418	Scoala Gimnaziala Balintvilmos Tomesti	23
24419	Gradinita Kipi-kopi Odorheiu-secuiesc	23
24420	Liceul Tehnologic Petofi Sandor Danesti	23
24421	Scoala Gimnaziala Janos Zsigmond	23
24422	Scoala Gimnaziala Porumbenii Mari	23
24423	Liceul Tehnologic Szekely Karoly	23
24424	Scoala Gimnaziala Liviu Rebreanu Miercurea Ciuc	23
24425	Scoala Gimnaziala Marosi Gergely	23
24426	Liceul Teologic Romano Catolic Segito Maria Miercurea Ciuc	23
24427	Liceul Pedagogic Benedek Elek	23
24428	Gradinita Voinicel Toplita	23
24429	Liceul Tehnologic Sover Elek Joseni	23
24430	Gradinita Kipi-kopi Odorheiu-secuiesc	23
24431	Scoala Gimnaziala Janos Zsigmond	23
24432	Liceul Tehnologic Szekely Karoly	23
24433	Scoala Gimnaziala Mircea Santimbreanu	24
24434	Scoala Gimnaziala I.g. Duca Petrosani	24
24435	Scoala Gimnaziala Sarmizegetusa	24
24436	Liceul Tehnologic Ovid Densusianu Calan	24
24437	Colegiul National Decebal	24
24438	Scoala Primara Lelese	24
24439	Scoala Gimnaziala Sfanta Varvara Aninoasa	24
24440	Scoala Gimnaziala Densus	24
24441	Scoala Gimnaziala Dominic Stanca Orastie	24
24442	Scoala Gimnaziala Baita	24
24443	Scoala Gimnaziala Zam	24
24444	Scoala Gimnaziala Vata De Jos	24
24445	Scoala Primara Hasdau	24
24446	Scoala Gimnaziala Nr. 3 Lupeni	24
24447	Colegiul Tehnic Agricol Alexandru Borza Geoagiu	24
24448	Scoala Gimnaziala Densus	24
24449	Scoala Gimnaziala Nr.7 Petrosani	24
24450	Scoala Primara Cerbal	24
24451	Scoala Primara Tomesti	24
24452	Colegiul National I.c.bratianu Hateg	24
24453	Scoala Gimnaziala Nr.2 Hunedoara	24
24454	Liceul Teoretic Ghelari	24
24455	Scoala Gimnaziala Bosorod	24
24456	Scoala Gimnaziala Dominic Stanca Orastie	24
24457	Scoala Gimnaziala Horea Closca Si Crisan Brad	24
24458	Scoala Gimnaziala Rau De Mori	24
24459	Scoala Primara Burjuc	24
24460	Colegiul National De Informatica Traian Lalescu Hunedoara	24
24461	Scoala Gimnaziala Valisoara	24
24462	Scoala Gimnaziala Lunca Cernii De Jos	24
24463	Scoala Gimnaziala Romos	24
24464	Colegiul Tehnic Constantin Brancusi	24
24465	Liceul Tehnologic Grigore Moisil Deva	24
24466	Liceul Teoretic Ghelari	24
24467	Colegiul Economic Emanuil Gojdu	24
24468	Scoala Primara Tomesti	24
24469	Scoala Gimnaziala Bacia	24
24470	Scoala Gimnaziala Rau De Mori	24
24471	Scoala Gimnaziala Banita	24
24472	Colegiul National I.c.bratianu Hateg	24
24473	Scoala Gimnaziala I.d. Sirbu Petrila	24
24474	Scoala Gimnaziala Lunca Cernii De Jos	24
24475	Scoala Gimnaziala Nr 1 Hunedoara	24
24476	Scoala Primara Burjuc	24
24477	Colegiul National Mihai Eminescu Petrosani	24
24478	Scoala Primara Pricaz	24
24479	Scoala Gimnaziala Nr 4 Vulcan	24
24480	Colegiul National De Informatica Traian Lalescu Hunedoara	24
24481	Scoala Gimnaziala Ion Buteanu Buces	24
24482	Gradinita Cu Program Prelungit Nr.7 Deva	24
24483	Scoala Gimnaziala Rapoltu Mare	24
24484	Liceul Tehnologic Grigore Moisil Deva	24
24485	Scoala Gimnaziala Harau	24
24486	Scoala Primara Pricaz	24
24487	Gradinita Cu Program Prelungit Dumbrava Minunata Hunedoara	24
24488	Colegiul National De Informatica Traian Lalescu Hunedoara	24
24489	Scoala Primara Reea	24
24490	Gradinita Cu Program Prelungit Nr.7 Deva	24
24491	Colegiul Tehnic Transilvania	24
24492	Liceul Tehnologic Grigore Moisil Deva	24
24493	Scoala Primara Martinesti	24
24494	Scoala Gimnaziala Rachitova	24
24495	Gradinita Casuta Cu Povesti Orastie	24
24496	Universitatea Din Petrosani	24
24497	Colegiul National Iancu De Hunedoara	24
24498	Scoala Primara General Berthelot	24
24499	Colegiul Tehnic Dimitrie Leonida Petrosani	24
24500	Colegiul National Sportiv Cetate Deva	24
24501	Colegiul National Pedagogic Regina Maria Deva	24
24502	Colegiul Economic Hermes Petrosani	24
24503	Gradinita Cu Program Normal Lumea Copiilor Lupeni	24
24504	Scoala Gimnaziala Avram Iancu Baia De Cris	24
24505	Scoala Gimnaziala Petros	24
24506	Scoala Gimnaziala Hadrian Daicoviciu Orastioara De Sus	24
24507	Scoala Primara Balsa	24
24508	Scoala Gimnaziala Nr 1 Hunedoara	24
24509	Liceul Tehnologic Nicolaus Olah Us Orastie	24
24510	Scoala Gimnaziala Ohaba	24
24511	Scoala Gimnaziala Sabin Oprean Bucuresci	24
24512	Scoala Gimnaziala Nr 4 Vulcan	24
24513	Colegiul Tehnic Matei Corvin	24
24514	Scoala Gimnaziala Teliucu Inferior	24
24515	Liceul Tehnologic Crisan Criscior	24
24516	Scoala Gimnaziala Rapoltu Mare	24
24517	Scoala Gimnaziala Luncoiu De Jos	24
24518	Colegiul National Aurel Vlaicu Orastie	24
24519	Colegiul Tehnic De Transport Feroviar Anghel Saligny Simeria	24
24520	Liceul Tehnologic Constantin Bursan Hunedoara	24
24521	Scoala Gimnaziala Dr. Aurel Vlad Orastie	24
24522	Scoala Gimnaziala Andrei Saguna Deva	24
24523	Gradinita Cu Program Prelungit Floare De Colt Brad	24
24524	Scoala Gimnaziala Bretea Romana	24
24525	Liceul Teoretic Mircea Eliade Lupeni	24
24526	Colegiul Tehnic Dimitrie Leonida Petrosani	24
24527	Scoala Gimnaziala Ion Buteanu Buces	24
24528	Gradinita Cu Program Normal Lumea Copiilor Lupeni	24
24529	Scoala Gimnaziala Harau	24
24530	Scoala Gimnaziala Petros	24
24531	Liceul Tehnologic Retezat Uricani	24
24532	Scoala Gimnaziala Soimus	24
24533	Scoala Primara Reea	24
24534	Scoala Primara Martinesti	24
24535	Colegiul National Iancu De Hunedoara	24
24536	Colegiul National Pedagogic Regina Maria Deva	24
24537	Scoala Gimnaziala Giurgeni	25
24538	Scoala Gimnaziala Ciochina	25
24539	Scoala Gimnaziala Movilita	25
24540	Scoala Gimnaziala Colelia	25
24541	Scoala Gimnaziala Alexandru Radu Lescu Marculesti	25
24542	Scoala Gimnaziala Salcioara	25
24543	Liceul Tehnologic Sfanta Ecaterina	25
24544	Liceul Tehnologic Inaltarea Domnului Slobozia	25
24545	Scoala Gimnaziala Barbulesti	25
24546	Scoala Gimnaziala Barbulesti	25
24547	Scoala Profesionala Reviga	25
24548	Scoala Gimnaziala Movilita	25
24549	Scoala Gimnaziala  Capitan  Aviator Constantin M Cantacuzino	25
24550	Gradinita Cu Program Prelungit Nr.2	25
24551	Scoala Gimnazialaionel Perlea Ograda	25
24552	Scoala Gimnaziala Salcioara	25
24553	Scoala Primara Buesti	25
24554	Scoala  Primara Sarateni	25
24555	Scoala Gimnaziala Roman Ialomiteanul	25
24556	Gradinita Cu Program Prelungit Voinicelul	25
24557	Scoala Gimnaziala  Alexandru Aldea Voievod	25
24558	Scoala Gimnaziala Arhanghelii Mihail Si Gavriil Munteni-Buzău	25
24559	Scoala Profesionala Traian	25
24560	Liceul Tehnologic  Fierbinti-targ	25
24561	Scoala Gimnaziala Perieti	25
24562	Scoala Gimnaziala  Valea Macrisului	25
24563	Liceul Tehnologic Cazan Esti	25
24564	Liceul Tehnologic Sfanta Ecaterina	25
24565	Scoala Gimnaziala Platonesti	25
24566	Scoala Gimnaziala Facaeni	25
24567	Scoala Gimnaziala Vladeni	25
24568	Liceul Tehnologic Sfanta Ecaterina	25
24569	Scoala Primara Buesti	25
24570	Scoala  Primara Sarateni	25
24571	Scoala Gimnaziala Ion Heliade Radulescu	25
24572	Scoala Gimnaziala Arhanghelii Mihail Si Gavriil Munteni-Buzău	25
24573	Scoala Gimnaziala Roman Ialomiteanul	25
24574	Scoala Profesionala Mihail Kogalniceanu	25
24575	Gradinita Cu Program Prelungit Dumbrava Minunata	25
24576	Seminarul Teologic Ortodox Sf.ioan Gura De Aur	25
24577	Scoala Gimnaziala  Alexandru Aldea Voievod	25
24578	Liceul Tehnologic Anghel Saligny Fetesti	25
24579	Liceul De Arte Ionel Perlea Slobozia	25
24580	Scoala Gimnaziala Stefan Copoiu An Drasesti	25
24581	Scoala Profesionala Traian	25
24582	Liceul Teoretic Carol I Fetesti	25
24583	Scoala Gimnaziala Perieti	25
24584	Scoala Gimnaziala Gheorghe Doja	25
24585	Liceul Tehnologic Cazan Esti	25
24586	Scoala Gimnaziala Manasia	25
24587	Gradinita Cu Program Prelungit Alba Ca Zapada  Fetesti	25
24588	Colegiul National Mihai Viteazul Slobozia	25
24589	Scoala Gimnaziala Dimitrie Cantemir Fetesti	25
24590	Colegiul National Grigore Moisil-urziceni	25
24591	Scoala Gimnaziala Gheorghe Lazar Slobozia	25
24592	Liceul Tehnologic Al. Ioan Cuza Slobozia	25
24593	Scoala Profesionala Reviga	25
24594	Scoala Gimnaziala Alexandru Odobescu Urziceni	25
24595	Scoala Gimnaziala  Capitan  Aviator Constantin M Cantacuzino	25
24596	Liceul Tehnologic Urziceni	25
24597	Scoala Gimnazialaionel Perlea Ograda	25
24598	Liceul Pedagogic Matei Basarab Slobozia	25
24599	Scoala Primara Buesti	25
24600	Scoala Gimnaziala Vladeni	25
24601	Scoala Gimnaziala Roman Ialomiteanul	25
24602	Scoala Gimnaziala Dridu	25
24603	Scoala Gimnaziala  Alexandru Aldea Voievod	25
24604	Scoala Gimnaziala Ion Heliade Radulescu	25
24605	Scoala Profesionala Traian	25
24606	Scoala Gimnaziala  Sf. Andrei Slobozia	25
24607	Scoala Gimnaziala Perieti	25
24608	Liceul Tehnologic De Industrie Alimentara Fetesti	25
24609	Liceul Tehnologic Cazan Esti	25
24610	Gradinita Cu Program Prelungit Alba Ca Zapada  Fetesti	25
24611	Scoala Gimnaziala Platonesti	25
24612	Scoala Gimnaziala Constantin Gurgu  Nr 1 Gura Ialomitei	25
24613	Scoala Gimnaziala Ciulnita	25
24614	Liceul Tehnologic Iordache Zossima	25
24615	Gradinita Cu Program Prelungit Amara	25
24616	Scoala Gimnaziala Constantin Stefan Albesti	25
24617	Scoala Gimnaziala Spiru Haret Tandarei	25
24618	Liceul Tehnologic Tandarei	25
24619	Scoala Gimnaziala Cosambesti	25
24620	Scoala Gimnaziala Gheorghe Lazar	25
24621	Gradinita Cu Program Prelungitjunior Slobozia	25
24622	Scoala Gimnaziala George Valsan Amara	25
24623	Scoala Gimnaziala Barbu Catargiu Maia	25
24624	Scoala Gimnaziala Milosesti	25
24625	Scoala Gimnaziala Valea Ciorii	25
24626	Scoala Postliceala Sanitara-slobozia	25
24627	Scoala Gimnaziala Cocora	25
24628	Scoala Gimnaziala Sinesti	25
24629	Liceul Tehnologic Areta Teodorescu Grivita	25
24630	Colegiul National Garabet Ibraileanu Iași	26
24631	Scoala Gimnaziala Ion Haulica Ipatele	26
24632	Scoala Gimnaziala Iordache Cantacuzino Pascani	26
24633	Scoala Gimnaziala Helesteni	26
24634	Scoala Gimnaziala Letcani	26
24635	Scoala Gimnaziala Chiscareni	26
24636	Scoala Gimnaziala Crucea	26
24637	Colegiul Tehnic De Cai Ferate Unirea Pascani	26
24638	Gradinita Cu Program Prelungit Nr.2 6	26
24639	Liceul Tehnologic Lespezi	26
24640	Scoala Gimnaziala Popricani	26
24641	Scoala Gimnaziala Constantin Erbiceanu Erbiceni	26
24642	Scoala Gimnaziala Nr. 1 Todiresti	26
24643	Colegiul Tehnic De Electronica Si Telecomunicatii Gheorghe Marzescu Iași	26
24644	Scoala Gimnaziala Alecu Russo Iași	26
24645	Academia Romana Filiala Iași	26
24646	Scoala Gimnaziala Ciurea	26
24647	Scoala Gimnaziala Pircovaci	26
24648	Scoala De Formare Initiala Si Continua A Personalului Politiei De Frontiera Iași	26
24649	Scoala Gimnaziala Popricani	26
24650	Liceul Tehnologic Valea Seaca	26
24651	Gradinita Cu Program Prelungit Nr.1	26
24652	Liceul Tehnologic Lespezi	26
24653	Scoala Gimnaziala Letcani	26
24654	Scoala Primara Gheorghe Asachi Iași	26
24655	Liceul Tehnologic De Mecatronica Si Automatizari Iași	26
24656	Scoala Gimnaziala Petru Poni Iași	26
24657	Scoala Gimnaziala Alecu Russo Iași	26
24658	Liceul Teoretic Lascar Rosetti Raducaneni	26
24659	Scoala Gimnaziala Aron-voda Aroneanu	26
24660	Colegiul Tehnic De Electronica Si Telecomunicatii Gheorghe Marzescu Iași	26
24661	Scoala Gimnaziala Buzn Ea	26
24662	Colegiul National Emil Racovita	26
24663	Scoala Gimnaziala Speciala Constantin Paunescu	26
24664	Scoala Gimnaziala Nr1 Comarna	26
24665	Colegiul National Iași	26
24666	Scoala Gimnaziala Liteni	26
24667	Scoala Gimnaziala Storn Esti	26
24668	Scoala Gimnaziala Ion Creanga Iași	26
24669	Institutul Teologic Romano Catolic	26
24670	Liceul Tehnologic Focuri	26
24671	Scoala Gimnaziala Birnova	26
24672	Gradinita Cu Program Prelungit Nr.1	26
24673	Liceul Tehnologic Braesti	26
24674	Scoala Gimnaziala Pausesti	26
24675	Gradinita P.p. Sf. Sava	26
24676	Liceul Teoretic Ion Neculce Targu Frumos	26
24677	Scoala Gimnaziala Madirjac	26
24678	Scoala Gimnaziala Cezar Petrescu Hodora	26
24679	Colegiul Economic Administrativ	26
24680	Liceul Tehnologic De Mecatronica Si Automatizari Iași	26
24681	Liceul Tehnologic De Industrie Alimentara Tibana	26
24682	Scoala Gimnaziala Titu Maiorescu Iași	26
24683	Scoala Gimnaziala Scobinti	26
24684	Scoala Gimnaziala Ioanid Romanescu Romanesti	26
24685	Scoala De Formare Initiala Si Continua A Personalului Politiei De Frontiera Iași	26
24686	Colegiul Tehnic Dimitrie Leonida	26
24687	Scoala Gimnaziala Aron-voda Aroneanu	26
24688	Liceul Tehnologic Coarnele Caprei	26
24689	Scoala Gimnaziala Ionel Teodoreanu	26
24690	Liceul Tehnologic Vm Craiu Belcesti	26
24691	Colegiul Tehnic De Electronica Si Telecomunicatii Gheorghe Marzescu Iași	26
24692	Scoala Primara Carol I	26
24693	Scoala Gimnaziala Buzn Ea	26
24694	Scoala Gimnaziala Speciala Constantin Paunescu	26
24695	Liceul Tehnologic Mihai Busuioc Pascani	26
24696	Scoala Gimnaziala Nr1 Comarna	26
24697	Colegiul National Emil Racovita	26
24698	Scoala Gimnaziala Sipote	26
24699	Scoala Gimnaziala  Muncelu De Sus	26
24700	Scoala Gimnaziala Nr. 1 Costesti	26
24701	Scoala Gimnaziala Popricani	26
24702	Scoala Gimnaziala Nr. 1  Lunca Cetatuii	26
24703	Scoala Gimnaziala Dimitrie A. Sturdza Iași	26
24704	Liceul Tehnologic Cozmesti	26
24705	Scoala Gimnaziala Cirjoaia	26
24706	Liceul Tehnologic Stolniceni-prajescu	26
24707	Scoala Gimnaziala Sipote	26
24708	Scoala Gimnaziala  Muncelu De Sus	26
24709	Scoala Gimnaziala Ciohorani	26
24710	Gradinita Cu Program Prelungit Nr.3	26
24711	Scoala Gimnaziala Ion Ghica	26
24712	Scoala Gimnaziala Siretel	26
24713	Scoala Gimnaziala Liteni	26
24714	Scoala Gimnaziala Constantin Teodorescu Razboieni	26
24715	Scoala Gimnaziala Nr. 1  Lunca Cetatuii	26
24716	Scoala Gimnaziala Dimitrie A. Sturdza Iași	26
24717	Liceul Tehnologic Special Vasile Pavelcu	26
24718	Scoala Gimnaziala Bogdan Petriceicu Hasdeu	26
24719	Scoala Gimnaziala Mosna	26
24720	Scoala Gimnaziala Dolh Esti	26
24721	Liceul Tehnologic Focuri	26
24722	Scoala Gimnaziala Golaiesti	26
24723	Colegiul Costache Negruzzi Iași	26
24724	Scoala Gimnaziala Alexandru Cel Bun Iași	26
24725	Scoala Gimnaziala Ciortesti	26
24726	Scoala Gimnaziala Dd Patrascanu Tomesti	26
24727	Liceul Tehnologic De Mecatronica Si Automatizari Iași	26
24728	Scoala Gimnaziala Colon El Constantin Langa Miroslava	26
24729	Scoala Gimnaziala Cezar Petrescu Hodora	26
24730	Colegiul National Stefan Cel Mare	26
24731	Scoala Gimnaziala Gheorghe Ciobanu Andrieseni	26
24732	Scoala Populara De Arte Titel Popovici	26
24733	Colegiul Economic Administrativ	26
24734	Scoala Gimnaziala Vasile Conta	26
24735	Scoala Gimnaziala Gistesti Pascani	26
24736	Liceul Tehnologic Nicolae Balauta Scheia	26
24737	Scoala Gimnaziala Titu Maiorescu Iași	26
24738	Gradinita Cu Program Prelungit Nr.2 Pascani	26
24739	Gradinita Cu Program Prelungit Nr. 4	26
24740	Colegiul National Mihai Eminescu Iași	26
24741	Scoala Gimnaziala Scobinti	26
24742	Scoala Gimnaziala Aron-voda Aroneanu	26
24743	Scoala Gimnaziala Harmanestii Vechi	26
24744	Scoala Gimnaziala Draguseni	26
24745	Scoala Gimnaziala Motca	26
24746	Scoala Gimnaziala Sirca	26
24747	Scoala Gimnaziala Prisacani	26
24748	Scoala Gimnaziala Draguseni	26
24749	Gradinita Cu Program Prelungit Nr.3 Pascani	26
24750	Scoala Gimnaziala Aron-voda Aroneanu	26
24751	Scoala Gimnaziala Mihai Codreanu	26
24752	Scoala Gimnaziala Speciala Pascani	26
24753	Scoala Gimnaziala Petru Anghel Probota	26
24754	Gradinita Cu Program Prelungit Nr.13	26
24755	Scoala Gimnaziala Gh. I. Bratianu Iași	26
24756	Scoala Gimnaziala Otilia Cazimir Iași	26
24757	Liceul Tehnologic Petre P Carp Tibanesti	26
24758	Scoala Gimnaziala Rediu	26
24759	Scoala Gimnaziala Vasile Alecsandri Mircesti	26
24760	Scoala Gimnaziala Stefan Barsanescu Iași	26
24761	Gradinita Cu Program Prelungit Nr.16	26
24762	Liceul Special Moldova	26
24763	Scoala Gimnaziala Poieni	26
24764	Scoala Gimnaziala Veronica Micle	26
24765	Scoala Gimnaziala Carmen Sylva	26
24766	Scoala Gimnaziala Dimitrie Sturdza Popesti	26
24767	Scoala Gimnaziala Topile	26
24768	Scoala Gimnaziala Slobozia Deal	26
24769	Scoala Gimnaziala Sipote	26
24770	Colegiul National Mihail Sadoveanu Pascani	26
24771	Scoala Gimnaziala Tutora	26
24772	Scoala Gimnaziala Girbesti	26
24773	Scoala Gimnaziala Storn Esti	26
24774	Gradinita Cu Program Prelungit Nr.22	26
24775	Liceul Tehnologic Vladeni	26
24776	Scoala Gimnaziala Valea Lupului Iași	26
24777	Scoala Gimnaziala Nr. 1  Lunca Cetatuii	26
24778	Scoala Gimnaziala Colon El Constantin Langa Miroslava	26
24779	Liceul Tehnologic Plugari	26
24780	Seminarul Teologic Ortodox Sf. Vasile Cel Mare Iași	26
24781	Scoala Gimnaziala Birnova	26
24782	Scoala Populara De Arte Titel Popovici	26
24783	Liceul Tehnologic Ionel Teodoreanu Victoria	26
24784	Scoala Gimnaziala Al. I. Cuza	26
24785	Colegiul Costache Negruzzi Iași	26
24786	Scoala Gimnaziala Bodesti	26
24787	Scoala Gimnaziala Otilia Cazimir Iași	26
24788	Gradinita Cu Program Prelungit Nr.12	26
24789	Scoala Gimnaziala Grajduri	26
24790	Scoala Gimnaziala Butea	26
24791	Liceul Tehnologic Agricol M.kogalniceanu Miroslava	26
24792	Liceul Teoretic Miron Costin Pascani	26
24793	Universitatea Alexandru Ioan Cuza Din Iași	26
24794	Scoala Gimnaziala Hadimbu	26
24795	Scoala Gimnaziala Veronica Micle	26
24796	Scoala Gimnaziala Bosia	26
24797	Gradinita Cu Program Prelungit Nr 14 Iași	26
24798	Scoala Gimnaziala Nicolae Iorga Buhalnita	26
24799	Scoala Gimnaziala Slobozia Deal	26
24800	Scoala Gimnaziala Rachiteni	26
24801	Scoala Gimnaziala Prisacani	26
24802	Scoala Gimnaziala Grozesti	26
24803	Liceul Tehnologic Dumitru Popa Mogosesti	26
24804	Scoala Gimnaziala Chicerea	26
24805	Gradinita Cu Program Prelungit Nr.3 Pascani	26
24806	Scoala Gimnaziala Rusi	26
24807	Gradinita Cu Program Prelungit Nr.22	26
24808	Scoala Gimnaziala Iacob Negruzzi	26
24809	Scoala Gimnaziala Costache Antoniu	26
24810	Scoala Gimnaziala Domnita	26
24811	Scoala Gimnaziala Colon El Constantin Langa Miroslava	26
24812	Scoala Gimnaziala Veniamin Costachi Sinesti	26
24813	Scoala Gimnaziala Larga Jijia	26
24814	Gradinita Pp Cuv.parascheva	26
24815	Scoala Populara De Arte Titel Popovici	26
24816	Scoala Gimnaziala Sticlaria	26
24817	Scoala Gimnaziala Gorban	26
24818	Scoala Gimnaziala Grajduri	26
24819	Liceul Tehnologic Nicolae Balauta Scheia	26
24820	Universitatea Alexandru Ioan Cuza Din Iași	26
24821	Liceul Tehnologic Gropnita	26
24822	Gradinita Cu Program Prelungit Nr 14 Iași	26
24823	Colegiul National Mihai Eminescu Iași	26
24824	Scoala Gimnaziala Prisacani	26
24825	Liceul Tehnologic Tatarusi	26
24826	Colegiul National Stefan Cel Mare	26
24827	Gradinita Cu Program Prelungit Nr.13	26
24828	Scoala Gimnaziala Vasile Conta	26
24829	Scoala Gimnaziala Otilia Cazimir Iași	26
24830	Gradinita Cu Program Prelungit Nr.2 Pascani	26
24831	Liceul Special Moldova	26
24832	Scoala Gimnaziala Veronica Micle	26
24833	Scoala Gimnaziala Stefan Cel Mare Si Sfant  Dobrovat	26
24834	Liceul Tehnologic Dumitru Popa Mogosesti	26
24835	Scoala Gimnaziala Topile	26
24836	Colegiul Tehnic Gheorghe Asachi	26
24837	Scoala Gimnaziala Tutora	26
24838	Scoala Gimnaziala Costache Antoniu	26
24839	Liceul Tehnologic Vladeni	26
24840	Scoala Gimnaziala Larga Jijia	26
24841	Liceul Tehnologic Plugari	26
24842	Scoala Gimnaziala Gorban	26
24843	Liceul Tehnologic Ionel Teodoreanu Victoria	26
24844	Liceul Tehnologic Gropnita	26
24845	Liceul Tehnologic Haralamb Vasiliu	26
24846	Scoala Gimnaziala Poiana	26
24847	Gradinita Cu Program Prelungit Nr 21  Iași	26
24848	Universitatea De Stiinte Agricole Si Medicina Veterinara Ion Ionescu Dela Brad Iași	26
24849	Scoala Gimnaziala Costuleni	26
24850	Scoala Gimnaziala George Cosbuc Iași	26
24851	Scoala Gimnaziala Nicolae Iorga	26
24852	Scoala Gimnaziala Horlesti	26
24853	Scoala Gimnaziala Bivolari	26
24854	Scoala Gimnaziala Maxut	26
24855	Universitatea Tehnica Gheorghe Asachi Din Iași	26
24856	Gradinita Cu Program Prelungit Nr. 18	26
24857	Scoala Gimnaziala Lunca	26
24858	Colegiul Agricol Si De Industrie Alimentara Vasile Adamachi Iași	26
24859	Scoala Gimnaziala Elena Cuza	26
24860	Scoala Gimnaziala Ioanid Romanescu Voinesti	26
24861	Gradinita Cu Program Prelungit Nr. 25	26
24862	Scoala Gimnaziala Satu Nou	26
24863	Colegiul Tehnic De Transporturi Si Constructii	26
24864	Liceul Tehnologic Economic De Turism Iași	26
24865	Scoala  Gimnaziala Garabet Ibraileanu Targu Frumos	26
24866	Scoala Gimnaziala Chicerea	26
24867	Liceul Tehnologic Dumesti	26
24868	Liceul Tehnologic Doamna Chiajna	27
24869	Scoala Primara Optima	27
24870	Scoala Gimnaziala Nr 2	27
24871	Scoala Gimnaziala Nr.1	27
24872	Scoala Gimnaziala Alexandru Odobescu	27
24873	Liceul Teoretic Nr. 1	27
24874	Scoala Gimnaziala Nr.1  Nuci	27
24875	Liceul Teoretic Ioan Petrus Otopeni	27
24876	Liceul Tehnologic Cezar Nicolau	27
24877	Scoala Gimnaziala Nr.2 Fundeni Dobroesti	27
24878	Liceul Tehnologic Dumitru Dumitrescu	27
24879	Scoala Gimnaziala Nr.3 Voluntari	27
24880	Scoala Gimnaziala Nr. 1 Berceni	27
24881	Gradinita Nr.2	27
24882	Scoala Gimnaziala Nr.1  Dobroesti	27
24883	Gradinita Nr 1  Otopeni	27
24884	Scoala Gimnaziala Nr.1 Voluntari	27
24885	Scoala Gimnaziala Nr.1	27
24886	Scoala Gimnaziala Nr.2 Fundeni Dobroesti	27
24887	Liceul Tehnologic Pamfil Seicaru	27
24888	Seminarul Teologic Liceal Ortodox Sfanta Filofteia	27
24889	Scoala Gimnaziala Nr.1  Darasti-ilfov	27
24890	Scoala Gimnaziala Prof Ion Visoiu	27
24891	Scoala Gimnaziala Alexandru Odobescu	27
24892	Scoala Gimnaziala Nr.3	27
24893	Scoala Gimnaziala Nr.1	27
24894	Scoala Gimnaziala Gruiu	27
24895	Gradinita Nr.2	27
24896	Scoala Gimnaziala Nr. 1	27
24897	Scoala Gimnaziala Nr.1	27
24898	Gradinita Voinicel	27
24899	Scoala Gimnaziala Nr.1  Nuci	27
24900	Scoala Gimnaziala Nr.1	27
24901	Liceul Tehnologic Nicolae Balcescu	27
24902	Scoala Gimnaziala Ioan Badescu	27
24903	Scoala Gimnaziala Nr.2	27
24904	Liceul Teoretic Mihail Kogalniceanu	27
24905	Scoala Gimnaziala Nr.1	27
24906	Scoala Gimnaziala Nr.1	27
24907	Liceul Teoretic Traian Lalescu	27
24908	Colegiul Silvic Theodor Pietraru	27
24909	Scoala Gimnaziala Nr.1	27
24910	Liceul Cu Program Sportiv Cu Cls. I-xii	27
24911	Scoala Gimnaziala Gheorghe Corneliu Domnesti	27
24912	Scoala Gimnaziala Nr.1	27
24913	Scoala Gimnaziala Nr.1	27
24914	Scoala Gimnaziala Nr. 1	27
24915	Seminarul Teologic Liceal Ortodox Sfanta Filofteia	27
24916	Gradinita Nrj	27
24917	Liceul Tehnologic Nicolae Balcescu	27
24918	Scoala Gimnaziala Nr.3	27
24919	Scoala Gimnaziala Nr.3	27
24920	Scoala Gimnaziala Nr.1	27
24921	Scoala Gimnaziala Nr.1	27
24922	Scoala Gimnaziala Nr. 1 Afumati	27
24923	Scoala Gimnaziala Nr. 1	27
24924	Gradinita Nr	27
24925	Scoala Gimnaziala Nr. 2 Jilava	27
24926	Gradinita Nrj Magurele	27
24927	Scoala Gimnaziala Nr.1	27
24928	Liceul Teoretic Alexandru Rosetti Vidra	27
24929	Scoala Gimnaziala Nr.1	27
24930	Scoala Gimnaziala Nr.1	27
24931	Liceul Tehnologic Dumitru Dumitrescu	27
24932	Scoala Gimnaziala Nr. 2 Jilava	27
24933	Liceul Cu Program Sportiv Cu Cls. I-xii	27
24934	Scoala Gimnaziala Mihai Eminescu	27
24935	Scoala Gimnaziala Nr. 1 Berceni	27
24936	Scoala Gimnaziala Nr.1 Copaceni	27
24937	Scoala Gimnaziala Nr. 1	27
24938	Scoala Gimnaziala Nr.1  Dobroesti	27
24939	Scoala Gimnaziala Nr.3	27
24940	Scoala Gimnaziala Nr.1 Voluntari	27
24941	Scoala Gimnaziala Nr. 1 Afumati	27
24942	Scoala Gimnaziala Nr.2 Voluntari	27
24943	Scoala Gimnaziala Nr.3 Buftea	27
24944	Gradinita Rita Gargarita	27
24945	Gradinita Nr 2 Otopeni	27
24946	Gradinita Cu Program Normal Nrj	27
24947	Liceul Teoretic George Pop De Baseşti Baia Mare	28
24948	Scoala Gimnaziala Coroieni	28
24949	Liceul Borsa	28
24950	Scoala Gimnaziala Viseu De Jos	28
24951	Liceul Tehnologic Ruscova	28
24952	Liceul Tehnologic Poienile De Sub Munte	28
24953	Scoala Gimnaziala Calinesti	28
24954	Scoala Gimnaziala Nichita Stanescu Baia Mare	28
24955	Colegiul De Arte	28
24956	Seminarul Teologic Liceal Sf. Iosif Marturisitorul Baia Mare	28
24957	Gradinita Cu Program Prelungit Nr 10 Baia Mare	28
24958	Scoala Gimnaziala Nr.5 Sighetu Marmatiei	28
24959	Liceul Tehnologic Ocna Sugatag	28
24960	Scoala Gimnaziala Alexandru Ivasiuc Baia Mare	28
24961	Scoala Gimnaziala Remetea Chioaru Lui	28
24962	Scoala Gimnaziala Nr.18 Baia Mare	28
24963	Scoala Gimnaziala Poienile Izei	28
24964	Colegiul Economic Nicolae Titulescu	28
24965	Scoala Gimnaziala Oncesti	28
24966	Seminarul Teologic Liceal Sf. Iosif Marturisitorul Baia Mare	28
24967	Liceul Tehnologic Ocna Sugatag	28
24968	Scoala Gimnaziala Nr.1 Stramtura	28
24969	Scoala Gimnaziala Cupseni	28
24970	Scoala Gimnaziala Alexandru Ivasiuc Baia Mare	28
24971	Scoala Gimnaziala Remetea Chioaru Lui	28
24972	Scoala Gimnaziala Kos Karoly Arduzel	28
24973	Colegiul National Vasile Lucaciu	28
24974	Scoala Gimnaziala George Cosbuc Sighetu Marmatiei	28
24975	Scoala Gimnaziala Poienile Izei	28
24976	Colegiul Tehnic  Anghel Saligny	28
24977	Liceul Tehnologic Nr.4 Viseu De Sus	28
24978	Scoala Gimnaziala Florea Mureșanu Suciu De Sus	28
24979	Scoala Gimnaziala Oncesti	28
24980	Scoala Gimnaziala Finteusu Mic	28
24981	Scoala Gimnaziala Speciala Baia Mare	28
24982	Colegiul Economic Nicolae Titulescu	28
24983	Scoala Gimnaziala Nr.2 Sighetu Marmatiei	28
24984	Scoala Gimnaziala Nr.7 Viseu De Sus	28
24985	Scoala Gimnaziala Nr.1 Leordina	28
24986	Liceul Cu Program Sportiv Baia Mare	28
24987	Scoala Gimnaziala Baia Sprie	28
24988	Liceul Tehnologic Alexandru Filipascu Petrova	28
24989	Liceul Tehnologic Ocna Sugatag	28
24990	Scoala Gimnaziala Nr. 4 Borsa	28
24991	Scoala Gimaziala Ben Corlaciu	28
24992	Scoala Gimnaziala Desesti	28
24993	Scoala Gimnaziala Octavian Goga Baia Mare	28
24994	Scoala Gimnaziala Nr.1 Sighetu Marmatiei	28
24995	Scoala Gimnaziala Copalnic Manastur	28
24996	Colegiul Tehnic Transilvania	28
24997	Scoala Gimnaziala Remetea Chioaru Lui	28
24998	Scoala Gimnaziala Nr.4 Poienile De Sub Munte	28
24999	Scoala Gimnaziala Nr.1o Sighetu Marmatiei	28
25000	Scoala Gimnaziala Craciunesti	28
25001	Scoala Gimnaziala Nr.1 Stramtura	28
25002	Gradinita Cu Program Prelungit Ion Creanga	28
25003	Scoala Gimnaziala Dumbravita	28
25004	Scoala Gimnaziala Simion Barn Utiu Baia Mare	28
25005	Scoala Gimnaziala Poienile Izei	28
25006	Scoala Gimnaziala Rona De Sus	28
25007	Liceul Pedagogic Taras Sevcen Ko	28
25008	Scoala Gimnaziala De Arte Sighetu Marmatiei	28
25009	Scoala Gimnaziala Dr.ioan Mihalyi De Apsa Sighetu Marmatiei	28
25010	Liceul Tehnologic Marmatia	28
25011	Scoala Gimnaziala Sacel	28
25012	Liceul Tehnologic Forestier Sighetu Marmatiei	28
25013	Scoala Gimnaziala George Cosbuc Baia Mare	28
25014	Scoala Gimnaziala Asuaju De Sus	28
25015	Scoala Gimnaziala Bogdan Voda	28
25016	Liceul Teologic Penticostal Baia Mare	28
25017	Gradinita Cu Program Normal Nr 4 Baia Mare	28
25018	Liceul Tehnologic Agricol Alexiu Berinde Seini	28
25019	Scoala Gimnaziala Miresu Mare	28
25020	Colegiul National Dragos Voda	28
25021	Scoala Gimnaziala Gardani	28
25022	Scoala Gimnaziala Octavian Goga Baia Mare	28
25023	Liceul Teoretic Bogdan Voda	28
25024	Scoala Gimnaziala Crasna Viseului	28
25025	Scoala Gimnaziala Dr. Teodor Mihali Boiu Mare	28
25026	Colegiul Tehnic Transilvania	28
25027	Scoala Gimnaziala Oarta De Sus	28
25028	Scoala Gimnaziala Remetea Chioaru Lui	28
25029	Liceul Teoretic Nemeth Laszlo	28
25030	Scoala Gimnaziala Craciunesti	28
25031	Gradinita Cu Program Prelungit Nr.28 Baia Mare	28
25032	Scoala Gimnaziala Kos Karoly Arduzel	28
25033	Scoala Gimnaziala Lucian Blaga Farcasa	28
25034	Scoala Gimnaziala Simion Barn Utiu Baia Mare	28
25035	Scoala Gimnaziala Dr Ilie Lazar Giulesti	28
25036	Scoala Gimnaziala Poienile Izei	28
25037	Scoala Gimnaziala Chelinta	28
25038	Scoala Gimnaziala De Arte Sighetu Marmatiei	28
25039	Scoala Gimnaziala Petre Dulfu Baia Mare	28
25040	Colegiul Tehnic  Anghel Saligny	28
25041	Scoala Gimnaziala Laurentiu Ulici Rona De Jos	28
25042	Liceul Tehnologic Forestier Sighetu Marmatiei	28
25043	Scoala Gimnaziala Baia Sprie	28
25044	Scoala Gimnaziala Oncesti	28
25045	Scoala Gimnaziala Lapus	28
25046	Scoala Gimnaziala Speciala Baia Mare	28
25047	Scoala Gimnaziala Nicolae Balcescu Baia Mare	28
25048	Colegiul Tehnic De Transporturi Auto Baia Sprie	28
25049	Liceul Tehnologic Dr. Florian Ulmeanu Ulmeni	28
25050	Scoala Gimnaziala Nr.2 Sighetu Marmatiei	28
25051	Scoala Gimnaziala Sieu	28
25052	Scoala Gimnaziala Nr.7 Viseu De Sus	28
25053	Liceul Pedagogic Taras Sevcen Ko	28
25054	Scoala Gimnaziala Nr.1 Leordina	28
25055	Liceul Tehnologic Traian Vuia Tautii Magheraus	28
25056	Gradinita Cu Program Prelungit Tirgu Lapus	28
25057	Scoala Gimnaziala Dr.ioan Mihalyi De Apsa Sighetu Marmatiei	28
25058	Liceul Tehnologic Alexandru Filipascu Petrova	28
25059	Gradinita Cu Program Prelungit Nr.12 Sighetu Marmatiei	28
25060	Colegiul Tehnic C.d. Nenitescu	28
25061	Scoala Gimnaziala Sacel	28
25062	Scoala Gimnaziala Desesti	28
25063	Scoala Gimnaziala Nr. 1 Moisei	28
25064	Gradinita Cu Program Prelungit.25 Baia Mare	28
25065	Scoala Gimnaziala George Cosbuc Baia Mare	28
25066	Gradinita Cu Program Normal Nr 4 Baia Mare	28
25067	Scoala Gimnaziala Remetea Chioaru Lui	28
25068	Scoala Gimnaziala Miresu Mare	28
25069	Scoala Gimnaziala Craciunesti	28
25070	Scoala Gimnaziala Gardani	28
25071	Scoala Gimnaziala Kos Karoly Arduzel	28
25072	Liceul Teoretic Bogdan Voda	28
25073	Scoala Gimnaziala Simion Barn Utiu Baia Mare	28
25074	Scoala Gimnaziala Dr. Teodor Mihali Boiu Mare	28
25075	Scoala Gimnaziala Poienile Izei	28
25076	Scoala Gimnaziala Regina Elisabeta Baiut	28
25077	Scoala Gimnaziala De Arte Sighetu Marmatiei	28
25078	Scoala Gimnaziala Nicolae Iorga Baia Mare	28
25079	Colegiul Tehnic  Anghel Saligny	28
25080	Scoala Gimnaziala Ion Luca Caragiale Baia Mare	28
25081	Liceul Tehnologic Forestier Sighetu Marmatiei	28
25082	Scoala Gimnaziala Oncesti	28
25083	Liceul Teologic Penticostal Baia Mare	28
25084	Scoala Gimnaziala Finteusu Mic	28
25085	Colegiul National Dragos Voda	28
25086	Gradinita Cu Program Prelungit Nr.12 Sighetu Marmatiei	28
25087	Liceul Tehnologic Grigore C Moisil Targu Lapus	28
25088	Scoala Gimnaziala Vasile Alecsandri Baia Mare	28
25089	Gradinita Cu Program Prelungit Step By Step Baia Mare	28
25090	Scoala Gimnaziala Nr. 1 Moisei	28
25091	Scoala Gimnaziala Cicirlau	28
25092	Gradinita Cu Program Prelungit Nr.8 Sighetu Marmatiei	28
25093	Gradinita Cu Program Prelungit Otilia Cazimir	28
25094	Scoala Gimnaziala Ardusat	28
25095	Liceul Tehnologic Viseu De Sus	28
25096	Scoala Gimnaziala Nicolae Steinhard Rohia	28
25097	Colegiul National Mihai Eminescu	28
25098	Scoala Gimnaziala Ieud	28
25099	Scoala Gimnaziala Sacalaseni	28
25100	Scoala Gimnaziala Remeti	28
25101	Scoala Gimnaziala Basesti	28
25102	Scoala Gimnaziala Benko Ferenc Damacuseni	28
25103	Gradinita Cu Program Prelungit Nr 10 Borsa	28
25104	Liceul Teoretic Petru Rares	28
25105	Gradinita Cu Program Prelungit Nr.2 Baia Sprie	28
25106	Liceul Teoretic Petru Rares	28
25107	Scoala Gimnaziala Satu Lung	28
25108	Colegiul Tehnic De Transporturi Auto	29
25109	Scoala Gimnaziala Dimitrie Grecescu	29
25110	Liceul Teoretic Traian Lalescu	29
25111	Scoala Gimnaziala Isverna	29
25112	Scoala Gimnaziala Constantin Negreanu	29
25113	Scoala Cu Clasele I-viii Balacita	29
25114	Scoala Gimnaziala Petre Sergescu	29
25115	Scoala Cu Clasele I-viii Constantin Radulescu Motru Butoiesti	29
25116	Colegiul National Economic Theodor Costescu	29
25117	Scoala Gimnaziala Ilovat	29
25118	Scoala Primara Siroca Godeanu	29
25119	Scoala Gimnaziala Stingaceaua	29
25120	Liceul Tehnologic Halinga	29
25121	Scoala Gimnaziala Cazanesti	29
25122	Scoala Gimnaziala Branistea	29
25123	Scoala Gimnaziala Girla Mare	29
25124	Scoala Gimnaziala Nr.14	29
25125	Gradinita Cu Program Prelungit Nr.19	29
25126	Liceul Tehnologic Tu Dor Vladimirescu	29
25127	Scoala Gimnaziala Gogosu	29
25128	Liceul Tehnologic Matei Basarab Strehaia	29
25129	Scoala Primara Siroca Godeanu	29
25130	Scoala Gimnaziala Nr.15	29
25131	Scoala Gimnaziala Pamfil Seicaru	29
25132	Scoala Gimnaziala Regele Mihai I	29
25133	Scoala Gimnaziala Greci	29
25134	Scoala Gimnaziala Podeni	29
25135	Scoala Gimnaziala Branistea	29
25136	Scoala Gimnaziala Isverna	29
25137	Scoala Gimnaziala Oprisor	29
25138	Scoala Gimnaziala Eselnita	29
25139	Colegiul Tehnic  Domnul Tudor	29
25140	Colegiul National Pedagogic Stefan Odobleja	29
25141	Scoala Gimnaziala Bala	29
25142	Scoala Gimnaziala Dumbrava	29
25143	Scoala Gimnaziala Corcova	29
25144	Scoala Gimnaziala Constantin Negreanu	29
25145	Liceul Tehnologic Constantin Brancoveanu	29
25146	Scoala Gimnaziala Ilovita	29
25147	Scoala Gimnaziala Greci	29
25148	Scoala Gimnaziala Dumitru Crasoveanu	29
25149	Gradinita Cu Program Prelungit Nr. 3	29
25150	Scoala Gimnaziala Hinova	29
25151	Scoala Gimnaziala Podeni	29
25152	Scoala Gimnaziala Cazanesti	29
25153	Scoala Gimnaziala Nr.6	29
25154	Liceul De Arte I.st.paulian	29
25155	Scoala Gimnaziala Oprisor	29
25156	Gradinita Cu Program Prelungit Nr.19	29
25157	Scoala Gimnaziala Alice Voinescu	29
25158	Scoala Postliceala Sanitara	29
25159	Scoala Gimnaziala Eselnita	29
25160	Gradinita Cu Program Prelungit Nr.7	29
25161	Scoala Profesionala Corlatel	29
25162	Scoala Gimnaziala Obarsia—de-camp	29
25163	Scoala Gimnaziala Bala	29
25164	Scoala Gimnaziala Mihai Viteazu Strehaia	29
25165	Scoala  Gimnaziala	29
25166	Scoala Gimnaziala Constantin Trusca	29
25167	Scoala Gimnaziala Nr.6	29
25168	Scoala Gimnaziala Ponoarele	29
25169	Colegiul Tehnic  Domnul Tudor	29
25170	Scoala Gimnaziala Ciresu	29
25171	Scoala Gimnaziala Alice Voinescu	29
25172	Scoala Gimnaziala Eibenthal	29
25173	Scoala Gimnaziala Eselnita	29
25174	Scoala Gimnaziala Vanju Mare	29
25175	Scoala Profesionala Corlatel	29
25176	Liceul Teoretic Cujmir	29
25177	Scoala Gimnaziala Corcova	29
25178	Gradinita Cu Program Prelungit Nr. 1 Orsova	29
25179	Scoala  Gimnaziala	29
25180	Scoala Gimnaziala Breznita Motru	29
25181	Scoala Gimnaziala Dumbrava	29
25182	Scoala Gimnaziala Floresti	29
25183	Gradinita Cu Program Prelungit Nr.22	29
25184	Scoala Primara Padina Mare	29
25185	Colegiul National Traian Drobeta Turnu Severin	29
25186	Scoala Gimnaziala Pristol	29
25187	Liceul De Arte I.st.paulian	29
25188	Scoala Cu Clasele I-viii Sovarna	29
25189	Scoala Postliceala Sanitara	29
25190	Liceul Tehnologic Special Drobeta	29
25191	Scoala Gimnaziala Obarsia—de-camp	29
25192	Scoala Gimnaziala	29
25193	Scoala Gimnaziala Breznita Ocol	29
25194	Scoala Gimnaziala Simian	29
25195	Scoala Gimnaziala Dirvari	29
25196	Scoala Gimnaziala Husnicioara	29
25197	Scoala Gimnaziala	29
25198	Scoala Gimnaziala Nr 5	29
25199	Scoala Gimnaziala Constantin Trusca	29
25200	Gradinita Cu Program Prelungit Nr 20	29
25201	Scoala Gimnaziala Ciresu	29
25202	Colegiul National Gheorghe Titeica	29
25203	Scoala Gimnaziala Vanju Mare	29
25204	Scoala Gimnaziala Devesel	29
25205	Gradinita Cu Program Prelungit Nr. 1 Orsova	29
25206	Gradinita Cu Program Prelungit Nr. 21	29
25207	Scoala Gimnaziala Floresti	29
25208	Scoala Gimnaziala Petru Dumitriu Orsova	29
25209	Scoala Gimnaziala Cerneti	29
25210	Scoala Gimnaziala Bilvanesti	29
25211	Liceul Tehnologic Constantin Brancusi Targu Mureș	30
25212	Scoala Gimnaziala Tholdalagi Mihaly Corunca	30
25213	Scoala Gimnaziala Cristesti	30
25214	Scoala Gimnaziala Europa Municipiul Targu Mureș	30
25215	Scoala Gimnaziala Comuna Sarateni	30
25216	Scoala Gimnaziala Comuna Zagar	30
25217	Scoala Gimnaziala Comuna Sanger	30
25218	Scoala Gimnaziala  Torok Janos Comuna Balauseri	30
25219	Scoala Gimnaziala Apafi Mihaly Ernei	30
25220	Scoala Gimnaziala Adorjani Karoly Glodeni	30
25221	Scoala Gimnaziala  Comuna Valea Larga	30
25222	Gradinita Cu Program  Prelungit Manpel Tg.Mureș	30
25223	Scoala Gimnaziala Iuliu Grama Comuna Chiheru De Jos	30
25224	Colegiul Tehnic Tarnaveni	30
25225	Liceul Vocational Pedagogic Mihai Eminescu Municipiul Targu Mureș	30
25226	Scoala Gimnaziala Comuna Zagar	30
25227	Scoala Gimnaziala Comuna Chetani	30
25228	Scoala Gimnaziala Apafi Mihaly Ernei	30
25229	Liceul Teologic Romano-catolic	30
25230	Scoala Gimnaziala  Comuna Valea Larga	30
25231	Scoala Gimnaziala Wesselenyi Miklos Ghindari	30
25232	Scoala Gimnaziala Sat Deaj  Comuna Mica	30
25233	Scoala Gimnaziala Vasile Pop Comuna Grebenisu De Cimpie	30
25234	Liceul Tehnologic Ioan Bojor Reghin	30
25235	Gradinita Casuta Fermecata Din Ludus	30
25236	Scoala Gimnaziala Adorjani Karoly Glodeni	30
25237	Scoala Gimnaziala Comuna Cuci	30
25238	Liceul Vocational Pedagogic Mihai Eminescu Municipiul Targu Mureș	30
25239	Scoala Gimnaziala Liviu Rebreanu Municipiul Tg.Mureș	30
25240	Liceul Teoretic Andrei Barseanu	30
25241	Scoala Gimnaziala Comuna Taureni	30
25242	Scoala Gimnaziala  Torok Janos Comuna Balauseri	30
25243	Scoala Gimnaziala Kadar Marton Comuna Pan Et	30
25244	Liceul Teologic Romano-catolic Ii Rakoczi Ferenc	30
25245	Scoala Gimnaziala  Comuna Ogra	30
25246	Scoala Gimnaziala Nr.01 Orasul Ludus	30
25247	Scoala Gimnaziala Aurel Mosora Municipiul Sighisoara	30
25248	Scoala Gimnaziala Comuna Sincai	30
25249	Scoala Gimnaziala S.illyes Lajos Sovata	30
25250	Liceul Tehnologic Traian Vuia Municipiul Targu Mureș	30
25251	Liceul Teoretic Andrei Barseanu	30
25252	Scoala Gimnaziala Dr Nyulas Ferenc Comuna Eremitu	30
25253	Scoala Gimnaziala Cornel Regman Comuna Danes	30
25254	Scoala Gimnaziala Comuna Faragau	30
25255	Scoala Gimnaziala Comuna Beica De Jos	30
25256	Scoala Gimnaziala Comuna Apold	30
25257	Scoala Gimaziala Comuna Adamus	30
25258	Scoala Gimnaziala  Comuna Valea Larga	30
25259	Scoala Gimnaziala Nr.7 Targu Mureș	30
25260	Liceul Tehnologic Lucian Blaga Reghin	30
25261	Liceul Tehnologic Nr 1  Municipiul Sighisoara	30
25262	Scoala  Gimnaziala Serafim Duicu Targu Mureș	30
25263	Scoala Gimnaziala Comuna Cozma	30
25264	Scoala Gimnaziala Avram Iancu Tarnaveni	30
25265	Scoala Gimnaziala Gheorghe Sincai Comuna Raciu	30
25266	Liceul Tehnologic Aurel Persu Municipiul Tirgu Mureș	30
25267	Scoala Gimnaziala Vatava	30
25268	Scoala Gimnaziala Sau Lia	30
25269	Scoala Gimnaziala Comuna Breaza	30
25270	Scoala Gimnaziala Nr. 01  Comuna Craciunesti	30
25271	Colegiul National Alexandru Papiu Ilarian Targu Mureș	30
25272	Scoala Gimnaziala Comuna Batos	30
25273	Scoala Gimnaziala Danila Stupar Comuna Rusii-munti	30
25274	Scoala Gimnaziala Teleki Domokos Comuna Gornesti	30
25275	Scoala Gimnaziala Comuna Pogaceaua	30
25276	Universitatea De Arte Din Tirgu Mureș	30
25277	Scoala Gimnaziala Seulia De Mureș Comuna Cucerdea	30
25278	Scoala Gimnaziala Comuna Bichis	30
25279	Colegiul Economic Transilvania	30
25280	Scoala Gimnaziala Comuna Acatari	30
25281	Scoala Gimnaziala Ion Chinezu Santana De Mureș	30
25282	Scoala Gimnaziala Comuna Ideciu De Jos	30
25283	Scoala Gimnaziala  Sfantul Petru Comuna Sampetru De Campie	30
25284	Scoala Gimnaziala Bahnea	30
25285	Scoala Gimnaziala Romulus Guga Tg.Mureș	30
25286	Scoala Gimnaziala Alexandru Ceusianu Municipiul Reghin	30
25287	Scoala Gimnaziala Kiss Gergely Pasareni	30
25288	Scoala Gimnaziala Comuna Sancraiu De Mureș	30
25289	Scoala Gimnaziala Comuna Papiu Ilarian	30
25290	Scoala Gimnaziala Nr.01 Orasul Ludus	30
25291	Liceul Tehnologic Sfantul Gheorghe  Sangeorgiu De Padure	30
25292	Scoala Gimnaziala Comuna Viisoara	30
25293	Scoala Gimnaziala Sfantul Gheorghe Comuna Sangeorgiu De Mureș	30
25294	Scoala Gimnaziala Sau Lia	30
25295	Liceul Tehnologic Nrj  Lu Dus	30
25296	Liceul Tehnologic Gheorghe Sincai Municipiul Targu Mureș	30
25297	Scoala Gimnaziala Comuna Vetca	30
25298	Scoala Gimnaziala Comuna Atintis	30
25299	Scoala Gimnaziala Comuna Suseni	30
25300	Liceul Teoretic Gheorghe Marinescu Municipiul Targu Mureș	30
25301	Scoala Gimnaziala Comuna Coroisinmartin	30
25302	Universitatea De Arte Din Tirgu Mureș	30
25303	Scoala Gimnaziala Pataky Agotha	30
25304	Scoala Gimnaziala Palko Attila Din Alunis	30
25305	Scoala Gimnaziala Benedek Elek Livezeni	30
25306	Colegiul National Mircea Eliade Sighisoara	30
25307	Scoala Gimnaziala Sat Iclandu Mare Comuna Iclanzel	30
25308	Scoala Gimnaziala Szentivani Mihaly Comuna Galesti	30
25309	Scoala Gimnaziala Cornel Regman Comuna Danes	30
25310	Liceul Vocational De Arta Municipiul Tg.Mureș	30
25311	Scoala Gimnaziala Petres Kalman Sambrias	30
25312	Scoala Gimnaziala Comuna Chetani	30
25313	Scoala Gimnaziala Pataky Agotha	30
25314	Liceul Vocational Reformat	30
25315	Scoala Gimnaziala Comuna Hodac	30
25316	Scoala Gimnaziala Comuna Mihesu De Cimpie	30
25317	Scoala Gimaziala Comuna Adamus	30
25318	Scoala Gimnaziala Friedrich Schiller Municiupiul Targu Mureș	30
25319	Liceul Tehnologic Vasile Netea Comuna Deda	30
25320	Liceul Teologic Romano-catolic	30
25321	Scoala Gimnaziala Zaharia Boiu Municipiul Sighisoara	30
25322	Liceul Teoretic Joseph  Haltrich	30
25323	Liceul Tehnologic Sat Dumbravioara Comuna Ernei	30
25324	Liceul Tehnologic Sfantul Gheorghe  Sangeorgiu De Padure	30
25325	Liceul Tehnologic Nr 1  Municipiul Sighisoara	30
25326	Scoala Gimnaziala Zaharia Boiu Municipiul Sighisoara	30
25327	Gradinita Casuta Fermecata Din Ludus	30
25328	Scoala Gimnaziala Nr 3 Tarnaveni	30
25329	Liceul Tehnologic Nr 1  Municipiul Sighisoara	30
25330	Scoala Gimnaziala Vatava	30
25331	Scoala Gimnaziala Comuna Cuci	30
25332	Scoala Gimnaziala Comuna Lunca	30
25333	Scoala Gimnaziala Gheorghe Sincai Comuna Raciu	30
25334	Scoala Gimnaziala Comuna Breaza	30
25335	Scoala Gimnaziala Liviu Rebreanu Municipiul Tg.Mureș	30
25336	Liceul Tehnologic Domokos Kazmer Orasul Sovata	30
25337	Liceul Tehnologic Ion Vlasiu	30
25338	Colegiul National Alexandru Papiu Ilarian Targu Mureș	30
25339	Scoala Gimnaziala Comuna Taureni	30
25340	Scoala Gimnaziala Vargata	30
25341	Scoala Gimnaziala Traian Tarnaveni	30
25342	Scoala Gimnaziala Danila Stupar Comuna Rusii-munti	30
25343	Scoala Gimnaziala Kadar Marton Comuna Pan Et	30
25344	Colegiul National Mircea Eliade Sighisoara	30
25345	Scoala Gimnaziala Mihai Viteazul Municipiul Targu Mureș	30
25346	Scoala Gimnaziala Comuna Iban Esti	30
25347	Scoala Gimnaziala Palko Attila Din Alunis	30
25348	Scoala Gimnaziala Comuna Ceuasu De Cimpie	30
25349	Scoala Gimnaziala Sat Iclandu Mare Comuna Iclanzel	30
25350	Liceul Tehnologic Sfantul Gheorghe  Sangeorgiu De Padure	30
25351	Scoala Gimnaziala Petres Kalman Sambrias	30
25352	Scoala Gimnaziala Ioan Vladutiu Orasul Ludus	30
25353	Scoala Gimnaziala Comuna Hodac	30
25354	Gradinita Cu Program Prelungit Nr.16 Tg.Mureș	30
25355	Liceul Tehnologic Vasile Netea Comuna Deda	30
25356	Scoala Gimnaziala Comuna Papiu Ilarian	30
25357	Liceul Tehnologic Sat Dumbravioara Comuna Ernei	30
25358	Scoala Gimnaziala Comuna Suseni	30
25359	Scoala Gimnaziala Comuna Petelea	30
25360	Scoala Gimnaziala Sfantul Gheorghe Comuna Sangeorgiu De Mureș	30
25361	Scoala Gimnaziala Comuna Stanceni	30
25362	Scoala Gimnaziala Comuna Fantanele	30
25363	Scoala Gimnaziala Magherani	30
25364	Scoala Gimnaziala Comuna Vetca	30
25365	Scoala Gimnaziala Comuna Neaua	30
25366	Scoala Gimnaziala Comuna Stanceni	30
25367	Liceul Cu Program Sportiv Szasz Adalbert	30
25368	Scoala Gimnaziala Sf Nicolae Satul Laslau Mare Comuna Suplac	30
25369	Scoala Gimnaziala Radu Popa Municipiul Sighisoara	30
25370	Scoala Gimnaziala Magherani	30
25371	Scoala Gimnaziala Rakossi Lajos Gheorghe Doja	30
25372	Scoala Gimnaziala Ion Dacian Comuna Saschiz	30
25373	Gradinita Cu Program Prelungit Nr.5 Reghin	30
25374	Scoala Gimnaziala Comuna Neaua	30
25375	Scoala Gimnaziala Comuna Lunca Bradului	30
25376	Liceul Teoretic Bocskai Istvan Orasul Miercurea Nirajului	30
25377	Scoala Gimnaziala Victor Jinga Municipiul Sighisoara	30
25378	Scoala Gimnaziala Nades	30
25379	Scoala Gimnaziala George Cosbuc Municipiul Targu Mureș	30
25380	Scoala Cu Clasele I - Viii Mastacan	31
25381	Colegiul Tehnic Forestier	31
25382	Scoala Gimnaziala Comuna Bodesti	31
25383	Scoala Gimnaziala Vasile Mitru Tasca	31
25384	Liceul Tehnologic Ion Creanga	31
25385	Colegiul National Gheorghe Asachi	31
25386	Liceul Tehnologic Damuc	31
25387	Scoala Gimnaziala Comuna Bodesti	31
25388	Scoala Gimnaziala Nr.2	31
25389	Colegiul National Gheorghe Asachi	31
25390	Scoala Gimnaziala Comuna Trifesti Judetul Neamț	31
25391	Scoala Gimnaziala Nicu Albu	31
25392	Scoala Gimnaziala Alexandru Podoleanu	31
25393	Scoala Gimnaziala  Mihai Eminescu  Roman	31
25394	Scoala Gimnaziala Calistrat Hogas Roman	31
25395	Scoala Gimnaziala Nr.1 Bicaz	31
25396	Scoala Gimnaziala  Comuna Moldoveni  Judetul Neamț	31
25397	Scoala Gimnaziala I.i.mronescu Tazlau	31
25398	Colegiul Tehnic Miron Costin Roman	31
25399	Colegiul Tehnic Ion Creanga	31
25400	Colegiul National Stefan Cel Mare	31
25401	Scoala Gimnaziala Vadu Ri	31
25402	Scoala Gimnaziala Comuna Pastraveni	31
25403	Liceul Tehnologic Ion Creanga	31
25404	Scoala Gimnaziala Nr 1 Raucesti	31
25405	Scoala Gimnaziala Pr.gheorghe Sandulescu Dragomiresti	31
25406	Scoala Gimnaziala Nr.1	31
25407	Scoala Gimnaziala Elena Cuza	31
25408	Scoala Gimnaziala Pr.gheorghe Sandulescu Dragomiresti	31
25409	Scoala Gimnaziala Prof.gheorghe Dumitreasa	31
25410	Scoala Gimnaziala Comuna Dobreni	31
25411	Scoala Gimnaziala Alexandru Podoleanu	31
25412	Colegiul Tehnic Miron Costin Roman	31
25413	Scoala Gimnaziala . Comuna Borlesti. Judetul Neamț	31
25414	Scoala Gimnaziala Gheorghe Nicolau Romani	31
25415	Scoala Gimnaziala Grigore Ungureanu Ceahlau	31
25416	Scoala Gimnaziala Nr. 1 . Sat Pildesti. Comuna Cordun. Judetul Neamț	31
25417	Scoala Gimnaziala  Vasile Alecsandri Roman	31
25418	Scoala Gimnaziala Comuna Birgauani Judetul Neamț	31
25419	Scoala Gimnaziala  Comuna Moldoveni  Judetul Neamț	31
25420	Scoala Gimnaziala Comuna Pastraveni	31
25421	Scoala Gimnaziala Alexandru Ioan Cuza Roman	31
25422	Scoala Gimnaziala Nr. I.comuna Cordun. Judetul Neamț	31
25423	Scoala Gimnaziala Antonie Mureșianu Comuna Bira	31
25424	Liceul Tehnologic Dimitrie Leonida	31
25425	Scoala Gimnaziala Comuna Costisa Judetul Neamț	31
25426	Liceul Tehnologic  Ion Ionescu De La Brad	31
25427	Scoala Gimnaziala Vadu Ri	31
25428	Scoala Gimnaziala Episcop Melchisedec Stefanescu	31
25429	Scoala Gimnaziala Vlad Danulescu Comuna Pancesti Judetul Neamț	31
25430	Scoala Gimnaziala Nr.1 Comuna Bicazu Ardelean	31
25431	Scoala Gimnaziala Comuna Valeni Judetul Neamț	31
25432	Scoala Gimnaziala Comuna Stanita Judetul Neamț	31
25433	Colegiul Tehnologic Spiru Haret	31
25434	Liceul Tehnologic Petricani	31
25435	Scoala Gimnaziala Elena Cuza	31
25436	Liceul Cu Program Sportiv Css Roman	31
25437	Liceul Tehnologic Gh Ruset Roznovanu	31
25438	Scoala Gimnaziala Gheorghe Savinescu Comuna Cracaoani Judetul Neamț	31
25439	Scoala Gimnaziala Comuna Bozieni Judetul Neamț	31
25440	Liceul Teologic Episcop Melchisedec Roman	31
25441	Scoala Gimnaziala Nicolae Iorga Pingarati	31
25442	Scoala Gimnaziala Timișesti	31
25443	Scoala Gimnaziala Grigore Ungureanu Ceahlau	31
25444	Scoala Gimnaziala Barticesti	31
25445	Scoala Gimnaziala Draganesti	31
25446	Liceul Tehnologic Gh Ruset Roznovanu	31
25447	Liceul Tehnologic Arhimandrit Chiriac Nicolau	31
25448	Scoala Gimnaziala Tamaseni	31
25449	Liceul Tehnologic  Vasile Sav	31
25450	Scoala Gimnaziala Nicolae Iorga Pingarati	31
25451	Liceul Teologic Ortodox Sfintii Imparati Constantin Si Elena	31
25452	Colegiul National Calistrat Hogas	31
25453	Liceul Vasile Conta	31
25454	Scoala Gimnaziala Draganesti	31
25455	Scoala Gimnaziala Nicolae Apostol Comuna Ruginoasa Judetul Neamț	31
25456	Scoala Gimnaziala Nicolae Buleu Comuna Margineni	31
25457	Scoala Gimnaziala Comuna Oniceni Judetul Neamț	31
25458	Scoala Gimnaziala Nr1 Comuna Tibucani Judetul Neamț	31
25459	Scoala Gimnaziala Ioan Grigore Teodorescu Sat Ruseni Comuna Borlesti	31
25460	Scoala Gimnaziala Comuna Sagna Judetul Neamț	31
25461	Scoala Gimnaziala Hangu	31
25462	Scoala Gimnaziala I. Gervescu	31
25463	Scoala Gimnaziala Constantin Pantiru Grinties	31
25464	Scoala Gimnaziala Iustin Pirvu Poiana Teiului	31
25465	Scoala Gimnaziala Nr.5  Piatra Neamț	31
25466	Scoala Gimnaziala Iustin Pirvu Poiana Teiului	31
25467	Scoala Gimnaziala Nr. 1 Piatra Neamț	31
25468	Liceul Tehnologic Nisiporesti Com Botesti	31
25469	Scoala Gimnaziala Nr 1 Comuna Zanesti Judetul Neamț	31
25470	Liceul Tehnologic Adjudeni	31
25471	Scoala Gimnaziala Nr 1 Raucesti	31
25472	Scoala Gimnaziala Boghicea Judetul Neamț	31
25473	Scoala Gimnaziala Comuna Rediu Judetul Neamț	31
25474	Scoala Gimnaziala Ioan Luca	31
25475	Scoala Gimnaziala  Constantin Virgil Gheorghiu	31
25476	Scoala Gimnaziala Comuna Doljesti Judetul Neamț	31
25477	Scoala Gimnaziala Ion Creanga Tg.Neamț	31
25478	Scoala Gimnaziala Nr 1 Comuna  Bicaz-chei	31
25479	Liceul Tehnologic Arhimandrit Chiriac Nicolau	31
25480	Liceul Teoretic  Vasile Alecsandri  Comuna Sabaoani Judetul Neamț	31
25481	Scoala Gimnaziala Dumitru Almas Negresti	31
25482	Liceul Teologic Romano Catolic „sfantul Francisc De Assisi..	31
25483	Liceul Teologic Ortodox Sfintii Imparati Constantin Si Elena	31
25484	Scoala Gimnaziala Comuna Piatra Soimului Judetul Neamț	31
25485	Liceul Carol I Bicaz	31
25486	Liceul Teoretic  Vasile Alecsandri  Comuna Sabaoani Judetul Neamț	31
25487	Scoala Gimnaziala Comuna Ion Creanga	31
25488	Liceul Tehnologic Petricani	31
25489	Scoala Gimnaziala Tamaseni	31
25490	Liceul Cu Program Sportiv Css Roman	31
25491	Colegiul National Calistrat Hogas	31
25492	Scoala Gimnaziala Gheorghe Savinescu Comuna Cracaoani Judetul Neamț	31
25493	Scoala Gimnaziala Nicolae Buleu Comuna Margineni	31
25494	Liceul Teologic Episcop Melchisedec Roman	31
25495	Scoala Gimnaziala Comuna Sagna Judetul Neamț	31
25496	Scoala Gimnaziala Timișesti	31
25497	Scoala Gimnaziala Iustin Pirvu Poiana Teiului	31
25498	Scoala Gimnaziala Barticesti	31
25499	Liceul Tehnologic Adjudeni	31
25500	Scoala Gimnaziala Nr.11 Piatra Neamț	31
25501	Scoala Gimnaziala Ioan Luca	31
25502	Scoala Gimnaziala Comuna Tupilati	31
25503	Scoala Gimnaziala Nr 1 Comuna  Bicaz-chei	31
25504	Liceul Tehnologic Valea Ursului	31
25505	Liceul Teologic Romano Catolic „sfantul Francisc De Assisi..	31
25506	Scoala Gimnaziala Dr.emanuiel Rigler	31
25507	Scoala Gimnaziala Comuna Piatra Soimului Judetul Neamț	31
25508	Scoala Gimnaziala Comuna Faurei Judet Neamț	31
25509	Colegiul Tehnic De Transporturi	31
25510	Scoala Gimnaziala Com Secuieni Jud Neamț	31
25511	Liceul Tehnologic Oglinzi	31
25512	Scoala Gimnaziala Comuna Baltatesti	31
25513	Scoala Gimnaziala Nr.1 Comuna Dumbrava Rosiejudetui Neamț	31
25514	Liceul Cu Program Sportiv Piatra Neamț	31
25515	Liceul Tehnologic Ion Popescu Cilieni Comuna Cilieni	32
25516	Scoala Gimnaziala Comuna Vadastra	32
25517	Scoala Gimnaziala Leonida Marineanu Comuna Tia Mare	32
25518	Scoala Gimnaziala Comuna Farcasele	32
25519	Scoala Gimnaziala Comuna Gircov	32
25520	Scoala Gimnaziala Comuna Dobrun	32
25521	Scoala Gimnaziala Comuna Vilcele	32
25522	Colegiul National Radu Greceanu	32
25523	Scoala Gimnaziala Nr.1  Loccaracal Jud.olt	32
25524	Colegiul National Agricol Carol I	32
25525	Scoala Gimnaziala Comuna Schitu	32
25526	Colegiul Tehnic Danubius	32
25527	Liceul Tehnologic Comuna Iancu Jianu	32
25528	Scoala Gimnaziala Comuna Vilcele	32
25529	Scoala Gimnaziala Comuna Farcasele	32
25530	Scoala Gimnaziala Comuna Verguleasa	32
25531	Scoala Gimnaziala Comuna Stoican Esti	32
25532	Scoala Gimnaziala Comuna Gradinari	32
25533	Scoala Gimnaziala Comuna Dobrun	32
25534	Liceul Teoretic Tu Dor Vladimirescu	32
25535	Scoala Gimnaziala Comuna Poboru	32
25536	Scoala Gimnaziala Comuna Bobicesti	32
25537	Scoala Gimnaziala Comuna Baldovinesti	32
25538	Liceul Tehnologic Constantin Filipescu Loc Caracal Jud Olt	32
25539	Scoala Gimnaziala Comuna Morunglav	32
25540	Scoala Gimnaziala Comuna Strej Esti	32
25541	Colegiul National Agricol Carol I	32
25542	Scoala Gimnaziala Comuna Vulturesti	32
25543	Scoala Gimnaziala Comuna Priseaca	32
25544	Scoala Gimnaziala Comuna Vadastrita	32
25545	Scoala Gimnaziala Comuna Calui	32
25546	Scoala Gimnaziala Comuna Izbiceni	32
25547	Liceul Tehnologic Comuna Valeni	32
25548	Scoala Gimnaziala Comuna Stoican Esti	32
25549	Liceul Tehnologic Comuna Crimpoia	32
25550	Scoala Gimnaziala Comuna Visina	32
25551	Scoala Gimnaziala Constantin Brancoveanu Municipiul Slatina	32
25552	Scoala Gimnaziala Comuna Gradinari	32
25553	Colegiul Tehnic Alexe Marin	32
25554	Scoala Gimnaziala Comuna Fagetelu	32
25555	Colegiul National Ionita Asan	32
25556	Scoala Gimnaziala Comuna Poboru	32
25557	Scoala Gimnaziala Comuna Dobrosloveni	32
25558	Scoala Gimnaziala Comuna Stoenesti	32
25559	Colegiul National Al I Cuza	32
25560	Scoala Gimnaziala Comuna Baldovinesti	32
25561	Scoala Gimnaziala Comuna Deveselu	32
25562	Colegiul Tehnic Metalurgic	32
25563	Colegiul National Ion Minulescu	32
25564	Scoala Gimnaziala Comuna Morunglav	32
25565	Liceul Tehnologic Comuna Vitomiresti	32
25566	Scoala Gimnaziala Mihai Viteazul Comuna Babiciu	32
25567	Scoala Gimnaziala Nr 1 Oras Bals	32
25568	Scoala Gimnaziala Cart.comani Orasul Draganesti Olt	32
25569	Scoala Gimnaziala Comuna Pirscoveni	32
25570	Scoala Gimnaziala Comuna Baldovinesti	32
25571	Liceul Tehnologic Orasul Draganesti-olt	32
25572	Scoala Gimnaziala Sat Viespesti Comuna Sprincenata	32
25573	Scoala Gimnaziala Comuna Gostavatu	32
25574	Scoala Gimnaziala Comuna Izbiceni	32
25575	Scoala Gimnaziala Comuna Barastii De Vede	32
25576	Colegiul National Agricol Carol I	32
25577	Scoala Gimnaziala Comuna Vladila	32
25578	Scoala Gimnaziala Comuna Visina	32
25579	Colegiul Tehnic Matei Basarab	32
25580	Scoala Gimnaziala Comuna Calui	32
25581	Scoala Gimnaziala Cart.bircii Orasul Scornicesti	32
25582	Scoala Gimnaziala Comuna Fagetelu	32
25583	Scoala Postliceala Sanitara	32
25584	Scoala Gimnaziala Comuna Gura Padinii	32
25585	Scoala Gimnaziala Comuna Stoenesti	32
25586	Scoala Gimnaziala Sat Viespesti Comuna Sprincenata	32
25587	Scoala Gimnaziala Nr.3 Municipiul Slatina	32
25588	Scoala Gimnaziala Comuna Dobrosloveni	32
25589	Scoala Gimnaziala Comuna Corbu	32
25590	Scoala Gimnaziala Comuna Visina Noua	32
25591	Scoala Gimnaziala Comuna Movileni	32
25592	Colegiul National Al I Cuza	32
25593	Scoala Gimnaziala Florian Dituleasa Sat Vitanesti Comuna Sarbii Magura	32
25594	Scoala Gimnaziala Comuna Milcov	32
25595	Liceul Tehnologic Comuna Tu Feni	32
25596	Scoala Gimnaziala Comuna Deveselu	32
25597	Scoala Gimnaziala  Aviator Alexandru Serbanescu Comuna Colon Esti	32
25598	Scoala Gimnaziala Comuna Ganeasa	32
25599	Scoala Gimnaziala Comuna Dobroteasa	32
25600	Colegiul National Ion Minulescu	32
25601	Scoala Gimnaziala Pan M. Vizirescu Sat Branet	32
25602	Scoala Gimnaziala Comuna Urzica	32
25603	Gradinita Cu Program Normal Dumbrava Minunata	32
25604	Liceul Tehnologic Comuna Vitomiresti	32
25605	Scoala Gimnaziala Comuna Teslui	32
25606	Scoala Gimnaziala Comuna Urzica	32
25607	Scoala Gimnaziala Comuna Brastavatu	32
25608	Scoala Gimnaziala Comuna Falcoiu	32
25609	Colegiul Tehnic Alexe Marin	32
25610	Scoala Gimnaziala Comuna Simburesti	32
25611	Scoala Gimnaziala Comuna Redea	32
25612	Gradinita Cu Program Prelungit Nr 1 Slatina	32
25613	Colegiul National Ionita Asan	32
25614	Scoala Gimnaziala Comuna Oboga	32
25615	Scoala Gimnaziala Decebal Comuna Dobretu	32
25616	Gradinita Cu Program Prelungit Ion Creanga Slatina	32
25617	Scoala Gimnaziala Comuna Dobrosloveni	32
25618	Scoala Gimnaziala Mihail Drumes Bals	32
25619	Scoala Gimnaziala Comuna Coteana	32
25620	Colegiul Economic P.s. Aurelian	32
25621	Colegiul National Al I Cuza	32
25622	Gradinita Cu Program Prelungit Nr 3 Slatina	32
25623	Scoala Gimnaziala Comuna Cungrea	32
25624	Scoala Gimnaziala Comuna Perieti	32
25625	Scoala Gimnaziala Comuna Deveselu	32
25626	Scoala Gimnaziala Nicolae Titu Lescu	32
25627	Scoala Gimnaziala Nr. 1 Slatina	32
25628	Gradinita Cu Program Prelungit Nr 3 Slatina	32
25629	Gradinita Cu Program Normal Ion Creanga	32
25630	Scoala Gimnaziala Comuna Traian	32
25631	Liceul Tehnologic Orasul Piatra Olt	32
25632	Scoala Gimnaziala Comuna Perieti	32
25633	Scoala Gimnaziala Comuna Tatu Lesti	32
25634	Scoala Gimnaziala Nr 1 Oras Bals	32
25635	Scoala Gimnaziala Comuna Topana	32
25636	Scoala Gimnaziala Comuna Draghiceni	32
25637	Scoala Gimnaziala Comuna Ghimpeteni	32
25638	Scoala Gimnaziala Comuna Pirscoveni	32
25639	Scoala Gimnaziala Comuna Nicolae Titu Lescu	32
25640	Scoala Gimnaziala Comuna Leleasca	32
25641	Scoala Profesionala Speciala Bals	32
25642	Liceul Tehnologic Orasul Draganesti-olt	32
25643	Scoala Gimnaziala Buna Vestire	32
25644	Scoala Gimnaziala Comuna  Grojdibodu	32
25645	Gradinita Cu Program Prelungit Nr 8	32
25646	Scoala Gimnaziala Comuna Slatioara	32
25647	Scoala Gimnaziala Nr. 1 Slatina	32
25648	Scoala Gimnaziala Comuna Optasi Magura	32
25649	Scoala Gimnaziala Comuna Cungrea	32
25650	Scoala Gimnaziala Nr.2 Loc. Caracal Jud. Olt	32
25651	Liceul Tehnologic Orasul Piatra Olt	32
25652	Scoala Gimnaziala Vlaicu Voda Municipiul Slatina	32
25653	Scoala Gimnaziala Comuna Topana	32
25654	Scoala Gimnaziala Nr.3 Municipiul Slatina	32
25655	Scoala Gimnaziala Comuna Nicolae Titu Lescu	32
25656	Scoala Gimnaziala Comuna Movileni	32
25657	Scoala Gimnaziala Buna Vestire	32
25658	Liceul Tehnologic Comuna Tu Feni	32
25659	Liceul Teoretic Petre Pan Drea	32
25660	Scoala Gimnaziala Comuna Dobroteasa	32
25661	Scoala Gimnaziala Comuna Radomiresti	32
25662	Gradinita Cu Program Normal Dumbrava Minunata	32
25663	Scoala Gimnaziala  Comuna Stefan Cel Mare	32
25664	Gradinita Cu Program Prelungit Nr 7 Slatina	32
25665	Scoala Gimnaziala Nicolae Marineanu Comuna Cezieni	32
25666	Gradinita Cu Program Prelungit Nr.5 Slatina	32
25667	Scoala Gimnaziala Sat Alunisu Comuna Spineni	32
25668	Scoala Gimnaziala Comuna Mihaesti	32
25669	Scoala Gimnaziala Sat Margaritesti Comuna Voineasa	32
25670	Scoala Gimnaziala Comuna Soparlita	32
25671	Scoala Gimnaziala Gheorghe Magheru Loc.caracal Jud.olt	32
25672	Scoala Gimnaziala Ion I. Graure Comuna Balteni	32
25673	Scoala Gimnaziala Comuna Slatioara	32
25674	Scoala Gimnaziala Comuna Optasi Magura	32
25675	Scoala Gimnaziala Nr.2 Loc. Caracal Jud. Olt	32
25676	Gradinita Cu Program Prelungit Nr. 33 Municipiul Ploiesti	33
25677	Scoala Postliceala Sanitara Sf. Vasile Cel Mare	33
25678	Colegiul Tehnic Constantin Istrati Municipiul Campina	33
25679	Scoala Gimnaziala Comuna Gura Vadu Lui	33
25680	Liceul Tehnologic Ludovic Mrazek	33
25681	Scoala Gimnaziala Comuna Jugureni	33
25682	Scoala Gimnaziala George Cosbuc Municipiul Ploiesti	33
25683	Scoala Gimnaziala Canuta Ionescu Orasul Urlati	33
25684	Scoala Profesionala Speciala Orasul Breaza	33
25685	Scoala Gimnaziala Comuna Calugareni	33
25686	Scoala Gimnaziala Comuna Brazi	33
25687	Liceul Tehnologic Comuna Filipestii De Padure	33
25688	Gradinita Step By Step Cu Program Prelungit Si Program Normal Raza De Soare Municipiul Plc	33
25689	Scoala Profesionala Speciala Orasul Breaza	33
25690	Scoala Gimnaziala Eroilor Comuna Lipanesti	33
25691	Scoala Gimnaziala Comuna Gura Vadu Lui	33
25692	Scoala Gimnaziala Comuna Gornet	33
25693	Colegiul National Nicolae Iorga Orasul Valenii De Munte	33
25694	Scoala Gimnaziala Profdinu Mihail Dan Sat Magula Comuna Tomsani	33
25695	Scoala Gimnaziala Manastireanu Mihai Comuna Predeal Sarari	33
25696	Scoala Gimnaziala Comuna Cocorastii Colt	33
25697	Scoala Gimnaziala Elena Doamna Municipiul Ploiesti	33
25698	Liceul Tehnologic Energetic Municipiul Campina	33
25699	Scoala Gimnaziala Comuna Calugareni	33
25700	Scoala Gimnaziala Speciala Orasul Valenii De Munte	33
25701	Scoala Gimnaziala Comuna Dumbravesti	33
25702	Liceul Tehnologic Comuna Starchiojd	33
25703	Scoala Gimnaziala Nichita Stanescu Comuna Ceptura	33
25704	Colegiul National Nicolae Grigorescu	33
25705	Scoala Gimnaziala Nestor Urechia Orasul Busteni	33
25706	Scoala Gimnaziala Comuna Poienarii Burchii	33
25707	Scoala Gimnaziala Invatator Dinu Nicolae Comuna Dumbrava	33
25708	Scoala Gimnaziala Traian Savu Lescu Comuna Izvoarele	33
25709	Scoala Gimnaziala Radu Tu Doran Comuna Blejoi	33
25710	Scoala Gimnaziala Comuna Gornet	33
25711	Scoala Gimnaziala Sfantul Nicolae Orasul Mizil	33
25712	Scoala Gimnaziala I.a. Bassarabescu Municipiul Ploiesti	33
25713	Scoala Gimnaziala  Principesa Maria Orasul Sinaia	33
25714	Scoala Gimnaziala Speciala Nr.1 Municipiul Ploiesti	33
25715	Scoala Gimnaziala Comuna Calugareni	33
25716	Scoala Gimnaziala  Gheorghe Dibos Comuna Manesti	33
25717	Colegiul Tehnic Gheorghe Lazar  Orasul Plopeni	33
25718	Scoala Gimnaziala Comuna Cocorastii Colt	33
25719	Scoala Gimnaziala Comuna Plopu	33
25720	Scoala Gimnaziala Sat Posestii Paminteni	33
25721	Scoala Gimnaziala Comuna Cocorastii Mislii	33
25722	Liceul Tehnologic De Transporturi Municipiul Ploiesti	33
25723	Scoala Gimnaziala Comuna Brazi	33
25724	Gradinita Cu Program Prelungit Nr.2 Comuna Filipestii De Padure	33
25725	Scoala Gimnaziala Comuna Olari	33
25726	Scoala Gimnaziala Profesor Oprea Mihai Sat Negoiesti Comuna Brazi	33
25727	Gradinita Cu Program Prelungit Nr.28 Municipiul Ploiesti	33
25728	Scoala Gimnaziala Platon Mocanu Sat Drajna De Jos Comuna Drajna	33
25729	Scoala Gimnaziala Speciala Orasul Valenii De Munte	33
25730	Scoala Gimnaziala Comuna Sotrile	33
25731	Scoala Gimnaziala Comuna Fantanele	33
25732	Liceul Tehnologic Comuna Starchiojd	33
25733	Scoala Gimnaziala Comuna Cosminele	33
25734	Scoala Profesionala Speciala Orasul Plopeni	33
25735	Gradinita Cu Program Prelungit Nr. 21 Municipiul Ploiesti	33
25736	Liceul Tehnologic Sat Cioranii De Jos Comuna Ciorani	33
25737	Colegiul National Nicolae Grigorescu	33
25738	Liceul Tehnologic De Servicii Sfantul Apostol Andrei	33
25739	Gradinita Cu Program Prelungit Nr.9 Municipiul Campina	33
25740	Scoala Gimnaziala Grigore Moisil Municipiul Ploiesti	33
25741	Scoala Gimnaziala Traian Savu Lescu Comuna Izvoarele	33
25742	Scoala Gimnaziala Ion Campineanu Municipiul Campina	33
25743	Scoala Gimnaziala Comuna Talea	33
25744	Scoala Gimnaziala Comuna Stefesti	33
25745	Scoala Gimnaziala Comuna Carbunesti	33
25746	Scoala Gimnaziala Comuna Vilcan Esti	33
25747	Scoala Gimnaziala Traian Savu Lescu Comuna Izvoarele	33
25748	Scoala Gimnaziala Comuna Sotrile	33
25749	Colegiul Economic Virgil Madgearu	33
25750	Scoala Gimnaziala Nicolae Titulescu Municipiul Ploiesti	33
25751	Scoala Gimnaziala Sat Buda Comuna Rifov	33
25752	Scoala Profesionala Speciala Orasul Plopeni	33
25753	Colegiul National Ion Luca Caragiale Municipiul Ploiesti	33
25754	Scoala Gimnaziala George Emil Palade Municipiul Ploiesti	33
25755	Scoala Gimnaziala I.a. Bassarabescu Municipiul Ploiesti	33
25756	Liceul Tehnologic De Servicii Sfantul Apostol Andrei	33
25757	Liceul Tehologic Constantin Cantacuzino Orasul Baicoi	33
25758	Scoala De Subofiteri De Pompieri Si Protectie Civila Pavel Zagan Escu  Boldesti	33
25759	Scoala Gimnaziala Profdinu Mihail Dan Sat Magula Comuna Tomsani	33
25760	Scoala Gimnaziala Ion Campineanu Municipiul Campina	33
25761	Scoala Gimnaziala Gheorghe Costescu Comuna Alunis	33
25762	Liceul Tehnologic 1 Mai Municipiul Ploiesti	33
25763	Scoala Gimnaziala  Gheorghe Dibos Comuna Manesti	33
25764	Scoala Gimnaziala Comuna Tinosu	33
25765	Liceul Tehnologic Comuna Cerasu	33
25766	Scoala Gimnaziala Comuna Gura Vitioarei	33
25767	Liceul Tehologic Constantin Cantacuzino Orasul Baicoi	33
25768	Scoala Gimnaziala Nr 1 Orasul Mizil	33
25769	Liceul Tehnologic Mecanic Municipiul Campina	33
25770	Scoala Gimnaziala Comuna Lapos	33
25771	Scoala Gimnaziala Gheorghe Costescu Comuna Alunis	33
25772	Scoala Gimnaziala Andrei Mureșanu	33
25773	Scoala Gimnaziala Profesor Nicolae Simache Municipiul Ploiesti	33
25774	Scoala Gimnaziala Comuna Berceni	33
25775	Liceul Tehnologic Comuna Cerasu	33
25776	Scoala Gimnaziala Comuna Floresti	33
25777	Scoala Gimnaziala Comuna Batrani	33
25778	Scoala Gimnaziala Comuna Bertea	33
25779	Scoala Gimnaziala Comuna Soimari	33
25780	Scoala Gimnaziala Comuna Magureni	33
25781	Scoala Gimnaziala Gheorghe Lazar Comuna Barcanesti	33
25782	Scoala Gimnaziala Comuna Apostolache	33
25783	Scoala Gimnaziala Sat Varbila Comuna Iordacheanu	33
25784	Scoala Gimnaziala Comuna Su Rani	33
25785	Scoala Gimnaziala  Sat Maneciu Pamanteni Comuna Maneciu	33
25786	Liceul Simion Stolnicu Orasul Comarnic	33
25787	Colegiul Economic Virgil Madgearu	33
25788	Scoala Gimnaziala Comuna Vadu  Sapat	33
25789	Scoala Gimnaziala I.a. Bassarabescu Municipiul Ploiesti	33
25790	Scoala Gimnaziala Comuna Tirgsoru Vechi	33
25791	Colegiul National Ion Luca Caragiale Municipiul Ploiesti	33
25792	Scoala Gimnaziala Carol I Orasul Plopeni	33
25793	Scoala Gimnaziala  Gheorghe Dibos Comuna Manesti	33
25794	Scoala Gimnaziala Sat Marginenii De Jos Comuna Filipestii De Tirg	33
25795	Liceul Tehologic Constantin Cantacuzino Orasul Baicoi	33
25796	Scoala Gimnaziala Laurentiu Fulga	33
25797	Scoala Gimnaziala Sat Posestii Paminteni	33
25798	Gradinita Cu Program Prelungit Scufita Rosie Municipiul Ploiesti	33
25799	Scoala Gimnaziala Gheorghe Costescu Comuna Alunis	33
25800	Scoala Gimnaziala Profesor Nicolae Simache Municipiul Ploiesti	33
25801	Gradinita Cu Program Prelungit Nr.2 Comuna Filipestii De Padure	33
25802	Liceul Teoretic Comuna Filipestii De Padure	33
25803	Liceul Tehnologic Comuna Cerasu	33
25804	Scoala  Gimnaziala Comuna Gornet-cricov	33
25805	Scoala Gimnaziala Comuna Gherghita	33
25806	Scoala Gimnaziala Mitropolit Pimen Georgescu Comuna Provita De Sus	33
25807	Scoala Gimnaziala Comuna Berceni	33
25808	Scoala Gimnaziala Centrala Municipiul Campina	33
25809	Liceul Tehologic Constantin Cantacuzino Orasul Baicoi	33
25810	Scoala Gimnaziala Comuna Magurele	33
25811	Scoala Gimnaziala Andrei Mureșanu	33
25812	Scoala Gimnaziala Ioan Duhovnicul Comuna Banesti	33
25813	Scoala Gimnaziala Gheorghe Costescu Comuna Alunis	33
25814	Gradinita Cu Program Prelungit Nr. 38 Municipiul Ploiesti	33
25815	Scoala Gimnaziala Comuna Bertea	33
25816	Liceul Tehnologic Agricol Comuna Barcanesti	33
25817	Liceul Tehnologic Comuna Cerasu	33
25818	Scoala De Agenti De Politie Vasile Lascar	33
25819	Scoala Gimnaziala Comuna Floresti	33
25820	Scoala Gimnaziala Nr. 2 Orasul Boldesti-scaeni	33
25821	Scoala Gimnaziala Comuna Soimari	33
25822	Scoala Gimnaziala Inv. Athanasiejan Stoicescu  Comuna Aricestii Zeletin	33
25823	Scoala Gimnaziala Comuna Apostolache	33
25824	Scoala Gimnaziala Anton Pann Municipiul Ploiesti	33
25825	Scoala Gimnaziala Sat Varbila Comuna Iordacheanu	33
25826	Liceul Teoretic Aurel Vlaicu Orasul Breaza	33
25827	Scoala Gimnaziala Andrei Mureșanu	33
25828	Scoala Gimnaziala Mitropolit Pimen Georgescu Comuna Provita De Sus	33
25829	Liceul Teoretic Brancoveanu Voda Orasul Urlati	33
25830	Scoala Gimnaziala Comuna Magurele	33
25831	Scoala Gimnaziala Comuna Floresti	33
25832	Gradinita Cu Program Prelungit Nr. 38 Municipiul Ploiesti	33
25833	Scoala Gimnaziala Liliesti Orasul Baicoi	33
25834	Scoala De Agenti De Politie Vasile Lascar	33
25835	Scoala Gimnaziala Comuna Magureni	33
25836	Scoala Gimnaziala Inv. Athanasiejan Stoicescu  Comuna Aricestii Zeletin	33
25837	Scoala Gimnaziala Comuna Iordacheanu	33
25838	Scoala Gimnaziala Comuna Draganesti	33
25839	Scoala Gimnaziala Comuna Su Rani	33
25840	Scoala Gimnaziala Nr.1  Comuna Telega	33
25841	Scoala Gimnaziala Sfintii Imparati Comuna Balta Doamnei	33
25842	Colegiul National Alexandru Ioan Cuza  Municipiul Ploiesti	33
25843	Liceul Teoretic Serban Voda	33
25844	Scoala Gimnaziala  Ioan Grigorescu Municipiul Ploiesti	33
25845	Colegiul Economic Virgil Madgearu	33
25846	Liceul Teoretic Serban Voda	33
25847	Colegiul Economic Virgil Madgearu	33
25848	Liceul Simion Stolnicu Orasul Comarnic	33
25849	Colegiul National Ion Luca Caragiale Municipiul Ploiesti	33
25850	Scoala Gimnaziala Comuna Tirgsoru Vechi	33
25851	Liceul Tehologic Constantin Cantacuzino Orasul Baicoi	33
25852	Scoala Gimnaziala Sat Marginenii De Jos Comuna Filipestii De Tirg	33
25853	Scoala Gimnaziala Gheorghe Costescu Comuna Alunis	33
25854	Gradinita Cu Program Prelungit Scufita Rosie Municipiul Ploiesti	33
25855	Liceul Tehnologic Comuna Cerasu	33
25856	Liceul Teoretic Comuna Filipestii De Padure	33
25857	Scoala Gimnaziala Comuna Soimari	33
25858	Scoala Gimnaziala Mihai Viteazul Orasul Boldesti-scaeni	33
25859	Scoala Gimnaziala Sat Varbila Comuna Iordacheanu	33
25860	Gradinita Cu Program Prelungit Nr.35 Ploiesti	33
25861	Scoala Gimnaziala Constantin Brancoveanu	33
25862	Scoala Gimnaziala Sfanta Maria Orasul Mizil	33
25863	Liceul Tehnologic Administrativ Si De Servicii Victor Slavescu Municipiul Ploiesti	33
25864	Scoala Gimnaziala Sat Slon Comuna Cerasu	33
25865	Scoala Gimnaziala Comuna Podenii Noi	33
25866	Scoala Gimnaziala Ioan Moga Sat Ditesti Comuna Filipestii De Padure	33
25867	Scoala Gimnaziala Comuna Baba Ana	33
25868	Liceul Tehnologic Carol I	33
25869	Gradinita Cu Program Prelungit Scufita Rosie Municipiul Ploiesti	33
25870	Scoala Gimnaziala Matei Basarab Comuna Brebu	33
25871	Liceul Tehnologic Tase Dumitrescu Orasul Mizil	33
25872	Liceul Teoretic Comuna Filipestii De Padure	33
25873	Scoala Gimnaziala Comuna Varbilau	33
25874	Scoala Gimnaziala Mihai Viteazul Orasul Boldesti-scaeni	33
25875	Scoala Gimnaziala Profesor Eugeniu Corbu Sat Podgoria	33
25876	Gradinita Cu Program Prelungit Nr.35 Ploiesti	33
25877	Scoala Gimnaziala Sfanta Maria Orasul Mizil	33
25878	Scoala Gimnaziala Sat Slon Comuna Cerasu	33
25879	Colegiul National Nichita Stanescu Municipiul Ploiesti	33
25880	Liceul Tehnologic  Teodor Diamant Orasul Boldesti-scaeni	33
25881	Gradinita Cu Program Prelungit Nr.32 Municipiul Ploiesti	33
25882	Gradinita Cu Program Prelungit Dumbrava Minunata  Municipiul Ploiesti	33
25883	Scoala Gimnaziala Toma T. Socolescu Comuna Paulesti	33
25884	Scoala Gimnaziala Alexandru Ioan Cuza Municipiul Campina	33
25885	Scoala Gimnaziala Sat Dirvari Comuna Valea Calugareasca	33
25886	Gradinita Cu Program Prelungit Nr. 23 Municipiul Ploiesti	33
25887	Scoala Gimnaziala  Ioan Grigorescu Municipiul Ploiesti	33
25888	Liceul Tehnologic Anghel Saligny Municipiul Ploiesti	33
25889	Scoala Gimnaziala George Enescu Orasul Sinaia	33
25890	Scoala Gimnaziala Iuliu Maniu Zalau	35
25891	Scoala Postliceala Sanitara Christiana	35
25892	Scoala Gimnaziala Nr 1 Babeni	35
25893	Scoala Gimnaziala Nr 1 Simisna	35
25894	Scoala Gimnaziala Nr. 1 Romanasi	35
25895	Scoala Gimnaziala Nr. 1 Somes Odorhei	35
25896	Scoala Gimnaziala Nr 1 Cristolt	35
25897	Gradinita Cu Program Normal N. 8 Zalau	35
25898	Gradinita Cu Program Prelungit Casuta Cu Povesti Zalau	35
25899	Liceul Tehnologic Nr 1 Sarmasag	35
25900	Gradinita Cu Program Prelungit Piticii Isteti Zalau	35
25901	Liceul Reformat Wesselenyi	35
25902	Liceul Tehnologic Nr 1  Gilgau	35
25903	Scoala Gimnaziala Nr1  Banisor	35
25904	Liceul Cu Program Sportiv Avram Iancu	35
25905	Gradinita Cu Program Prelungit Nr. 5 Zalau	35
25906	Gradinita Cu Program Prelungit Casuta Cu Povesti Zalau	35
25907	Scoala Gimnaziala Aurelia Si Lazar Cosma Treznea	35
25908	Scoala Gimnaziala Nr 1 Marca	35
25909	Scoala Gimnaziala Nr1  Banisor	35
25910	Gradinita Cu Program Prelungit Piticii Isteti Zalau	35
25911	Scoala Postliceala Sanitara Zalau	35
25912	Scoala Gimnaziala Nr.1  Dragu	35
25913	Scoala Gimnaziala Nr.1 Almasu	35
25914	Liceul Tehnologic Nr 1  Gilgau	35
25915	Gradinita Cu Program Prelungit Nr.1 Zalau	35
25916	Scoalagimnaziala Nr 1 Mirsid	35
25917	Scoala Gimnaziala Nr 1 Ip	35
25918	Liceul Cu Program Sportiv Avram Iancu	35
25919	Scoala Gimnaziala Nr.1 Virsolt	35
25920	Scoala Gimnaziala  Nr.1 Valcau De Jos	35
25921	Liceul Teoretic Ion Agarbiceanu	35
25922	Liceul Tehnologic Voievodul Gelu Zalau	35
25923	Gradinita Cu Program Prelungit Ion Creanga Zalau	35
25924	Scoala Gimnaziala Nr 1 Pericei	35
25925	Scoala Gimnaziala Traian Cretu Napradea	35
25926	Scoala Gimnaziala Nr 1 Zimbor	35
25927	Liceul Tehnologic Voievodul Gelu Zalau	35
25928	Scoala Gimnaziala Gheorghe Lazar Zalau	35
25929	Scoala Postliceala Sanitara Zalau	35
25930	Scoala Gimnaziala Nr.1  Borla	35
25931	Scoala Gimnaziala Nr.1 Almasu	35
25932	Scoala Gimnaziala Nr.1  Panic	35
25933	Scoala Gimnaziala Vasile Breban Criseni	35
25934	Scoala Gimnaziala Nr 1 Cristolt	35
25935	Scoala Gimnaziala Nr.1 Virsolt	35
25936	Liceul Teoretic Ion Agarbiceanu	35
25937	Scoala Gimnaziala Nr 1 Pericei	35
25938	Gradinita Cu Program Prelungit Casuta Cu Povesti Zalau	35
25939	Scoala Gimnaziala Traian Cretu Napradea	35
25940	Gradinita Cu Program Prelungit Nr 3 Simleul Silvaniei	35
25941	Scoala Gimnaziala Aurelia Si Lazar Cosma Treznea	35
25942	Gradinita Cu Program Prelungit Piticii Isteti Zalau	35
25943	Liceul Tehnologic Nr. 1 Nusfalau	35
25944	Scoala Gimnaziala Gheorghe Sincai	35
25945	Scoala Gimnaziala Gyulaffy Laszlo	35
25946	Gradinita Cu Program Prelungit Nr 3 Simleul Silvaniei	35
25947	Scoala Gimnaziala Nr.1  Fildu De Mijloc	35
25948	Gradinita Cu Program Prelungit Piticii Isteti Zalau	35
25949	Scoala Gimnaziala Nr.1  Horoatu Crasnei	35
25950	Scoala Gimnaziala Andrei Mureșanu	35
25951	Gradinita Cu Program Preungit Voinicel	35
25952	Liceul Tehnologic Nr. 1 Nusfalau	35
25953	Liceul Tehnologic Ioan Ossian	35
25954	Scoala Gimnaziala Gheorghe Sincai	35
25955	Gradinita Cu Program Prelungit Nr. 12 Zalau	35
25956	Liceul Tehnologic Nr 1  Gilgau	35
25957	Scoala Gimnaziala Nr. 1 Lozna	35
25958	Scoala Gimnaziala Nr. 1 Coseiu	35
25959	Liceul Tehnologic Nr. 1 Sig	35
25960	Scoala Gimnaziala Petre Dulfu Salatig	35
25961	Liceul Cu Program Sportiv Avram Iancu	35
25962	Liceul Tehnologic Mihai Viteazul	35
25963	Gradinita Cu Program Prelungit Prichindel	35
25964	Scoala Gimnaziala Nr.1 Jebucu	35
25965	Scoala Gimnaziala Horea	35
25966	Liceul Tehnologic Ioan Ossian	35
25967	Scoala Gimnaziala Petre Dulfu Salatig	35
25968	Scoala Gimnaziala Nr.1 Maeriste	35
25969	Scoala Gimnaziala Nr.1 Deja	35
25970	Gradinita Cu Program Prelungit Nr. 12 Zalau	35
25971	Scoala Gimnaziala  Nr.1 Valcau De Jos	35
25972	Scoala Gimnaziala Nr. 1 Zalha	35
25973	Scoala Gimnaziala Nr.1 Boghis	35
25974	Scoala Gimnaziala Nr. 1 Lozna	35
25975	Scoala Gimnaziala Nr.1 Jebucu	35
25976	Scoala Gimnaziala Nr 1 Chiesd	35
25977	Scoala Gimnaziala Nr.1 Cuzaplac	35
25978	Scoala Gimnaziala Petri Mor Nusfalau	35
25979	Liceul Tehnologic Voievodul Gelu Zalau	35
25980	Scoala Gimnaziala Nr.1 Sinmihaiu Almasu Lui	35
25981	Scoala Gimnaziala Nr.1  Balan	35
25982	Scoala Gimnaziala Nr 1 Zimbor	35
25983	Gradinita Cu Program Prelungit Nr 2	35
25984	Scoala Gimnaziala Gheorghe Lazar Zalau	35
25985	Scoala Gimnaziala Lucian Blaga Jibou	35
25986	Scoala Gimnaziala Nr.1  Fildu De Mijloc	35
25987	Scoala Gimnaziala Nr 1 Zimbor	35
25988	Scoala Gimnaziala Nr.1  Horoatu Crasnei	35
25989	Scoala Gimnaziala Gheorghe Lazar Zalau	35
25990	Gradinita Cu Program Preungit Voinicel	35
25991	Scoala Gimnaziala Nr.1  Borla	35
25992	Liceul Tehnologic Ioan Ossian	35
25993	Scoala Gimnaziala Nr.1  Panic	35
25994	Gradinita Cu Program Prelungit Nr. 12 Zalau	35
25995	Scoala Gimnaziala Nr. 1 Lozna	35
25996	Gradinita Cu Program Prelungit Nr.6 Satu Mare	34
25997	Scoala Gimnaziala Pomi	34
25998	Scoala Gimnaziala Porumbesti	34
25999	Gradinita Cu Program Prelungit Nr.13 Satu Mare	34
26000	Gradinita Cu Program Saptamanal Floarea De Lotus Odoreu	34
26001	Scoala Gimnaziala Poiana Codrului	34
26002	Scoala Gimnaziala Calinesti Oas	34
26003	Gradinita Cu Program Prelungit Nr.5	34
26004	Scoala Gimnaziala Pir	34
26005	Scoala Gimnaziala Santau	34
26006	Scoala Gimnaziala Tiream	34
26007	Scoala Gimnaziala Poiana Codrului	34
26008	Scoala Gimnaziala Nr. 3	34
26009	Scoala Gimnaziala Camin	34
26010	Scoala  Gimnaziala  Batarci	34
26011	Gradinita Cu Program Prelungit Nr.5	34
26012	Scoala Gimnaziala Vama	34
26013	Colegiul National Ioan Slavici Satu Mare	34
26014	Gradinita Cu Program Prelungit Nr.1 Tasnad	34
26015	Scoala Gimnaziala Santau	34
26016	Liceul Tehnologic George Baritiu Livada	34
26017	Scoala Gimnaziala Tasnad	34
26018	Liceul Teologic Ortodox Nicolae Steinhardt	34
26019	Scoala Gimnaziala Porumbesti	34
26020	Liceul Tehnologic Ionita G. Andron Negresti Oas	34
26021	Scoala De Arte Satu Mare	34
26022	Scoala Gimnaziala Dorolt	34
26023	Gradinita Cu Program Prelungit Guliver	34
26024	Gradinita Cu Program Prelungit Dumbrava Minunata	34
26025	Colegiul National Mihai Eminescu	34
26026	Scoala Gimnaziala George Cosbuc  Mediesu Aurit	34
26027	Liceul Teologic Romano Catolic Ham Janos	34
26028	Liceul Romano Catolic Josephus Calasantius	34
26029	Scoala Gimnaziala Vama	34
26030	Scoala     Gimnaziala   Valea  Vinului	34
26031	Scoala Gimnaziala Pir	34
26032	Scoala Gimnaziala Grigore Moisil	34
26033	Gradinita Cu Program Prelungit Nr.1 Tasnad	34
26034	Scoala Gimnaziala Ciumesti	34
26035	Scoala Gimnaziala Doba	34
26036	Scoala Gimnaziala Dr.vasile Lucaciu Satu Mare	34
26037	Liceul Tehnologic George Baritiu Livada	34
26038	Liceul Cu Program Sportiv Satu Mare	34
26039	Liceul Tehnologic Anghel Saligny Turt	34
26040	Colegiul Tehnic Iuliu Maniu	34
26041	Liceul Teologic Ortodox Nicolae Steinhardt	34
26042	Colegiul Economic Gheorghe Dragos	34
26043	Scoala Gimnaziala Lucian Blaga	34
26044	Scoala Gimnaziala Oar	34
26045	Liceul Tehnologic Ionita G. Andron Negresti Oas	34
26046	Scoala Gimnaziala Nr.1	34
26047	Liceul Teologic Romano Catolic Ham Janos	34
26048	Scoala Gimnaziala Cu Lciu Mare	34
26049	Scoala Gimnaziala Foieni	34
26050	Liceul Teoretic Carei	34
26051	Scoala Gimnaziala Pir	34
26052	Gradinita Cu Program Prelungit Nr.1 Negresti Oas	34
26053	Scoala Gimnaziala Acas	34
26054	Scoala  Gimnaziala  Vasile Lucaciu  Apa	34
26055	Scoala Gimnaziala Doba	34
26056	Scoala Gimnaziala Orasu Nou	34
26057	Scoala Gimnaziala „ Vasile Lucaciu „ Lucaceni	34
26058	Scoala Gimnaziala Sauca	34
26059	Liceul Tehnologic Anghel Saligny Turt	34
26060	Scoala Gimnaziala Odoreu	34
26061	Gradinita Cu Program Prelungit Nr.7	34
26062	Scoala Gimnaziala Vasile Lucaciu	34
26063	Scoala Gimnaziala Lucian Blaga	34
26064	Scoala Gimnaziala Octavian Goga	34
26065	Scoala Gimnaziala Socond	34
26066	Scoala Gimnaziala Andrid	34
26067	Scoala Gimnaziala Berveni	34
26068	Scoala Gimnaziala Ion Creanga	34
26069	Scoala Gimnaziala Tasnad	34
26070	Scoala Gimnaziala Balcescu Petofi	34
26071	Scoala Gimnaziala Ratesti	34
26072	Gradinita Cu Program Prelungit Voinicelul	34
26073	Scoala Gimnaziala Ciumesti	34
26074	Scoala Gimnaziala Tirsolt	34
26075	Liceul Tehnologic Tarna Mare	34
26076	Scoala Gimnaziala Aurel Haiduc Trip	34
26077	Scoala De Arte Satu Mare	34
26078	Colegiul Tehnic De Transporturi Si Telecomunicatii Ion I.c.bratianu Satu Mare	34
26079	Scoala Gimnaziala Halmeu	34
26080	Gradinita Cu Program Prelungit Ardud	34
26081	Liceul Cu Program Sportiv Satu Mare	34
26082	Gradinita Cu Programprlungit Nr.7	34
26083	Scoala Gimnaziala Avram Iancu	34
26084	Liceul Tehnologic Petofi Sandor Lazuri	34
26085	Colegiul National Mihai Eminescu	34
26086	Liceul Tehnologic Anghel Saligny Turt	34
26087	Scoala Gimnaziala Nr.1 Carei	34
26088	Scoala Gimnaziala Gheorghe Bulgar Sanislau	34
26089	Liceul Teoreticnegresti Oas	34
26090	Scoala Gimnaziala Tempfli Jozsef Urziceni	34
26091	Scoala Gimnaziala Botiz	34
26092	Scoala Gimnaziala Viorel Salagean-beltiug	34
26093	Liceul Tehnologic Constantin Brancusi	34
26094	Colegiul National Doamna Stanca	34
26095	Gradinita Cu Program Prelungit Draga Mea Satu Mare	34
26096	Colegiul Tehnic Unio-traian Vuia Satu Mare	34
26097	Scoala Gimnaziala Terebesti	34
26098	Gradinita Cu Program Prelungit Nr.1	34
26099	Colegiul Tehnic Elisa Zamfirescu	34
26100	Scoala Gimnaziala Paulesti	34
26101	Scoala Gimnaziala Mircea Eliade	34
26102	Scoala Gimnaziala Piscolt	34
26103	Scoala Gimnaziala Gherta Mica	34
26104	Liceul Tehnologic Ardud	34
26105	Liceul Tehnologic Petru Cupcea Supuru De Jos	34
26106	Liceul Tehnologic Tasnad	34
26107	Scoala Gimnaziala Odoreu	34
26108	Scoala Gimnaziala Gellert Sandor Micu La	34
26109	Scoala Gimnaziala Vasile Lucaciu	34
26110	Scoala Gimnaziala Craidorolt	34
26111	Scoala Gimnaziala Octavian Goga	34
26112	Scoala Gimnaziala Cehal	34
26113	Scoala Gimnaziala Certeze	34
26114	Scoala Gimnaziala Nr.1 Carei	34
26115	Scoala Gimnaziala Gheorghe Bulgar Sanislau	34
26116	Scoala Gimnaziala Botiz	34
26117	Scoala Gimnaziala Viorel Salagean-beltiug	34
26118	Gradinita Cu Program Prelungit Draga Mea Satu Mare	34
26119	Colegiul Tehnic Unio-traian Vuia Satu Mare	34
26120	Scoala Gimnaziala Terebesti	34
26121	Scoala Gimnaziala Paulesti	34
26122	Colegiul Tehnic Elisa Zamfirescu	34
26123	Scoala Gimnaziala Mircea Eliade	34
26124	Scoala Gimnaziala Gherta Mica	34
26125	Liceul Tehnologic Petru Cupcea Supuru De Jos	34
26126	Scoala Gimnaziala Constantin Brancoveanu	34
26127	Liceul Tehnologic Nicolae Teclu Copsa Mica	36
26128	Gradinita Cu Program Prelungit Nr.17 Sibiu	36
26129	Scoala Gimnaziala Mihai Viteazu Selimbar	36
26130	Universitatea Lucian Blaga	36
26131	Scoala Gimnaziala Ion Pop Reteganul Orlat	36
26132	Liceul Tehnologic Scoala Nationala De Gaz Medias	36
26133	Scoala Gimnaziala Cristian	36
26134	Liceul Tehnologic Cisnadie	36
26135	Scoala Gimnaziala Radu Selejan Sibiu	36
26136	Scoala Gimnaziala Bruiu	36
26137	Gradinita Cu Program  Prelungit Nr. 43 Sibiu	36
26138	Scoala Gimnaziala Stephan  Ludwig Roth Mosna	36
26139	Scoala  Gimnaziala Nr.23 Sibiu	36
26140	Scoala Gimnaziala Sura Mica	36
26141	Scoala Gimnaziala -viorel Cucu Paltin- Arpasu De Jos	36
26142	Scoala Gimnaziala Rosia	36
26143	Liceul Teoretic Gustav Gundisch Cisnadie	36
26144	Scoala Gimnaziala Seica Mica	36
26145	Scoala Gimnaziala Matei Basarab Turnu Rosu	36
26146	Gradinita Cu Program Prelungit Dumbrava Minunata Medias	36
26147	Scoala Gimnaziala Altina	36
26148	Colegiul National Samuel Von Brukenthal Sibiu	36
26149	Scoala Gimnaziala Apoldu De Jos	36
26150	Gradinita Cu Program  Prelungit Nr. 43 Sibiu	36
26151	Scoala Gimnaziala Corneliu Pacurariu Micasasa	36
26152	Liceul Teoretic Axente Sever Medias	36
26153	Gradinita Cu Program Prelungit Nr. 28 Sibiu	36
26154	Scoala Gimnaziala Ion Pop Reteganul Orlat	36
26155	Scoala Gimnaziala  Chirpar	36
26156	Gradinita Cu Program Prelungit Nr.18 Sibiu	36
26157	Scoala Gimnaziala Axente Sever	36
26158	Liceul Tehnologic Scoala Nationala De Gaz Medias	36
26159	Gradinita Cu Program Prelungit  Pinocchio  Medias	36
26160	Gradinita Cu Program Prelungit Bucuria Copiilor Medias	36
26161	Scoala Gimnaziala  Biertan	36
26162	Scoala Gimnaziala Regele Ferdinand Sibiu	36
26163	Liceul  Tehnologic  Iacobeni	36
26164	Scoala  Gimnaziala Ighisu Nou	36
26165	Gradinita Cu Program Prelungit Nr. 42 Sibiu	36
26166	Scoala Gimnaziala Seica Mica	36
26167	Scoala Gimnaziala Ioan Slavici Sibiu	36
26168	Gradinita Cu Program Prelungit Nr.14 Sibiu	36
26169	Scoala Gimnaziala Altina	36
26170	Colegiul National Samuel Von Brukenthal Sibiu	36
26171	Scoala Gimnaziala Georg Daniel Teutsch Agnita	36
26172	Scoala Gimnaziala Ocna Sibiului	36
26173	Scoala Gimnaziala Apoldu De Jos	36
26174	Scoala Gimnaziala Constantin Ioan Motas Medias	36
26175	Scoala Gimnaziala Mihaileni	36
26176	Gradinita Cu Program Prelungit Piticot Medias	36
26177	Scoala Gimnaziala Corneliu Pacurariu Micasasa	36
26178	Liceul Teoretic Axente Sever Medias	36
26179	Gradinita Cu Program Prelungit Nr. 37 Sibiu	36
26180	Scoala Gimnaziala Aurel Decei Gura Raului	36
26181	Gradinita Cu Program Prelungit Nr. 28 Sibiu	36
26182	Scoala Gimnaziala Pauca	36
26183	Liceul De Arta Sibiu	36
26184	Scoala Gimnaziala Nr.10 Sibiu	36
26185	Scoala Gimnaziala  Chirpar	36
26186	Gradinita Cu Program Prelungit Nr. 37 Sibiu	36
26187	Scoala Gimnaziala Avrig	36
26188	Liceul Tehnologic Constructii Si Arhitectura Carol I Sibiu	36
26189	Scoala Gimnaziala Nr.2 Cisnadie	36
26190	Liceul De Arta Sibiu	36
26191	Scoala Gimnaziala Nicolae Iorga Sibiu	36
26192	Scoala Gimnaziala Seica Mica	36
26193	Scoala Gimnaziala Altina	36
26194	Gradinita Cu Program Prelungit Raza De Soare Medias	36
26195	Gradinita Cu Program Prelungit Nr.14 Sibiu	36
26196	Scoala Gimnaziala Ioan Slavici Sibiu	36
26197	Scoala Gimnaziala Apoldu De Jos	36
26198	Scoala Gimnaziala  Andrei Saguna Sura Mare	36
26199	Scoala Gimnaziala Ocna Sibiului	36
26200	Scoala Gimnaziala Constantin Ioan Motas Medias	36
26201	Scoala Gimnaziala Corneliu Pacurariu Micasasa	36
26202	Scoala Gimnaziala Pauca	36
26203	Gradinita Cu Program Prelungit Piticot Medias	36
26204	Scoala Gimnaziala Nr.2 Sibiu	36
26205	Gradinita Cu Program Prelungit Nr. 28 Sibiu	36
26206	Scoala Gimnaziala Bathory Istvan Medias	36
26207	Colegiul National Octavian Goga Sibiu	36
26208	Gradinita Cu Program Prelungit Nr. 42 Sibiu	36
26209	Gradinita Cu Program Prelungit Raza De Soare Medias	36
26210	Colegiul National Pedagogic Andrei Saguna Sibiu	36
26211	Scoala Gimnaziala Nr. 5 Medias	36
26212	Liceul Tehnologic Automecanica Medias	36
26213	Scoala  Gimnaziala Ighisu Nou	36
26214	Gradinita Cu Program Prelungit Nr.33 Sibiu	36
26215	Scoala Gimnaziala Nr.7 Medias	36
26216	Liceul Teoretic Constantin Noica Sibiu	36
26217	Scoala Gimnaziala  Andrei Saguna Sura Mare	36
26218	Scoala  Gimnaziala  Blajel	36
26219	Liceul Tehnologic  Ilie Macelariu Miercurea Sibiului	36
26220	Scoala Gimnaziala Porumbacu De Jos	36
26221	Scoala Gimnaziala Vurpar	36
26222	Gradinita Cu Program Prelungit Nr. 16 Sibiu	36
26223	Scoala Gimnaziala Badea Cirtan Cirtisoara	36
26224	Scoala Gimnaziala Sava Popovici Barcianu Rasinari	36
26225	Gradinita Cu Program Prelungit Nr. 26 Sibiu	36
26226	Scoala Gimnaziala Apoldu De Jos	36
26227	Scoala Gimnaziala Marpod	36
26228	Gradinita Cu Program Prelungit Nr. 26 Sibiu	36
26229	Universitatea Lucian Blaga Din Sibiu	36
26230	Colegiul Tehnic Mediensis Medias	36
26231	Scoala Gimnaziala Corneliu Pacurariu Micasasa	36
26232	Scoala Gimnaziala Tilisca	36
26233	Colegiul Tehnic Cibinium Sibiu	36
26234	Scoala Gimnaziala Nr. 25 Sibiu	36
26235	Gradinita Cu Program Prelungit Nr. 28 Sibiu	36
26236	Scoala Gimnaziala Birghis	36
26237	Scoala Gimnaziala Regina Maria Sibiu	36
26238	Gradinita Cu Program Prelungit Nr.19 Sibiu	36
26239	Scoala Gimnaziala  Chirpar	36
26240	Scoala Gimnaziala Mihai Eminescu Medias	36
26241	Scoala Gimnaziala Ioan Moraru Dirlos	36
26242	Gradinita Cu Program Prelungit Fratii Grimm Sibiu	36
26243	Scoala Gimnaziala Axente Sever	36
26244	Scoala Gimnaziala Hermann Oberth Medias	36
26245	Scoala Gimnaziala Nr 18 Sibiu	36
26246	Gradinita Cu Program Prelungit Nr. 16 Sibiu	36
26247	Scoala Gimnaziala Poplaca	36
26248	Gradinita Cu Program Prelungit Elefantelul Curios Sibiu	36
26249	Liceul Tehnologic Ioan Lupas Saliste	36
26250	Colegiul Tehnic Energetic Sibiu	36
26251	Scoala Gimnaziala Seica Mare	36
26252	Gradinita Cu Program Prelungit Nr.15 Sibiu	36
26253	Gradinita Cu Program Prelungit Micul Print Medias	36
26254	Colegiul Tehnic August Treboniu Laurian Agnita	36
26255	Scoala Gimnaziala Merghindeal	36
26256	Scoala Gimnaziala Slimnic	36
26257	Scoala Gimnaziala Alma	36
26258	Scoala Gimnaziala Ilie Micu Ludos	36
26259	Liceul Tehnologic Henri Coanda Sibiu	36
26260	Scoala Gimnaziala Riu Sadului	36
26261	Scoala Gimnaziala Ciresarii Medias	36
26262	Scoala Gimnaziala Racovita	36
26263	Scoala Gimnaziala Nocrich	36
26264	Liceul Teoretic Onisifor Ghibu Sibiu	36
26265	Scoala Gimnaziala Bradeni	36
26266	Scoala Gimnaziala Ion Albescu Boita	36
26267	Scoala Gimnaziala Nr.21 Sibiu	36
26268	Scoala Gimnaziala Nr.8 Sibiu	36
26269	Colegiul Tehnic Independenta Sibiu	36
26270	Scoala Gimnaziala  George Popa Medias	36
26271	Scoala Gimnaziala  Martian Negrea  Valea Viilor	36
26272	Scoala Gimnaziala Nr 1 Sibiu	36
26273	Scoala Gimnaziala Marpod	36
26274	Universitatea Stefan Cel Mare Din Suceava	37
26275	Scoala Gimnaziala Dimitrie Gusti	37
26276	Scoala Gimnaziala Maritei	37
26277	Scoala Gimnaziala Siminicea	37
26278	Scoala Gimnaziala Nr 2 Iaslovat	37
26279	Scoala Gimnaziala Mihai Eminescu Radauti	37
26280	Scoala Gimnaziala Simion Florea Marian Ilisesti	37
26281	Scoala  Gimnaziala Iulian  Vesper  Horodnic De  Sus	37
26282	Gradinita Samariteanul Nr. 20 Suceava	37
26283	Gradinita Cu Program Normal Tandarica	37
26284	Gradinita Cu Program Prelungi Prichindelul Radauti	37
26285	Scoala Gimnaziala Moara Nica	37
26286	Colegiul National Stefan Cel Mare	37
26287	Scoala Gimnaziala Mihai Eminescu Radauti	37
26288	Scoala Gimnaziala Nr.1 Vicovu De Sus	37
26289	Scoala  Gimnaziala Iulian  Vesper  Horodnic De  Sus	37
26290	Scoala Postliceala Sanitara Suceava	37
26291	Scoala Gimnaziala Rotu Nda	37
26292	Scoala Gimnaziala Nr. 2 Vicovu De Sus	37
26293	Gradinita Cu Program Prelungit Casuta Piticilor	37
26294	Scoala Gimnaziala  Constantin Tomescu Plesesti	37
26295	Gradinita Cu Program Normal Tandarica	37
26296	Scoala  Gimnaziala  Pahomie C Vasiliu  Gramesti	37
26297	Scoala Gimnaziala Moara Nica	37
26298	Scoala Gimnaziala Partestii De Sus	37
26299	Scoala Gimnaziala Salcea	37
26300	Scoala Gimnaziala Sadova	37
26301	Scoala Gimnaziala Maritei	37
26302	Scoala  Gimnaziala Hatmanul Sendrea Dolh Esti	37
26303	Scoala Gimnaziala Volovat	37
26304	Scoala Gimnaziala Dimitrie Onciul Straja	37
26305	Scoala Gimnaziala Poieni-solca	37
26306	Scoala Gimnaziala  Dimitrie Vatamaniuc Sucevita	37
26307	Scoala Postliceala Sanitara Suceava	37
26308	Scoala Gimnaziala Berchisesti	37
26309	Scoala Gimnaziala Mihai Eminescu Radauti	37
26310	Scoala Gimnaziala Ipotesti	37
26311	Scoala Gimnaziala Nr. 2 Vicovu De Sus	37
26312	Scoala Gimnaziala Nr 1 Vadu Moldovei	37
26313	Scoala Gimnaziala Poieni-solca	37
26314	Scoala Gimnaziala Vornicu Simion Tautu  Comanesti	37
26315	Scoala Gimnaziala  Constantin Tomescu Plesesti	37
26316	Liceul Tehnologic Iorgu Varnav Liteanu	37
26317	Colegiul National Petru Rares Suceava	37
26318	Scoala Gimnaziala Ulma	37
26319	Scoala  Gimnaziala  Pahomie C Vasiliu  Gramesti	37
26320	Scoala Gimnaziala Grigore Ghica Voievod Suceava	37
26321	Scoala Gimnaziala Ostra	37
26322	Scoala Gimnaziala Ioan Ciurea Falticeni	37
26323	Scoala Gimnaziala Partestii De Sus	37
26324	Scoala Gimnaziala Preutesti	37
26325	Gradinita Cu Program Normal Tandarica	37
26326	Scoala Gimnaziala  Constantin Tomescu Plesesti	37
26327	Scoala Gimnaziala Nr 1 Vadu Moldovei	37
26328	Colegiul National Mihai Eminescu Suceava	37
26329	Colegiul National De Informatica Spiru Haret	37
26330	Scoala  Gimnaziala  Pahomie C Vasiliu  Gramesti	37
26331	Scoala Gimnaziala Vornicu Simion Tautu  Comanesti	37
26332	Scoala Gimnaziala Dorn Esti	37
26333	Scoala Gimnaziala Pojorita	37
26334	Scoala Gimnaziala Partestii De Sus	37
26335	Liceul Tehnologic Iorgu Varnav Liteanu	37
26336	Gradinita Cu Program Normal Lumea Copilariei  Gura Humorului	37
26337	Scoala Gimnaziala Brodina	37
26338	Scoala Gimnaziala Sadova	37
26339	Scoala Gimnaziala Ulma	37
26340	Gradinita Cu Program Prelungit Alba Ca Zapada Vatra Dornei	37
26341	Gradinita Cu Program Prelungit Micul Print	37
26342	Scoala  Gimnaziala Hatmanul Sendrea Dolh Esti	37
26343	Scoala Gimnaziala Grigore Ghica Voievod Suceava	37
26344	Scoala  Gimnaziala Voitinel	37
26345	Scoala Gimnaziala Stefan Cel Mare Cirlibaba	37
26346	Scoala Gimnaziala Calafindesti	37
26347	Colegiul National Stefan Cel Mare	37
26348	Scoala Gimnaziala Nr 4 Vatra Dornei	37
26349	Scoala Gimnaziala Grigore Ghica Voievod Suceava	37
26350	Scoala Gimnaziala Bogdan Voda	37
26351	Liceul Teoretic Ion Luca Vatra Dornei	37
26352	Scoala Gimnaziala Mihai Halunga Hantesti	37
26353	Scoala Gimnaziala Ioan Ciurea Falticeni	37
26354	Scoala Gimnaziala Nicolae Labis Malini	37
26355	Scoala Gimnaziala Nr.1 Vicovu De Sus	37
26356	Scoala Gimnaziala Bosanci	37
26357	Scoala Gimnaziala Preutesti	37
26358	Liceul Tehnologic Oltea Doamna Dolhasca	37
26359	Colegiul Tehnic Mihai Bacescu Falticeni	37
26360	Gradinita Cu Program Prelungit1-2-3	37
26361	Scoala Gimnaziala Nr. 4 Suceava	37
26362	Colegiul Andronic Motrescu	37
26363	Scoala Postliceala Sanitara Suceava	37
26364	Scoala Gimnaziala Bainet	37
26365	Scoala Gimnaziala Dragoiesti	37
26366	Scoala Gimnaziala Nr 1 Iaslovat	37
26367	Scoala Gimnaziala Academician Haralambie Mihaescu Udesti	37
26368	Scoala Gimnaziala Nr. 2 Vicovu De Sus	37
26369	Scoala Gimnaziala Cosna	37
26370	Colegiul National Mihai Eminescu Suceava	37
26371	Scoala Gimnaziala Ion Pintilie Maneuti	37
26372	Scoala Gimnaziala  Constantin Tomescu Plesesti	37
26373	Gradinita Cu Program Normal Casuta Povestilor Vatra Dornei	37
26374	Scoala Gimnaziala Vatra Moldovitei	37
26375	Scoala Gimnaziala Mitocu Dragomirnei	37
26376	Scoala  Gimnaziala  Pahomie C Vasiliu  Gramesti	37
26377	Liceul Tehnologic Mihai Eminescu Dumbraveni	37
26378	Scoala Gimnaziala Artur Gorovei Bunesti	37
26379	Scoala Gimnaziala Nr. 8 Suceava	37
26380	Scoala Gimnaziala Partestii De Sus	37
26381	Scoala Gimnaziala Risca	37
26382	Liceul Teoretic Ion Luca Vatra Dornei	37
26383	Scoala Gimnaziala Nr.2 Vatra Dornei	37
26384	Scoala Gimnaziala Sadova	37
26385	Scoala Gimnaziala Dorna Arini	37
26386	Scoala Gimnaziala Fratautii Vechi	37
26387	Scoala Gimnaziala Preutesti	37
26388	Scoala Gimnaziala Nr 6 Suceava	37
26389	Scoala Gimnaziala George Tofan Bilca	37
26390	Scoala Gimnaziala Ion Barbir	37
26391	Scoala Postliceala Sanitara Suceava	37
26392	Scoala Gimnaziala Veresti	37
26393	Scoala Gimnaziala Nr. 1 Vatra Dornei	37
26394	Scoala Gimnaziala  Mihai Eminescu  Banesti	37
26395	Scoala Gimnaziala Bainet	37
26396	Colegiul Tehnic Latcu Voda Siret	37
26397	Scoala Gimnaziala Burla	37
26398	Scoala Gimnaziala Constantin Morariu Patrauti	37
26399	Scoala Gimnaziala Nr. 2 Vicovu De Sus	37
26400	Scoala Gimnaziala Nr.1gura Humorului	37
26401	Scoala Gimnaziala Speciala Sf Stelian Radauti	37
26402	Scoala Gimnaziala ..i.g.sbiera.. Horodnic De Jos	37
26403	Scoala Gimnaziala Gainesti	37
26404	Scoala Gimnaziala Herla	37
26405	Scoala Gimnaziala Mihail Sadoveanu Granicesti	37
26406	Colegiul National De Informatica Spiru Haret	37
26407	Universitatea Stefan Cel Mare Din Suceava	37
26408	Scoala Gimnaziala George Tofan Bilca	37
26409	Colegiul Alexandru Cel Bun Gura Humorului	37
26410	Scoala Gimnaziala Pojorita	37
26411	Liceul Tehnologic Nicanor Morosan Pirtestii De Jos	37
26412	Scoala Gimnaziala Nr. 1 Vatra Dornei	37
26413	Liceul Tehnologic Special Bivolarie	37
26414	Scoala Gimnaziala Brodina	37
26415	Scoala Gimnaziala Burla	37
26416	Gradinita Cu Program Prelungit Micul Print	37
26417	Scoala Gimnaziala Speciala Sf Stelian Radauti	37
26418	Scoala Gimnaziala Stefan Cel Mare Cirlibaba	37
26419	Scoala Gimnaziala Mihail Sadoveanu Granicesti	37
26420	Scoala Gimnaziala Nr. 2 Marginea	37
26421	Scoala Gimnaziala Iraclie Porumbescu Fratautii Noi	37
26422	Colegiul National Nicu Gane Falticeni	37
26423	Scoala Gimnaziala Stroiesti	37
26424	Scoala Gimnaziala Ion Lovinescu Radaseni	37
26425	Gradinita Cu Program Normal Voinicelul Falticeni	37
26426	Gradinita Cu Program Prelungit Prichindel	37
26427	Scoala Gimnaziala Teodor V Stefanelli Campulung Moldovenesc	37
26428	Liceul Tehnologic Ion Nistor Vicovu De Sus	37
26429	Scoala Gimnaziala Neagra Sarului	37
26430	Scoala Gimnaziala Panaci	37
26431	Liceul Tehnologic Tomsa Voda Solca	37
26432	Scoala Gimnaziala Baisesti	37
26433	Scoala Gimnaziala Cornu Luncii	37
26434	Scoala Gimnaziala Cosna	37
26435	Scoala Gimnaziala Fratautii Vechi	37
26436	Gradinita Cu Program Normal Casuta Povestilor Vatra Dornei	37
26437	Colegiul Economic Dimitrie Cantemir Suceava	37
26438	Liceul Tehnologic Mihai Eminescu Dumbraveni	37
26439	Scoala Gimnaziala Nr 6 Suceava	37
26440	Scoala Gimnaziala Risca	37
26441	Scoala Gimnaziala Ion Muceleanu Fantana Mare	37
26442	Scoala Gimnaziala Dorna Arini	37
26443	Scoala Gimnaziala Ion Barbir	37
26444	Scoala Gimnaziala Calafindesti	37
26445	Scoala Profesionala Speciala Campulung Moldovenesc	37
26446	Scoala Gimnaziala Constantin Morariu Patrauti	37
26447	Scoala Gimnaziala Teodor Balan	37
26448	Scoala Gimnaziala Nr.1gura Humorului	37
26449	Scoala Gimnaziala Bivolarie	37
26450	Scoala Gimnaziala ..i.g.sbiera.. Horodnic De Jos	37
26451	Scoala Gimnaziala Crucea	37
26452	Scoala Gimnaziala Herla	37
26453	Liceul Tehnologic Vasile Gherasim Marginea	37
26454	Scoala Gimnaziala Regina Elisabeta Radauti	37
26455	Scoala Gimnaziala Krystyna Bochenek Poiana Micului	37
26456	Liceul Tehnologic Liviu Suhar Iacobeni	37
26457	Colegiul Tehnic Samuil Isopescu Suceava	37
26458	Scoala Gimnaziala Bogdan Voda Campulung Moldovenesc	37
26459	Colegiul National Eudoxiu Hurmuzachi Radauti	37
26460	Scoala Gimnaziala Cristofor Simionescu Plopeni	37
26461	Colegiul National Dragos Voda	37
26462	Colegiul Tehnic Al.i.cuza Suceava	37
26463	Scoala Gimnaziala Petru Musat Siret	37
26464	Scoala Gimnaziala Satu Mare	37
26465	Scoala Gimnaziala Ciocanesti	37
26466	Scoala Gimnaziala ..i.g.sbiera.. Horodnic De Jos	37
26467	Gradinita Cu Program Prelungit1-2-3	37
26468	Scoala Gimnaziala Herla	37
26469	Colegiul Andronic Motrescu	37
26470	Scoala Gimnaziala Regina Elisabeta Radauti	37
26471	Liceul Tehnologic Liviu Suhar Iacobeni	37
26472	Scoala Gimnaziala Bogdan Voda Campulung Moldovenesc	37
26473	Scoala Gimnaziala Cristofor Simionescu Plopeni	37
26474	Colegiul Tehnic Al.i.cuza Suceava	37
26475	Scoala Gimnaziala Satu Mare	37
26476	Gradinita Cu Program Normal Nr.1 Cajvana	37
26477	Colegiul Tehnic Anghel Saligny	38
26478	Scoala Gimnaziala Fantanele	38
26479	Liceul Tehnologic Andrei Saguna	38
26480	Scoala Gimnaziala Segarcea-vale	38
26481	Scoala Gimnaziala	38
26482	Liceul Teoretic Zimnicea	38
26483	Scoala Gimnaziala Tatarastii De Sus	38
26484	Scoala Gimnaziala	38
26485	Scoala Gimnaziala Nr. 4	38
26486	Scoala Gimnaziala	38
26487	Scoala Gimnaziala Comuna Dracsenei	38
26488	Liceul Teoretic Zimnicea	38
26489	Scoala Gimnaziala Zaharia Stancu	38
26490	Scoala Gimnaziala Tatarastii De Sus	38
26491	Scoala  Gimnaziala   Alexandru Deparateanu	38
26492	Colegiul National Unirea	38
26493	Scoala Gimnaziala Salcia	38
26494	Scoala Gimnaziala Nr. 4	38
26495	Scoala Gimnaziala Nr.1	38
26496	Scoala Gimnaziala Lisa	38
26497	Gradinita Cu Program Prelungit Nr.1	38
26498	Scoala Gimnaziala Mihai Eminescu	38
26499	Liceul Teoretic Constantin Noica	38
26500	Scoala Gimnaziala Cervenia	38
26501	Scoala Gimnaziala Bascoveni	38
26502	Scoala Gimnaziala Mihai Viteazul	38
26503	Scoala Gimnaziala Dan Berindei	38
26504	Scoala Gimnaziala	38
26505	Liceul Tehnologic Virgil Madgearu	38
26506	Scoala Gimnaziala Scurtu Mare	38
26507	Liceul Tehnologic Nicolae Balcescu	38
26508	Scoala Gimnaziala	38
26509	Scoala Gimnaziala Plosca	38
26510	Scoala Gimnaziala Nr.2	38
26511	Scoala Gimnaziala Traian	38
26512	Scoala Gimnaziala	38
26513	Scoala Gimnaziala Nr.1	38
26514	Scoala Gimnaziala	38
26515	Scoala Gimnaziala Vasile Racotfa	38
26516	Scoala Gimnaziala Vedea	38
26517	Liceul Tehnologic	38
26518	Gradinita Cu Program Prelungit Nr.5	38
26519	Scoala Gimnaziala Nr. 5	38
26520	Scoala Gimnaziala Miron Radu Paraschivescu	38
26521	Gradinita Cu Program Prelungit Ion Creanga	38
26522	Scoala Gimnaziala	38
26523	Scoala Gimnaziala Puranii De Sus	38
26524	Scoala Gimnaziala Comuna Dracsenei	38
26525	Scoala Gimnaziala	38
26526	Scoala Gimnaziala Tatarastii De Jos	38
26527	Scoala Gimnaziala	38
26528	Scoala Gimnaziala Plopii Slavitesti	38
26529	Gradinita Nr 7	38
26530	Scoala Gimnaziala Comuna Talpa	38
26531	Scoala Gimnaziala	38
26532	Scoala Gimnaziala Dan Berindei	38
26533	Scoala Postliceala Sanitara Alexandria	38
26534	Liceul Tehnologic Nicolae Balcescu	38
26535	Scoala Gimnaziala Nenciulesti	38
26536	Scoala Gimnaziala Slobozia Mandra	38
26537	Scoala Gimnaziala Ion Preotu	38
26538	Scoala Gimnaziala Nr.1	38
26539	Gradinita Cu Program Prelungit Nr.4	38
26540	Liceul Tehnologic Virgil Madgearu	38
26541	Scoala Gimnaziala Nr. 1	38
26542	Scoala Gimnaziala Traian	38
26543	Scoala Gimnaziala	38
26544	Scoala Gimnaziala	38
26545	Scoala Gimnaziala	38
26546	Gradinita Cu Program Prelungit Ion Creanga	38
26547	Liceul Pedagogic Mircea Scarlat	38
26548	Scoala Gimnaziala Salcia	38
26549	Scoala Gimnaziala	38
26550	Scoala Gimnaziala Vasile Racotfa	38
26551	Gradinita Nr 7	38
26552	Scoala Gimnaziala Nr.1	38
26553	Scoala Gimnaziala	38
26554	Scoala Gimnaziala Nr. 5	38
26555	Scoala Postliceala Sanitara Alexandria	38
26556	Gradinita Cu Program Prelungit Nr.1	38
26557	Scoala Gimnaziala Nenciulesti	38
26558	Scoala Gimnaziala Puranii De Sus	38
26559	Scoala Gimnaziala Ion Preotu	38
26560	Liceul Teoretic Constantin Noica	38
26561	Gradinita Cu Program Prelungit Nr.4	38
26562	Scoala Gimnaziala I.gh.duca	38
26563	Scoala Gimnaziala Nr. 1	38
26564	Scoala Gimnaziala Bascoveni	38
26565	Scoala Gimnaziala	38
26566	Liceul Tehnologic Nrj	38
26567	Gradinita Cu Program Prelungit Nr.4	38
26568	Scoala Gimnaziala Saceni	38
26569	Scoala Gimnaziala Nr. 1	38
26570	Scoala Gimnaziala	38
26571	Scoala Gimnaziala	38
26572	Liceul Teoretic Marin Preda	38
26573	Scoala Gimnaziala	38
26574	Scoala Gimnaziala Grigore Dimitrie Ghica	38
26575	Scoala Gimnaziala Nr 3	38
26576	Scoala Gimnaziala Alexandru Colfescu	38
26577	Liceul Tehnologic Emil Racovita	38
26578	Scoala Gimnaziala Silistea	38
26579	Scoala Gimnaziala Comuna Poroschia	38
26580	Scoala Gimnaziala Comuna Seaca	38
26581	Scoala  Gimnaziala	38
26582	Scoala Gimnaziala Nr 1 Comuna Dobrotesti	38
26583	Scoala Gimnaziala Smardioasa	38
26584	Gradinita Cu Program Prelungit Nr.6	38
26585	Scoala Gimnaziala Marin Preda	38
26586	Scoala Gimnaziala	38
26587	Scoala Gimnaziala Nr.7	38
26588	Scoala Gimnaziala Grigore Dimitrie Ghica	38
26589	Scoala Gimnaziala Nr.1 Cosmesti	38
26590	Scoala Postliceala Sanitara Alexandria	38
26591	Scoala Gimnaziala	38
26592	Liceul Tehnologic Emil Racovita	38
26593	Colegiul Nationaiaid. Ghica	38
26594	Scoala Gimnaziala Nenciulesti	38
26595	Scoala Gimnaziala Nr.1	38
26596	Scoala Gimnaziala Ion Preotu	38
26597	Scoala Gimnaziala Stejaru	38
26598	Gradinita Cu Program Prelungit Nr.4	38
26599	Scoala Gimnaziala	38
26600	Scoala Gimnaziala Nr. 1	38
26601	Scoala Gimnaziala Nr. 2	38
26602	Scoala Gimnaziala	38
26603	Scoala Gimnaziala	38
26604	Scoala Gimnaziala	38
26605	Gradinita Cu Program Prelungit Nr. 4	38
26606	Gradinita Cu Program Prelungit Nr. 4	38
26607	Scoala  Gimnaziala  Nr.1	38
26608	Scoala Gimnaziala	38
26609	Scoala Gimnaziala Balaci	38
26610	Scoala Gimnaziala Pietrosani	38
26611	Liceul Teoretic	38
26612	Scoala Gimnaziala Cringeni	38
26613	Scoala Gimnaziala	38
26614	Scoala Gimnaziala Iecea Mare	39
26615	Academia Romana Filiala Timișoara	39
26616	Scoala Gimnaziala Nr. 30 Timișoara	39
26617	Universitatea Politeh Nica Timișoara	39
26618	Colegiul Tehnic Energetic Regele Ferdinand I	39
26619	Scoala Gimnaziala Remetea Mare	39
26620	Liceul Tehnologic Agricol Ortisoara	39
26621	Scoala Primara  Casa Sperantei	39
26622	Liceul Teoretic Dositei Obradovici Timișoara	39
26623	Scoala Gimnaziala Criciova	39
26624	Liceul Tepretic David Voniga Giroc	39
26625	Colegiul Tehnic Azu R	39
26626	Scoala Gimnaziala Iecea Mare	39
26627	Scoala Gimnaziala Curtea	39
26628	Scoala Gimnaziala Comuna Dudestii Noi	39
26629	Scoala Gimnaziala Firdea	39
26630	Colegiul Tehnic Azu R	39
26631	Liceul Teoretic Recas	39
26632	Gradinita Cu Program Prelungit Nr.33	39
26633	Scoala Gimnaziala Criciova	39
26634	Gradinita Cu Program Prelungit Deta	39
26635	Liceul Teoretic Special  Iris	39
26636	Scoala Gimnaziala Nr.1 Timișoara	39
26637	Colegiul Tehnic Ion I.c.bratianu	39
26638	Scoala  Gimnaziala Sorin Titel Margina	39
26639	Scoala Gimnaziala Carpinis	39
26640	Scoala Gimnaziala Moravita	39
26641	Scoala Gimnaziala Theodor Bucurescu Nr 1 Sannicolau Mare	39
26642	Scoala Gimnaziala Nr. 30 Timișoara	39
26643	Liceul Teoretic Periam	39
26644	Scoala Gimnaziala Nr.27 Timișoara	39
26645	Scoala Gimnaziala Comuna Giera	39
26646	Scoala Gimnaziala Nr. 30 Timișoara	39
26647	Scoala Gimnaziala Nr.16 Take Ionescu	39
26648	Colegiul Tehnic Ion I.c.bratianu	39
26649	Scoala Gimnaziala „eftimie Murgu„ Lugoj	39
26650	Universitatea Tibiscus	39
26651	Scoala Gimnaziala Nitchidorf	39
26652	Liceul Teoretic Special  Iris	39
26653	Scoala Gimnaziala Birna	39
26654	Scoala Gimnaziala Comuna Dudestii Noi	39
26655	Colegiul Tehnic Henri Coanda	39
26656	Scoala Gimnaziala Jamu Mare	39
26657	Universitatea De Stiinte Agricole Si Medicina Veterinara A Banatului Regele Mihai I Al Romaniei Din Timiș	39
26658	Scoala Gimnaziala Theodor Bucurescu Nr 1 Sannicolau Mare	39
26659	Liceul Teoretic Grigore Moisil	39
26660	Scoala Gimnaziala Carpinis	39
26661	Gradinita Cu Program Prelungit Nr.20	39
26662	Colegiul Tehnic Energetic Regele Ferdinand I	39
26663	Scoala Gimnaziala Nr.25	39
26664	Scoala Gimnaziala Comuna Giera	39
26665	Scoala Gimnaziala Nr.6	39
26666	Scoala Gimnaziala Ghilad	39
26667	Colegiul Economic F.s.nitti	39
26668	Scoala Gimnaziala Comuna Uivar	39
26669	Scoala Gimnaziala Comuna Padureni	39
26670	Scoala Gimnaziala Pischia	39
26671	Gradinita Cu Program Prelungit Nr.33	39
26672	Scoala Gimnaziala Nr.16 Take Ionescu	39
26673	Scoala Gimnaziala Comuna Belint	39
26674	Scoala Gimnaziala „eftimie Murgu„ Lugoj	39
26675	Gradinita Cu Program Prelungit Nt.14 Timișoara	39
26676	Scoala Gimnaziala Nitchidorf	39
26677	Universitatea Tibiscus	39
26678	Scoala Gimnaziala Birna	39
26679	Scoala Gimnaziala Nr.1 Timișoara	39
26680	Colegiul Tehnic Henri Coanda	39
26681	Scoala Gimnaziala Speciala Buzias	39
26682	Universitatea De Stiinte Agricole Si Medicina Veterinara A Banatului Regele Mihai I Al Romaniei Din Timiș	39
26683	Gradinita Cu Program Prelungit Nr.22	39
26684	Liceul Teoretic Grigore Moisil	39
26685	Scoala Gimnaziala Curtea	39
26686	Scoala Gimnaziala Jimbolia	39
26687	Liceul Teoretic Sfintii Kiril Si Metodii Dudestii-vechi	39
26688	Scoala Gimnaziala Comuna Sinpetru Mare	39
26689	Liceul Teologic Romano Catolic Gerhardinum	39
26690	Scoala Gimnaziala Ch Ecea	39
26691	Gradinita Cu Program Prelungut Nr.26	39
26692	Scoala Gimnaziala Ghiroda	39
26693	Scoala Gimnaziala Ghilad	39
26694	Scoala Gimnaziala Anghel Saligny Banloc	39
26695	Scoala Gimnaziala Masloc	39
26696	Liceul Teoretic Bartok Bela	39
26697	Scoala Gimnaziala Comuna Uivar	39
26698	Liceul Teoretic Jean Louis Calderon	39
26699	Scoala Gimnaziala Maria Brindea Pesac	39
26700	Scoala Gimnaziala Nr. 3	39
26701	Scoala Gimnaziala Pischia	39
26702	Liceul Tehnologic De Industrie Alimentara	39
26703	Scoala Gimnaziala Nr.16 Take Ionescu	39
26704	Scoala Gimnaziala Comuna Saravale	39
26705	Scoala Gimnaziala „eftimie Murgu„ Lugoj	39
26706	Gradinita Cu Program Prelungit Nikolaus Lenau	39
26707	Colegiul Tehnic Emanuil Ungureanu	39
26708	Scoala Gimnaziala Anghel Saligny Banloc	39
26709	Gradinita Cu Program Prelungit Nr 25 Timișoara	39
26710	Colegiul Tehnic Dimitrie Leonida	39
26711	Scoala Primara Charlotten Bu Rg	39
26712	Liceul Tehnologic De Industrie Alimentara	39
26713	Scoala Gimnaziala Birda	39
26714	Liceul Teoretic Nikolaus Lenau Timișoara	39
26715	Scoala Gimnaziala Ch Everesu Mare	39
26716	Colegiul National Banatean Timișoara	39
26717	Scoala Gimnaziala Com Sinandrei	39
26718	Gradinita Cu Program Prelungit Nr.23 Timișoara	39
26719	Scoala Gimnaziala Sandra	39
26720	Scoala Gimnaziala George Garda Manastiur	39
26721	Scoala Gimnaziala Gotflob	39
26722	Colegiul National Iulia Hasdeu	39
26723	Liceul Teoretic Gataia	39
26724	Liceul Tehnologic Special Gheorghe Atanasiu Timișoara	39
26725	Scoala Gimnaziala Comuna Ghizela	39
26726	Scoala Gimnaziala Ch Ecea	39
26727	Gradinita Cu Program Prelungit Nr 38 Timișoara	39
26728	Scoala Gimnaziala Birna	39
26729	Scoala Primara Bara	39
26730	Liceul Teoretic Jean Louis Calderon	39
26731	Colegiul Tehnic Emanuil Ungureanu	39
26732	Colegiul Tehnic Henri Coanda	39
26733	Gradinita Cu Program Prelungit Nr 25 Timișoara	39
26734	Universitatea De Stiinte Agricole Si Medicina Veterinara A Banatului Regele Mihai I Al Romaniei Din Timiș	39
26735	Scoala Primara Charlotten Bu Rg	39
26736	Liceul Teoretic Grigore Moisil	39
26737	Scoala Gimnaziala Birda	39
26738	Gradinita Cu Program Prelungit Nr.20	39
26739	Scoala Gimnaziala Ch Everesu Mare	39
26740	Scoala Gimnaziala Nr.25	39
26741	Scoala Gimnaziala Com Sinandrei	39
26742	Scoala Gimnaziala Nr.6	39
26743	Scoala Gimnaziala Sandra	39
26744	Scoala Gimnaziala Comuna Parta	39
26745	Scoala Gimnaziala Gotflob	39
26746	Liceul Teoretic Sfintii Kiril Si Metodii Dudestii-vechi	39
26747	Scoala Gimnaziala Sandra	39
26748	Gradinita Cu Program Prelungut Nr.26	39
26749	Scoala Gimnaziala Tomnatic	39
26750	Scoala Gimnaziala Masloc	39
26751	Scoala Gimnaziala Gotflob	39
26752	Scoala Gimnaziala Maria Brindea Pesac	39
26753	Scoala Gimnaziala Beba Veche	39
26754	Liceul Teoretic Gataia	39
26755	Liceul Tehnologic  Transporturi Auto Timișoara	39
26756	Scoala Gimnaziala Comuna Ghizela	39
26757	Liceul Tehnologic Sfantu Nicolae Deta	39
26758	Liceul Teoretic Com Peciu Nou	39
26759	Scoala Gimnaziala Nr 15	39
26760	Scoala Gimnaziala Comuna Sinmihaiu Roman	39
26761	Scoala Gimnaziala Comuna Balint	39
26762	Scoala Gimnaziala Denta	39
26763	Scoala Gimnaziala Nr.19avram Iancu Timișoara	39
26764	Scoala Gimnaziala Racovita	39
26765	Liceul Teoretic Vlad Tepes Timișoara	39
26766	Scoala Gimnaziala Masloc	39
26767	Scoala Gimnaziala Comuna Darova	39
26768	Liceul Teoretic Com Peciu Nou	39
26769	Gradinita Cu Program Prelungit Nr.11	39
26770	Scoala Gimnaziala Maria Brindea Pesac	39
26771	Liceul Teologic Baptist	39
26772	Scoala Gimnaziala Comuna Sinmihaiu Roman	39
26773	Scoala Gimnaziala De Muzica Filaret Barbu Lugoj	39
26774	Scoala Gimnaziala Denta	39
26775	Scoala Gimnaziala Lenauheim	39
26776	Scoala Gimnaziala Racovita	39
26777	Scoala Gimnaziala Stiuca	39
26778	Scoala Gimnaziala Nr 12	39
26779	Scoala Gimnaziala Comuna Dumbravita	39
26780	Liceul Teoretic William Shakespeare	39
26781	Gradinita Cu Program Prelungit Nr.36	39
26782	Scoala Primara Comuna Secas	39
26783	Gradinita Cu Program Prelungit Nr.1 Sannicolau Mare	39
26784	Scoala Gimnaziala Nr.2 Lugoj	39
26785	Scoala Gimnaziala Gavojdia	39
26786	Gradinita Program Prelungit Nr 32	39
26787	Scoala Gimnaziala Lenauheim	39
26788	Colegiul Tehnic De Vest Timișoara	39
26789	Scoala Gimnaziala Stiuca	39
26790	Liceul Waldorf Timișoara	39
26791	Scoala Gimnaziala Comuna Dumbravita	39
26792	Gradinita Cu Program Prelungit Nr.36	39
26793	Gradinita Cu Program Prelungit Nr.1 Sannicolau Mare	39
26794	Scoala Gimnaziala Gavojdia	39
26795	Scoala Gimnaziala Bethausen	39
26796	Scoala Gimnaziala Comuna Cenei	39
26797	Colegiul Silvic Casa Verde Timișoara	39
26798	Scoala Gimnaziala Comuna Cenad	39
26799	Scoala Gimnaziala Valcani	39
26800	Scoala Gimnaziala Satchinez	39
26801	Liceul Tehnologic Aurel Vlaicu  Lugoj	39
26802	Scoala Gimnaziala Topolovatu Mare	39
26803	Scoala Gimnaziala Nestor Oprean Nr.2 Sannicolau Mare	39
26804	Colegiul Tehnic V. Braniste	39
26805	Scoala Gimnaziala Nr 24 Timișoara	39
26806	Gradinita Cu Program Prelungit Nr.53	39
26807	Gradinita Cu Program Prelungit Nr. 4	39
26808	Liceul Tehnologic Traian Grozavescu Nadrag	39
26809	Scoala Gimnaziala Carcaliu	40
26810	Scoala Gimnaziala Ceatalchioi	40
26811	Gradinita Cu Program Prelungit Nr.18 Tulcea	40
26812	Liceul Teoretic Ion Creanga Tulcea	40
26813	Gradinita Cu Program Prelungit Nr.12 Tulcea	40
26814	Colegiul Economic Delta Dunarii Tulcea	40
26815	Liceul Dimitrie Cantemir	40
26816	Scoala Gimnaziala Grigore Antipa Tulcea	40
26817	Liceul Teoretic Constantin Bratescu	40
26818	Gradinita Cu Progrm Prelungit Nr.3 Tulcea	40
26819	Scoala Gimnaziala Ostrov	40
26820	Colegiul Brad Segal Tulcea	40
26821	Scoala Profesionala Danubius Tulcea	40
26822	Scoala Gimnaziala   Constantin Gavenea	40
26823	Scoala Gimnaziala Ceamurlia De Jos	40
26824	Scoala Gimnaziala Frecatei	40
26825	Scoala Gimnaziala Nr.12 Tulcea	40
26826	Liceul Dimitrie Cantemir	40
26827	Colegiul Dobrogean Spiru Haret Tulcea	40
26828	Scoala Gimnaziala Frecatei	40
26829	Scoala Gimnaziala Mihail Kogalniceanu	40
26830	Liceul Teoretic Constantin Bratescu	40
26831	Scoala Gimnaziala Horia	40
26832	Scoala Gimnaziala Mihai Eminescu Valea Teilor	40
26833	Scoala Gimnaziala Maliuc	40
26834	Scoala Gimnaziala Ostrov	40
26835	Scoala  Gimnaziala Mircea Cel Batran	40
26836	Scoala Gimnaziala   Constantin Gavenea	40
26837	Scoala Gimnaziala Bestepe	40
26838	Scoala Profesionala Danubius Tulcea	40
26839	Scoala Gimnaziala Jijila	40
26840	Scoala Gimnaziala Izvoarele	40
26841	Scoala Gimnaziala Ceamurlia De Jos	40
26842	Scoala Gimnaziala Ciucurova	40
26843	Scoala Gimnaziala Nr.12 Tulcea	40
26844	Liceul Tehnologic Vasile Bacalu Mahmudia	40
26845	Liceul Tehnologic Ion Mincu	40
26846	Scoala Gimnaziala Dorobantu	40
26847	Liceul Teoretic Jean Bart	40
26848	Scoala Gimnaziala Nr.12 Tulcea	40
26849	Scoala Gimnaziala Daeni	40
26850	Liceul Tehnologic Ion Mincu	40
26851	Seminarul Teologic Ortodox Sf. Ioan Casian Tulcea	40
26852	Scoala Gimnaziala Maior Ioan Murgescu	40
26853	Scoala Gimnaziala Crisan	40
26854	Scoala Gimnaziala Valea Nucarilor	40
26855	Liceul Teoretic Grigore Moisil Tulcea	40
26856	Scoala Gimnaziala Ion Luca Caragiale Tulcea	40
26857	Scoala Gimnaziala Nr. 1 Macin	40
26858	Gradinita Cu Program Prelungit Numarul 17	40
26859	Scoala Gimnaziala Casimcea	40
26860	Scoala Gimnaziala Elena Doamna Tulcea	40
26861	Gradinita Cu Program Prelungit  Dumbrava Minunata	40
26862	Scoala Gimnaziala Greci	40
26863	Scoala Gimnaziala Baia	40
26864	Scoala Gimnaziala Stejaru	40
26865	Scoala Gimnaziala Vasile Alecsandri Nufaru	40
26866	Scoala Gimnaziala Slava Cercheza	40
26867	Scoala Gimnaziala Horia	40
26868	Scoala Gimnaziala Peceneaga	40
26869	Scoala Gimnaziala Ioan Nenitescu Tulcea	40
26870	Scoala Gimnaziala Ca Rosetfi	40
26871	Scoala Gimnaziala Maliuc	40
26872	Scoala Gimnaziala Nicolae Iorga Grindu	40
26873	Scoala Gimnaziala Ion Creanga Ic Bratianu	40
26874	Liceultghe M Murgoci Macin	40
26875	Scoala  Gimnaziala Mircea Cel Batran	40
26876	Scoala Gimnaziala Ctin Brancoveanu	40
26877	Scoala Gimnaziala Alexandru Ciucurencu Tulcea	40
26878	Liceul Tehnologic Topolog	40
26879	Scoala Gimnaziala Bestepe	40
26880	Scoala Gimnaziala Tu Rcoaia	40
26881	Scoala Gimnaziala Beidaud	40
26882	Scoala Gimnaziala Jurilovca	40
26883	Scoala Gimnaziala Jijila	40
26884	Scoala Gimnaziala Chilia Veche	40
26885	Scoala Gimnaziala Nichifor Lu Dovig Niculitel	40
26886	Scoala Gimnaziala Sarichioi	40
26887	Scoala Gimnaziala Murighiol	40
26888	Liceul De Arte George Georgescu	40
26889	Scoala Gimnaziala Speciala Nr.14 Tulcea	40
26890	Gradinita Cu Program Prelungit Ostroveni 1	41
26891	Scoala Gimnaziala Costea Marinoiu Ocnele Mari	41
26892	Scoala Gimnaziala Comuna Lungesti	41
26893	Scoala Gimnaziala Comuna Creteni	41
26894	Gradinita Cu Program Prelungit Nord 1	41
26895	Liceul Constantin Brancoveanu Horezu	41
26896	Scoala Gimnaziala Comuna Titesti	41
26897	Liceul Preda Buzescu Oras Berbesti Judetul Vâlcea	41
26898	Gradinita Cu Program Prelungit Nord 2	41
26899	Scoala Gimnaziala Sat Tina Comuna Livezi Judetul Vâlcea	41
26900	Scoala Populara De Arte Si Meserii	41
26901	Scoala Gimnaziala Sat Ursi Comuna Stoilesti Jud Vâlcea	41
26902	Gradinita Cu Program Prelungit Cozia Rm Vâlcea	41
26903	Scoala Gimnaziala Comuna Mateesti Judetul Vâlcea	41
26904	Scoala Gimnaziala Nr 4 Municipiul Rm.Vâlcea	41
26905	Scoala Gimnazial Comuna Stoilesti Judetul Vâlcea	41
26906	Gradinita Cu Program Prelungit Nord 2	41
26907	Scoala Gimnaziala. Com. Stoen Esti. Judetul Vâlcea	41
26908	Scoala Gimnaziala Comuna Susani Judetul Vâlcea	41
26909	Liceul Teoretic Comuna Gradistea Judetul Vâlcea	41
26910	Colegiul National Gib Mihaescu	41
26911	Liceul Tehnologic Justinian Marina, Oras Baile Olanesti, Jud. Vâlcea	41
26912	Scoala Gimnaziala Sat Gura Vaii Comuna Bujoreni	41
26913	Scoala Gimnaziala Nr. 13  Mun. Rm Vâlcea	41
26914	Gradinita Cu Program Prelungit Cozia Rm Vâlcea	41
26915	Liceul Tehnologic Special Nr.1	41
26916	Colegiul National De Informatica Matei Basarab	41
26917	Scoala Gimnaziala Comuna Mateesti Judetul Vâlcea	41
26918	Scoala Gimnaziala, Sat Ulmetu, Comuna Copaceni, Judetul Vâlcea	41
26919	Scoala Gimnaziala Comuna Ionesti Judetul Vâlcea	41
26920	Liceul De Arte Victor Giuleanulic Arte	41
26921	Liceul Tehnologic Petrache Poenaru Oras Balcesti Judetul Vâlcea	41
26922	Gradinita Cu Program Prelungit Ostroveni 2 Mun. Rm	41
26923	Scoala Gimnaziala Batasani Sat Batasani Com. Valea Mare	41
26924	Scoala Gimnaziala Bartolomeu Valeriu Anania Comuna Glavile Judetul Vâlcea	41
26925	Scoala Gimnaziala Tu Dor Vladimirescu. Mun.dragasani. Judetul Vâlcea	41
26926	Liceul Tehnologic Special Nr.1	41
26927	Scoala Gimnaziala Sat Udresti Comuna Danicei Judetul  Vâlcea	41
26928	Scoala Gimnaziala Olanu	41
26929	Liceul De Arte Victor Giuleanulic Arte	41
26930	Scoala Gimnaziala Comuna Ionesti Judetul Vâlcea	41
26931	Liceul Tehnologic General Magheru Rm Vâlcea	41
26932	Scoala Gimnaziala Comuna Scundu Judetul Vâlcea	41
26933	Scoala Gimnaziala Babeni Oltetu Comuna Diculesti Judetul Vâlcea	41
26934	Scoala Gimnaziala Batasani Sat Batasani Com. Valea Mare	41
26935	Colegiul Economic	41
26936	Scoala Gimnaziala Colonie  Mun. Rm. Vâlcea	41
26937	Colegiul De Silvicultura Si Protectia Mediului	41
26938	Scoala Gimnaziala Anton Pann Mun.rm.Vâlceajud.Vâlcea	41
26939	Scoala Gimnaziala Comuna Stanesti	41
26940	Scoala Gimnaziala Comuna Malaia	41
26941	Scoala Gimnaziala Comuna Sirineasa Judetul Vâlcea	41
26942	Scoala Gimnaziala Comuna Prundeni Judetul Vâlcea	41
26943	Scoala Gimnaziala Nr. 13  Mun. Rm Vâlcea	41
26944	Scoala Gimnaziala Sat Magura Comuna  Mihaesti  Judetul  Vâlcea	41
26945	Scoala  Gimnaziala Comuna Ghioroiu Judetul Vâlcea	41
26946	Scoala Gimnaziala Sat Udresti Comuna Danicei Judetul  Vâlcea	41
26947	Colegiul De Silvicultura Si Protectia Mediului	41
26948	Scoala Gimnaziala I.gh.duca Mu N.rm.Vâlcea Jud Vâlcea	41
26949	Scoala Gimnaziala Comuna Prundeni Judetul Vâlcea	41
26950	Scoala Gimnaziala Nr 10 Municipiul Rm Vâlcea Judetul Vâlcea	41
26951	Scoala Gimnaziala Comuna Pietrari	41
26952	Scoala Gimnaziala Comuna Bunesti Judetul Vâlcea	41
26953	Scoala Gimnaziala Pesceana Comuna Pesceana Judetul Vâlcea	41
26954	Liceul Tehnologic General Magheru Rm Vâlcea	41
26955	Scoala Gimnaziala Comuna Sirineasa Judetul Vâlcea	41
26956	Scoala Gimnaziala Luca Solomon Comuna Vaideeni Judetul Vâlcea	41
26957	Scoala Gimnaziala Comuna Boisoara	41
26958	Scoala Gimnaziala Comuna Maldaresti Judetul Vâlcea	41
26959	Scoala Gimnaziala Comuna Ru Ncu Judetul Vâlcea	41
26960	Scoala Gimnaziala Sat Bungetani Comuna Fauresti  Judetul Vâlcea	41
26961	Liceul Gheorghe Surdu Orasul Brezoi Judetul Vâlcea	41
26962	Colegiul Economic	41
26963	Scoala  Gimnaziala Comuna Ghioroiu Judetul Vâlcea	41
26964	Scoala Gimnaziala Capitan Marasanu Stroesti Comuna Stroesti Judetul Vâlcea	41
26965	Liceul Tehnologic Oltchim	41
26966	Scoala Gimnaziala Sat Popesti Comuna Golesti	41
26967	Scoala Gimnaziala Sat Bungetani Comuna Fauresti  Judetul Vâlcea	41
26968	Scoala Gimnaziala Nr 10 Municipiul Rm Vâlcea Judetul Vâlcea	41
26969	Colegiul Economic	41
26970	Scoala Ginmnaziala  Sat Madulari Comuna Cernisoara Judetul Vâlcea	41
26971	Scoala Gimnaziala Capitan Marasanu Stroesti Comuna Stroesti Judetul Vâlcea	41
26972	Liceul George Tarn Ea Babeni	41
26973	Scoala Gimaziala Sat Valea Mare Babeni	41
26974	Scoala Gimnaziala . Comuna Lacusteni . Judetul Vâlcea	41
26975	Scoala Gimnaziala Comua Milcoiu Judetul Vâlcea	41
26976	Scoala Gimnaziala Comuna Maldaresti Judetul Vâlcea	41
26977	Scoala Gimnaziala Com. Sutesti, Jud. Vâlcea	41
26978	Scoala Gimnaziala Comuna Amarasti Judetul Vâlcea	41
26979	Scoala Gimnaziala Sat Tepesti  Com Tetoiu  Judetul Vâlcea	41
26980	Scoala Gimnaziala Ioan Didicescu Comuna Voicesti Judetul Vilcea	41
26981	Liceul Tehnologic Ferdinand I	41
26982	Gradinita Cu Pp Nr.1 Casuta Piticilor Horezu	41
26983	Scoala Gimnaziala Sat Bodesti  Comuna  Barbatesti Judetul Vâlcea	41
26984	Scoala Gimnaziala  Sat Copaceni Comu Na Racovita Ju Detul Vâlcea	41
26985	Liceul Tehnologic Bratianu Municipiul Dragasani Judetul Vâlcea	41
26986	Liceul George Tarn Ea Babeni	41
26987	Scoala Gimnaziala Comuna Francesti Judetul Vâlcea	41
26988	Scoala Gimnaziala Colonie  Mun. Rm. Vâlcea	41
26989	Scoala Gimnaziala Ioan Didicescu Comuna Voicesti Judetul Vilcea	41
26990	Scoala Gimnaziala Comuna Malaia	41
26991	Scoala Gimnaziala Nicolae Balcescu, Municipiul Dragasani, Judetul Vâlcea	41
26992	Scoala Gimnaziala Sat Magura Comuna  Mihaesti  Judetul  Vâlcea	41
26993	Liceul Teoretic Comuna Ladesti Judetul Vâlcea	41
26994	Liceul Tehnologic Capitan Nicolae Plesoianu Rm Vâlcea Judetul Vâlcea	41
26995	Scoala Gimnaziala Com.voineasa	41
26996	Scoala Gimnaziala Rotarasti Comuna Nicolae Balcescu	41
26997	Colegiul National Alexandru Lahovari	41
26998	Scoala Gimnaziala I.gh.duca Mu N.rm.Vâlcea Jud Vâlcea	41
26999	Scoala Gimnaziala Sat Pausesti-otasau Com. Pausesti Judetul Vâlcea	41
27000	Scoala Gimnaziala Comuna Bunesti Judetul Vâlcea	41
27001	Scoala Gimnaziala Teodor Balasel Comuna Stefanest Judetul Vâlcea	41
27002	Scoala Gimnaziala Luca Solomon Comuna Vaideeni Judetul Vâlcea	41
27003	Scoala Gimnaziala Com Rosiilejudetul Vâlcea	41
27004	Scoala Gimnaziala Sat Bungetani Comuna Fauresti  Judetul Vâlcea	41
27005	Scoala Gimnaziala Com Tomsani Judetul Vâlcea	41
27006	Scoala Gimnaziala Com Rosiilejudetul Vâlcea	41
27007	Scoala Gimnaziala Comuna  Mitrofani Judetul Vâlcea	41
27008	Scoala Gimnaziala Com Tomsani Judetul Vâlcea	41
27009	Scoala Gimnaziala Comuna Budesti Judetul Vâlcea	41
27010	Scoala Gimnaziala Sat  Muereasca De Sus Com. Muereasca Judetul Vâlcea	41
27011	Scoala Gimnaziala Comuna Gusoeni Judetul Vâlcea	41
27012	Scoala Gimnaziala Take Ionescu Jud.Vâlcea Mun.ramnicu Vâlcea	41
27013	Scoala Gimnaziala Sat Rusan Esti Comuna Fartatesti Jud.Vâlcea	41
27014	Scoala Gimnaziala Comuna Lapusata Judetul Vâlcea	41
27015	Liceul Tehnologic  Henri  Coandamu N.rm-Vâlcea	41
27016	Scoala Gimnaziala Nicolae Ciubotaru	42
27017	Scoala Gimnaziala Nr.1  Sat Padureni	42
27018	Scoala Gimnaziala Adrian Porumboiu Muntenii De Jos	42
27019	Scoala Gimnaziala  Horia Stamatin Bogdan Esti	42
27020	Scoala Gimnaziala George Tutoveanu	42
27021	Colegiul National Cuza Voda	42
27022	Scoala Gimnaziala Nr 1 Sat Ivesti	42
27023	Scoala Gimnaziala Mihai David Negresti	42
27024	Scoala Gimnaziala Episcop Iacov Antonovici	42
27025	Scoala Gimnaziala Sfantul Ierarh Luca Sat Costesti	42
27026	Scoala Gimnaziala Nr.1  Hurdugi	42
27027	Scoala Gimnaziala  Horia Stamatin Bogdan Esti	42
27028	Gradinita Cu Program Prelungit Nr.2 Barlad	42
27029	Scoala Gimnaziala George C Dragu Coroiesti	42
27030	Scoala Gimnaziala Nr1	42
27031	Scoala Gimnaziala Mihai David Negresti	42
27032	Scoala Gimnaziala Constantin Asiminei Sat Epureni	42
27033	Scoala Gimnaziala Elena Cuza Vaslui	42
27034	Scoala Postliceala Sanitara Anastasie Fatu Vaslui	42
27035	Scoala Gimnaziala Sfantul Ierarh Luca Sat Costesti	42
27036	Scoala Gimnaziala Nr.1  Bogdana	42
27037	Scoala Gimnaziala Victor Ion Popa Dodesti	42
27038	Gradinita Cu Program Prelungit Nr.9 Vaslui	42
27039	Scoala Gimnaziala George Tutoveanu	42
27040	Scoala Gimnaziala Stefan Cel Mare	42
27041	Scoala Gimnaziala Stroe S Belloescu	42
27042	Scoala Gimnaziala Mihail Sadoveanu	42
27043	Scoala Gimnaziala Nr1 Malusteni	42
27044	Scoala Gimnaziala Nr. 1 Ivanesti	42
27045	Scoala Gimnaziala Nr.1  Sat Albesti	42
27046	Scoala Gimnaziala Nr.1  Sat Tanacu	42
27047	Scoala Gimnaziala Nr.1  Hurdugi	42
27048	Gradinita Cu Program Prelungit Nr.11	42
27049	Scoala Gimnaziala Nr.1 Sat Lunca Banului	42
27050	Scoala Gimnaziala Teodor Medeleanu Sat Ciocani	42
27051	Scoala Gimnaziala Spiru C. Haret Viisoara	42
27052	Scoala Gimnaziala Nr. 1 Garceni	42
27053	Scoala Gimnaziala Alexandru Vlah Uta	42
27054	Scoala Gimnaziala Anastasie Panu	42
27055	Scoala Gimnaziala Nr1	42
27056	Liceul Tehnologic Ion Mincu Vaslui	42
27057	Gradinita Cu Program Prelungit Nr.2 Barlad	42
27058	Gradinita Cu Program Prelungit Nr.8	42
27059	Scoala Gimnaziala Mihai Eminescu Osesti	42
27060	Gradinita Cu Program Prelungit Nr.1o Husi	42
27061	Colegiul Tehnic Al.i.cuza	42
27062	Seminarul Teologic Ortodox Sf.ioan Gura De Aur Husi	42
27063	Scoala Postliceala Sanitara Anastasie Fatu Vaslui	42
27064	Gradinita Cu Program Prelungit Nr.17 Vaslui	42
27065	Scoala Gimnaziala Constantin Asiminei Sat Epureni	42
27066	Scoala Gimnaziala Nr. 1 Sat Tutova	42
27067	Scoala Gimnaziala Stroe S Belloescu	42
27068	Scoala Gimnaziala Nr. 1 Sat Stanilesti	42
27069	Liceul Tehnologic Petru Rares Barlad	42
27070	Gradinita Cu Program Prelungit Nr.18 Vaslui	42
27071	Scoala Gimnaziala Stefan Cel Mare	42
27072	Scoala Gimnaziala Nr 1 Sat Cepesti	42
27073	Liceul Tehnologic Ioan Corivan	42
27074	Gradinita Cu Program Prelungit Nr.1 Husi	42
27075	Scoala Gimnaziala Nr.1  Sat Albesti	42
27076	Liceul Tehnologic Nicolae Iorga Negresti	42
27077	Scoala Gimnaziala Alexandru Vlah Uta	42
27078	Scoala Gimnaziala  Alexandru Ioan Cuza Vaslui	42
27079	Scoala Gimnaziala Nr. 1 Ivanesti	42
27080	Scoala Gimnaziala Dimitrie Negrutiu Pogonesti	42
27081	Scoala Gimnaziala General Aviator  Inginer Gheorghe Negrescu Fruntiseni	42
27082	Scoala Gimnaziala Nr.1  Botesti	42
27083	Gradinita Cu Program Prelungit Nr.11	42
27084	Scoala Gimnaziala De Arte N. N. Tonitza	42
27085	Liceul Teoretic Mihail Kogalniceanu Vaslui	42
27086	Liceul Tehnologic Ion Mincu Vaslui	42
27087	Scoala Gimnaziala1 Deleni	42
27088	Scoala Gimnaziala Constantin Motas Vaslui	42
27089	Scoala Gimnaziala Nr. 1 Sat Stanilesti	42
27090	Gradinita Cu Program Prelungit Nr.1o Husi	42
27091	Gradinita Cu Program Prelungit Norocel Negresti	42
27092	Scoala Gimnaziala Manolache Costache Epureanu	42
27093	Scoala Gimnaziala Nr 1 Sat Cepesti	42
27094	Gradinita Cu Program Prelungit Nr.17 Vaslui	42
27095	Liceul Pedagogic Ioan Popescu	42
27096	Gradinita De Copii Cu Program Prelungit Nr. 12	42
27097	Liceul Tehnologic Nicolae Iorga Negresti	42
27098	Scoala Gimnaziala Constantin Rotaru Tarzii	42
27099	Scoala Gimnaziala Nr. 1 Pungesti	42
27100	Scoala Gimnaziala Nr.1 Gh Ergh Esti	42
27101	Scoala Gimnaziala Dimitrie Negrutiu Pogonesti	42
27102	Scoala Gimnaziala Mihai Eminescu	42
27103	Gradinita Cu Program Prelungit Nr.5	42
27104	Scoala Gimnaziala Nr. 1 Sat Iana	42
27105	Scoala Gimnaziala De Arte N. N. Tonitza	42
27106	Scoala Gimnaziala Nr.3 Sat Popeni	42
27107	Gradinita Cu Program Prelungit Nr.17 Vaslui	42
27108	Scoala Gimnaziala Nr. 1 Sat Voinesti	42
27109	Scoala Gimnaziala Stefan Cel Mare	42
27110	Scoala Gimnaziala Stefan Ciobotarasu	42
27111	Scoala Gimnaziala Constantin Rotaru Tarzii	42
27112	Scoala Gimnaziala N.ghe. Lupu Arsura	42
27113	Liceul Tehnologic Vladia	42
27114	Scoala Gimnaziala Theodor Rosetti Solesti	42
27115	Scoala Gimnaziala Mihai Eminescu	42
27116	Scoala Gimnaziala Nr. 1 Poienesti	42
27117	Scoala Gimnaziala Nr. 1 Ivanesti	42
27118	Scoala Gimnaziala Nr. 1 Sat Ibanesti	42
27119	Scoala Gimnaziala Iorgu Radu	42
27120	Gradinita Cu Program Prelungit Nr. 3 Vaslui	42
27121	Scoala Gimnaziala Nr.1  Sat Tanacu	42
27122	Scoala Gimnaziala Nr.1 Sat Cretestii De Sus	42
27123	Scoala Gimnaziala Constantin Parfene	42
27124	Scoala Gimnaziala Mihai Eminescu Sat Laza	42
27125	Scoala Gimnaziala Ion Creanga Municipiul Husi	42
27126	Scoala Gimnaziala Nr.1 Gh Ergh Esti	42
27127	Scoala Gimnaziala Mihai Eminescu	42
27128	Scoala Gimnaziala Nr. 1 Sat Iana	42
27129	Scoala Gimnaziala Iorgu Radu	42
27130	Scoala Gimnaziala Nr. 1 Sat Salceni	42
27131	Scoala Gimnaziala Constantin Parfene	42
27132	Scoala Gimnaziala Gheorghe Cioata Sat Todiresti	42
27133	Liceul Tehnologic Sat Puiesti	42
27134	Scoala Gimnaziala Nicolae Milescu Spataru	42
27135	Liceul Stefan  Procopiu	42
27136	Scoala Gimnaziala Nr. 1 Sat Gara Banca	42
27137	Scoala Gimnaziala Sfantul Andrei Tacuta	42
27138	Scoala Gimnaziala Stroe Belloescu Grivita	42
27139	Scoala Gimnaziala Nr.1  Puscasi	42
27140	Scoala Gimnaziala Nr. 1 Sat Blagesti	42
27141	Scoala Gimnaziala Principesa Elena Bibescu Barlad	42
27142	Scoala Gimnaziala Ion Artene Gagesti	42
27143	Scoala Gimnaziala Ion Agarici Muntenii De Sus	42
27144	Scoala Gimnaziala Nr.3 Sat Popeni	42
27145	Scoala Gimnaziala Nr. 1 Sat Voinesti	42
27146	Liceul Teoretic Emil Racovita Vaslui	42
27147	Liceul Tehnologic Special Sfanta Ecaterina	42
27148	Scoala Gimnaziala  Cezar Botez Fastaci	42
27149	Scoala Gimnaziala Mihai Eminescu	42
27150	Scoala Gimnaziala Nr.1	42
27151	Scoala Gimnaziala Iorgu Radu	42
27152	Liceul Tehnologic Gh En Uta Coman	42
27153	Scoala Gimnaziala Constantin Parfene	42
27154	Scoala Gimnaziala Nr.1 Zorleni	42
27155	Liceul Tehnologic Sat Puiesti	42
27156	Liceul Stefan  Procopiu	42
27157	Scoala Gimnaziala Sfantul Andrei Tacuta	42
27158	Scoala Gimnaziala Nr.1  Puscasi	42
27159	Scoala Gimnaziala Principesa Elena Bibescu Barlad	42
27160	Colegiul Economic Mihail Kogalniceanu Focsani	43
27161	Scoala Gimnaziala Nr.7 Focsani	43
27162	Scoala Gimnaziala Slobozia  Bradului	43
27163	Scoala Gimnaziala Principele Serbanghica Si Principesa Aristitaghica Sihlea	43
27164	Colegiul Tehnic Ion Mincu Focsani	43
27165	Scoala Gimnaziala Neculai Jechianu Vrincioaia	43
27166	Scoala Gimnaziala Tanasoaia	43
27167	Scoala Gimnaziala Nr.7 Focsani	43
27168	Scoala Gimnaziala  Alexandru Vlah Uta	43
27169	Colegiul Tehnic Ion Mincu Focsani	43
27170	Scoala Gimnaziala Ruginesti	43
27171	Scoala Gimnaziala Stefan Cel Mare	43
27172	Scoala Gimnaziala Pu Festi	43
27173	Liceul Tehnologic Alexandru Ioan Cuza Panciu	43
27174	Scoala Gimnaziala Gura Calitei	43
27175	Scoala Gimnaziala Neculai Jechianu Vrincioaia	43
27176	Scoala Gimnaziala Timboiesti	43
27177	Scoala Gimnaziala Jaristea	43
27178	Scoala Gimnaziala Duiliu Zamfirescu Dumbraveni	43
27179	Scoala Gimnaziala Chiojdeni	43
27180	Scoala Gimnaziala Maicanesti	43
27181	Gradinita Cu Program Prelungit Nr 23 Focsani	43
27182	Scoala Gimnaziala Fitionesti	43
27183	Scoala Gimnaziala  Ionel Sirbu Ciorasti	43
27184	Scoala Gimnaziala Nr. 3 Focsani	43
27185	Scoala Gimnaziala Urechesti	43
27186	Scoala Gimnaziala Timboiesti	43
27187	Scoala Gimnaziala Tifesti	43
27188	Scoala Gimnaziala Duiliu Zamfirescu Dumbraveni	43
27189	Scoala Gimnaziala Urechesti	43
27190	Scoala Gimnaziala Maicanesti	43
27191	Liceul  Simion Mehedinți Vidra	43
27192	Scoala Gimnaziala Fitionesti	43
27193	Colegiul Tehnic Valeriu D.cotea Focsani	43
27194	Scoala Gimnaziala Nr. 3 Focsani	43
27195	Scoala Gimnaziala Sindrilari Nr 1	43
27196	Scoala Gimnaziala Ioan Cimpineanu	43
27197	Scoala Gimnaziala Paltin	43
27198	Scoala Gimnaziala Cimpuri	43
27199	Scoala Gimnaziala Paulesti	43
27200	Scoala Gimnaziala Vasile Iftimescu Valea Sarii	43
27201	Scoala Gimnaziala Dimitrie Gusti Nereju	43
27202	Scoala Gimnaziala Gagesti	43
27203	Scoala Gimnaziala Nr.2	43
27204	Scoala Nicolae Iorga Focsani	43
27205	Gradinita Cu Program Prelungit Nr.16 Focsani	43
27206	Liceul Teoretic Odobesti	43
27207	Scoala Gimnaziala Jaristea	43
27208	Scoala Gimnaziala Gagesti	43
27209	Scoala Gimnaziala Homocea	43
27210	Scoala Gimnaziala Alexandru Vlah Uta	43
27211	Scoala Gimnaziala Pu Festi	43
27212	Scoala Nicolae Iorga Focsani	43
27213	Scoala Gimnaziala Doctor Costica Balan Poiana Cristei	43
27214	Scoala Gimnaziala Nanesti	43
27215	Scoala Gimnaziala Balesti	43
27216	Colegiul Tehnic Auto  Traian Vuia Focsani	43
27217	Colegiul National Al. I. Cuza Focsani	43
27218	Scoala Gimnaziala Vu Ltu Ru	43
27219	Scoala Gimnaziala Rastoaca	43
27220	Scoala Gimnaziala Invatator Gheorghe Asanache Bordesti	43
27221	Gradinita Cu Program Prelungit Nr. 2 Focsani	43
27222	Scoala Gimnaziala Serbanesti	43
27223	Scoala Gimnaziala Urechesti	43
27224	Scoala Gimnaziala Profesor Doctor General Gheorghe V.zaharia Popesti	43
27225	Scoala Gimnaziala Ploscuteni	43
27226	Scoala Gimnaziala Ploscuteni	43
27227	Scoala Gimnaziala Andreiasu De Jos	43
27228	Scoala Gimnaziala Profesor Doctor General Gheorghe V.zaharia Popesti	43
27229	Scoala Gimnaziala Barbu Stefanescu Delavrancea Naruja	43
27230	Scoala Gimnaziala Obrejita	43
27231	Scoala Gimnaziala Nistoresti	43
27232	Scoala Gimnaziala Duiliu Zamfirescu	43
27233	Liceul Cu Program Sportiv Focsani	43
27234	Scoala Gimnaziala Principele Radu Adjud	43
27235	Gradinita Cu Program Prelungit Numarul 13 Focsani	43
27236	Scoala Gimnaziala Paunesti	43
27237	Scoala Gimnaziala Maresal Alexandru Averescu Adjud	43
27238	Scoala Gimnaziala Suraia	43
27239	Scoala Gimnaziala Nr. 1 Straoane	43
27240	Liceul Tehnologic Odobesti	43
27241	Scoala Gimnaziala Dumitru Pricop Negrilesti	43
27242	Scoala Gimnaziala Victor Slavescu Cotesti	43
27243	Liceul Tehnologic G.g.  Longinescu	43
27244	Scoala Gimnaziala  Spulber	43
27245	Gradinita Cu Program Prelungit Nr.1 Focsani	43
27246	Scoala Gimnaziala Paunesti	43
27247	Scoala Gimnaziala Nr.1mera	43
27248	Scoala Gimnaziala Suraia	43
27249	Colegiul National Emil Botta Adjud	43
27250	Liceul Tehnologic Odobesti	43
27251	Scoala Gimnaziala Movilita	43
27252	Scoala Gimnaziala Victor Slavescu Cotesti	43
27253	Scoala Gimnaziala Ioan Voda Cel Viteaz Slobozia Ciorasti	43
27254	Scoala Gimnaziala  Spulber	43
27255	Liceul Teoretic Odobesti	43
27256	Scoala Gimnaziala Mihail Armencea Adjud	43
27257	Scoala Gimnaziala Vizantea Razaseasca	43
27258	Scoala Gimnaziala Virtescoiu	43
27259	Scoala Gimnaziala Racoasa	43
27260	Scoala Gimnaziala Simion Mehedinți Soveja	43
27261	Scoala Gimnaziala Emil Atanasiu Garoafa	43
27262	Colegiul National Unirea Focsani	43
27263	Scoala Gimnaziala Alexandru Vlah Uta	43
27264	Scoala Gimnaziala Barbu Stefanescu Delavrancea Naruja	43
27265	Scoala Gimnaziala Nanesti	43
27266	Scoala Gimnaziala Nanesti	43
27267	Colegiul National Al. I. Cuza Focsani	43
27268	Scoala Gimnaziala Vu Ltu Ru	43
27269	Gradinita Cu Program Prelungit Nr. 2 Focsani	43
27270	Scoala Gimnaziala Ploscuteni	43
20966	Scoala Gimnaziala Sohodol	3
20967	Scoala Gimnaziala Aron Cotrus  Cergau Mare	3
20968	Scoala Gimnaziala Intregalde	3
20969	Colegiul Tehnic Ion D Lazarescu	3
20970	Colegiul Tehnic Apulum	3
20971	Scoala Gimnaziala Iosif Sarbu Sibot	3
20972	Scoala Gimnaziala Simion Lazar Lunca Mureșului	3
20973	Scoala Gimnaziala Vasile Goldis	3
20974	Scoala Gimnaziala Germana Sebes	3
20975	Liceul Dr.lazar Chirila Baia De Aries	3
20976	Scoala Gimnaziala Drasov	3
20977	Scoala Gimnaziala Petresti	3
20978	Liceul Tehnologic Tara Motilor Albac	3
20979	Scoala Gimnaziala Livezile	3
20980	Scoala Gimnaziala Vadu Motilor	3
20981	Liceul Teologic Romano-catolic Grof Majlath Gusztav Karoly	3
20982	Scoala Gimnaziala Demetriu Radu  Radesti	3
20983	Liceul Tehnologic Jidvei	3
20984	Scoala Gimnaziala Sugag	3
20985	Liceul Thnologic De Turism Si Alimentatie Arieseni	3
20986	Scoala Gimnaziala Demetriu Radu  Radesti	3
20987	Scoala Gimnaziala Simion Pantea Salciua	3
20988	Scoala Gimnaziala Sugag	3
20989	Scoala Gimnaziala Simion Barn Utiu	3
20990	Scoala Gimnaziala Vasile Goldis	3
20991	Scoala Gimnaziala Lopadea Noua	3
20992	Colegiul National David Prodan Cugir	3
20993	Gradinita Cu Program Prelungit Dumbrava Minunata Alba Iulia	3
20994	Scoala Gimnaziala Singidava Cugir	3
20995	Liceul Horea Closca Si Crisan Abrud	3
20996	Scoala Gimnaziala Prof. Univ. Dr Gheorghe Beleiu Poiana Vadului	3
20997	Scoala Gimnaziala Girbova	3
20998	Liceul Dr.lazar Chirila Baia De Aries	3
20999	Scoala Gimnaziala Simion Balint Rosia Montana	3
21000	Scoala Gimnaziala Ion Pop Reteganul	3
21001	Scoala Gimnaziala Ovidiu Hulea	3
21002	Liceul Tehnologic Agricol Alexandru Borza Ciumbrud	3
21003	Scoala Gimnaziala Ion Agarbiceanu Bucium	3
21004	Scoala Gimnaziala Avram Iancu	3
21005	Scoala Gimnaziala Iuliu Maniu Vintu De Jos	3
21006	Scoala Gimnaziala Simion Pantea Salciua	3
21007	Scoala Gimnaziala Ion Breazu Mihalt	3
21008	Scoala Gimnaziala Mihai Eminescu Ighiu	3
21009	Gradinita Cu Program Prelungit Nr 2 Aiud	3
21010	Liceul De Arte  Regina Maria  Alba Iulia	3
21011	Scoala Gimnaziala Nicodim Ganea Bistra	3
21012	Scoala Gimnaziala Dr.petru Span Lupsa	3
21013	Scoala Gimnaziala Toma Cocisiu	3
21014	Scoala Gimnaziala Simion Barn Utiu	3
21015	Gradinita Cu Program Prelungit Nr.13 Alba Iulia	3
21016	Scoala Gimnaziala Stremt	3
21017	Scoala Gimnaziala Emil Racovita Girda De Sus	3
21018	Liceul Thnologic De Turism Si Alimentatie Arieseni	3
21019	Colegiul Tehnic Alexandru Domsa	3
21020	Scoala Gimnaziala Sebes Pal Rimetea	3
21021	Scoala Gimnaziala Mihai Eminescu Alba Iulia	3
21022	Scoala Gimnaziala Lopadea Noua	3
21023	Scoala Gimnaziala Avram Iancu Abrud	3
21024	Gradinita Cu Program Prelungit Primii Pasi Aiud	3
21025	Scoala Gimnaziala Craciunelu De Jos	3
21026	Colegiul National David Prodan Cugir	3
21027	Liceul Cu Program Sportiv Sebes	3
21028	Scoala Gimnaziala Nicodim Ganea Bistra	3
21029	Scoala Gimnaziala Daia Romana	3
21030	Scoala Gimnaziala Avram Iancu Unirea	3
21031	Scoala Gimnaziala Ocolis	3
21032	Scoala Gimnaziala Toma Cocisiu	3
21033	Liceul Tehnolgic Ocna Mureș	3
21034	Scoala Gimnaziala Ion Pop Reteganul	3
21035	Scoala Gimnaziala Horea	3
21036	Gradinita Cu Program Prelungit Nr.13 Alba Iulia	3
21037	Scoala Gimnaziala Noslac	3
21038	Liceul Tehnologic Timotei  Cipariu	3
21039	Scoala Gimnaziala Emil Racovita Girda De Sus	3
21040	Scoala Gimnaziala Ciuruleasa	3
21041	Colegiul Tehnic Alexandru Domsa	3
21042	Scoala Gimnaziala Mihai Eminescu Ighiu	3
21043	Scoala Gimnaziala Mihai Eminescu Alba Iulia	3
21044	Scoala Gimnaziala Rosia De Secas	3
21045	Scoala Gimnaziala Avram Iancu Abrud	3
21046	Scoala Gimnaziala Rosia De Secas	3
21047	Liceul Tehnolgic Ocna Mureș	3
21048	Scoala Gimnaziala Mihai Eminescu Ighiu	3
21049	Scoala Gimnaziala Horea	3
21050	Scoala Gimnaziala Iosif Pervain Cugir	3
21051	Scoala Gimnaziala Noslac	3
21052	Scoala Gimnaziala Dr.petru Span Lupsa	3
21053	Colegiul Tehnic Aiud	3
21054	Scoala Gimnaziala Stremt	3
21055	Colegiul National Inochentie Micu Clain Blaj	3
21056	Scoala Gimnaziala Sebes Pal Rimetea	3
21057	Gradinita Cu Program Prelungit Piticot	3
21058	Gradinita Cu Program Prelungit Primii Pasi Aiud	3
21059	Scoala Gimnaziala Hopirta	3
21060	Scoala Gimnaziala Mogos	3
21061	Scoala Gimnaziala Petru Pavel Aron Blaj	3
21062	Scoala Gimnaziala Ion Micu Moldovan Blaj	3
21063	Scoala  Gimnaziala Vidra	3
21064	Scoala Gimnaziala Nr.2 Sebes	3
21065	Liceul Teoretic Petru Maior	3
21066	Scoala Gimnaziala Mihail Kogalniceanu	3
21067	Scoala Gimnaziala Cimpeni	3
21068	Liceul Tehnolgic Ocna Mureș	3
21069	Liceul Tehnologic Stefan Manciulea	3
21070	Gradinita Cu Program Prelungit Nr.12 Alba Iulia	3
21071	Scoala Gimnaziala Posaga De Jos	3
21072	Scoala Gimnaziala Horea	3
21073	Scoala Gimnaziala Metes	3
21074	Scoala Gimnaziala Almasu Mare	3
21075	Scoala Gimnaziala Ion Agarbiceanu Alba Iulia	3
21076	Scoala Gimnaziala Noslac	3
21077	Colegiul Economic Dionisie Pop Martian Alba Iulia	3
21078	Colegiul Tehnic Dorin  Pavel	3
21079	Scoala Gimnaziala Ponor	3
21080	Gradinita Cu Program Prelungit Lumea Copiilor Blaj	3
21081	Colegiul National Titu Maiorescu	3
21082	Scoala Gimnaziala Ohaba	3
21083	Scoala Gimnaziala Ion Bianu Valea-lunga	3
21084	Scoala Gimnaziala Ion Agarbiceanu Cenade	3
21085	Scoala Gimnaziala Cilnic	3
21086	Scoala Gimnaziala Nr.3 Cugir	3
21087	Scoala Gimnaziala Almasu Mare	3
21088	Scoala Gimnaziala Farau	3
21089	Scoala Gimnaziala Horea	3
21090	Scoala Gimnaziala Blan Diana	3
21091	Scoala Gimnaziala Noslac	3
21092	Scoala Gimnaziala Nicolae Dragan Galda De Jos	3
21093	Liceul Teologic Greco-catolic Sfantul Vasile Cel Mare Blaj	3
21094	Gradinita Cu Program Prelungit Scufita Rosie Alba Iulia	3
21095	Seminarul Teologic Ortodox Sfantul Simion Stefan	3
21096	Scoala Gimnaziala Ioan De Hunedoara Sintimbru	3
21097	Scoala Gimnaziala Adam Nicolae Arad	4
21098	Scoala Gimnaziala Vanatori	4
21099	Colegiul Economic Arad	4
21100	Scoala Gimnaziala Adam Muller Guttenbrunn Zabran	4
21101	Colegiul Tehnic De Constructii Si Protectia Mediului Arad	4
21102	Scoala Gimnaziala Agrisu Mare	4
21103	Colegiul Tehnic Aurel Vlaicu Arad	4
21104	Scoala Gimnaziala Emil Montia Sicula	4
21105	Colegiul Csiky Gergely Arad	4
21106	Scoala Gimnaziala Olari	4
21107	Colegiul Tehnic De Constructii Si Protectia Mediului Arad	4
21108	Scoala Gimnaziala Buteni	4
21109	Liceul Teoretic Jozef Gregor Tajovsky	4
21110	Liceul Ioan Buteanu Gurahont	4
21111	Scoala Gimnaziala Mora Ferenc Zimandu Nou	4
21112	Scoala Gimnaziala Agrisu Mare	4
21113	Scoala Gimnaziala Sintea Mare	4
21114	Liceul Teoretic  Mihai Veliciu	4
21115	Colegiul Csiky Gergely Arad	4
21116	Liceul Teologic Baptist Alexa Popovici Arad	4
21117	Scoala Primara Sever Bocu Sistarovat	4
21118	Scoala Gimnaziala Titus Popovici Misca	4
21119	Scoala Gimnaziala Craiva	4
21120	Scoala Gimnaziala Vasile Pop  Bocsig	4
21121	Scoala Gimnaziala Mailat	4
21122	Scoala Gimnaziala Taut	4
21123	Scoala Gimnaziala Andrei Saguna Andrei Saguna	4
21124	Scoala Gimnaziala Santana	4
21125	Scoala Gimnaziala Tipar	4
21126	Scoala Gimnaziala Silindia	4
21127	Scoala Gimnaziala Tipar	4
21128	Gradinita Cu Program Prelungit Chisineu Cris	4
21129	Scoala Gimnaziala Tirnova	4
21130	Liceul Teoretic Cermei	4
21131	Gradinita Program Prelungit Palatul  Fermecat	4
21132	Scoala Primara Ignesti	4
21133	Scoala Gimnaziala Aron Cotrus	4
21134	Liceul Tehnologic De Industrie Alimentara	4
21135	Scoala Gimnaziala Corneliu Miclosi Covasint	4
21136	Colegiul Tehnic Aurel Vlaicu Arad	4
21137	Scoala Gimnaziala Stefan Cicio Pop Arad	4
21138	Scoala Gimnaziala Avram Iancu	4
21139	Colegiul National Elena Ghiba Birta Arad	4
21140	Scoala Gimnaziala Fiscut	4
21141	Liceul Tehnologic Francisc Neuman	4
21142	Scoala Gimnaziala Tabajdi Karoly Zerind	4
21143	Scoala Gimnaziala Olosz Lajos Adea	4
21144	Liceul Tehnologic Stefan Hell	4
21145	Scoala Gimnaziala Patrichie Popescu Bata	4
21146	Scoala Gimnaziala Silindia	4
21147	Scoala Gimnaziala Virgil Iovanas Sofron Ea	4
21148	Scoala Gimnaziala Simonyi Imre Satu Nou	4
21149	Universitatea Aurel Vlaicu Arad	4
21150	Scoala Gimnaziala Mihai Eminescu Arad	4
21151	Gradinita Program Prelungit Casuta Piticilor	4
21152	Scoala Gimnaziala Vladimirescu	4
21153	Gradinita Cu Program Prelungit Nr. 1 Arad	4
21154	Liceul Teoretic Cermei	4
21155	Colegiul National Moise Nicoara Arad	4
21156	Scoala Gimnaziala Zadareni	4
21157	Scoala Gmnaziala Plescuta	4
21158	Gradinita Cu Program Prelungit Gradinita Prieteniei	4
21159	Scoala Gimnaziala Sagu	4
21160	Scoala Gimnaziala Santana	4
21161	Scoala Gimnaziala Gheorghe Groza Moneasa	4
21162	Liceul Tehnologic De Industrie Alimentara	4
21163	Scoala Gimnaziala Chisindia	4
21164	Scoala Gimnaziala Carand	4
21165	Liceul Atanasie Marienescu Lipova	4
21166	Scoala Gimnaziala Paulis	4
21167	Scoala Gimnaziala Stefan Bozian Seitin	4
21168	Scoala Gimnaziala Sintea Mare	4
21169	Liceul Tehnologic Francisc Neuman	4
21170	Scoala Gimnaziala Halmagel	4
21171	Gradinita Cu Program Prelungit Gradinita Veseliei Cu Rtici	4
21172	Scoala Gimnaziala Iratosu	4
21173	Scoala Gimnaziala Patrichie Popescu Bata	4
21174	Scoala Gimnaziala Nr.2 Pecica	4
21175	Scoala Gimnaziala Aurel Sebesan Felnac	4
21176	Scoala Primara Sever Bocu Sistarovat	4
21177	Scoala Gimnaziala Dr. Ioan Danicico Semlac	4
21178	Scoala Gimnaziala Simonyi Imre Satu Nou	4
21179	Liceul Tehnologic Ion Creanga	4
21180	Scoala Gimnaziala Mailat	4
21181	Scoala Gimnaziala Birzava	4
21182	Scoala Gimnaziala Zadareni	4
21183	Scoala Gimnaziala Zarand	4
21184	Scoala Gimnaziala Tipar	4
21185	Scoala Gimnaziala Pater Godo Mihaly Dorobanti	4
21186	Scoala Gimnaziala Tipar	4
21187	Liceul Special Sfanta Maria	4
21188	Scoala Gimnaziala Carand	4
21189	Gradinita Cu Program Prelungit Gradinita Veseliei Cu Rtici	4
21190	Gradinita Program Prelungit Palatul  Fermecat	4
21191	Scoala Gimnaziala Graniceri	4
21192	Liceul Cu Program Sportiv Arad	4
21193	Scoala Gimnaziala Aurel Sebesan Felnac	4
21194	Scoala Gimnaziala Corneliu Miclosi Covasint	4
21195	Scoala Gimnaziala Aurel Vlaicu Arad	4
21196	Scoala Gimnaziala Teodor Pacatian Ususau	4
21197	Liceul Tehnologic Ion Creanga	4
21198	Colegiul National Elena Ghiba Birta Arad	4
21199	Colegiul National Preparandia Dimitrie Tichindeal Arad	4
21200	Seminarul Teologic Ortodox	4
21201	Scoala Gimnaziala Zarand	4
21202	Scoala Gimnaziala Olosz Lajos Adea	4
21203	Gradinita Cu Program Prelungit Furnicuta Arad	4
21204	Scoala Gimnaziala Nr 2 Curtici	4
21205	Scoala Gimnaziala Nicolae Balcescu Arad	4
21206	Scoala Gimnaziala Lazar Tampa Almas	4
21207	Liceul Tehnologic De Electronica Si Automatizari Caius Iacob	4
21208	Universitatea Aurel Vlaicu Arad	4
21209	Gradinita Cu Program Prelungit Nr.11 Arad	4
21210	Scoala Gimnaziala Birzava	4
21211	Gradinita Program Prelungit Casuta Piticilor	4
21212	Gradinita Cu Program Prelungit Elefantelul Alfa  Arad	4
21213	Gradinita Cu Program Prelungit Nr. 1 Arad	4
21214	Scoala Gimnaziala Pater Godo Mihaly Dorobanti	4
21215	Colegiul National Moise Nicoara Arad	4
21216	Gradinita Program Prelungit Curcubeul Copiilor	4
21217	Scoala Gmnaziala Plescuta	4
21218	Scoala Gimnaziala Secusigiu	4
21219	Scoala Gimnaziala Sagu	4
21220	Scoala Gimnaziala Iacobini	4
21221	Scoala Gimnaziala Gheorghe Groza Moneasa	4
21222	Liceul Tehnologic Vasile Juncu Minis	4
21223	Scoala Gimnaziala Chisindia	4
21224	Liceul Tehnologic Beliu	4
21225	Liceul Atanasie Marienescu Lipova	4
21226	Liceul Tehnologic Vasile Juncu Minis	4
21227	Liceul Tehnologic Beliu	4
21228	Scoala Gimnaziala Iosif Moldovan	4
21229	Scoala Gimnaziala Mihai Veliciu Sepreus	4
21230	Scoala Gimnaziala Peregu Mic	4
21231	Liceul Tehnologic De Transporturi Auto Henri Coanda	4
21232	Scoala Gimnaziala Peregu Mare	4
21233	Scoala Gimnaziala Simand	4
21234	Scoala Gimnaziala Fratii Neuman	4
21235	Scoala Gimnaziala Fintinele	4
21236	Liceul Tehnologic Chisineu Cris	4
21237	Scoala Gimnaziala Iustin Marsieu Socodor	4
21238	Scoala Gimnaziala Caius Iacob	4
21239	Scoala Gimnaziala Balilesti	5
21240	Universitatea Constantin Brancoveanu	5
21241	Colegiul National Dinicu Golescu	5
21242	Liceul Tehnologic Dinu  Bratianu	5
21243	Scoala Gimnaziala Traian	5
21244	Scoala Gimnaziala Elena Davila Perticari	5
21245	Scoala Gimnaziala Toma Bratianu	5
21246	Liceul Tehnologic Dinu  Bratianu	5
21247	Scoala Gimnaziala  George Marinescu	5
21248	Universitatea Din Pitesti	5
21249	Scoala Gimnaziala Nr.1uda	5
21250	Scoala Gimnaziala Nr 1	5
21251	Liceul Tehnologic Dacia	5
21252	Scoala Gimnaziala  Brosteni Aninoasa	5
21253	Scoala Gimnaziala Serbanesti	5
21254	Scoala Gimnaziala Balilesti	5
21255	Liceul Tehnologic Auto	5
21256	Scoala Gimnaziala Gheorghe I.i.c. Bratianu	5
21257	Scoala Gimnaziala General Constantin Cristescu	5
21258	Scoala Gimnaziala Nr.1	5
21259	Scoala Gimnaziala Nr.1	5
21260	Scoala Gimnaziala Nr. 1	5
21261	Scoala Gimnaziala Vladimir Streinu	5
21262	Gradinita Cu Program Prelungit Sfanta Marina	5
21263	Scoala Gimnaziala Sanda Movila Albota	5
21264	Scoala Gimnaziala Bratia	5
21265	Scoala Gimnaziala Nr1	5
21266	Gradinita Cu Program Prelungit Micul Print	5
21267	Scoala Gimnaziala  Petre Tutea	5
21268	Colegiul Tehnic	5
21269	Scoala Gimnaziala  Tudor Cornel	5
21270	Colegiul National Dinicu Golescu	5
21271	Scoala Gimnaziala Petre Badea	5
21272	Scoala Gimnaziala Dumitru Udrescu	5
21273	Liceul Tehnologic Auto	5
21274	Scoala Gimnaziala Alexandru Davila	5
21275	Scoala Gimnaziala Nr.1uda	5
21276	Scoala Gimnaziala Virgil Calotescu Bascov	5
21277	Scoala Gimnaziala Nr.1	5
21278	Scoala Gimnaziala Nr 1 Vulturesti	5
21279	Scoala Gimnaziala Serbanesti	5
21280	Liceul Tehnologic  Foresti Er	5
21281	Scoala Gimnaziala Sanda Movila Albota	5
21282	Liceul Tehnologic  I.c.  Petrescu	5
21283	Scoala Gimnaziala General Constantin Cristescu	5
21284	Scoala Gimnaziala Tu Dor Arghezi	5
21285	Scoala Gimnaziala Gruiu Din Comuna Cateasca	5
21286	Scoala Gimnaziala  Nae A Ghica	5
21287	Gradinita Cu Program Prelungit Raza De Soare	5
21288	Scoala Gimnaziala Harsesti	5
21289	Gradinita Cu Program Prelungit Aripi Deschise	5
21290	Scoala Gimnaziala Ilie Stanculescu Raca	5
21291	Scoala De Muzica Campulung	5
21292	Scoala Gimnaziala Nicolae Velea	5
21293	Liceul Tehnologic Auto	5
21294	Scoala Gimnaziala Iosif Catrinescu	5
21295	Liceul Tehnologic  Petre Ionescu Muscel	5
21296	Scoala Gimnaziala Constantin Balaceanu Stolnici	5
21297	Scoala Gimnaziala Traian	5
21298	Liceul Cu Program Sportiv Viitorul Pitesti	5
21299	Scoala Gimnaziala Dirmanesti	5
21300	Scoala Gimnaziala Nr.1	5
21301	Scoala Gimnaziala Nr.1	5
21302	Gradinita Cu Program Normal Campionii	5
21303	Scoala Gimnaziala Galesu	5
21304	Scoala Gimnaziala Constantin Brancoveanu	5
21305	Gradinita Cu Program Prelungit Micul Print	5
21306	Gradinita Cu Program Prelungit Alba Ca Zapada	5
21307	Scoala Gimnaziala Nr.1	5
21308	Scoala Gimnaziala Carol I	5
21309	Scoala Gimnaziala Nr 1  Bughea De Sus	5
21310	Scoala Gimnaziala Liviu Rebreanu	5
21311	Scoala Gimnaziala Nr.1	5
21312	Scoala Gimnaziala  Petre Tutea	5
21313	Scoala Gimnaziala Virgil Calotescu Bascov	5
21314	Gradinita Cu Program Prelungit Raza De Soare	5
21315	Scoala Gimnaziala Naum Ramniceanu	5
21316	Scoala Gimnaziala Mosoaia	5
21317	Scoala Gimnaziala  Nae A Ghica	5
21318	Scoala Gimnaziala Harsesti	5
21319	Scoala Gimnaziala	5
21320	Scoala Gimnaziala Petre Badea	5
21321	Liceul Tehnologic  Foresti Er	5
21322	Scoala De Muzica Campulung	5
21323	Scoala Gimnaziala Cotmeana	5
21324	Gradinita Cu Program Prelungit Floare De Colt	5
21325	Scoala Gimnaziala Ilie Stanculescu Raca	5
21326	Liceul Tehnologic Constantin Brancusi	5
21327	Scoala Gimnaziala Tu Dor Vladimirescu	5
21328	Scoala Gimnaziala Iosif Catrinescu	5
21329	Scoala Gimnaziala Ion Iorgulescu	5
21330	Scoala Gimnaziala Nr.1	5
21331	Scoala Gimnaziala Nr .1	5
21332	Scoala Gimnaziala General Constantin Cristescu	5
21333	Liceul Cu Program Sportiv Viitorul Pitesti	5
21334	Scoala Speciala Pentru Copii Cu Deficiente Asociate Sfantul  Stelian Costesti	5
21335	Scoala Gimnaziala Nicolae Simonide	5
21336	Liceul Tehnologic Auto	5
21337	Gradinita Cu Program Normal Campionii	5
21338	Scoala Gimnaziala Sanda Movila Albota	5
21339	Liceul Teologic Elim	5
21340	Scoala Gimnaziala Vladimir Streinu	5
21341	Scoala Gimnaziala Mircea Ghitulescu	5
21342	Scoala Gimnaziala  Petre Tutea	5
21343	Gradinita Cu Program Prelungit Primii Pasi	5
21344	Scoala Gimnaziala Nr.1	5
21345	Gradinita Cu Program Prelungit Fantezia	5
21346	Scoala Gimnaziala Cd Aricescu	5
21347	Gradinita Cu Program Prelungit Academia Piticilor	5
21348	Scoala Gimnaziala Marin Preda	5
21349	Colegiul National Ion C Bratianu	5
21350	Colegiul Tehnic	5
21351	Seminarul Teologic Ortodox Neagoe Voda Basarab	5
21352	Scoala Gimnaziala Constantin Brancoveanu	5
21353	Scoala Gimnaziala Ion Minulescu	5
21354	Scoala Gimnaziala Nr.1	5
21355	Scoala Gimnaziala Matei Basarab	5
21356	Scoala Gimnaziala Nicolae Balcescu	5
21357	Gradinita Cu Program Prelungit Pui De Lei	5
21358	Scoala Gimnaziala Dumitru Udrescu	5
21359	Colegiul National Vlaicu Voda	5
21360	Scoala Gimnaziala Nr 1	5
21361	Scoala Gimnaziala Gabriel Marinescu	5
21362	Scoala Gimnaziala Carol I	5
21363	Scoala Gimnaziala Merisani	5
21364	Scoala Gimnaziala Petre Tudose	5
21365	Colegiul Tehnic Armand Calinescu	5
21366	Scoala Gimnaziala Constantin Brancoveanu	5
21367	Scoala Gimnaziala Mihai Eminescu	5
21368	Gradinita Cu Program Prelungit Castelul Magic	5
21369	Liceul Tehnologic Nrj	5
21370	Liceul Cu Program Sportiv Viitorul Pitesti	5
21371	Colegiul Tehnic Dimitrie Dima	5
21372	Gradinita Cu Program Normal Istetel	5
21373	Scoala Gimnaziala Baiculesti	5
21374	Gradinita Cu Program Normal Campionii	5
21375	Scoala Gimnaziala Prof.emil Negoita	5
21376	Scoala Gimnaziala D Radulescu	5
21377	Scoala Gimnaziala Regina Maria Curtea De Arges	5
21378	Scoala Gimnaziala Mircea Ghitulescu	5
21379	Scoala Gimnaziala Vranesti	5
21380	Scoala Gimnaziala Nr 1	5
21381	Scoala Gimnaziala Nr 1 Cocu	5
21382	Gradinita Cu Program Prelungit Fantezia	5
21383	Scoala Gimnaziala Oprea Iorgulescu	5
21384	Liceul Teoretic Iulia Zamfirescu	5
21385	Liceul Tehnologic	5
21386	Liceul Tehnologic Victor Slavescu	5
21387	Gradinita Cu Program Prelungit Dumbrava Minunata	5
21388	Scoala Gimnaziala Petre Tudose	5
21389	Scoala Gimnaziala Nr 1	5
21390	Scoala Gimnaziala Nr.1	5
21391	Liceul De Arte Dinu Lipatti	5
21392	Scoala Gimnaziala Musatesti	5
21393	Scoala Gimnaziala Nr 1	5
21394	Scoala Gimnaziala Vintila Bratianu	5
21395	Scoala Gimnaziala Nr 1  Poiana Lacului	5
21396	Colegiul National Pedagogic Carol I	5
21397	Scoala Gimnaziala Nr 1	5
21398	Scoala Gimnaziala Beleti-negresti	5
21399	Scoala Gimnaziala  Nanu Muscel	5
21400	Scoala Gimnaziala Basarab I	5
21401	Colegiul National Alexandru Odobescu	5
21402	Scoala Gimaziala Moraresti	5
21403	Scoala Gimnaziala Nr.1 Schitu Golesti	5
21404	Scoala Gimnaziala Mircea Cel Batran	5
21405	Colegiul National Ion C Bratianu	5
21406	Scoala Gimnaziala Nr 1	5
21407	Scoala Gimnaziala Babana	5
21408	Scoala Gimnaziala	5
21409	Liceul Tehnologic Ferdinand I	5
21410	Scoala Gimnaziala Petre Tudose	5
21411	Gradinita Cu Program Prelungit Dumbrava Minunata	5
21412	Gradinita Cu Program Prelungit Castelul Fermecat	5
21413	Liceul De Arte Dinu Lipatti	5
21414	Scoala Gimnaziala Musatesti	5
21415	Scoala Gimnaziala Nr 1  Poiana Lacului	5
21416	Scoala Gimnaziala Ion Pillat	5
21417	Scoala Gimnaziala  Nanu Muscel	5
21418	Colegiul National Pedagogic Carol I	5
21419	Scoala Gimnaziala Nr.1 Schitu Golesti	5
21420	Scoala Gimnaziala Mihai Eminescu	5
21421	Liceul Tehnologic Topoloveni	5
21422	Scoala Gimnaziala Basarab I	5
21423	Liceul Tehnologic Vedea	5
21424	Liceul Tehnologic Constantin Dobrescu	5
21425	Scoala Gimnaziala Tu Dor Vladimirescu	5
21426	Scoala Gimnaziala Nr 1  Poiana Lacului	5
21427	Scoala Gimnaziala  Nanu Muscel	5
21428	Scoala Gimnaziala Nr.1 Schitu Golesti	5
21429	Liceul Tehnologic Topoloveni	5
21430	Liceul Tehnologic Vedea	5
21431	Scoala Gimnaziala Tu Dor Vladimirescu	5
21432	Scoala Gimnaziala Ion Iorgulescu	5
21433	Scoala Gimnaziala Ungureni	6
21434	Universitatea George Bacovia	6
21435	Scoala Gimnaziala Nr.1  Blagesti	6
21436	Liceul Tehnologic Jacques M. Elias Com. Sascut	6
21437	Scoala Gimnaziala Nr.1  Comuna Manastirea Casin	6
21438	Scoala Gimnaziala Nicolae Iorga	6
21439	Scoala Gimnaziala Helegiu	6
21440	Scoala Gimnaziala Nr.1 Slanic Moldova	6
21441	Scoala Gimnaziala Comuna Cleja	6
21442	Scoala Gimnaziala Comuna Racaciuni	6
21443	Scoala Gimnaziala Sfantul Voievod Stefan Cel Mare	6
21444	Scoala Gimnaziala Stefan Cel Mare Oras Buhusi	6
21445	Scoala Gimnaziala Nicolae Balcescu	6
21446	Scoala Gimnaziala Emil Braescu Magura	6
21447	Scoala Gimnaziala Glavanesti	6
21448	Scoala Gimnaziala Comuna Cotofanesti	6
21449	Scoala Gimnaziala Comuna Colonesti	6
21450	Scoala Gimnaziala Secuieni	6
21451	Scoala Gimnaziala Alexandru Sever  Moinesti	6
21452	Scoala Gimnaziala Nr.1  Comuna Manastirea Casin	6
21453	Scoala Cu Clasele I-viii Huruiesti	6
21454	Colegiul Henri Coanda Bacău	6
21455	Colegiul National De Arta George Apostu	6
21456	Scoala Gimnaziala Stefan Cel Mare Oras Buhusi	6
21457	Scoalanationala De Pregatire A Agentilor De Penitenciare	6
21458	Colegiul Tehnic Anghel Saligny	6
21459	Scoala Gimnazialcomuna Oncesti	6
21460	Scoala Gimnaziala Helegiu	6
21461	Scoala Gimnaziala Nr.1  Municipiul Onesti	6
21462	Colegiul National Pedagogic Stefan Cel Mare	6
21463	Colegiul Tehnic Grigore Cobalcescu	6
21464	Scoala Gimnaziala Alexandru  Cel Bun  Bacău	6
21465	Scoala Gimnaziala  Al . I. Cuza  Bacău	6
21466	Liceul Tehnologic  Darman Esti	6
21467	Liceul Tehnologic Municipiul Onesti	6
21468	Scoala Gimnaziala Stefan Luchian Moinesti	6
21469	Scoala Gimnaziala Octavian Voicu	6
21470	Scoala Gimnaziala Comuna Scorteni	6
21471	Scoala Gimnaziala Scarlat Longhin -dofteana	6
21472	Scoala Gimnaziala Nicolae Balcescu	6
21473	Scoala Gimnaziala George Apostu Stanisesti	6
21474	Scoala Gimnaziala Comuna Beresti Tazlau	6
21475	Colegiul National Vasile Alecsandri	6
21476	Colegiul Tehnic Petru Poni	6
21477	Scoala Gimnaziala Parava	6
21478	Scoala Gimnaziala Glavanesti	6
21479	Liceul Tehnologic . Oras Tirgu Ocna	6
21480	Liceul Tehnologic  Rachitoasa	6
21481	Scoala Gimnaziala Comuna Agas	6
21482	Scoala Gimnaziala Comuna Colonesti	6
21483	Colegiul Grigore Antipa Bacău	6
21484	Scoala Gimnaziala Nr.1 Comuna Faraoani	6
21485	Scoala Gimnaziala Comuna Filipeni	6
21486	Scoala Gimnaziala Calugareni	6
21487	Scoala Gimnaziala Comuna Strugari	6
21488	Scoala Gimnaziala Nicolae Balcescu	6
21489	Scoala Gimnaziala Ciprian Porumbescu Comanesti	6
21490	Colegiul Tehnic Grigore Cobalcescu	6
21491	Scoala Gimnaziala Stefan Cel Mare Comuna Zemes	6
21492	Scoala Gimnaziala Gheorghe Nechita Motoseni	6
21493	Scoala Gimnaziala Ghita Mocanu	6
21494	Scoala Gimnaziala Comuna Sascut	6
21495	Scoala Gimnaziala Liviu Rebreanu Oras Comanesti	6
21496	Scoala Gimnaziala Comuna Beresti Tazlau	6
21497	Universitatea Vasile Alecsandri Din Bacău	6
21498	Scoala Gimnaziala Vasile Gh.radu Satu Nou	6
21499	Scoala Gimnaziala Ioana Radu Rosetti Comuna Brusturoasa	6
21500	Scoala Gimnaziala Secuieni	6
21501	Scoala Gimnaziala Nr.2 Targu Ocna	6
21502	Scoala Gimnaziala Vultureni	6
21503	Liceul Tehnologic  Rachitoasa	6
21504	Scoala Gimnaziala Mihail Andrei Orasul Buhusi	6
21505	Scoala Gimnaziala Nr 1 Comuna Valea Seaca	6
21506	Scoala Gimnaziala Vultureni	6
21507	Colegiul Economic Ion Ghica Bacău	6
21508	Scoala Gimnaziala Nr.1  Municipiul Onesti	6
21509	Scoala Gimnaziala Nr. 1 Oituz	6
21510	Colegiul Tehnic Grigore Cobalcescu	6
21511	Liceul Tehnologic Ghimes-faget	6
21512	Scoala Gimnaziala  Al . I. Cuza  Bacău	6
21513	Liceul Tehnologic Municipiul Onesti	6
21514	Scoala Gimnaziala Vasile Gh.radu Satu Nou	6
21515	Scoala Gimnaziala Sat Ch Etris Comuna Tamasi	6
21516	Scoala Gimnaziala -sat Haghiac Comuna Dofteana	6
21517	Scoala Gimnaziala Scarlat Longhin -dofteana	6
21518	Scoala Gimnaziala Mihail Andrei Orasul Buhusi	6
21519	Scoala Gimnaziala Comuna Buciumi	6
21520	Liceul Teologic Fericitul Ieremia	6
21521	Colegiul National Vasile Alecsandri	6
21522	Scoala Gimnaziala Alexandru Cel Bun Berzunti	6
21523	Scoala Gimnaziala Loc Plopu Darman Esti	6
21524	Colegiul Mihai Eminescu Bacău	6
21525	Liceul Tehnologic . Oras Tirgu Ocna	6
21526	Scoala Gimnaziala Alecu Russo	6
21527	Scoala Populara De Arte  Si Meserii	6
21528	Scoala Gimnaziala Sat Cornii De Sus Com.tatarasti	6
21529	Scoala Gimnaziala Mihai Eminescu Lespezi Com Girleni	6
21530	Scoala Gimnaziala Nr.1 Comuna Livezi	6
21531	Scoala Gimnaziala Comuna Solont	6
21532	Scoala Gimnaziala General Nicolae Sova Poduri	6
21533	Scoala Cu Clasele I-viii Constantin Moscu Izvoru Berheciului	6
21534	Scoala Gimnaziala Comuna Magiresti	6
21535	Scoala Gimnaziala Comuna Caiuti	6
21536	Scoala Gimnaziala Mihai Dragan Mun Bacău	6
21537	Colegiul National Grigore C Moisil	6
21538	Scoala Gimnaziala Comuna Pirjol	6
21539	Scoala Gimnaziala Sat Racatau Comuna Horgesti	6
21540	Scoala Gimnaziala Corbasca	6
21541	Scoala Cu Clasele I-viii Ionita Sandu Sturdza	6
21542	Scoala Gimnaziala Com. Luizi Calugara	6
21543	Scoala Gimnaziala Nr. 1 Oituz	6
21544	Scoala  Gimnaziala Nr.1 Gura Vaii	6
21545	Scoala Gimnaziala Domnita Maria	6
21546	Liceul Teologic Fericitul Ieremia	6
21547	Colegiul Tehnic Ion Borcea Buhusi	6
21548	Liceul Cu Program Sportiv	6
21549	Scoala Gimnaziala Comuna Strugari	6
21550	Scoala Gimnaziala Comuna Buciumi	6
21551	Scoala Gimnaziala Ciprian Porumbescu Comanesti	6
21552	Scoala Gimnaziala Alecu Russo	6
21553	Scoala Gimnaziala Stefan Cel Mare Comuna Zemes	6
21554	Colegiul Mihai Eminescu Bacău	6
21555	Scoala Gimnaziala Ghita Mocanu	6
21556	Scoala Gimnaziala Nr.1 Comuna Livezi	6
21557	Scoala Gimnaziala Liviu Rebreanu Oras Comanesti	6
21558	Scoala Gimnaziala Loc Plopu Darman Esti	6
21559	Universitatea Vasile Alecsandri Din Bacău	6
21560	Scoala Gimnaziala Comuna Magiresti	6
21561	Scoala Gimnaziala Ioana Radu Rosetti Comuna Brusturoasa	6
21562	Colegiul National Catolic Sfantul Iosif	6
21563	Scoala Gimnaziala Nr.2 Targu Ocna	6
21564	Scoala Gimnaziala Mihai Dragan Mun Bacău	6
21565	Scoala Gimnaziala General Nicolae Sova Poduri	6
21566	Universitatea Vasile Alecsandri Din Bacău	6
21567	Scoala Gimnaziala Mihai Eminescu Lespezi Com Girleni	6
21568	Liceul Tehnologic Alexandru Vlahuta Podu Turcului	6
21569	Scoala Gimnaziala George Enescu Moinesti	6
21570	Scoala Gimnaziala Ioana Radu Rosetti Comuna Brusturoasa	6
21571	Scoala Gimnaziala Comuna Solont	6
21572	Scoala Gimnaziala Nr.3 Orasul Darmanesti	6
21573	Scoala Gimnaziala Ion Borcea Comuna Racova	6
21574	Scoala Gimnaziala Nr.2 Targu Ocna	6
21575	Scoala Cu Clasele I-viii Constantin Moscu Izvoru Berheciului	6
21576	Scoala Gimnaziala Nr.1 Comuna Rosiori	6
21577	Scoala Gimnaziala Gheorghe Bantas Itesti	6
21578	Scoala Gimnaziala Nr 22	6
21579	Scoala Gimnaziala Filipesti	6
21580	Scoala Gimnaziala Nr.1 Slobozia	6
21581	Colegiul Tehnic Dumitru Mangeron Bacău	6
21582	Scoala Gimnaziala Nr. 2 Orasul Darmanesti	6
21583	Scoala Gimnaziala Nr. 1 Negoiesti	6
21584	Scoala Gimnaziala  Gheorghe Avramescu	6
21585	Scoala Gimnaziala Nr 1 Pincesti	6
21586	Colegiul Sportiv Nadia Comaneci	6
21587	Scoala Gimnaziala Alecu Russo	6
21588	Scoala Gimnaziala Ion Rotaru Valea Lui Ion	6
21589	Scoala Gimnaziala Nr.1 Comuna Livezi	6
21590	Scoala Gimnaziala Bacioiu	6
21591	Scoala Gimnaziala Comuna Magiresti	6
21592	Scoala Gimnaziala Nr.1 Comuna Sarata	6
21593	Scoala Gimnaziala Mihai Dragan Mun Bacău	6
21594	Scoala Gimnaziala Comuna Dealu Morii	6
21595	Scoala Gimnaziala Comuna Pirjol	6
21596	Scoala Gimnaziala George Enescu Moinesti	6
21597	Scoala Gimnaziala Ion Borcea Comuna Racova	6
21598	Scoala Gimnaziala Gheorghe Bantas Itesti	6
21599	Scoala Gimnaziala Filipesti	6
21600	Colegiul Tehnic Dumitru Mangeron Bacău	6
21601	Scoala Gimnaziala Nr. 1 Negoiesti	6
21602	Scoala Gimnaziala Nr 1 Pincesti	6
21603	Scoala Gimnaziala Costachi S.ciocan Comanesti	6
21604	Liceul Don Orione	7
21605	Liceul Teoretic Ady Endre	7
21606	Gradinita Cu Program Prelungit Toldi Salonta	7
21607	Scoala Gimnaziala Dimitrie Cantemir	7
21608	Scoala Gimnaziala Nr.1  Bulz	7
21609	Liceul Ortodox Episcop Roman Ciorogariu Municipiul Oradea	7
21610	Scoala Gimnaziala Szalardi Janos Salard	7
21611	Liceul Don Orione	7
21612	Colegiul Tehnic Nr 1 Vadu Crisului	7
21613	Scoala Gimnaziala Nr.1 Cheresig	7
21614	Liceul Teoretic Horvath Janos	7
21615	Scoala De Arte Francisc Hubic	7
21616	Scoala Gimnaziala Lucretia Suciu	7
21617	Scoala Gimnaziala Nr.1 Comuna Pomezeu	7
21618	Scoala Gimnaziala Nr. 1 Comuna Viisoara	7
21619	Scoala Gimnaziala Toldy Sinnicolau De Munte	7
21620	Colegiul Economic Partenie Cosma Oradea	7
21621	Scoala Gimnaziala Nr.1 Sat Urvis De Beius Comuna Soimi	7
21622	Scoala Primara Nr.1 Comuna Pocola	7
21623	Scoala Gimnaziala Nicolae Popoviciu Beius	7
21624	Liceul Tehnologic Nr. 1 Suplacu De Barcau	7
21625	Scoala Gimnaziala Nr.1  Comuna Sirbi	7
21626	Universitatea Din Oradea	7
21627	Universitatea Crestina Partium	7
21628	Scoala De Pregatire A Agentilor Politiei De Frontiera Avram Iancu	7
21629	Scoala Gimnaziala Nr.1  Comuna Ceica	7
21630	Liceul De Arte	7
21631	Scoala Gimnaziala Nr 1 Oras Nucet	7
21632	Colegiul National Iosif Vulcan	7
21633	Scoala Gimnaziala Nr.1 Sintandrei	7
21634	Gradinita Cu Program Prelungit Nr.34	7
21635	Gradinita Cu Program Prelungit Toldi Salonta	7
21636	Scoala Gimnaziala Nr.1  Sat Petreu Comuna Abramut	7
21637	Scoala Gimnaziala Nr. 1 Sinteu	7
21638	Liceul Teoretic Lucian  Blaga	7
21639	Scoala Gimnaziala Avram Iancu Oradea	7
21640	Scoala Gimnaziala Nr.1  Comuna Tarcea	7
21641	Scoala Gimnaziala Nr.1 Cheresig	7
21642	Scoala Gimnaziala Nr. 1 Sacadat	7
21643	Scoala Gimnaziala Nr.1  Bulz	7
21644	Gradinita Nr. 54	7
21645	Scoala Gimnaziala Nicolae Bogdan Vascau	7
21646	Scoala Gimnaziala Nr.1 Sat Urvis De Beius Comuna Soimi	7
21647	Scoala Gimnaziala Nr 1 Husasau De Tinca	7
21648	Liceul Tehnologic George Baritiu Oradea	7
21649	Scoala Gimnaziala Oltea Doamna	7
21650	Scoala Gimnaziala Miskolczy Karoly Sat  Misca Comuna Chislaz	7
21651	Scoala Gimnaziala Benedek Elek Comuna Cetariu	7
21652	Scoala Gimnaziala Nr.1 Comuna Curatele	7
21653	Colegiul National Avram Iancu	7
21654	Scoala Gimnaziala Nr.1  Comuna Sirbi	7
21655	Scoala Gimnaziala Nr. 1 Comuna Lunca	7
21656	Scoala Gimnaziala Nr 1 Oras Nucet	7
21657	Scoala Gimnaziala Nr.1 Sannicolau Roman	7
21658	Scoala Gimnaziala Nr.1  Bulz	7
21659	Liceul Tehnologic Horea	7
21660	Scoala Gimnaziala Balasko Nandor Comuna Salacea	7
21661	Scoala Gimnaziala Nr.1 Comuna Budureasa	7
21662	Liceul Tehnologic Nrj Comuna Popesti	7
21663	Scoala Primara Nr1 Comuna Paleu	7
21664	Scoala Gimnaziala Avram Iancu Oradea	7
21665	Scoala Gimnaziala Nr. 1 Comuna Tauteu	7
21666	Scoala Gimnaziala Nr.11	7
21667	Scoala Gimnaziala Szalardi Janos Salard	7
21668	Scoala Gimnaziala Nr. 1 Gepiu	7
21669	Liceul Tehnologic Nrj Comuna Popesti	7
21670	Liceul Tehnologic Ioan Bococi	7
21671	Scoala Gimnaziala Miron Pompiliu	7
21672	Scoala Gimnaziala Nr.1 Comuna Bu Duslau	7
21673	Liceul Teoretic Lucian  Blaga	7
21674	Scoala Gimnaziala Nr.1 Comuna Cociuba Mare	7
21675	Scoala Gimnaziala Nr. 1 Sinteu	7
21676	Scoala Gimnaziala Ovidiu Drimba	7
21677	Colegiul National „samuil Vu Lcanbeius	7
21678	Scoala Gimnaziala Nr. 1 Comuna Rieni	7
21679	Scoala Gimnaziala Octavian Goga Oradea	7
21680	Gradinita Cu Program Prelungit Nr. 45	7
21681	Scoala Gimnaziala Nr. 1 Sacadat	7
21682	Liceul Teoretic Aurel Lazar	7
21683	Colegiul Tehnic Nr 1 Vadu Crisului	7
21684	Scoala Gimnaziala Gaspar Andras Comuna Biharia	7
21685	Scoala Gimnaziala Nr 1 Sat Mihai Bravu Comuna Rosiori	7
21686	Liceul Tehnologic Sanitar  Vasile Voiculescu	7
21687	Scoala Gimnaziala Lucretia Suciu	7
21688	Scoala Gimnaziala Nr.1 Comuna Brusturi	7
21689	Liceul De Arte	7
21690	Scoala Gimnaziala Nr.1 Comuna Batar	7
21691	Colegiul National „samuil Vu Lcanbeius	7
21692	Scoala Gimnaziala Zelk Zoltan Valea Lui Mihai	7
21693	Scoala Gimnaziala Nr.1 Abram	7
21694	Gradinita Cu Program Prelungit Nr.25	7
21695	Scoala Gimnaziala Nr. 1 Comuna Viisoara	7
21696	Scoala Gimnaziala Nr.1 Chislaz	7
21697	Gradinita Cu Program Prelungit Nr.34	7
21698	Liceul Tehnologic Agroindustrial  Tamasi Aron	7
21699	Scoala Gimnaziala Nr 1 Sat Mihai Bravu Comuna Rosiori	7
21700	Liceul Tehnologic Nrj  Cadea	7
21701	Colegiul Agricol Nrj Oras Valea Lui Mihai	7
21702	Scoala Gimnaziala Nr.1 Comuna Olcea	7
21703	Colegiul Economic Partenie Cosma Oradea	7
21704	Scoala Gimnaziala Georgiu Popa Cimpani	7
21705	Liceul Teoretic Lucian  Blaga	7
21706	Scoala Gimnaziala Nr. 1 Spinus	7
21707	Liceul Tehnologic Nrj Comuna Popesti	7
21708	Scoala Gimnaziala  Inv.galgau Iosif Sat Pagaia Comuna Boianu Mare	7
21709	Scoala Gimnaziala Nr.1 Uileacu De Beius	7
21710	Scoala Gimnaziala Nicolae Balcescu Oradea	7
21711	Scoala Gimnaziala Nr.1 Cefa	7
21712	Gradinita Cu Program Prelungit Nr. 1 Beius	7
21713	Scoala Gimnaziala Nr.1  Butani	7
21714	Scoala Gimnaziala Nr.1 Nojorid	7
21715	Liceul De Arte	7
21716	Colegiul Tehnic Traian Vuia	7
21717	Scoala Gimnaziala Nr.1  Comuna Capilna	7
21718	Gradinita Cu Program Prelungit Nr.1 Comuna Tinca	7
21719	Colegiul National Mihai Eminescu	7
21720	Scoala Gimnaziala Nr.1 Comuna Bu Ntesti	7
21721	Scoala Gimnaziala Viorel Horj Draganesti	7
21722	Colegiul National „samuil Vu Lcanbeius	7
21723	Colegiul Tehnic Mihai Viteazul Oradea	7
21724	Liceul Teoretic Nicolae  Jiga Tinca	7
21725	Gradinita De Copii Nr.50	7
21726	Liceul Teoretic Petofi San Dor	7
21727	Scoala Gimnaziala Nr. 1 Gepiu	7
21728	Gradinita Cu Program Prelungit Floare De Colt Beius	7
21729	Liceul Teologic Baptist Emanuel	7
21730	Liceul Teologic Penticostal Betel	7
21731	Scoala Gimnaziala Nr.1 Comuna Bu Duslau	7
21732	Scoala Gimnaziala Dacia	7
21733	Scoala Gimnaziala Nr.1 Uileacu De Beius	7
21734	Scoala Gimnaziala Nr 1 Comuna Derna	7
21735	Scoala Gimnaziala Ovidiu Drimba	7
21736	Scoala Gimnaziala Nr.2 Sat Bogei  Comuna Tauteu	7
21737	Scoala Gimnaziala Nr.1  Butani	7
21738	Scoala Gimnaziala Nr.11	7
21739	Gradinita Cu Program Prelungit Nr. 45	7
21740	Liceul Tehnologic Ioan Bococi	7
21741	Scoala Gimnaziala Nr.1  Comuna Capilna	7
21742	Scoala Gimnaziala Nr.1 Comuna Cociuba Mare	7
21743	Scoala Gimnaziala Gaspar Andras Comuna Biharia	7
21744	Scoala Gimnaziala Nr. 1 Comuna Rieni	7
21745	Scoala Gimnaziala Viorel Horj Draganesti	7
21746	Scoala Gimnaziala Zelk Zoltan Valea Lui Mihai	7
21747	Liceul Teoretic Nr 1 Bratca	7
21748	Scoala Gimnaziala Nr.1 Comuna Budureasa	7
21749	Scoala Gimnaziala Nr. 1 Comuna Rieni	7
21750	Gradinita Cu Program Prelungit Nr.25	7
21751	Scoala Gimnaziala Floare De Lotus Sinmartin	7
21752	Scoala Primara Nr1 Comuna Paleu	7
21753	Liceul Teoretic Aurel Lazar	7
21754	Scoala Gimnaziala Nr.1 Chislaz	7
21755	Gradinita Cu Program Prelungit Nr. 28 Oradea	7
21756	Liceul Tehnologic Agroindustrial  Tamasi Aron	7
21757	Liceul Teoretic Constantin Serban	7
21758	Liceul Tehnologic Nrj  Cadea	7
21759	Scoala Gimnaziala Nr.1 Madaras	7
21760	Scoala Gimnaziala Nr.1 Comuna Olcea	7
21761	Colegiul Tehnic Alexandru Roman	7
21762	Scoala Gimnaziala Georgiu Popa Cimpani	7
21763	Scoala Gimnaziala Puiu Sever	7
21764	Scoala Gimnaziala Nrj Tileagd	7
21765	Scoala Gimnaziala Nr.1 Comuna Lazareni	7
21766	Scoala Gimnaziala Georgiu Popa Cimpani	7
21767	Colegiul Tehnic Traian Vuia	7
21768	Gradinita Cu Program Prelungit Nr. 28 Oradea	7
21769	Gradinita Cu Program Prelungit Nr.1 Comuna Tinca	7
21770	Scoala Gimnaziala Nr.1 Madaras	7
21771	Scoala Gimnaziala Nr.1 Comuna Bu Ntesti	7
21772	Scoala Gimnaziala Puiu Sever	7
21773	Scoala Gimnaziala Nr.1 Comuna Lazareni	7
21774	Scoala Gimnaziala Nr. 1 Ciumeghiu	7
21775	Scoala Gimnaziala Nr.1 Comuna Diosig	7
21776	Liceul Cu Program Sportiv Bihorul	7
21777	Colegiul National Teodor Nes	7
21778	Liceul Reformat Lorantffy Zsuzsan Na	7
21779	Liceul Teoretic Onisifor Ghibu	7
21780	Scoala Gimnaziala Ioan Slavici	7
21781	Scoala Gimnaziala Matei	8
21782	Gradinita Cu Program Prelungit Nr.2 Bistrita	8
21783	Scoala Gimnaziala Micestii De Cimpie	8
21784	Gradinita Cu Program Prelungit Nr.1	8
21785	Liceul Cu Program Sportiv Bistrita	8
21786	Scoala Gimnaziala Tiha Birgaului	8
21787	Scoala Gimnaziala Matei	8
21788	Colegiul National Petru Rares Beclean	8
21789	Scoala Gimnaziala Sintereag	8
21790	Gradinita Cu Program Saptamanal Dumbrava Minunata	8
21791	Scoala Gimnaziala Iacob Si Ioachim Mureșanu	8
21792	Scoala Gimnaziala Dumitra	8
21793	Scoala Gimnaziala Avram Iancu	8
21794	Scoala Gimnaziala Nr.1  Ilva Mica	8
21795	Gradinita Cu Program Prelungit Nr.1	8
21796	Scoala Gimnaziala Bu Desti	8
21797	Scoala Gimnaziala Ioan S. Pavelea	8
21798	Scoala Gimnaziala Sieu	8
21799	Gradinita Cu Program Prelungit Raza De Soare	8
21800	Scoala Gimnaziala Milas	8
21801	Scoala Gimnaziala Budacu De Sus	8
21802	Scoala Gimnaziala Nr. 1 Rebra	8
21803	Liceul Cu Program Sportiv Bistrita	8
21804	Liceul Tehnologic  Foresti Er	8
21805	Scoala Gimnaziala Livezile	8
21806	Scoala Gimnaziala Ilva Mare	8
21807	Scoala Gimnaziala Sever Pop Poiana Ilvei	8
21808	Scoala Gimnaziala George Cobuc	8
21809	Colegiul Economic Nasaud	8
21810	Scoala Gimnaziala Lucian Blaga	8
21811	Scoala Gimnaziala Nr. 4	8
21812	Scoala Gimnaziala Tiha Birgaului	8
21813	Liceul Tehnologic Lechinta	8
21814	Scoala Gimnaziala Josenii Birgaului	8
21815	Scoala Gimnaziala Nuseni	8
21816	Scoala Gimnaziala Sintereag	8
21817	Scoala Gimnaziala Nr.1  Lunca Ilvei	8
21818	Scoala Gimnaziala Uriu	8
21819	Scoala Gimnaziala Liviu Rebreanu Chiuza	8
21820	Gradinita Cu Program Saptamanal Dumbrava Minunata	8
21821	Scoala Gimnaziala Vasile Scurtu Parva	8
21822	Gradinita Cu Program Prelungit Nr.6 Bistrita	8
21823	Gradinita Cu Program Prelungit Nr.3	8
21824	Scoala Gimnaziala Avram Iancu	8
21825	Gradinita Cu Program Prelungit Trenuletul Veseliei Bistrita	8
21826	Gradinita Cu Program Prelungit Nr. 12	8
21827	Scoala Gimnaziala Florian Porcius Rodna	8
21828	Scoala Gimnaziala Ilva Mare	8
21829	Scoala Gimnaziala Grigore Herinean Galațiibistritei	8
21830	Scoala Gimnaziala Lucian Blaga	8
21831	Liceul Tehnologic Special Sfanta Maria Bistrita	8
21832	Gradinita Cu Program Prelungit Singeorz-bai	8
21833	Gradinita Cu Program Prelungit Nr.13	8
21834	Scoala Gimnaziala Tiha Birgaului	8
21835	Gradinita Cu Program Prelungit Casuta Cu Povesti	8
21836	Scoala Gimnaziala Stefan Cel Mare	8
21837	Scoala Gimaziala Petru Rares Ciceu-mihaiesti	8
21838	Scoala Gimnaziala Sintereag	8
21839	Scoala Gimnaziala Nr.1  Lesu	8
21840	Scoala Gimnaziala Paul Tanco Monor	8
21841	Scoala Gimnaziala Grigore Silasi Beclean	8
21842	Gradinita Cu Program Saptamanal Dumbrava Minunata	8
21843	Scoala Gimnaziala Urmenis	8
21844	Scoala Gimnaziala Sever Pop Poiana Ilvei	8
21845	Scoala Gimnaziala Avram Iancu	8
21846	Scoala Gimnaziala Nr. 1  Bistrita Birgaului	8
21847	Liceul Tehnologic Ion Caian Romanul	8
21848	Liceul Tehnologic Lechinta	8
21849	Scoala Gimnaziala Enea Grapini	8
21850	Scoala Gimnaziala Tiberiu Morariu	8
21851	Liceul Radu Petrescu	8
21852	Scoala Gimnaziala Dariu Pop	8
21853	Colegiul Tehnic Infoel Bistrita	8
21854	Liceul De Muzica Tudor Jarda	8
21855	Liceul Tehnologic Henri Coanda Beclean	8
21856	Scoala Gimnaziala Nr.1  Lunca Ilvei	8
21857	Liceul Tehnologic De Servicii	8
21858	Scoala Gimnaziala Nicolae Draganu Zagra	8
21859	Scoala Gimnaziala Spermezeu	8
21860	Scoala Gimnaziala Nr.1	8
21861	Scoala Gimnaziala Tu Reac	8
21862	Liceul Teoretic Solomon Halita	8
21863	Liceul Tehnologic Tirlisua	8
21864	Scoala Gimnaziala Vasile Scurtu Parva	8
21865	Scoala Gimnaziala Silivasu De Cimpie	8
21866	Liceul De Arte Corneliu Baba	8
21867	Liceul Teoretic Solomon Halita	8
21868	Gradinita Cu Program Prelungit Nr.13	8
21869	Scoala Gimnaziala Nr 7 Bistrita	8
21870	Scoala Gimnaziala Branistea	8
21871	Scoala Gimnaziala Ciceu-giurgesti	8
21872	Gradinita Cu Program Prelungit Casuta Cu Povesti	8
21873	Scoala Gimnaziala Mariselu	8
21874	Scoala Gimnaziala Enea Grapini	8
21875	Colegiul  National George Cosbuc Nasaud	8
21876	Scoala Gimaziala Petru Rares Ciceu-mihaiesti	8
21877	Scoala Gimnaziala Petris	8
21878	Colegiul Tehnic Infoel Bistrita	8
21879	Scoala Gimnaziala Sinmihaiu De Cimpie	8
21880	Scoala Gimnaziala Nr.1  Lesu	8
21881	Liceul Tehnologic De Servicii	8
21882	Scoala Gimnaziala Grigore Silasi Beclean	8
21883	Scoala Gimnaziala Tu Reac	8
21884	Scoala Gimnaziala Urmenis	8
21885	Scoala Gimnaziala Silivasu De Cimpie	8
21886	Scoala Gimnaziala Nr.12 Botoșani	9
21887	Scoala Gimnaziala Nr.2 Tudor Vladimirescu-albesti	9
21888	Scoala Gimnaziala Aristotel Crismaru Draguseni	9
21889	Liceul Tehnologic Plopenii  Mari	9
21890	Scoala Gimnaziala Nr. 1 Corlateni	9
21891	Liceul Tehnologic Todireni	9
21892	Colegiul Tehnic Gheorghe Asachi Botoșani	9
21893	Scoala Gimnaziala Leon Danaila Darabani	9
21894	Liceul Teoretic Anastasie Basota	9
21895	Scoala Gimnaziala Nr 1 Dobirceni	9
21896	Liceul Tehnologic Stefan Cel Mare Si Sfant Vorona	9
21897	Scoala Gimnaziala Nr.1 Santa Mare	9
21898	Scoala Gimnaziala Mihail Sadoveanu Dumbravita	9
21899	Gradinita Cu Program Prelungit Nr.6 Botoșani	9
21900	Scoala Gimnaziala Nr.1 Vaculesti	9
21901	Scoala Gimnaziala Nr.13 Botoșani	9
21902	Gradinita Cu Program Prelungit Stefan Cel Mare Si Sfant Dorohoi	9
21903	Scoala Gimnaziala Alexandru Ioan Cuza	9
21904	Gradinita Pp. Nr.22 Botoșani	9
21905	Scoala Gimnaziala Nr 1 Albesti	9
21906	Scoala Gimnaziala Nr.1 Mileanca	9
21907	Liceul Teoretic Anastasie Basota	9
21908	Scoala Gimaziala Nr.1 Hudesti	9
21909	Colegiul Tehnic Gheorghe Asachi Botoșani	9
21910	Scoala Gimnaziala Nr.1 Copalau	9
21911	Scoala Gimnaziala Ion Bojoi	9
21912	Scoala Gimnaziala Nr.1 Stiubieni	9
21913	Scoala Gimnaziala Nr. 11	9
21914	Scoala Gimnaziala Mihail Sadoveanu Dumbravita	9
21915	Scoala Gimnaziala Nr.1 Gorbanesti	9
21916	Scoala Gimnaziala Elena Rares	9
21917	Scoala Gimnaziala Ioan Murariu Cristinesti	9
21918	Gradinita Cu Program Prelungit Stefan Cel Mare Si Sfant Dorohoi	9
21919	Liceul Tehnologic Stefan Cel Mare Si Sfant Vorona	9
21920	Liceul Tehnologic Cotusca	9
21921	Scoala Profesionala Sfantul Apostl Andrei Smirdan	9
21922	Colegiul National A.t.laurian Botoșani	9
21923	Scoala Gimnaziala Sfinta Maria Botoșani	9
21924	Scoala Gimnaziala Nr. 1 Adaseni	9
21925	Scoala Gimnaziala Nr.1 Concesti	9
21926	Gradinita Cu Program Prelungit Stefan Cel Mare Si Sfant Dorohoi	9
21927	Seminarul Teologic Sf. Ioan Iacob Dorohoi	9
21928	Scoala Gimaziala Nr.1 Hudesti	9
21929	Gradinita Pp. Nr.22 Botoșani	9
21930	Scoala Gimnaziala Nr. 1 Adaseni	9
21931	Scoala Gimnaziala Nr.1 Stauceni	9
21932	Scoala Gimnaziala Nr.1 Copalau	9
21933	Scoala Profesionala Sfantul Apostl Andrei Smirdan	9
21934	Colegiul National A.t.laurian Botoșani	9
21935	Scoala Gimnaziala Nr 1 Rauseni	9
21936	Scoala Gimnaziala Nr.1 Stiubieni	9
21937	Colegiul National Gr.ghica	9
21938	Scoala Gimnaziala Nr.1  Prajeni	9
21939	Liceul De Arta Stefan Luchian Botoșani	9
21940	Scoala Gimnaziala Nr.1  Radauti-prut	9
21941	Scoala Gimnaziala Nr.1 Concesti	9
21942	Scoala Gimnaziala Nr. 1 Dorohoi	9
21943	Scoala Gimnaziala Dimitrie Romanescu Dorohoi	9
21944	Liceul Alexandru Cel Bun	9
21945	Liceul Tehnologic Petru Rares Botoșani	9
21946	Colegiul National Gr.ghica	9
21947	Scoala Gimnaziala Nr.1  Roma	9
21948	Scoala Gimnaziala Stefan Cel Mare Botoșani	9
21949	Gradinita Cu Program Prelungit Sotron Botoșani	9
21950	Scoala Gimnaziala Nr.7	9
21951	Scoala Gimnaziala Nr.1 Vladeni Deal	9
21952	Scoala Profesionala Sfantul Apostl Andrei Smirdan	9
21953	Liceul Tehnologic Special  Ion Pillat Dorohoi	9
21954	Liceul Tehnologic Petru Rares Botoșani	9
21955	Liceul Tehnologic Bucecea	9
21956	Scoala Gimnaziala  Florica Murariu Mitoc	9
21957	Scoala Gimnaziala Nr. 1 Avrameni	9
21958	Scoala Gimnaziala Nr.1 Concesti	9
21959	Scoala Gimnaziala Octav Bancila Corni	9
21960	Scoala Gimnaziala Mihail Kogalniceanu Dorohoi	9
21961	Scoala Gimnaziala Nicolae Calinescu Cosula	9
21962	Scoala Gimnaziala Nr 1 Sulita	9
21963	Scoala Gimnaziala Nr 1 Dimacheni	9
21964	Scoala Gimnaziala Ioan Cernat Havirna	9
21965	Scoala Gimnaziala Nr.1 Saveni	9
21966	Scoala Gimnaziala Nr.1  Roma	9
21967	Scoala Gimnaziala Gheorghe Coman Braesti	9
21968	Scoala Gimnaziala Nr.1o Botoșani	9
21969	Liceul Teoretic  Nicolae Iorga	9
21970	Gradinita Cu Program Prelungit Sotron Botoșani	9
21971	Scoala Gimaziala Nr.1 Hudesti	9
21972	Scoala Gimnaziala Nr. 1 Blandesti	9
21973	Colegiul Economic Octav Onicescu Botoșani	9
21974	Scoala Gimnaziala Nr.1 Vladeni Deal	9
21975	Scoala Profesionala Gheorghe Burac Vlasinesti	9
21976	Scoala Gimnaziala Dimitrie Brandza Viisoara	9
21977	Scoala Gimnaziala Nr1 Călărași	9
21978	Liceul Tehnologic Special  Ion Pillat Dorohoi	9
21979	Scoala Gimnaziala Nr.1 Copalau	9
21980	Liceul Dimitrie Negreanu Botoșani	9
21981	Liceul Regina Maria Dorohoi	9
21982	Liceul Tehnologic Bucecea	9
21983	Scoala Gimnaziala Nr.1 Oraseni Deal	9
21984	Scoala Gimnaziala Nr. 1 Cristesti	9
21985	Scoala Gimnaziala Nr.1 Mihalaseni	9
21986	Scoala Gimnaziala Nr.1  Roma	9
21987	Scoala Gimnaziala Nr.1  Dingeni	9
21988	Gradinita Cu Program Prelungit Sotron Botoșani	9
21989	Scoala Profesionala Gheorghe Burac Vlasinesti	9
21990	Scoala Gimnaziala Nr.1 Vladeni Deal	9
21991	Scoala Gimnaziala Nr.1 Manoleasa	9
21992	Liceul Tehnologic Special  Ion Pillat Dorohoi	9
21993	Colegiul National Mihai Eminescu Botoșani	9
21994	Liceul Tehnologic Bucecea	9
21995	Scoala Gimnaziala Nr 1 Dumeni	9
21996	Scoala Gimnaziala Nr.1 Oraseni Deal	9
21997	Scoala Gimnaziala Nr 1 Ungureni	9
21998	Scoala Gimnaziala Nr.1  Durnesti	9
21999	Scoala Gimnaziala Tiberiu Crudu Tudora	9
22000	Liceul Demostene Botez Trusesti	9
22001	Gradinita Pp. Nr. 19 Botoșani	9
22002	Scoala Gimnaziala Nr.1  Romanesti	9
22003	Scoala Gimnaziala Nr. 1 Rachiti	9
22004	Liceul Tehnologic Alexandru Vlahuta	9
22005	Scoala Gimnaziala Nr. 1 Ripiceni	9
22006	Gradinita Cu Program Prelungit Sotron Botoșani	9
22007	Scoala Gimnaziala Nr.1 Vladeni Deal	9
22008	Liceul Tehnologic Special  Ion Pillat Dorohoi	9
22009	Liceul Tehnologic Bucecea	9
22010	Gradinita Cu Program Prelungit Nr 36	11
22011	Colegiul Tehnic Edmond Nicolau	11
22012	Scoala Gimnaziala Frecatei	11
22013	Scoala Gimnaziala Chiscani	11
22014	Scoalaa Gimnaziala Romanu	11
22015	Scoala Gimnaziala Comuna Ramnicelu Judetul Brăila	11
22016	Scoala Gimnaziala Tichilesti	11
22017	Liceul Tehnologic Gheorghe K.constantinescu	11
22018	Gradinita Cu Program Prelungit Nr.7	11
22019	Gradinita Cu Program Prelungit Numarul 56	11
22020	Scoala Gimnaziala Bordei Verde	11
22021	Gradinita Cu Program Prelungit Nr. 37 Brăila	11
22022	Scoala Gimnaziala Cazasu	11
22023	Gradinita Cu Program Prelungit Nr 11	11
22024	Scoala Gimnaziala Racovita	11
22025	Colegiul National Ana Aslan	11
22026	Gradinita Cu Program Prelungit Nr 1 Brăila	11
22027	Scoala Gimnaziala Alexandru Vechiu Zavoaia	11
22028	Scoala Gimnaziala Ion Creanga Brăila	11
22029	Scoala  Gimnaziala  Baraganul	11
22030	Colegiul Tehnic Panait Istrati	11
22031	Gradinita Cu Program Prelungit Nr 36	11
22032	Scoala Gimnaziala Vlaicu Voda Brăila	11
22033	Scoala Gimnaziala Nedelcu Chercea	11
22034	Scoala Gimnaziala Dudesti	11
22035	Liceul Tehnologic Insuratei	11
22036	Scoala Gimnaziala	11
22037	Scoala Gimnaziala Mihail Kogalniceanu Brăila	11
22038	Scoala Gimnaziala Ciocile	11
22039	Scoala Gimnaziala Mihu Dragomir	11
22040	Liceul Tehnologic Nicolae Oncescu	11
22041	Scoala Gimnaziala Mihai Eminescu	11
22042	Scoala Gimnaziala Gropeni	11
22043	Scoala Gimnaziala Radu Tu Doran Brăila	11
22044	Scoala Gimnaziala Plopu	11
22045	Gradinita Cu Program Normal Ion Creanga	11
22046	Scoala Gimnaziala Lanurile	11
22047	Liceul Teoretic George Valsan Fau Rei	11
22048	Gradinita Cu Program Saptamanal Nr. 49 Brăila	11
22049	Gradinita Cu Program Prelungit Nr.7	11
22050	Scoala Populara De Arte Si Meserii Vespasian Lungu	11
22051	Scoala Gimnaziala Anton Pann	11
22052	Scoala Gimnaziala  Dimitrie Cantemir	11
22053	Scoala Gimnaziala Ecaterina Teodoroiu	11
22054	Liceul Teoretic Constantin Angelescu	11
22055	Scoala Gimnaziala Movila Miresii	11
22056	Scoala De Arte Si Meserii Bertestii De Jos	11
22057	Scoala Gimnaziala Bordei Verde	11
22058	Liceul Teoretic Panait Cerna	11
22059	Scoala Gimnaziala George Cosbuc Brăila	11
22060	Scoala Gimnaziala Salcia Tudor	11
22061	Scoala Gimnaziala Toma Tampeanu Galbenu	11
22062	Liceul Teoretic Mihail Sebastian	11
22063	Scoala Gimnaziala Victoria	11
22064	Liceul Tehnologic Grigore Moisil	11
22065	Scoala Gimnaziala Cazasu	11
22066	Scoala Gimnaziala Ciocile	11
22067	Scoala Gimnaziala Petre Carp Tufesti	11
22068	Gradinita Cu Program Prelungit Nr.48	11
22069	Gradinita Cu Program Prelungit Nr.39 Brăila	11
22070	Liceul Tehnologic Nicolae Oncescu	11
22071	Gradinita Cu Program Prelungit Nr.3o Brăila	11
22072	Colegiul National Gheorghe Munteanu Murgoci	11
22073	Scoala Gimnaziala Racovita	11
22074	Scoala Gimnaziala Gropeni	11
22075	Liceul Tehnologic Constantin Bancoveanu	11
22076	Scoala Gimnaziala Gemenele	11
22077	Scoala Gimnaziala  Dimitrie Cantemir	11
22078	Scoala Gimnaziala Plopu	11
22079	Scoala Gimnaziala Vadeni	11
22080	Scoala Gimnaziala  Mihai Viteazul	11
22081	Scoala Gimnaziala Salcia Tudor	11
22082	Gradinita Cu Program Prelungit Nr. 8 Brăila	11
22083	Scoala Gimnaziala Stancuta	11
22084	Scoala Gimnaziala Lanurile	11
22085	Liceul Pedagogic  D.p.perpessicius	11
22086	Scoala Gimnaziala Speciala Tichilesti	11
22087	Scoala Gimnaziala Lanurile	11
22088	Scoala Gimnaziala Al.i.cuza	11
22089	Scoala Gimnaziala Nikos Kazantzakis	11
22090	Scoala  Gimnaziala Rosiori	11
22091	Scoala Populara De Arte Si Meserii Vespasian Lungu	11
22092	Scoala Gimnaziala Vasile Alecsandri Brăila	11
22093	Liceul De Arte Hariclea Darclee	11
22094	Gradinita  Cu Program Prelungit Nr.6 Brăila	11
22095	Liceul Teoretic Constantin Angelescu	11
22096	Scoala Gimnaziala Sutesti	11
22097	Scoala Gimnaziala  Alexandr Sergheevici Puskin Brăila	11
22098	Scoala Gimnaziala Fanus Neagu	11
22099	Liceul Teoretic Panait Cerna	11
22100	Scoala Gimnaziala Comuna Visani	11
22101	Scoala Gimnaziala Aurel Hornet	11
22102	Liceul Teoretic Mihail Sebastian	11
22103	Scoala Gimnaziala Aurel Vlaicu	11
22104	Scoala Gimnaziala Emil Dragan	11
22105	Scoala Gimnaziala Marasu	11
22106	Gradinita Cu Program Prelungit Nr.3o Brăila	11
22107	Liceul Tehnologic Constantin Bancoveanu	11
22108	Scoala Gimnaziala Vadeni	11
22109	Scoala Gimnaziala Stancuta	11
22110	Scoala Gimnaziala Speciala Tichilesti	11
22111	Scoala  Gimnaziala Rosiori	11
22112	Gradinita  Cu Program Prelungit Nr.6 Brăila	11
22113	Scoala Gimnaziala Fanus Neagu	11
22114	Scoala Gimnaziala Comuna Visani	11
22115	Liceul Tehnologic Silvic Dr.nicolae Rucareanu	10
22116	Gradinita Cu Program Prelungit Nr.9 Brașov	10
22117	Liceul Tehnologic Victor Jinga	10
22118	Scoala Profesionala Speciala Codlea	10
22119	Liceul Petru Rares	10
22120	Scoala Gimnaziala Mandra	10
22121	Liceul Sextil Puscariu Bran	10
22122	Gradinita Cu Program Normal Rupea	10
22123	Scoala Gimnaziala Tarlungeni	10
22124	Gradinita Cu Program Prelungit Nr. 2 Rasnov	10
22125	Scoala Gimnaziala Nr 3 Gheorghe Lazar Brașov	10
22126	Scoala Gimnaziala Mandra	10
22127	Scoala Profesionala Germana Kronstadt	10
22128	Gradinita Cu Program Prelungit Nr.7 Brașov	10
22129	Scoala Gimnaziala Bethlen Samuel Racos	10
22130	Gradinita Cu Program Normal Rupea	10
22131	Scoala Populara De Arte Si Meserii-tiberiu Brediceanu	10
22132	Gradinita Cu Program Prelungit Dintisori De Lapte Nr 23 Brașov	10
22133	Scoala Gimnaziala Nr. 6 Iacob Mureșianu Brașov	10
22134	Gradinita Cu Program Prelungit Nr. 2 Rasnov	10
22135	Colegiul Tehnic Maria Baiulescu Brașov	10
22136	Scoala Gimnaziala Ghimbav	10
22137	Scoala Gimnaziala Nr 2 Zarn Esti	10
22138	Liceul Tehnologic Victor Jinga	10
22139	Gradinita Cu Program Prelungit Prichindeii	10
22140	Gradinita Cu Program Prelungit Boboceii Nr.19	10
22141	Scoala Gimnaziala Nr. 3 Rasnov	10
22142	Liceul Teoretic Zajzoni Rab Istvan Sacele	10
22143	Gradinita Cu Program Saptamanal Pinochio Fagaras	10
22144	Colegiul National Andrei Saguna Brașov	10
22145	Scoala   Gimnaziala  Cata	10
22146	Scoala Gimnaziala Nr. 5 Sacele	10
22147	Scoala Gimnaziala Fundata	10
22148	Colegiul Pentru Agricultura Si Industrie Alimentara Tara Barsei Prejmer	10
22149	Gradinita Cu Program Prelungit Nr. 33 Brașov	10
22150	Scoala Gimnaziala Vu Lcan	10
22151	Scoala Gimnaziala Budila	10
22152	Gradinita Cu Program Prelungit Nr.1 Codlea	10
22153	Scoala Gimnaziala Bod	10
22154	Scoala Gimnaziala Augustin	10
22155	Colegiul Tehnic De Transporturi Brașov	10
22156	Scoala Gimnaziala Nr.2 Codlea	10
22157	Liceul Andrei Mureșanu Brașov	10
22158	Gradinita Cu Program Prelungit Nr. 2 Rasnov	10
22159	Scoala Gimnaziala Ticusu Vechi	10
22160	Gradinita Cu Program Prelungit Nr. 15	10
22161	Scoala Gimnaziala Nr.1  Poiana Marului	10
22162	Scoala Gimnaziala Nr.1  Brașov	10
22163	Scoala Gimnaziala Ovid Densusianu	10
22164	Scoala Gimnaziala Harman	10
22165	Scoala Gimnaziala Peter Thal Rasnov	10
22166	Liceul Teologic Ortodox Sfantul Constantin Brancoveanu Fagaras	10
22167	Gradinita Cu Program Normal Albinuta Nr 1	10
22168	Scoala Gimnaziala Peter Thal Rasnov	10
22169	Scoala Gimnaziala Nr. 3 Rasnov	10
22170	Liceul Teoretic Zajzoni Rab Istvan Sacele	10
22171	Scoala Gimnaziala Homorod	10
22172	Gradinita Cu Program Prelungit Nr.8	10
22173	Gradinita Cu Program Saptamanal Pinochio Fagaras	10
22174	Colegiul Tehnic Transilvania Brașov	10
22175	Colegiul Tehnic Energetic Remus Radulet Brașov	10
22176	Gradinita Cu Program Prelungit Nr.29	10
22177	Scoala   Gimnaziala  Cata	10
22178	Gradinita Cu Program Prelungit Nr.14	10
22179	Scoala Gimnaziala Aron Pumnul Cuciulata	10
22180	Scoala Gimnaziala Fundata	10
22181	Scoala Gimnaziala Nr.1 Sacele	10
22182	Scoala Gimnaziala Nr.11 Stefan Octavian Iosif Brașov	10
22183	Gradinita Cu Program Normal Dumbravita	10
22184	Scoala Gimnaziala Cincu	10
22185	Gradinita Cu Program Prelungit Dumbrava Minunata Nr. 18	10
22186	Colegiul Pentru Agricultura Si Industrie Alimentara Tara Barsei Prejmer	10
22187	Scoala Gimnaziala Budila	10
22188	Colegiul Tehnic Simion Mehedinți Codlea	10
22189	Scoala Gimnaziala Vistea De Jos	10
22190	Gradinita Cu Program Prelungit Nr. 21 Brașov	10
22191	Scoala Gimnaziala Nr.11 Stefan Octavian Iosif Brașov	10
22192	Gradinita Cu Program Prelungit Nr. 28	10
22193	Scoala Gimnaziala Parau	10
22194	Gradinita Cu Program Prelungit Nr.1 Codlea	10
22195	Colegiul Tehnic De Transporturi Brașov	10
22196	Colegiul Aurel Vijoli Fagaras	10
22197	Scoala Gimnaziala Recea	10
22198	Universitatea Transilvania Brașov	10
22199	Gradinita Cu Program Prelungit Nr.24	10
22200	Liceul Teoretic Ioan Pascu Codlea	10
22201	Scoala Gimnaziala Nr. 14 Brașov	10
22202	Scoala Gimnaziala Nr.2 Codlea	10
22203	Scoala Gimnaziala Ticusu Vechi	10
22204	Liceul Teoretic Johannes Honterus  Brașov	10
22205	Scoala Gimnaziala Halchiu	10
22206	Gradinita Cu Program Prelungit Martinica Nr.17 Brașov	10
22207	Scoala Profesionala Germana Kronstadt	10
22208	Liceul Vocational De Muzica Tu Dor Ciortea Brașov	10
22209	Gradinita Cu Program Prelungit Nr.8	10
22210	Scoala Gimnaziala Nr. 5 Brașov	10
22211	Gradinita Cu Program Prelungit Halchiu	10
22212	Scoala Gimnaziala Prof.dr.ioan Cerghit	10
22213	Gradinita Cu Program Prelungit Nr.14	10
22214	Gradinita Cu Program Normal Nr 4	10
22215	Scoala Gimnaziala Bethlen Samuel Racos	10
22216	Gradinita Cu Program Prelungit Nr. 12	10
22217	Scoala Gimnaziala Fundata	10
22218	Scoala Populara De Arte Si Meserii-tiberiu Brediceanu	10
22219	Scoala Gimnaziala Vama Buzăului	10
22220	Scoala Gimnaziala Nr. 6 Iacob Mureșianu Brașov	10
22221	Scoala Gimnaziala Budila	10
22222	Colegiul Tehnic Maria Baiulescu Brașov	10
22223	Scoala Gimnaziala Bod	10
22224	Scoala Gimnaziala Nr 2 Zarn Esti	10
22225	Colegiul Tehnic De Transporturi Brașov	10
22226	Gradinita Cu Program Prelungit Nr. 15	10
22227	Colegiul De Stiinte Grigore Antipa Brașov	10
22228	Liceul Teoretic George Moroianu Sacele	10
22229	Colegiul De Stiinte Ale Naturii Emil Racovita Brașov	10
22230	Gradinita Cu Program Prelungitjunior Nr 26 Brașov	10
22231	Gradinita Cu Program Prelungit Nr.34 Brașov	10
22232	Gradinita Cu Program Normal Nr 1 Rasnov	10
22233	Scoala Gimnaziala Harman	10
22234	Scoala Gimnaziala Gheorghe Sincai	10
22235	Colegiul National Unirea Brașov	10
22236	Scoala Gimnaziala Drauseni	10
22237	Gradinita Cu Program Normal Albinuta Nr 1	10
22238	Scoala  Primara Beclean	10
22239	Gradinita Cu Program Normal Nr.2 Codlea	10
22240	Liceul Cu Program Sportiv Brașov	10
22241	Scoala Gimnaziala Homorod	10
22242	Scoala Gimnaziala Ormenis	10
22243	Scoala Gimnaziala Apaczai Csere Janos-apata	10
22244	Scoala Gimnaziala Nr. 3 Codlea	10
22245	Colegiul Tehnic Energetic Remus Radulet Brașov	10
22246	Scoala Gimnaziala Maierus	10
22247	Colegiul Tehnic Mircea Cristea  Brașov	10
22248	Gradinita Cu Program Prelungit Nr. 13 Brașov	10
22249	Scoala Gimnaziala Vistea De Jos	10
22250	Scoala Gimnaziala Bunesti	10
22251	Scoala Gimnaziala Sinca Noua	10
22252	Gradinita Cu Program Prelungit Bobocel Nr 4	10
22253	Scoala Gimnaziala Parau	10
22254	Scoala Gimnaziala Nr 3 Pompiliu Dan	10
22255	Gradinita Cu Program Prelungit Micul Print Nr.22 Brașov	10
22256	Scoala Gimnaziala Nr.27 Anatol Ghermanschi Brașov	10
22257	Scoala Gimnaziala Recea	10
22258	Scoala Gimnaziala Nr. 15 Brașov	10
22259	Gradinita Cu Program Prelungit Lumea Copiilor Nr 25 Brașov	10
22260	Gradinita Cu Program Prelungit Casuta Bucuriei Nr. 11	10
22261	Scoala Gimnaziala Nr. 14 Brașov	10
22262	Gradinita Cu Program Normal 1 Predeal	10
22263	Scoala Gimnaziala Moieciu De Jos	10
22264	Scoala Gimnaziala Cristian	10
22265	Scoala Gimnaziala Halchiu	10
22266	Scoala Gimnaziala Sinca Noua	10
22267	Scoala Gimnaziala Parau	10
22268	Gradinita Cu Program Prelungit Micul Print Nr.22 Brașov	10
22269	Scoala Gimnaziala Recea	10
22270	Gradinita Cu Program Prelungit Lumea Copiilor Nr 25 Brașov	10
22271	Scoala Gimnaziala Nr. 14 Brașov	10
22272	Scoala Gimnaziala Moieciu De Jos	10
22273	Scoala Gimnaziala Halchiu	10
22274	Scoala Gimnaziala Jibert	10
22275	Scoala Gimnaziala Nr.19 Brașov	10
22276	Scoala Gimnaziala Ungra	10
22277	Colegiul Tehnic Dr.alexan Dru Barbat	10
22278	Gradinita Cu Program Prelungit Nr.31	10
22279	Colegiul National De Informatica Grigore Moisil Brașov	10
22280	Liceul Teoretic  I.c. Dragusanu Victoria	10
22281	Gradinita Cu Program Prelungit Nr. 4	10
22282	Gradinita Cu Program Prelungit Primii Pasi Nr.1o Brașov	10
22283	Colegiul National Aprily Lajos Brașov	10
22284	Colegiul De Stiinte Grigore Antipa Brașov	10
22285	Colegiul De Stiinte Ale Naturii Emil Racovita Brașov	10
22286	Gradinita Cu Program Prelungit Albinuta Fagaras	10
22287	Scoala Gimnaziala Ion I C Bratianu	2
22288	Colegiul National Matei Basarab	2
22289	Gradinita Steaua	2
22290	Academia Oamenilor De Stiinta Din Romania	2
\.


--
-- Data for Name: judete; Type: TABLE DATA; Schema: public; Owner: cosminaruxandei
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
-- Data for Name: like_comentarii; Type: TABLE DATA; Schema: public; Owner: cosminaruxandei
--

COPY public.like_comentarii (id, id_utilizator, id_comentariu) FROM stdin;
\.


--
-- Data for Name: lista_neagra; Type: TABLE DATA; Schema: public; Owner: cosminaruxandei
--

COPY public.lista_neagra (id, id_profesor, text) FROM stdin;
\.


--
-- Data for Name: materii; Type: TABLE DATA; Schema: public; Owner: cosminaruxandei
--

COPY public.materii (id, nume) FROM stdin;
\.


--
-- Data for Name: materii_profesori; Type: TABLE DATA; Schema: public; Owner: cosminaruxandei
--

COPY public.materii_profesori (id, id_profesor, id_materie) FROM stdin;
\.


--
-- Data for Name: profesori; Type: TABLE DATA; Schema: public; Owner: cosminaruxandei
--

COPY public.profesori (id, nume, id_institutie_activ, pensionat) FROM stdin;
\.


--
-- Data for Name: rating_institutii; Type: TABLE DATA; Schema: public; Owner: cosminaruxandei
--

COPY public.rating_institutii (id, nota, id_utilizator, id_institutie, text) FROM stdin;
\.


--
-- Data for Name: rating_profesori; Type: TABLE DATA; Schema: public; Owner: cosminaruxandei
--

COPY public.rating_profesori (id, id_utilizator, nota, data_creare, id_profesor, text) FROM stdin;
\.


--
-- Data for Name: utilizatori; Type: TABLE DATA; Schema: public; Owner: cosminaruxandei
--

COPY public.utilizatori (id, username, google_id, data_inregistrare, data_nastere, id_institutie_curenta, ban_status) FROM stdin;
\.


--
-- Name: comentarii_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosminaruxandei
--

SELECT pg_catalog.setval('public.comentarii_id_seq', 1, false);


--
-- Name: dislike_comentarii_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosminaruxandei
--

SELECT pg_catalog.setval('public.dislike_comentarii_id_seq', 1, false);


--
-- Name: institutii_id_institutie_seq; Type: SEQUENCE SET; Schema: public; Owner: cosminaruxandei
--

SELECT pg_catalog.setval('public.institutii_id_institutie_seq', 27270, true);


--
-- Name: judete_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosminaruxandei
--

SELECT pg_catalog.setval('public.judete_id_seq', 43, true);


--
-- Name: like_comentarii_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosminaruxandei
--

SELECT pg_catalog.setval('public.like_comentarii_id_seq', 1, false);


--
-- Name: lista_neagra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosminaruxandei
--

SELECT pg_catalog.setval('public.lista_neagra_id_seq', 1, false);


--
-- Name: materii_id_materie_seq; Type: SEQUENCE SET; Schema: public; Owner: cosminaruxandei
--

SELECT pg_catalog.setval('public.materii_id_materie_seq', 1, false);


--
-- Name: materii_profesori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosminaruxandei
--

SELECT pg_catalog.setval('public.materii_profesori_id_seq', 1, false);


--
-- Name: profesori_id_profesor_seq; Type: SEQUENCE SET; Schema: public; Owner: cosminaruxandei
--

SELECT pg_catalog.setval('public.profesori_id_profesor_seq', 1, false);


--
-- Name: rating_id_rating_seq; Type: SEQUENCE SET; Schema: public; Owner: cosminaruxandei
--

SELECT pg_catalog.setval('public.rating_id_rating_seq', 1, false);


--
-- Name: rating_profesori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosminaruxandei
--

SELECT pg_catalog.setval('public.rating_profesori_id_seq', 1, false);


--
-- Name: utilizatori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cosminaruxandei
--

SELECT pg_catalog.setval('public.utilizatori_id_seq', 1, false);


--
-- Name: comentarii pk_comentarii_id; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.comentarii
    ADD CONSTRAINT pk_comentarii_id PRIMARY KEY (id);


--
-- Name: dislike_comentarii pk_dislike_comentarii_id; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.dislike_comentarii
    ADD CONSTRAINT pk_dislike_comentarii_id PRIMARY KEY (id);


--
-- Name: institutii pk_institutii_id_institutie; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.institutii
    ADD CONSTRAINT pk_institutii_id_institutie PRIMARY KEY (id);


--
-- Name: judete pk_judete_id; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.judete
    ADD CONSTRAINT pk_judete_id PRIMARY KEY (id);


--
-- Name: like_comentarii pk_like_comentarii_id; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.like_comentarii
    ADD CONSTRAINT pk_like_comentarii_id PRIMARY KEY (id);


--
-- Name: lista_neagra pk_lista_neagra_id; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.lista_neagra
    ADD CONSTRAINT pk_lista_neagra_id PRIMARY KEY (id);


--
-- Name: materii pk_materii_id_materie; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.materii
    ADD CONSTRAINT pk_materii_id_materie PRIMARY KEY (id);


--
-- Name: materii_profesori pk_materii_profesori_id; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.materii_profesori
    ADD CONSTRAINT pk_materii_profesori_id PRIMARY KEY (id);


--
-- Name: profesori pk_profesori_id_profesor; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.profesori
    ADD CONSTRAINT pk_profesori_id_profesor PRIMARY KEY (id);


--
-- Name: rating_institutii pk_rating_id_rating; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.rating_institutii
    ADD CONSTRAINT pk_rating_id_rating PRIMARY KEY (id);


--
-- Name: rating_profesori pk_rating_profesori_id; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.rating_profesori
    ADD CONSTRAINT pk_rating_profesori_id PRIMARY KEY (id);


--
-- Name: utilizatori pk_utilizatori_id; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.utilizatori
    ADD CONSTRAINT pk_utilizatori_id PRIMARY KEY (id);


--
-- Name: comentarii unq_comentarii_id_utilizator; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.comentarii
    ADD CONSTRAINT unq_comentarii_id_utilizator UNIQUE (id_utilizator);


--
-- Name: dislike_comentarii unq_dislike_comentarii_id_comentariu; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.dislike_comentarii
    ADD CONSTRAINT unq_dislike_comentarii_id_comentariu UNIQUE (id_comentariu);


--
-- Name: dislike_comentarii unq_dislike_comentarii_id_utilizator; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.dislike_comentarii
    ADD CONSTRAINT unq_dislike_comentarii_id_utilizator UNIQUE (id_utilizator);


--
-- Name: like_comentarii unq_like_comentarii_id_comentariu; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.like_comentarii
    ADD CONSTRAINT unq_like_comentarii_id_comentariu UNIQUE (id_comentariu);


--
-- Name: like_comentarii unq_like_comentarii_id_utilizator; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.like_comentarii
    ADD CONSTRAINT unq_like_comentarii_id_utilizator UNIQUE (id_utilizator);


--
-- Name: materii_profesori unq_materii_profesori_id_materie; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.materii_profesori
    ADD CONSTRAINT unq_materii_profesori_id_materie UNIQUE (id_materie);


--
-- Name: materii_profesori unq_materii_profesori_id_profesor; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.materii_profesori
    ADD CONSTRAINT unq_materii_profesori_id_profesor UNIQUE (id_profesor);


--
-- Name: profesori unq_profesori_id_institutie_activ; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.profesori
    ADD CONSTRAINT unq_profesori_id_institutie_activ UNIQUE (id_institutie_activ);


--
-- Name: rating_institutii unq_rating_id_institutie; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.rating_institutii
    ADD CONSTRAINT unq_rating_id_institutie UNIQUE (id_institutie);


--
-- Name: rating_institutii unq_rating_id_utilizator; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.rating_institutii
    ADD CONSTRAINT unq_rating_id_utilizator UNIQUE (id_utilizator);


--
-- Name: rating_profesori unq_rating_profesori_id_profesor; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.rating_profesori
    ADD CONSTRAINT unq_rating_profesori_id_profesor UNIQUE (id_profesor);


--
-- Name: rating_profesori unq_rating_profesori_id_utilizator; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.rating_profesori
    ADD CONSTRAINT unq_rating_profesori_id_utilizator UNIQUE (id_utilizator);


--
-- Name: utilizatori unq_utilizatori_id_institutie_curenta; Type: CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.utilizatori
    ADD CONSTRAINT unq_utilizatori_id_institutie_curenta UNIQUE (id_institutie_curenta);


--
-- Name: comentarii fk_comentarii_utilizatori; Type: FK CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.comentarii
    ADD CONSTRAINT fk_comentarii_utilizatori FOREIGN KEY (id_utilizator) REFERENCES public.utilizatori(id);


--
-- Name: dislike_comentarii fk_dislike_comentarii_comentarii; Type: FK CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.dislike_comentarii
    ADD CONSTRAINT fk_dislike_comentarii_comentarii FOREIGN KEY (id_comentariu) REFERENCES public.comentarii(id);


--
-- Name: dislike_comentarii fk_dislike_comentarii_utilizatori; Type: FK CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.dislike_comentarii
    ADD CONSTRAINT fk_dislike_comentarii_utilizatori FOREIGN KEY (id_utilizator) REFERENCES public.utilizatori(id);


--
-- Name: institutii fk_institutii_judete; Type: FK CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.institutii
    ADD CONSTRAINT fk_institutii_judete FOREIGN KEY (id_judet) REFERENCES public.judete(id);


--
-- Name: like_comentarii fk_like_comentarii_comentarii; Type: FK CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.like_comentarii
    ADD CONSTRAINT fk_like_comentarii_comentarii FOREIGN KEY (id_comentariu) REFERENCES public.comentarii(id);


--
-- Name: like_comentarii fk_like_comentarii_utilizatori; Type: FK CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.like_comentarii
    ADD CONSTRAINT fk_like_comentarii_utilizatori FOREIGN KEY (id_utilizator) REFERENCES public.utilizatori(id);


--
-- Name: lista_neagra fk_lista_neagra_profesori; Type: FK CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.lista_neagra
    ADD CONSTRAINT fk_lista_neagra_profesori FOREIGN KEY (id_profesor) REFERENCES public.profesori(id);


--
-- Name: materii_profesori fk_materii_profesori_materii; Type: FK CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.materii_profesori
    ADD CONSTRAINT fk_materii_profesori_materii FOREIGN KEY (id_materie) REFERENCES public.materii(id);


--
-- Name: materii_profesori fk_materii_profesori_profesori; Type: FK CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.materii_profesori
    ADD CONSTRAINT fk_materii_profesori_profesori FOREIGN KEY (id_profesor) REFERENCES public.profesori(id);


--
-- Name: profesori fk_profesori_institutii; Type: FK CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.profesori
    ADD CONSTRAINT fk_profesori_institutii FOREIGN KEY (id_institutie_activ) REFERENCES public.institutii(id);


--
-- Name: rating_institutii fk_rating_institutii_institutii; Type: FK CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.rating_institutii
    ADD CONSTRAINT fk_rating_institutii_institutii FOREIGN KEY (id_institutie) REFERENCES public.institutii(id);


--
-- Name: rating_institutii fk_rating_institutii_utilizatori; Type: FK CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.rating_institutii
    ADD CONSTRAINT fk_rating_institutii_utilizatori FOREIGN KEY (id_utilizator) REFERENCES public.utilizatori(id);


--
-- Name: rating_profesori fk_rating_profesori_profesori; Type: FK CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.rating_profesori
    ADD CONSTRAINT fk_rating_profesori_profesori FOREIGN KEY (id_profesor) REFERENCES public.profesori(id);


--
-- Name: rating_profesori fk_rating_profesori_utilizatori; Type: FK CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.rating_profesori
    ADD CONSTRAINT fk_rating_profesori_utilizatori FOREIGN KEY (id_utilizator) REFERENCES public.utilizatori(id);


--
-- Name: utilizatori fk_utilizatori_institutii; Type: FK CONSTRAINT; Schema: public; Owner: cosminaruxandei
--

ALTER TABLE ONLY public.utilizatori
    ADD CONSTRAINT fk_utilizatori_institutii FOREIGN KEY (id_institutie_curenta) REFERENCES public.institutii(id);


--
-- PostgreSQL database dump complete
--

