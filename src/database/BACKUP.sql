PGDMP                       |            db_estudiantes "   13.13 (Ubuntu 13.13-1.pgdg20.04+1)     16.1 (Ubuntu 16.1-1.pgdg20.04+1) 0               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    37123    db_estudiantes    DATABASE     z   CREATE DATABASE db_estudiantes WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es_PE.UTF-8';
    DROP DATABASE db_estudiantes;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false                       0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1255    37275 z   creando_persona_con_movimientos(character varying, character varying, character varying, date, character varying, integer) 	   PROCEDURE     `  CREATE PROCEDURE public.creando_persona_con_movimientos(nombre character varying, apellidopaterno character varying, apellidomaterno character varying, fechadenacimiento date, ruta character varying, idgrado integer)
    LANGUAGE plpgsql
    AS $$
declare
	detalleCronograma RECORD;
	idPersona persona.nid_persona%TYPE;
begin
	INSERT INTO persona(nom_persona, ape_pate_pers, ape_mate_pers, fecha_naci, nid_grado, foto_ruta) 
	VALUES (nombre, apellidoPaterno, apellidoMaterno, fechaDeNacimiento, idGrado, ruta) RETURNING nid_persona INTO idPersona;
	for detalleCronograma in (SELECT id_detalle_cronograma FROM detalle_cronograma WHERE id_grado = idGrado ) loop
		INSERT INTO movimiento(tipo_movimiento, estado, monto, id_persona, id_detalle_cronograma) 
				VALUES ('INGRESO','POR PAGAR', 0, idPersona, detalleCronograma.id_detalle_cronograma);
	end loop;
end; $$;
 �   DROP PROCEDURE public.creando_persona_con_movimientos(nombre character varying, apellidopaterno character varying, apellidomaterno character varying, fechadenacimiento date, ruta character varying, idgrado integer);
       public          postgres    false    4            �            1259    37301 
   cronograma    TABLE     Y   CREATE TABLE public.cronograma (
    id_cronograma integer NOT NULL,
    year integer
);
    DROP TABLE public.cronograma;
       public         heap    postgres    false    4            �            1259    37299    cronograma_id_cronograma_seq    SEQUENCE     �   CREATE SEQUENCE public.cronograma_id_cronograma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.cronograma_id_cronograma_seq;
       public          postgres    false    205    4                       0    0    cronograma_id_cronograma_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.cronograma_id_cronograma_seq OWNED BY public.cronograma.id_cronograma;
          public          postgres    false    204            �            1259    37309    detalle_cronograma    TABLE     �   CREATE TABLE public.detalle_cronograma (
    id_detalle_cronograma integer NOT NULL,
    desc_pension character varying(50),
    monto numeric,
    fecha_venci date,
    id_cronograma integer,
    id_grado integer
);
 &   DROP TABLE public.detalle_cronograma;
       public         heap    postgres    false    4            �            1259    37307 ,   detalle_cronograma_id_detalle_cronograma_seq    SEQUENCE     �   CREATE SEQUENCE public.detalle_cronograma_id_detalle_cronograma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.detalle_cronograma_id_detalle_cronograma_seq;
       public          postgres    false    207    4                       0    0 ,   detalle_cronograma_id_detalle_cronograma_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.detalle_cronograma_id_detalle_cronograma_seq OWNED BY public.detalle_cronograma.id_detalle_cronograma;
          public          postgres    false    206            �            1259    37278    grado    TABLE     �   CREATE TABLE public.grado (
    nid_grado integer NOT NULL,
    desc_grado character varying(30),
    nivel character varying(30),
    orden integer
);
    DROP TABLE public.grado;
       public         heap    postgres    false    4            �            1259    37276    grado_nid_grado_seq    SEQUENCE     �   CREATE SEQUENCE public.grado_nid_grado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.grado_nid_grado_seq;
       public          postgres    false    201    4                       0    0    grado_nid_grado_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.grado_nid_grado_seq OWNED BY public.grado.nid_grado;
          public          postgres    false    200            �            1259    37330 
   movimiento    TABLE       CREATE TABLE public.movimiento (
    id_movimiento integer NOT NULL,
    tipo_movimiento character varying(20),
    monto numeric,
    estado character varying(20),
    fecha_pago timestamp without time zone,
    id_persona integer,
    id_detalle_cronograma integer
);
    DROP TABLE public.movimiento;
       public         heap    postgres    false    4            �            1259    37328    movimiento_id_movimiento_seq    SEQUENCE     �   CREATE SEQUENCE public.movimiento_id_movimiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.movimiento_id_movimiento_seq;
       public          postgres    false    4    209                       0    0    movimiento_id_movimiento_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.movimiento_id_movimiento_seq OWNED BY public.movimiento.id_movimiento;
          public          postgres    false    208            �            1259    37288    persona    TABLE       CREATE TABLE public.persona (
    nid_persona integer NOT NULL,
    nom_persona character varying(50),
    ape_pate_pers character varying(50),
    ape_mate_pers character varying(50),
    fecha_naci date,
    foto_ruta character varying(255),
    nid_grado integer
);
    DROP TABLE public.persona;
       public         heap    postgres    false    4            �            1259    37286    persona_nid_persona_seq    SEQUENCE     �   CREATE SEQUENCE public.persona_nid_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.persona_nid_persona_seq;
       public          postgres    false    203    4                       0    0    persona_nid_persona_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.persona_nid_persona_seq OWNED BY public.persona.nid_persona;
          public          postgres    false    202            o           2604    37304    cronograma id_cronograma    DEFAULT     �   ALTER TABLE ONLY public.cronograma ALTER COLUMN id_cronograma SET DEFAULT nextval('public.cronograma_id_cronograma_seq'::regclass);
 G   ALTER TABLE public.cronograma ALTER COLUMN id_cronograma DROP DEFAULT;
       public          postgres    false    204    205    205            p           2604    37312 (   detalle_cronograma id_detalle_cronograma    DEFAULT     �   ALTER TABLE ONLY public.detalle_cronograma ALTER COLUMN id_detalle_cronograma SET DEFAULT nextval('public.detalle_cronograma_id_detalle_cronograma_seq'::regclass);
 W   ALTER TABLE public.detalle_cronograma ALTER COLUMN id_detalle_cronograma DROP DEFAULT;
       public          postgres    false    206    207    207            m           2604    37281    grado nid_grado    DEFAULT     r   ALTER TABLE ONLY public.grado ALTER COLUMN nid_grado SET DEFAULT nextval('public.grado_nid_grado_seq'::regclass);
 >   ALTER TABLE public.grado ALTER COLUMN nid_grado DROP DEFAULT;
       public          postgres    false    201    200    201            q           2604    37333    movimiento id_movimiento    DEFAULT     �   ALTER TABLE ONLY public.movimiento ALTER COLUMN id_movimiento SET DEFAULT nextval('public.movimiento_id_movimiento_seq'::regclass);
 G   ALTER TABLE public.movimiento ALTER COLUMN id_movimiento DROP DEFAULT;
       public          postgres    false    208    209    209            n           2604    37291    persona nid_persona    DEFAULT     z   ALTER TABLE ONLY public.persona ALTER COLUMN nid_persona SET DEFAULT nextval('public.persona_nid_persona_seq'::regclass);
 B   ALTER TABLE public.persona ALTER COLUMN nid_persona DROP DEFAULT;
       public          postgres    false    203    202    203            
          0    37301 
   cronograma 
   TABLE DATA           9   COPY public.cronograma (id_cronograma, year) FROM stdin;
    public          postgres    false    205   �=                 0    37309    detalle_cronograma 
   TABLE DATA           ~   COPY public.detalle_cronograma (id_detalle_cronograma, desc_pension, monto, fecha_venci, id_cronograma, id_grado) FROM stdin;
    public          postgres    false    207   �=                 0    37278    grado 
   TABLE DATA           D   COPY public.grado (nid_grado, desc_grado, nivel, orden) FROM stdin;
    public          postgres    false    201   �>                 0    37330 
   movimiento 
   TABLE DATA           �   COPY public.movimiento (id_movimiento, tipo_movimiento, monto, estado, fecha_pago, id_persona, id_detalle_cronograma) FROM stdin;
    public          postgres    false    209   �?                 0    37288    persona 
   TABLE DATA           {   COPY public.persona (nid_persona, nom_persona, ape_pate_pers, ape_mate_pers, fecha_naci, foto_ruta, nid_grado) FROM stdin;
    public          postgres    false    203   �@                  0    0    cronograma_id_cronograma_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.cronograma_id_cronograma_seq', 5, true);
          public          postgres    false    204                       0    0 ,   detalle_cronograma_id_detalle_cronograma_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.detalle_cronograma_id_detalle_cronograma_seq', 22, true);
          public          postgres    false    206                       0    0    grado_nid_grado_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.grado_nid_grado_seq', 15, true);
          public          postgres    false    200                       0    0    movimiento_id_movimiento_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.movimiento_id_movimiento_seq', 77, true);
          public          postgres    false    208                       0    0    persona_nid_persona_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.persona_nid_persona_seq', 7, true);
          public          postgres    false    202            y           2606    37306    cronograma cronograma_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.cronograma
    ADD CONSTRAINT cronograma_pkey PRIMARY KEY (id_cronograma);
 D   ALTER TABLE ONLY public.cronograma DROP CONSTRAINT cronograma_pkey;
       public            postgres    false    205            {           2606    37317 *   detalle_cronograma detalle_cronograma_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.detalle_cronograma
    ADD CONSTRAINT detalle_cronograma_pkey PRIMARY KEY (id_detalle_cronograma);
 T   ALTER TABLE ONLY public.detalle_cronograma DROP CONSTRAINT detalle_cronograma_pkey;
       public            postgres    false    207            s           2606    37285    grado grado_orden_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.grado
    ADD CONSTRAINT grado_orden_key UNIQUE (orden);
 ?   ALTER TABLE ONLY public.grado DROP CONSTRAINT grado_orden_key;
       public            postgres    false    201            u           2606    37283    grado grado_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.grado
    ADD CONSTRAINT grado_pkey PRIMARY KEY (nid_grado);
 :   ALTER TABLE ONLY public.grado DROP CONSTRAINT grado_pkey;
       public            postgres    false    201            }           2606    37338    movimiento movimiento_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.movimiento
    ADD CONSTRAINT movimiento_pkey PRIMARY KEY (id_movimiento);
 D   ALTER TABLE ONLY public.movimiento DROP CONSTRAINT movimiento_pkey;
       public            postgres    false    209            w           2606    37293    persona persona_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (nid_persona);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public            postgres    false    203                       2606    37318     detalle_cronograma fk_cronograma    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_cronograma
    ADD CONSTRAINT fk_cronograma FOREIGN KEY (id_cronograma) REFERENCES public.cronograma(id_cronograma);
 J   ALTER TABLE ONLY public.detalle_cronograma DROP CONSTRAINT fk_cronograma;
       public          postgres    false    207    2937    205            �           2606    37344     movimiento fk_detalle_cronograma    FK CONSTRAINT     �   ALTER TABLE ONLY public.movimiento
    ADD CONSTRAINT fk_detalle_cronograma FOREIGN KEY (id_detalle_cronograma) REFERENCES public.detalle_cronograma(id_detalle_cronograma);
 J   ALTER TABLE ONLY public.movimiento DROP CONSTRAINT fk_detalle_cronograma;
       public          postgres    false    207    209    2939            ~           2606    37294    persona fk_grado    FK CONSTRAINT     x   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT fk_grado FOREIGN KEY (nid_grado) REFERENCES public.grado(nid_grado);
 :   ALTER TABLE ONLY public.persona DROP CONSTRAINT fk_grado;
       public          postgres    false    203    201    2933            �           2606    37323    detalle_cronograma fk_grado    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_cronograma
    ADD CONSTRAINT fk_grado FOREIGN KEY (id_grado) REFERENCES public.grado(nid_grado);
 E   ALTER TABLE ONLY public.detalle_cronograma DROP CONSTRAINT fk_grado;
       public          postgres    false    201    2933    207            �           2606    37339    movimiento fk_persona    FK CONSTRAINT     �   ALTER TABLE ONLY public.movimiento
    ADD CONSTRAINT fk_persona FOREIGN KEY (id_persona) REFERENCES public.persona(nid_persona) ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.movimiento DROP CONSTRAINT fk_persona;
       public          postgres    false    209    2935    203            
   &   x�3�4202�2Q�\� ʈ�Ds��(�=... {��         �   x�m���@��u�] ӡ��]� 3��A0ѧ���0���Ň0��ڵ�!�6�ଣĺĕ��������I̠n��G�$_��C/��}Cs�9���Է�ĵ�Z³{,�����,*��e=e����8���}�p��N��J��6UҪ\ic%����\I�r�7XҰ\�M��,�RhI�r����m�qv�%����qy���q���Ƙ/s2�I         �   x�M�;�@E�{W�
o>|jB1�A��!J�����-���4L(�y��Ԯ�~�'��A��7��a6�i`7lhQ�������2E�ݧ�6s���_�{����׌9�~X��$��{AI(�7U	���`E�D0�b�H�b�L��=���A�         G  x�}ձmAD�xY�+0n�\R
�I�S�_��������}��?�q�������o��y�9�-�˜�[p��%Ǵ�Xv�x�+ǫ��D�9O��P��)\�-\�1\�5\�9\�=\��.JG����x[��4G����V�A�V��Q+d��t�
Yj�,�B��Z!�@�h�8Ú���\ȥ���rX ��@1崍d�e͔/�M�j��X�mTS��O�ֲ�j٨ղQ7�e�nT�FMT�FMT�FMT�FMT�FMT�FMT�F�5�&��V��VZ}�Yi��d����V_V��Ы��B����J�/Ī^}�aM�|��?��>         �   x����n�@�g�S��\B+*��@1�b���\9	O�S1GH�-������7p-P�4���|eXHl����'i�x�L��-j3��]hǷ��.�U*�M*�k�}���N������4b��a�Ժ��7���>	P��ҧ�E���/��}��|;TE�_����3�A���T�6XcdXQ�w�{>N};瞾�x4     