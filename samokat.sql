PGDMP                      |            aaa    16.1    16.1 G               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25569    aaa    DATABASE     w   CREATE DATABASE aaa WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE aaa;
                postgres    false            �            1259    25570    address    TABLE     N  CREATE TABLE public.address (
    address_id integer NOT NULL,
    address_street character varying NOT NULL,
    address_house integer NOT NULL,
    address_entry integer,
    address_floor integer,
    address_flat integer,
    address_deliverytime integer NOT NULL,
    address_backtime integer NOT NULL,
    storage_id integer
);
    DROP TABLE public.address;
       public         heap    postgres    false            �            1259    25575    address_address_id_seq    SEQUENCE     �   CREATE SEQUENCE public.address_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.address_address_id_seq;
       public          postgres    false    215                       0    0    address_address_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.address_address_id_seq OWNED BY public.address.address_id;
          public          postgres    false    216            �            1259    25576    client    TABLE     p   CREATE TABLE public.client (
    client_id integer NOT NULL,
    client_phone character varying(11) NOT NULL
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    25579    client_address    TABLE     h   CREATE TABLE public.client_address (
    client_id integer NOT NULL,
    address_id integer NOT NULL
);
 "   DROP TABLE public.client_address;
       public         heap    postgres    false            �            1259    25582    client_client_id_seq    SEQUENCE     �   CREATE SEQUENCE public.client_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_client_id_seq;
       public          postgres    false    217                       0    0    client_client_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;
          public          postgres    false    219            �            1259    25583    courier    TABLE     �   CREATE TABLE public.courier (
    courier_id integer NOT NULL,
    courier_name character varying NOT NULL,
    courier_phone character varying(11) NOT NULL,
    courier_status character varying,
    storage_id integer NOT NULL
);
    DROP TABLE public.courier;
       public         heap    postgres    false            �            1259    25588    courier_courier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.courier_courier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.courier_courier_id_seq;
       public          postgres    false    220                       0    0    courier_courier_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.courier_courier_id_seq OWNED BY public.courier.courier_id;
          public          postgres    false    221            �            1259    25589    orders    TABLE       CREATE TABLE public.orders (
    order_id integer NOT NULL,
    order_comment character varying,
    order_burndate time without time zone NOT NULL,
    order_closedate time without time zone,
    client_id integer NOT NULL,
    courier_id integer,
    storage_id integer
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    25594    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public          postgres    false    222                       0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public          postgres    false    223            �            1259    25595    packet    TABLE     �   CREATE TABLE public.packet (
    packet_id integer NOT NULL,
    packet_weight numeric(10,1),
    packet_sum integer,
    order_id integer
);
    DROP TABLE public.packet;
       public         heap    postgres    false            �            1259    25598    packet_packet_id_seq    SEQUENCE     �   CREATE SEQUENCE public.packet_packet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.packet_packet_id_seq;
       public          postgres    false    224                       0    0    packet_packet_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.packet_packet_id_seq OWNED BY public.packet.packet_id;
          public          postgres    false    225            �            1259    25599    packet_products    TABLE     �   CREATE TABLE public.packet_products (
    packet_id integer NOT NULL,
    product_count integer NOT NULL,
    product_id integer,
    storage_id integer
);
 #   DROP TABLE public.packet_products;
       public         heap    postgres    false            �            1259    25602    products    TABLE     �   CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying NOT NULL,
    product_weight numeric(3,1) NOT NULL,
    product_burndate date NOT NULL,
    product_outdate date,
    product_prise integer NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    25607    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public          postgres    false    227                       0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;
          public          postgres    false    228            �            1259    25608    storages    TABLE     t   CREATE TABLE public.storages (
    storage_id integer NOT NULL,
    storage_phone character varying(11) NOT NULL
);
    DROP TABLE public.storages;
       public         heap    postgres    false            �            1259    25611    storages_products    TABLE     �   CREATE TABLE public.storages_products (
    storage_id integer NOT NULL,
    product_id integer NOT NULL,
    product_count integer NOT NULL
);
 %   DROP TABLE public.storages_products;
       public         heap    postgres    false            �            1259    25614    storages_storage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.storages_storage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.storages_storage_id_seq;
       public          postgres    false    229                       0    0    storages_storage_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.storages_storage_id_seq OWNED BY public.storages.storage_id;
          public          postgres    false    231            D           2604    25615    address address_id    DEFAULT     x   ALTER TABLE ONLY public.address ALTER COLUMN address_id SET DEFAULT nextval('public.address_address_id_seq'::regclass);
 A   ALTER TABLE public.address ALTER COLUMN address_id DROP DEFAULT;
       public          postgres    false    216    215            E           2604    25616    client client_id    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN client_id DROP DEFAULT;
       public          postgres    false    219    217            F           2604    25617    courier courier_id    DEFAULT     x   ALTER TABLE ONLY public.courier ALTER COLUMN courier_id SET DEFAULT nextval('public.courier_courier_id_seq'::regclass);
 A   ALTER TABLE public.courier ALTER COLUMN courier_id DROP DEFAULT;
       public          postgres    false    221    220            G           2604    25618    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    223    222            H           2604    25619    products product_id    DEFAULT     z   ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    228    227            I           2604    25620    storages storage_id    DEFAULT     z   ALTER TABLE ONLY public.storages ALTER COLUMN storage_id SET DEFAULT nextval('public.storages_storage_id_seq'::regclass);
 B   ALTER TABLE public.storages ALTER COLUMN storage_id DROP DEFAULT;
       public          postgres    false    231    229            �          0    25570    address 
   TABLE DATA           �   COPY public.address (address_id, address_street, address_house, address_entry, address_floor, address_flat, address_deliverytime, address_backtime, storage_id) FROM stdin;
    public          postgres    false    215   nT       �          0    25576    client 
   TABLE DATA           9   COPY public.client (client_id, client_phone) FROM stdin;
    public          postgres    false    217   �U       �          0    25579    client_address 
   TABLE DATA           ?   COPY public.client_address (client_id, address_id) FROM stdin;
    public          postgres    false    218   V       �          0    25583    courier 
   TABLE DATA           f   COPY public.courier (courier_id, courier_name, courier_phone, courier_status, storage_id) FROM stdin;
    public          postgres    false    220   iV       �          0    25589    orders 
   TABLE DATA           }   COPY public.orders (order_id, order_comment, order_burndate, order_closedate, client_id, courier_id, storage_id) FROM stdin;
    public          postgres    false    222   �W       �          0    25595    packet 
   TABLE DATA           P   COPY public.packet (packet_id, packet_weight, packet_sum, order_id) FROM stdin;
    public          postgres    false    224   �X                  0    25599    packet_products 
   TABLE DATA           [   COPY public.packet_products (packet_id, product_count, product_id, storage_id) FROM stdin;
    public          postgres    false    226   �Y                 0    25602    products 
   TABLE DATA           ~   COPY public.products (product_id, product_name, product_weight, product_burndate, product_outdate, product_prise) FROM stdin;
    public          postgres    false    227   �Z                 0    25608    storages 
   TABLE DATA           =   COPY public.storages (storage_id, storage_phone) FROM stdin;
    public          postgres    false    229   �[                 0    25611    storages_products 
   TABLE DATA           R   COPY public.storages_products (storage_id, product_id, product_count) FROM stdin;
    public          postgres    false    230   "\                  0    0    address_address_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.address_address_id_seq', 1, false);
          public          postgres    false    216                       0    0    client_client_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.client_client_id_seq', 1, true);
          public          postgres    false    219                       0    0    courier_courier_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.courier_courier_id_seq', 1, true);
          public          postgres    false    221                       0    0    orders_order_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orders_order_id_seq', 1, true);
          public          postgres    false    223                       0    0    packet_packet_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.packet_packet_id_seq', 265, true);
          public          postgres    false    225                       0    0    products_product_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.products_product_id_seq', 1, true);
          public          postgres    false    228                       0    0    storages_storage_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.storages_storage_id_seq', 1, false);
          public          postgres    false    231            K           2606    25622    address address_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT address_pkey;
       public            postgres    false    215            M           2606    25624    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    217            O           2606    25626    courier courier_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.courier
    ADD CONSTRAINT courier_pkey PRIMARY KEY (courier_id);
 >   ALTER TABLE ONLY public.courier DROP CONSTRAINT courier_pkey;
       public            postgres    false    220            Q           2606    25628    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    222            S           2606    25630    packet packet_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.packet
    ADD CONSTRAINT packet_pkey PRIMARY KEY (packet_id);
 <   ALTER TABLE ONLY public.packet DROP CONSTRAINT packet_pkey;
       public            postgres    false    224            Y           2606    25632    storages_products pk 
   CONSTRAINT     f   ALTER TABLE ONLY public.storages_products
    ADD CONSTRAINT pk PRIMARY KEY (storage_id, product_id);
 >   ALTER TABLE ONLY public.storages_products DROP CONSTRAINT pk;
       public            postgres    false    230    230            U           2606    25634    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    227            W           2606    25636    storages storages_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.storages
    ADD CONSTRAINT storages_pkey PRIMARY KEY (storage_id);
 @   ALTER TABLE ONLY public.storages DROP CONSTRAINT storages_pkey;
       public            postgres    false    229            [           2606    25637    client_address address_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_address
    ADD CONSTRAINT address_id FOREIGN KEY (address_id) REFERENCES public.address(address_id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.client_address DROP CONSTRAINT address_id;
       public          postgres    false    215    4683    218            \           2606    25642    client_address client_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_address
    ADD CONSTRAINT client_id FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.client_address DROP CONSTRAINT client_id;
       public          postgres    false    217    218    4685            ^           2606    25647    orders client_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT client_id FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON UPDATE CASCADE;
 :   ALTER TABLE ONLY public.orders DROP CONSTRAINT client_id;
       public          postgres    false    222    217    4685            _           2606    25652    orders courier_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT courier_id FOREIGN KEY (courier_id) REFERENCES public.courier(courier_id) ON UPDATE CASCADE;
 ;   ALTER TABLE ONLY public.orders DROP CONSTRAINT courier_id;
       public          postgres    false    222    4687    220            a           2606    25657    packet order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.packet
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON UPDATE CASCADE ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.packet DROP CONSTRAINT order_id;
       public          postgres    false    222    224    4689            b           2606    25662    packet_products packet_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.packet_products
    ADD CONSTRAINT packet_id FOREIGN KEY (packet_id) REFERENCES public.packet(packet_id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.packet_products DROP CONSTRAINT packet_id;
       public          postgres    false    226    4691    224            d           2606    25667    storages_products product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.storages_products
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON UPDATE CASCADE ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.storages_products DROP CONSTRAINT product_id;
       public          postgres    false    230    4693    227            c           2606    25672    packet_products product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.packet_products
    ADD CONSTRAINT product_id FOREIGN KEY (product_id, storage_id) REFERENCES public.storages_products(product_id, storage_id) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.packet_products DROP CONSTRAINT product_id;
       public          postgres    false    226    226    230    4697    230            Z           2606    25677    address storage_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT storage_id FOREIGN KEY (storage_id) REFERENCES public.storages(storage_id) ON UPDATE CASCADE ON DELETE SET NULL;
 <   ALTER TABLE ONLY public.address DROP CONSTRAINT storage_id;
       public          postgres    false    215    4695    229            e           2606    25682    storages_products storage_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.storages_products
    ADD CONSTRAINT storage_id FOREIGN KEY (storage_id) REFERENCES public.storages(storage_id) ON UPDATE CASCADE ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.storages_products DROP CONSTRAINT storage_id;
       public          postgres    false    229    4695    230            ]           2606    25687    courier storage_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.courier
    ADD CONSTRAINT storage_id FOREIGN KEY (storage_id) REFERENCES public.storages(storage_id) ON UPDATE CASCADE ON DELETE SET NULL;
 <   ALTER TABLE ONLY public.courier DROP CONSTRAINT storage_id;
       public          postgres    false    220    4695    229            `           2606    25692    orders storage_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT storage_id FOREIGN KEY (storage_id) REFERENCES public.storages(storage_id) NOT VALID;
 ;   ALTER TABLE ONLY public.orders DROP CONSTRAINT storage_id;
       public          postgres    false    222    4695    229            �   .  x���=N�0���a�=��/�	�0������>BZ�b�p�ɍxc'�(��>�y�dG�(��M�2/29|�\�H�� ��P�����\�D,&�0a%0������6 �<�y����ƃwh�ܵĚ�R���l���c$�k4�t-z:ܮr�
��V\�u*:�W��I����V��8�ܺ)m?2�auަ�
#ť���*��F�� T�$g�B���*��u$S0�9_��D@���)��Tv����U0l���K�O�q����\X���&�v��_UQ����Nʏ�����1�      �   _   x�=���0�޽a*.������%*5/$�k,h�V�e^ dQ��z��e�!�lX���{���v��xr�N��xzBK'���r�7s<7�&�%7      �   >   x�Ʊ�0�x�����B�u�HFn���2��v�vQn�7�9��&d�"�i���9��
Z      �     x�uQ�M�@�ޫ�D�+N1c��@ !��ҁqba06-�v���N�e$[����\LxA�F4���EǷTlbq%���b��$�Z�r9������y���oE�A�{�J�I	Gt�8��R�$Z_~�^8S��>�HK�;a���7#ܣ��o9��vV�E:��.�K'RS^�
����:	됫�bɕ��M��N�Q��R'몳�� �jn����.���-��:W�2��=��k�uoc�OW�� �Nu�`����5Ss�2��;��      �     x����q� E�r� #!��"R����b���L٭w�/���<}}}��U���G�k���}n�v��s�j��w�z�.Ĺ�V��\(�R��N���l�0�N�A�A��"�i �2;��P2 �.3on�}b���֯�wn�ĥ�b�ZQ(^��.�Vo\���F с|p|H�.!�$H.QF�2 �H�	��&���) ��x(��ɞ������`���r��M$tI.��M$�<��@c�+O�f6�#�� �`�K=}H��O/�4��l�H      �   �   x�=�ۍ@!D��#ohb+���X��&&��8�@��(�
�@�@�����Vs�`����s�S��!��WK@�(�GA�< ��
��y�ڄ�l��P��>�-����l��+!$�*]�HնfzIG��r}�[]�����Y��gk�{HX��ߟ�ΓĞe���dO��љ Y<pZ>p�ءؿ�]����E�          �   x�=��� г�/�Ĥ�����`/�?Ct06ְa���UC��A�ۧ�]~���K�Ӆ{W�=���7��+��G'guo\���B�p�Otc����r��'��cXj��_Ay����Ѡ�YJ���A�����.�F���1�K8c'pl�%w�R�W.u�I$�PЛ�Fr��5g�_9J�R��#eO`�^�� �D�$���)�cyJQc~?s�2lR�         M  x�m��n�0E��������RmZ�J[���lMh'!t�õ}���V��A��@l�˸��ȕb�Ch�4J`�J�Q�WlT��0V*��^�(3j��!���8��8��������S�{�&y�8-�!i�V1��̯n���
:E	s�ܫl�;@)TL���0F$���u鞞��2e��S�����7��e���V�	m	N�����%-����j��]�8���!PT��*�'B-��=fA��s[�?O;.s��N+�{Ph�B,�l��ϥ�dmއqIm'�.�GPl[�����ln�w�ظɥ��tB��+�ժ��倈-��{         -   x�3�4�4�.# ����<c�2�L`���3��=... �!.         N  x�-�ۭ!C�C1W��l�u\�i�7!1gnn�,�4�e��6ߐ�ܱd��z��Ǹ��Q��iUԚ��Tz۟����L�Qu�JL�p�-�����)�@��B!Gu/,!�X �d���HjZ�C�!F�{�;#︃PM@���[��#�3(���X��§$���,�� �_j�IB�����M�\qEŗ�����R�j���Y�Y�tq��J���&HHP���2�_��T���OA��iM���Z��|7EN����F�uR0��|��P0)^R�`��0���z�^Q|Lb��tJ��8�X�x �\�^a���`J�*�9���Z�Γi}     