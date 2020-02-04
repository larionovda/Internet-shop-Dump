--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2020-02-04 10:30:39

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
-- TOC entry 203 (class 1259 OID 16463)
-- Name: Brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Brand" (
    id integer NOT NULL,
    name character(15) NOT NULL
);


ALTER TABLE public."Brand" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16498)
-- Name: Gender_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Gender_category" (
    id integer NOT NULL,
    category character varying(25) NOT NULL,
    discount integer NOT NULL
);


ALTER TABLE public."Gender_category" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16534)
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    id integer NOT NULL,
    user_name character varying(120) NOT NULL,
    phone character varying(32) NOT NULL,
    data_time timestamp without time zone NOT NULL
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16532)
-- Name: Order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Order" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Order_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100
    CACHE 1
);


--
-- TOC entry 209 (class 1259 OID 16539)
-- Name: Order_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order_products" (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    count integer NOT NULL
);


ALTER TABLE public."Order_products" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16394)
-- Name: Products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Products" (
    id_brand integer NOT NULL,
    id_type integer NOT NULL,
    id_category integer NOT NULL,
    price money NOT NULL,
    article smallint NOT NULL,
    id_supplier integer
);


ALTER TABLE public."Products" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16523)
-- Name: Products_article_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Products" ALTER COLUMN article ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Products_article_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 16572)
-- Name: Suplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Suplier" (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public."Suplier" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16570)
-- Name: Suplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Suplier" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Suplier_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100
    CACHE 1
);


--
-- TOC entry 204 (class 1259 OID 16473)
-- Name: Type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Type" (
    id integer NOT NULL,
    type character varying(15) NOT NULL
);


ALTER TABLE public."Type" OWNER TO postgres;

--
-- TOC entry 2869 (class 0 OID 16463)
-- Dependencies: 203
-- Data for Name: Brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Brand" (id, name) FROM stdin;
1	marc polo      
2	alcott         
3	guess          
\.


--
-- TOC entry 2871 (class 0 OID 16498)
-- Dependencies: 205
-- Data for Name: Gender_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Gender_category" (id, category, discount) FROM stdin;
1	women's clothing	5
2	man's clothing	0
3	woman's shoes	10
4	man's shoes	15
\.


--
-- TOC entry 2874 (class 0 OID 16534)
-- Dependencies: 208
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order" (id, user_name, phone, data_time) FROM stdin;
1	Vasya	555-55-55	2018-08-07 20:38:40
\.


--
-- TOC entry 2875 (class 0 OID 16539)
-- Dependencies: 209
-- Data for Name: Order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order_products" (order_id, product_id, count) FROM stdin;
1	1	1
1	2	3
\.


--
-- TOC entry 2868 (class 0 OID 16394)
-- Dependencies: 202
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Products" (id_brand, id_type, id_category, price, article, id_supplier) FROM stdin;
1	1	1	$15,980.00	1	2
2	2	1	$1,090.00	2	2
3	1	1	$13,990.00	3	1
2	2	2	$1,490.00	4	1
\.


--
-- TOC entry 2877 (class 0 OID 16572)
-- Dependencies: 211
-- Data for Name: Suplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Suplier" (id, name) FROM stdin;
1	Rima
2	Scania
\.


--
-- TOC entry 2870 (class 0 OID 16473)
-- Dependencies: 204
-- Data for Name: Type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Type" (id, type) FROM stdin;
1	dress
2	t-shirt
3	pants
4	jacket
\.


--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 207
-- Name: Order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Order_id_seq"', 1, true);


--
-- TOC entry 2884 (class 0 OID 0)
-- Dependencies: 206
-- Name: Products_article_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Products_article_seq"', 4, true);


--
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 210
-- Name: Suplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Suplier_id_seq"', 2, true);


--
-- TOC entry 2719 (class 2606 OID 16506)
-- Name: Brand Brand_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT "Brand_unique" UNIQUE (name);


--
-- TOC entry 2727 (class 2606 OID 16531)
-- Name: Gender_category Category; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gender_category"
    ADD CONSTRAINT "Category" UNIQUE (category);


--
-- TOC entry 2729 (class 2606 OID 16502)
-- Name: Gender_category Gender_category__pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gender_category"
    ADD CONSTRAINT "Gender_category__pkey" PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 16538)
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 16543)
-- Name: Order_products Order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order_products"
    ADD CONSTRAINT "Order_products_pkey" PRIMARY KEY (order_id, product_id);


--
-- TOC entry 2716 (class 2606 OID 16518)
-- Name: Products Products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (article);


--
-- TOC entry 2735 (class 2606 OID 16576)
-- Name: Suplier Suplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Suplier"
    ADD CONSTRAINT "Suplier_pkey" PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 16477)
-- Name: Type Type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Type"
    ADD CONSTRAINT "Type_pkey" PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 16467)
-- Name: Brand id_brand; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT id_brand PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 16508)
-- Name: Type type_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Type"
    ADD CONSTRAINT type_unique UNIQUE (type);


--
-- TOC entry 2717 (class 1259 OID 16569)
-- Name: index_products; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products ON public."Products" USING btree (id_brand, id_type, id_category);


--
-- TOC entry 2736 (class 2606 OID 16468)
-- Name: Products Brand_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Brand_FK" FOREIGN KEY (id_brand) REFERENCES public."Brand"(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2738 (class 2606 OID 16525)
-- Name: Products Category_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Category_FK" FOREIGN KEY (id_category) REFERENCES public."Gender_category"(id) NOT VALID;


--
-- TOC entry 2737 (class 2606 OID 16478)
-- Name: Products Type_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Type_FK" FOREIGN KEY (id_type) REFERENCES public."Type"(id) NOT VALID;


--
-- TOC entry 2740 (class 2606 OID 16559)
-- Name: Order_products order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order_products"
    ADD CONSTRAINT order_fk FOREIGN KEY (order_id) REFERENCES public."Order"(id) MATCH FULL;


--
-- TOC entry 2741 (class 2606 OID 16564)
-- Name: Order_products product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order_products"
    ADD CONSTRAINT product_fk FOREIGN KEY (order_id) REFERENCES public."Products"(article) MATCH FULL;


--
-- TOC entry 2739 (class 2606 OID 16577)
-- Name: Products supplier_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "supplier_FK" FOREIGN KEY (id_supplier) REFERENCES public."Suplier"(id) MATCH FULL;


-- Completed on 2020-02-04 10:30:39

--
-- PostgreSQL database dump complete
--

