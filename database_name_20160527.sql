--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
-- Dumped by pg_dump version 12.7

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
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: menu_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_item (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    price integer NOT NULL,
    discount double precision DEFAULT 0 NOT NULL,
    serving_time_period character varying(3) NOT NULL,
    estimate_cooking_time integer DEFAULT 20 NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.menu_item OWNER TO postgres;

--
-- Name: menu_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_item_id_seq OWNER TO postgres;

--
-- Name: menu_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_item_id_seq OWNED BY public.menu_item.id;


--
-- Name: message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message (
    id integer NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(100) NOT NULL,
    my_message character varying NOT NULL,
    date_time_stamp date NOT NULL,
    time_time_stamp time without time zone NOT NULL
);


ALTER TABLE public.message OWNER TO postgres;

--
-- Name: message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.message_id_seq OWNER TO postgres;

--
-- Name: message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_id_seq OWNED BY public.message.id;


--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    table_id integer NOT NULL,
    number integer NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    date_time_stamp date NOT NULL,
    time_time_stamp time without time zone NOT NULL
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_id_seq OWNER TO postgres;

--
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;


--
-- Name: order_menu_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_menu_item (
    id integer NOT NULL,
    order_id integer NOT NULL,
    menu_item_id integer NOT NULL,
    quantity integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.order_menu_item OWNER TO postgres;

--
-- Name: order_menu_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_menu_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_menu_item_id_seq OWNER TO postgres;

--
-- Name: order_menu_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_menu_item_id_seq OWNED BY public.order_menu_item.id;


--
-- Name: order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_number_seq OWNER TO postgres;

--
-- Name: order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_number_seq OWNED BY public."order".number;


--
-- Name: receipt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receipt (
    id integer NOT NULL,
    order_id integer NOT NULL,
    order_number integer NOT NULL,
    total_price integer NOT NULL,
    final_price integer NOT NULL,
    date_time_stamp date NOT NULL,
    time_time_stamp time without time zone NOT NULL
);


ALTER TABLE public.receipt OWNER TO postgres;

--
-- Name: receipt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receipt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receipt_id_seq OWNER TO postgres;

--
-- Name: receipt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receipt_id_seq OWNED BY public.receipt.id;


--
-- Name: table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."table" (
    id integer NOT NULL,
    number integer NOT NULL,
    "position" character varying(100),
    status integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."table" OWNER TO postgres;

--
-- Name: table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_id_seq OWNER TO postgres;

--
-- Name: table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.table_id_seq OWNED BY public."table".id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    phone_number character varying(13) NOT NULL,
    email character varying(50),
    password character varying(30) NOT NULL,
    type character varying(30) DEFAULT 'cashier'::character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: menu_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_item ALTER COLUMN id SET DEFAULT nextval('public.menu_item_id_seq'::regclass);


--
-- Name: message id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message ALTER COLUMN id SET DEFAULT nextval('public.message_id_seq'::regclass);


--
-- Name: order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);


--
-- Name: order number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN number SET DEFAULT nextval('public.order_number_seq'::regclass);


--
-- Name: order_menu_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_menu_item ALTER COLUMN id SET DEFAULT nextval('public.order_menu_item_id_seq'::regclass);


--
-- Name: receipt id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt ALTER COLUMN id SET DEFAULT nextval('public.receipt_id_seq'::regclass);


--
-- Name: table id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."table" ALTER COLUMN id SET DEFAULT nextval('public.table_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name) FROM stdin;
1	tea
2	coffee
3	cool foods
4	drinks
38	fast food
39	cake
40	akbar
\.


--
-- Data for Name: menu_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_item (id, name, price, discount, serving_time_period, estimate_cooking_time, category_id) FROM stdin;
1	green tea	1000	0	1	5	1
2	espresso	25000	0	123	10	2
3	ice cream	5000	0	23	2	3
4	faloode	5000	0	2	5	3
38	Orange juice	15000	0	1	5	4
39	Cappuccino	20000	0	123	10	2
41	pizza mini	30000	0	23	20	38
42	nescaffe	5000	0	123	5	2
\.


--
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message (id, first_name, last_name, email, my_message, date_time_stamp, time_time_stamp) FROM stdin;
1	amir	kiani	amir.kiani@gmail.com	salamfdfddlkgjdflkgjdfhgdfjkbgdflkjgggggggggggggggggggdlfkhgdflkvnrrejhgoijervlknfdjkjghoiwijlkvlkfdhglhrrewoighdfnvlkjfd	2021-07-07	21:51:02
2	amir	talebi	amir.talebnia1478@gmail.com	salaaaaaaaaaaaaaam	2021-07-07	22:05:52
3	saed	beyrami	saed@gmail.com	hello	2021-07-07	22:07:56
4	amir	masoud	amir.talebnia1478@gmail.com	ok	2021-07-08	00:34:14
5	ali	amiri	sdfdfnhkjjhk	salaaaaaaam	2021-07-10	19:02:35
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (id, table_id, number, status, date_time_stamp, time_time_stamp) FROM stdin;
4	1	1	3	2021-06-30	20:02:02
5	5	2	-1	2021-07-02	23:20:08
7	4	3	3	2021-07-03	01:04:19
8	6	4	3	2021-07-05	03:08:59
16	6	971216	3	2021-07-07	23:58:11
17	6	971255	-1	2021-07-08	00:07:49
18	6	971306	3	2021-07-08	00:13:54
19	1	98362	3	2021-07-08	00:30:49
20	1	405447	-1	2021-07-08	00:49:27
22	4	471035	0	2021-07-10	19:07:45
23	6	471036	0	2021-07-10	19:08:20
21	1	471034	3	2021-07-10	19:07:18
\.


--
-- Data for Name: order_menu_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_menu_item (id, order_id, menu_item_id, quantity) FROM stdin;
3	4	2	3
4	4	1	1
8	7	3	3
9	7	2	1
10	7	1	12
7	5	1	5
6	5	2	5
11	8	3	6
12	8	2	3
13	8	1	1
14	16	2	4
15	17	3	1
16	18	39	4
17	19	1	4
18	19	41	4
19	20	2	4
20	21	2	4
21	22	2	4
22	22	41	3
23	23	2	4
24	23	41	3
25	23	1	3
\.


--
-- Data for Name: receipt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receipt (id, order_id, order_number, total_price, final_price, date_time_stamp, time_time_stamp) FROM stdin;
2	4	1	76000	68400	2021-07-05	03:21:03
3	5	2	130000	130000	2021-07-05	03:22:14
4	7	3	52000	46800	2021-07-05	03:40:52
5	8	4	106000	95400	2021-07-06	15:30:39
6	16	971216	100000	90000	2021-07-08	00:00:07
7	17	971255	5000	5000	2021-07-08	00:08:22
8	16	971216	5000	5000	2021-07-08	00:12:11
9	18	971306	80000	72000	2021-07-08	00:14:26
10	19	98362	124000	111600	2021-07-08	00:31:21
11	20	405447	100000	100000	2021-07-08	01:07:38
12	21	471034	100000	90000	2021-07-10	19:12:16
\.


--
-- Data for Name: table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."table" (id, number, "position", status) FROM stdin;
5	3	Inside	0
4	2	Inside	1
6	4	Outside	1
1	1	Balcony	0
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, first_name, last_name, phone_number, email, password, type) FROM stdin;
2	amirmasoud	talebnia	09117898739	amir.talebnia@gmail.com	12345	cashier
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 40, true);


--
-- Name: menu_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_item_id_seq', 42, true);


--
-- Name: message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_id_seq', 5, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 23, true);


--
-- Name: order_menu_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_menu_item_id_seq', 25, true);


--
-- Name: order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_number_seq', 5, true);


--
-- Name: receipt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receipt_id_seq', 12, true);


--
-- Name: table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_id_seq', 7, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 3, true);


--
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- Name: menu_item menu_item_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_item
    ADD CONSTRAINT menu_item_pk PRIMARY KEY (id);


--
-- Name: message message_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pk PRIMARY KEY (id);


--
-- Name: order_menu_item order_menu_item_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_menu_item
    ADD CONSTRAINT order_menu_item_pk PRIMARY KEY (id);


--
-- Name: order order_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- Name: receipt receipt_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt
    ADD CONSTRAINT receipt_pk PRIMARY KEY (id);


--
-- Name: table table_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."table"
    ADD CONSTRAINT table_pk PRIMARY KEY (id);


--
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- Name: category_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX category_id_uindex ON public.category USING btree (id);


--
-- Name: category_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX category_name_uindex ON public.category USING btree (name);


--
-- Name: menu_item_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX menu_item_id_uindex ON public.menu_item USING btree (id);


--
-- Name: message_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX message_id_uindex ON public.message USING btree (id);


--
-- Name: order_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX order_id_uindex ON public."order" USING btree (id);


--
-- Name: order_menu_item_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX order_menu_item_id_uindex ON public.order_menu_item USING btree (id);


--
-- Name: order_number_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX order_number_uindex ON public."order" USING btree (number);


--
-- Name: receipt_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX receipt_id_uindex ON public.receipt USING btree (id);


--
-- Name: table_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX table_id_uindex ON public."table" USING btree (id);


--
-- Name: table_number_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX table_number_uindex ON public."table" USING btree (number);


--
-- Name: user_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_id_uindex ON public."user" USING btree (id);


--
-- Name: user_phone_number_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_phone_number_uindex ON public."user" USING btree (phone_number);


--
-- Name: menu_item menu_item_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_item
    ADD CONSTRAINT menu_item_category_id_fk FOREIGN KEY (category_id) REFERENCES public.category(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: order_menu_item order_menu_item_menu_item_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_menu_item
    ADD CONSTRAINT order_menu_item_menu_item_id_fk FOREIGN KEY (menu_item_id) REFERENCES public.menu_item(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: order_menu_item order_menu_item_order_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_menu_item
    ADD CONSTRAINT order_menu_item_order_id_fk FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: order order_table_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_table_id_fk FOREIGN KEY (table_id) REFERENCES public."table"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: receipt receipt_order_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt
    ADD CONSTRAINT receipt_order_id_fk FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

