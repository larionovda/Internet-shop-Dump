PGDMP         /                x            Internet-Shop    12.1    12.1 )    @           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            A           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            B           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            C           1262    16393    Internet-Shop    DATABASE     �   CREATE DATABASE "Internet-Shop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1251' LC_CTYPE = 'English_United States.1251';
    DROP DATABASE "Internet-Shop";
                postgres    false            �            1259    16463    Brand    TABLE     Z   CREATE TABLE public."Brand" (
    id integer NOT NULL,
    name character(15) NOT NULL
);
    DROP TABLE public."Brand";
       public         heap    postgres    false            �            1259    16498    Gender_category    TABLE     �   CREATE TABLE public."Gender_category" (
    id integer NOT NULL,
    category character varying(25) NOT NULL,
    discount integer NOT NULL
);
 %   DROP TABLE public."Gender_category";
       public         heap    postgres    false            �            1259    16534    Order    TABLE     �   CREATE TABLE public."Order" (
    id integer NOT NULL,
    user_name character varying(120) NOT NULL,
    phone character varying(32) NOT NULL,
    data_time timestamp without time zone NOT NULL
);
    DROP TABLE public."Order";
       public         heap    postgres    false            �            1259    16532    Order_id_seq    SEQUENCE     �   ALTER TABLE public."Order" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Order_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100
    CACHE 1
);
            public          postgres    false    208            �            1259    16539    Order_products    TABLE     �   CREATE TABLE public."Order_products" (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    count integer NOT NULL
);
 $   DROP TABLE public."Order_products";
       public         heap    postgres    false            �            1259    16394    Products    TABLE     �   CREATE TABLE public."Products" (
    id_brand integer NOT NULL,
    id_type integer NOT NULL,
    id_category integer NOT NULL,
    price money NOT NULL,
    article smallint NOT NULL,
    id_supplier integer
);
    DROP TABLE public."Products";
       public         heap    postgres    false            �            1259    16523    Products_article_seq    SEQUENCE     �   ALTER TABLE public."Products" ALTER COLUMN article ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Products_article_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100
    CACHE 1
);
            public          postgres    false    202            �            1259    16572    Suplier    TABLE     d   CREATE TABLE public."Suplier" (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);
    DROP TABLE public."Suplier";
       public         heap    postgres    false            �            1259    16570    Suplier_id_seq    SEQUENCE     �   ALTER TABLE public."Suplier" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Suplier_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100
    CACHE 1
);
            public          postgres    false    211            �            1259    16473    Type    TABLE     a   CREATE TABLE public."Type" (
    id integer NOT NULL,
    type character varying(15) NOT NULL
);
    DROP TABLE public."Type";
       public         heap    postgres    false            5          0    16463    Brand 
   TABLE DATA           +   COPY public."Brand" (id, name) FROM stdin;
    public          postgres    false    203   =.       7          0    16498    Gender_category 
   TABLE DATA           C   COPY public."Gender_category" (id, category, discount) FROM stdin;
    public          postgres    false    205   ~.       :          0    16534    Order 
   TABLE DATA           B   COPY public."Order" (id, user_name, phone, data_time) FROM stdin;
    public          postgres    false    208   �.       ;          0    16539    Order_products 
   TABLE DATA           G   COPY public."Order_products" (order_id, product_id, count) FROM stdin;
    public          postgres    false    209   
/       4          0    16394    Products 
   TABLE DATA           a   COPY public."Products" (id_brand, id_type, id_category, price, article, id_supplier) FROM stdin;
    public          postgres    false    202   3/       =          0    16572    Suplier 
   TABLE DATA           -   COPY public."Suplier" (id, name) FROM stdin;
    public          postgres    false    211   �/       6          0    16473    Type 
   TABLE DATA           *   COPY public."Type" (id, type) FROM stdin;
    public          postgres    false    204   �/       D           0    0    Order_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Order_id_seq"', 1, true);
          public          postgres    false    207            E           0    0    Products_article_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Products_article_seq"', 4, true);
          public          postgres    false    206            F           0    0    Suplier_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Suplier_id_seq"', 2, true);
          public          postgres    false    210            �
           2606    16506    Brand Brand_unique 
   CONSTRAINT     Q   ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT "Brand_unique" UNIQUE (name);
 @   ALTER TABLE ONLY public."Brand" DROP CONSTRAINT "Brand_unique";
       public            postgres    false    203            �
           2606    16531    Gender_category Category 
   CONSTRAINT     [   ALTER TABLE ONLY public."Gender_category"
    ADD CONSTRAINT "Category" UNIQUE (category);
 F   ALTER TABLE ONLY public."Gender_category" DROP CONSTRAINT "Category";
       public            postgres    false    205            �
           2606    16502 %   Gender_category Gender_category__pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Gender_category"
    ADD CONSTRAINT "Gender_category__pkey" PRIMARY KEY (id);
 S   ALTER TABLE ONLY public."Gender_category" DROP CONSTRAINT "Gender_category__pkey";
       public            postgres    false    205            �
           2606    16538    Order Order_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_pkey";
       public            postgres    false    208            �
           2606    16543 "   Order_products Order_products_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."Order_products"
    ADD CONSTRAINT "Order_products_pkey" PRIMARY KEY (order_id, product_id);
 P   ALTER TABLE ONLY public."Order_products" DROP CONSTRAINT "Order_products_pkey";
       public            postgres    false    209    209            �
           2606    16518    Products Products_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (article);
 D   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Products_pkey";
       public            postgres    false    202            �
           2606    16576    Suplier Suplier_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Suplier"
    ADD CONSTRAINT "Suplier_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Suplier" DROP CONSTRAINT "Suplier_pkey";
       public            postgres    false    211            �
           2606    16477    Type Type_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Type"
    ADD CONSTRAINT "Type_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Type" DROP CONSTRAINT "Type_pkey";
       public            postgres    false    204            �
           2606    16467    Brand id_brand 
   CONSTRAINT     N   ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT id_brand PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."Brand" DROP CONSTRAINT id_brand;
       public            postgres    false    203            �
           2606    16508    Type type_unique 
   CONSTRAINT     M   ALTER TABLE ONLY public."Type"
    ADD CONSTRAINT type_unique UNIQUE (type);
 <   ALTER TABLE ONLY public."Type" DROP CONSTRAINT type_unique;
       public            postgres    false    204            �
           1259    16569    index_products    INDEX     _   CREATE INDEX index_products ON public."Products" USING btree (id_brand, id_type, id_category);
 "   DROP INDEX public.index_products;
       public            postgres    false    202    202    202            �
           2606    16468    Products Brand_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Brand_FK" FOREIGN KEY (id_brand) REFERENCES public."Brand"(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Brand_FK";
       public          postgres    false    203    2721    202            �
           2606    16525    Products Category_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Category_FK" FOREIGN KEY (id_category) REFERENCES public."Gender_category"(id) NOT VALID;
 B   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Category_FK";
       public          postgres    false    2729    205    202            �
           2606    16478    Products Type_FK    FK CONSTRAINT     ~   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Type_FK" FOREIGN KEY (id_type) REFERENCES public."Type"(id) NOT VALID;
 >   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Type_FK";
       public          postgres    false    2723    204    202            �
           2606    16559    Order_products order_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Order_products"
    ADD CONSTRAINT order_fk FOREIGN KEY (order_id) REFERENCES public."Order"(id) MATCH FULL;
 C   ALTER TABLE ONLY public."Order_products" DROP CONSTRAINT order_fk;
       public          postgres    false    2731    209    208            �
           2606    16564    Order_products product_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Order_products"
    ADD CONSTRAINT product_fk FOREIGN KEY (order_id) REFERENCES public."Products"(article) MATCH FULL;
 E   ALTER TABLE ONLY public."Order_products" DROP CONSTRAINT product_fk;
       public          postgres    false    2716    209    202            �
           2606    16577    Products supplier_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "supplier_FK" FOREIGN KEY (id_supplier) REFERENCES public."Suplier"(id) MATCH FULL;
 B   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "supplier_FK";
       public          postgres    false    202    211    2735            5   1   x�3��M,JV(���W .#�Ĝ����2�L/M-.V@���qqq ���      7   >   x�3�,��M�S/VH��/���K�4�2��MD2�2�g�sp�p��r��qqq /�      :   .   x�3�K,�L�455�#N#C] 2W02�2��21������ �n�      ;      x�3�4�4�2�4�4����� 
      4   @   x�3�4BCSK= 'Əˈ�,�c`	4	C��XBD�aJ�@JM �& �=... �Jg      =      x�3���M�2�NN��L����� <
      6   0   x�3�L)J-.�2�,�-��,*�2�,H�+)�2��JL�N-����� ��C     