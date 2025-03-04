--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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

ALTER TABLE ONLY public.product_review DROP CONSTRAINT product_review_product_id_428b0c5c_fk_product_product_id;
ALTER TABLE ONLY public.product_product_tag DROP CONSTRAINT product_product_tag_tag_id_fe2f1952_fk_product_tag_id;
ALTER TABLE ONLY public.product_product_tag DROP CONSTRAINT product_product_tag_product_id_456d9764_fk_product_product_id;
ALTER TABLE ONLY public.product_product_image DROP CONSTRAINT product_product_image_product_id_9badf910_fk_product_product_id;
ALTER TABLE ONLY public.product_product_color DROP CONSTRAINT product_product_color_product_id_31c3247c_fk_product_product_id;
ALTER TABLE ONLY public.product_product_color DROP CONSTRAINT product_product_color_color_id_8f3ae534_fk_product_color_id;
ALTER TABLE ONLY public.product_product DROP CONSTRAINT product_product_category_id_0c725779_fk_product_category_id;
ALTER TABLE ONLY public.product_product DROP CONSTRAINT product_product_brand_id_fcf1b3f3_fk_product_brand_id;
ALTER TABLE ONLY public.order_checkout DROP CONSTRAINT order_checkout_user_id_7d6d3160_fk_accounts_user_id;
ALTER TABLE ONLY public.order_checkout DROP CONSTRAINT order_checkout_product_id_c5b932dc_fk_product_product_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE ONLY public.blog_blogpost_tag DROP CONSTRAINT blog_blogpost_tag_blogtag_id_d599d611_fk_blog_blogtag_id;
ALTER TABLE ONLY public.blog_blogpost_tag DROP CONSTRAINT blog_blogpost_tag_blogpost_id_d9887497_fk_blog_blogpost_id;
ALTER TABLE ONLY public.blog_blogpost DROP CONSTRAINT blog_blogpost_category_id_0e9835dd_fk_blog_category_id;
ALTER TABLE ONLY public.blog_blogcomment DROP CONSTRAINT blog_blogcomment_user_id_dc3b3111_fk_accounts_user_id;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
ALTER TABLE ONLY public.accounts_user_user_permissions DROP CONSTRAINT accounts_user_user_p_user_id_e4f0a161_fk_accounts_;
ALTER TABLE ONLY public.accounts_user_user_permissions DROP CONSTRAINT accounts_user_user_p_permission_id_113bb443_fk_auth_perm;
ALTER TABLE ONLY public.accounts_user_groups DROP CONSTRAINT accounts_user_groups_user_id_52b62117_fk_accounts_user_id;
ALTER TABLE ONLY public.accounts_user_groups DROP CONSTRAINT accounts_user_groups_group_id_bd11a704_fk_auth_group_id;
DROP INDEX public.product_review_product_id_428b0c5c;
DROP INDEX public.product_product_tag_tag_id_fe2f1952;
DROP INDEX public.product_product_tag_product_id_456d9764;
DROP INDEX public.product_product_image_product_id_9badf910;
DROP INDEX public.product_product_color_product_id_31c3247c;
DROP INDEX public.product_product_color_color_id_8f3ae534;
DROP INDEX public.product_product_category_id_0c725779;
DROP INDEX public.product_product_brand_id_fcf1b3f3;
DROP INDEX public.order_checkout_user_id_7d6d3160;
DROP INDEX public.order_checkout_product_id_c5b932dc;
DROP INDEX public.django_session_session_key_c0390e0f_like;
DROP INDEX public.django_session_expire_date_a5c62663;
DROP INDEX public.django_admin_log_user_id_c564eba6;
DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX public.blog_blogpost_tag_blogtag_id_d599d611;
DROP INDEX public.blog_blogpost_tag_blogpost_id_d9887497;
DROP INDEX public.blog_blogpost_category_id_0e9835dd;
DROP INDEX public.blog_blogcomment_user_id_dc3b3111;
DROP INDEX public.auth_permission_content_type_id_2f476e4b;
DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX public.auth_group_name_a6ea08ec_like;
DROP INDEX public.accounts_user_username_6088629e_like;
DROP INDEX public.accounts_user_user_permissions_user_id_e4f0a161;
DROP INDEX public.accounts_user_user_permissions_permission_id_113bb443;
DROP INDEX public.accounts_user_groups_user_id_52b62117;
DROP INDEX public.accounts_user_groups_group_id_bd11a704;
ALTER TABLE ONLY public.product_tag DROP CONSTRAINT product_tag_pkey;
ALTER TABLE ONLY public.product_review DROP CONSTRAINT product_review_pkey;
ALTER TABLE ONLY public.product_product_tag DROP CONSTRAINT product_product_tag_product_id_tag_id_c15ed811_uniq;
ALTER TABLE ONLY public.product_product_tag DROP CONSTRAINT product_product_tag_pkey;
ALTER TABLE ONLY public.product_product DROP CONSTRAINT product_product_pkey;
ALTER TABLE ONLY public.product_product_image DROP CONSTRAINT product_product_image_pkey;
ALTER TABLE ONLY public.product_product_color DROP CONSTRAINT product_product_color_product_id_color_id_d1cf75c1_uniq;
ALTER TABLE ONLY public.product_product_color DROP CONSTRAINT product_product_color_pkey;
ALTER TABLE ONLY public.product_color DROP CONSTRAINT product_color_pkey;
ALTER TABLE ONLY public.product_category DROP CONSTRAINT product_category_pkey;
ALTER TABLE ONLY public.product_brand DROP CONSTRAINT product_brand_pkey;
ALTER TABLE ONLY public.order_checkout DROP CONSTRAINT order_checkout_pkey;
ALTER TABLE ONLY public.order_billingdetails DROP CONSTRAINT order_billingdetails_pkey;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.core_our_address DROP CONSTRAINT core_our_address_pkey;
ALTER TABLE ONLY public.core_contact_detail DROP CONSTRAINT core_contact_detail_pkey;
ALTER TABLE ONLY public.blog_category DROP CONSTRAINT blog_category_pkey;
ALTER TABLE ONLY public.blog_blogtag DROP CONSTRAINT blog_blogtag_pkey;
ALTER TABLE ONLY public.blog_blogpost_tag DROP CONSTRAINT blog_blogpost_tag_pkey;
ALTER TABLE ONLY public.blog_blogpost_tag DROP CONSTRAINT blog_blogpost_tag_blogpost_id_blogtag_id_69ade9dd_uniq;
ALTER TABLE ONLY public.blog_blogpost DROP CONSTRAINT blog_blogpost_pkey;
ALTER TABLE ONLY public.blog_blogcomment DROP CONSTRAINT blog_blogcomment_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
ALTER TABLE ONLY public.accounts_user DROP CONSTRAINT accounts_user_username_key;
ALTER TABLE ONLY public.accounts_user_user_permissions DROP CONSTRAINT accounts_user_user_permissions_pkey;
ALTER TABLE ONLY public.accounts_user_user_permissions DROP CONSTRAINT accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq;
ALTER TABLE ONLY public.accounts_user DROP CONSTRAINT accounts_user_pkey;
ALTER TABLE ONLY public.accounts_user_groups DROP CONSTRAINT accounts_user_groups_user_id_group_id_59c0b32f_uniq;
ALTER TABLE ONLY public.accounts_user_groups DROP CONSTRAINT accounts_user_groups_pkey;
DROP TABLE public.product_tag;
DROP TABLE public.product_review;
DROP TABLE public.product_product_tag;
DROP TABLE public.product_product_image;
DROP TABLE public.product_product_color;
DROP TABLE public.product_product;
DROP TABLE public.product_color;
DROP TABLE public.product_category;
DROP TABLE public.product_brand;
DROP TABLE public.order_checkout;
DROP TABLE public.order_billingdetails;
DROP TABLE public.django_session;
DROP TABLE public.django_migrations;
DROP TABLE public.django_content_type;
DROP TABLE public.django_admin_log;
DROP TABLE public.core_our_address;
DROP TABLE public.core_contact_detail;
DROP TABLE public.blog_category;
DROP TABLE public.blog_blogtag;
DROP TABLE public.blog_blogpost_tag;
DROP TABLE public.blog_blogpost;
DROP TABLE public.blog_blogcomment;
DROP TABLE public.auth_permission;
DROP TABLE public.auth_group_permissions;
DROP TABLE public.auth_group;
DROP TABLE public.accounts_user_user_permissions;
DROP TABLE public.accounts_user_groups;
DROP TABLE public.accounts_user;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.accounts_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    city text NOT NULL,
    address text NOT NULL
);


ALTER TABLE public.accounts_user OWNER TO tech;

--
-- Name: accounts_user_groups; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.accounts_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_user_groups OWNER TO tech;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.accounts_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.accounts_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: accounts_user_user_permissions; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.accounts_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_user_user_permissions OWNER TO tech;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.accounts_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO tech;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO tech;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO tech;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: blog_blogcomment; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.blog_blogcomment (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    subject character varying(225) NOT NULL,
    text text NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.blog_blogcomment OWNER TO tech;

--
-- Name: blog_blogcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.blog_blogcomment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.blog_blogcomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: blog_blogpost; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.blog_blogpost (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(255) NOT NULL,
    image character varying(100),
    content text NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.blog_blogpost OWNER TO tech;

--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.blog_blogpost ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.blog_blogpost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: blog_blogpost_tag; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.blog_blogpost_tag (
    id bigint NOT NULL,
    blogpost_id bigint NOT NULL,
    blogtag_id bigint NOT NULL
);


ALTER TABLE public.blog_blogpost_tag OWNER TO tech;

--
-- Name: blog_blogpost_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.blog_blogpost_tag ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.blog_blogpost_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: blog_blogtag; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.blog_blogtag (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(150) NOT NULL
);


ALTER TABLE public.blog_blogtag OWNER TO tech;

--
-- Name: blog_blogtag_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.blog_blogtag ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.blog_blogtag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: blog_category; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.blog_category (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(150) NOT NULL
);


ALTER TABLE public.blog_category OWNER TO tech;

--
-- Name: blog_category_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.blog_category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.blog_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_contact_detail; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.core_contact_detail (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    full_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    phone text NOT NULL,
    subject text NOT NULL,
    massage text NOT NULL
);


ALTER TABLE public.core_contact_detail OWNER TO tech;

--
-- Name: core_contact_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.core_contact_detail ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_contact_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_our_address; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.core_our_address (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    address text NOT NULL,
    phone text NOT NULL,
    email character varying(254) NOT NULL,
    small_description character varying(255) NOT NULL
);


ALTER TABLE public.core_our_address OWNER TO tech;

--
-- Name: core_our_address_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.core_our_address ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_our_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO tech;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO tech;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO tech;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO tech;

--
-- Name: order_billingdetails; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.order_billingdetails (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    company_name character varying(150) NOT NULL,
    address text NOT NULL,
    city text NOT NULL,
    country text NOT NULL,
    email character varying(254) NOT NULL,
    phone text NOT NULL
);


ALTER TABLE public.order_billingdetails OWNER TO tech;

--
-- Name: order_billingdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.order_billingdetails ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.order_billingdetails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: order_checkout; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.order_checkout (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    number integer NOT NULL,
    product_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.order_checkout OWNER TO tech;

--
-- Name: order_checkout_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.order_checkout ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.order_checkout_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_brand; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.product_brand (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(150) NOT NULL
);


ALTER TABLE public.product_brand OWNER TO tech;

--
-- Name: product_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.product_brand ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_category; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.product_category (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(150) NOT NULL
);


ALTER TABLE public.product_category OWNER TO tech;

--
-- Name: product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.product_category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_color; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.product_color (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(225) NOT NULL
);


ALTER TABLE public.product_color OWNER TO tech;

--
-- Name: product_color_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.product_color ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_color_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_product; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.product_product (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(255) NOT NULL,
    cover_image character varying(100) NOT NULL,
    small_description character varying(255) NOT NULL,
    base_description character varying(255) NOT NULL,
    description text NOT NULL,
    simple_facts text NOT NULL,
    brand_id bigint NOT NULL,
    category_id bigint NOT NULL,
    diccount character varying,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.product_product OWNER TO tech;

--
-- Name: product_product_color; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.product_product_color (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    color_id bigint NOT NULL
);


ALTER TABLE public.product_product_color OWNER TO tech;

--
-- Name: product_product_color_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.product_product_color ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_product_color_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.product_product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_product_image; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.product_product_image (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    image character varying(100) NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.product_product_image OWNER TO tech;

--
-- Name: product_product_image_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.product_product_image ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_product_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_product_tag; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.product_product_tag (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.product_product_tag OWNER TO tech;

--
-- Name: product_product_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.product_product_tag ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_product_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_review; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.product_review (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(225) NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.product_review OWNER TO tech;

--
-- Name: product_review_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.product_review ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_tag; Type: TABLE; Schema: public; Owner: tech
--

CREATE TABLE public.product_tag (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(150) NOT NULL
);


ALTER TABLE public.product_tag OWNER TO tech;

--
-- Name: product_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: tech
--

ALTER TABLE public.product_tag ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.accounts_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, city, address) FROM stdin;
1	pbkdf2_sha256$720000$uNYXcGtf5jbTfFP8iUDnbZ$a+RwUtt7BRxM0atLWkd/JyjuiaoGsHlI4DzgQ2Wg2BA=	2024-07-05 14:38:27.424691+00	t	admin				t	t	2024-07-05 14:37:39.385419+00		
\.


--
-- Data for Name: accounts_user_groups; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.accounts_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add contact_ detail	7	add_contact_detail
26	Can change contact_ detail	7	change_contact_detail
27	Can delete contact_ detail	7	delete_contact_detail
28	Can view contact_ detail	7	view_contact_detail
29	Can add our_ address	8	add_our_address
30	Can change our_ address	8	change_our_address
31	Can delete our_ address	8	delete_our_address
32	Can view our_ address	8	view_our_address
33	Can add blog tag	9	add_blogtag
34	Can change blog tag	9	change_blogtag
35	Can delete blog tag	9	delete_blogtag
36	Can view blog tag	9	view_blogtag
37	Can add category	10	add_category
38	Can change category	10	change_category
39	Can delete category	10	delete_category
40	Can view category	10	view_category
41	Can add blog comment	11	add_blogcomment
42	Can change blog comment	11	change_blogcomment
43	Can delete blog comment	11	delete_blogcomment
44	Can view blog comment	11	view_blogcomment
45	Can add blog post	12	add_blogpost
46	Can change blog post	12	change_blogpost
47	Can delete blog post	12	delete_blogpost
48	Can view blog post	12	view_blogpost
49	Can add billing details	13	add_billingdetails
50	Can change billing details	13	change_billingdetails
51	Can delete billing details	13	delete_billingdetails
52	Can view billing details	13	view_billingdetails
53	Can add checkout	14	add_checkout
54	Can change checkout	14	change_checkout
55	Can delete checkout	14	delete_checkout
56	Can view checkout	14	view_checkout
57	Can add brand	15	add_brand
58	Can change brand	15	change_brand
59	Can delete brand	15	delete_brand
60	Can view brand	15	view_brand
61	Can add category	16	add_category
62	Can change category	16	change_category
63	Can delete category	16	delete_category
64	Can view category	16	view_category
65	Can add color	17	add_color
66	Can change color	17	change_color
67	Can delete color	17	delete_color
68	Can view color	17	view_color
69	Can add tag	18	add_tag
70	Can change tag	18	change_tag
71	Can delete tag	18	delete_tag
72	Can view tag	18	view_tag
73	Can add product	19	add_product
74	Can change product	19	change_product
75	Can delete product	19	delete_product
76	Can view product	19	view_product
77	Can add product_image	20	add_product_image
78	Can change product_image	20	change_product_image
79	Can delete product_image	20	delete_product_image
80	Can view product_image	20	view_product_image
81	Can add review	21	add_review
82	Can change review	21	change_review
83	Can delete review	21	delete_review
84	Can view review	21	view_review
\.


--
-- Data for Name: blog_blogcomment; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.blog_blogcomment (id, created_at, updated_at, email, subject, text, user_id) FROM stdin;
\.


--
-- Data for Name: blog_blogpost; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.blog_blogpost (id, created_at, updated_at, title, image, content, category_id) FROM stdin;
1	2024-07-05 14:48:24.526292+00	2024-07-05 14:48:24.526292+00	The Unique Chair By PAVSHOP	blog_images/blog-list-img-1-2_Yi877gz.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam volutpat dui at lacus aliquet, a consequat enim aliquet. Integer molestie sit amet sem et faucibus. Nunc ornare pharetra dui, vitae auctor orci fringilla eget. Pellentesque in placerat felis. Etiam mollis venenatis luctus. Nunc at blandit neque, bibendum varius purus.	1
2	2024-07-05 14:48:39.141479+00	2024-07-05 14:48:39.141479+00	The Unique Chair By PAVSHOP	blog_images/blog-list-img-1-3_ZUIM3ek.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam volutpat dui at lacus aliquet, a consequat enim aliquet. Integer molestie sit amet sem et faucibus. Nunc ornare pharetra dui, vitae auctor orci fringilla eget. Pellentesque in placerat felis. Etiam mollis venenatis luctus. Nunc at blandit neque, bibendum varius purus.	3
3	2024-07-05 14:49:02.061636+00	2024-07-05 14:49:02.061636+00	We Craft An Awesome For You	blog_images/blog-list-img-1-4_4eKrzmu.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam volutpat dui at lacus aliquet, a consequat enim aliquet. Integer molestie sit amet sem et faucibus. Nunc ornare pharetra dui, vitae auctor orci fringilla eget. Pellentesque in placerat felis. Etiam mollis venenatis luctus. Nunc at blandit neque, bibendum varius purus.	7
4	2024-07-05 14:49:34.030755+00	2024-07-05 14:49:34.030755+00	The Classic Razor For Man	blog_images/blog-list-img-1-5_p2ypUiJ.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam volutpat dui at lacus aliquet, a consequat enim aliquet. Integer molestie sit amet sem et faucibus. Nunc ornare pharetra dui, vitae auctor orci fringilla eget. Pellentesque in placerat felis. Etiam mollis venenatis luctus. Nunc at blandit neque, bibendum varius purus.	9
5	2024-07-05 14:49:52.196837+00	2024-07-05 14:49:52.196837+00	Graffiti Art On White Tshirt	blog_images/blog-list-img-1-6_g7TzebZ.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam volutpat dui at lacus aliquet, a consequat enim aliquet. Integer molestie sit amet sem et faucibus. Nunc ornare pharetra dui, vitae auctor orci fringilla eget. Pellentesque in placerat felis. Etiam mollis venenatis luctus. Nunc at blandit neque, bibendum varius purus.	11
\.


--
-- Data for Name: blog_blogpost_tag; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.blog_blogpost_tag (id, blogpost_id, blogtag_id) FROM stdin;
1	1	4
2	2	6
3	3	7
4	4	5
5	5	8
\.


--
-- Data for Name: blog_blogtag; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.blog_blogtag (id, created_at, updated_at, title) FROM stdin;
1	2024-07-05 14:40:07.505058+00	2024-07-05 14:40:07.505058+00	Towels
2	2024-07-05 14:46:39.626672+00	2024-07-05 14:46:39.626672+00	Chair
3	2024-07-05 14:46:47.918973+00	2024-07-05 14:46:47.918973+00	Bedsheets
4	2024-07-05 14:46:55.717295+00	2024-07-05 14:46:55.717295+00	Shoe
5	2024-07-05 14:47:02.310867+00	2024-07-05 14:47:02.310867+00	Curtains
6	2024-07-05 14:47:09.266383+00	2024-07-05 14:47:18.212042+00	Clocks
7	2024-07-05 14:47:24.49478+00	2024-07-05 14:47:30.48839+00	TV Cabinets
8	2024-07-05 14:47:39.552966+00	2024-07-05 14:47:39.552966+00	Best Seller
9	2024-07-05 14:47:55.713723+00	2024-07-05 14:47:55.713723+00	Top Selling
\.


--
-- Data for Name: blog_category; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.blog_category (id, created_at, updated_at, title) FROM stdin;
1	2024-07-05 14:44:55.777811+00	2024-07-05 14:44:55.777811+00	Chair
2	2024-07-05 14:45:02.810909+00	2024-07-05 14:45:02.810909+00	Bag
3	2024-07-05 14:45:13.632875+00	2024-07-05 14:45:13.632875+00	Soffa
4	2024-07-05 14:45:21.202207+00	2024-07-05 14:45:21.202207+00	Bed
5	2024-07-05 14:45:29.392552+00	2024-07-05 14:45:29.392552+00	Shoes
6	2024-07-05 14:45:39.675697+00	2024-07-05 14:45:39.675697+00	Table
7	2024-07-05 14:45:48.799291+00	2024-07-05 14:45:48.799291+00	Bedsheets
8	2024-07-05 14:45:58.037165+00	2024-07-05 14:45:58.037165+00	Curtains
9	2024-07-05 14:46:07.369532+00	2024-07-05 14:46:07.369532+00	TV Cabinets
10	2024-07-05 14:46:18.741167+00	2024-07-05 14:46:18.741167+00	Clocks
11	2024-07-05 14:46:26.309136+00	2024-07-05 14:46:26.309136+00	Towels
\.


--
-- Data for Name: core_contact_detail; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.core_contact_detail (id, created_at, updated_at, full_name, email, phone, subject, massage) FROM stdin;
\.


--
-- Data for Name: core_our_address; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.core_our_address (id, created_at, updated_at, address, phone, email, small_description) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-07-05 14:40:07.508058+00	1	Towels	1	[{"added": {}}]	9	1
2	2024-07-05 14:44:55.777811+00	1	Chair	1	[{"added": {}}]	10	1
3	2024-07-05 14:45:02.810909+00	2	Bag	1	[{"added": {}}]	10	1
4	2024-07-05 14:45:13.632875+00	3	Soffa	1	[{"added": {}}]	10	1
5	2024-07-05 14:45:21.202207+00	4	Bed	1	[{"added": {}}]	10	1
6	2024-07-05 14:45:29.392552+00	5	Shoes	1	[{"added": {}}]	10	1
7	2024-07-05 14:45:39.675697+00	6	Table	1	[{"added": {}}]	10	1
8	2024-07-05 14:45:48.799291+00	7	Bedsheets	1	[{"added": {}}]	10	1
9	2024-07-05 14:45:58.037165+00	8	Curtains	1	[{"added": {}}]	10	1
10	2024-07-05 14:46:07.369532+00	9	TV Cabinets	1	[{"added": {}}]	10	1
11	2024-07-05 14:46:18.741167+00	10	Clocks	1	[{"added": {}}]	10	1
12	2024-07-05 14:46:26.309136+00	11	Towels	1	[{"added": {}}]	10	1
13	2024-07-05 14:46:39.627197+00	2	Chair	1	[{"added": {}}]	9	1
14	2024-07-05 14:46:47.918973+00	3	Bedsheets	1	[{"added": {}}]	9	1
15	2024-07-05 14:46:55.717295+00	4	Shoe	1	[{"added": {}}]	9	1
16	2024-07-05 14:47:02.310867+00	5	Curtains	1	[{"added": {}}]	9	1
17	2024-07-05 14:47:09.266383+00	6	CL	1	[{"added": {}}]	9	1
18	2024-07-05 14:47:18.212042+00	6	Clocks	2	[{"changed": {"fields": ["Title"]}}]	9	1
19	2024-07-05 14:47:24.500225+00	7	TV	1	[{"added": {}}]	9	1
20	2024-07-05 14:47:30.504056+00	7	TV Cabinets	2	[{"changed": {"fields": ["Title"]}}]	9	1
21	2024-07-05 14:47:39.552966+00	8	Best Seller	1	[{"added": {}}]	9	1
22	2024-07-05 14:47:55.713723+00	9	Top Selling	1	[{"added": {}}]	9	1
23	2024-07-05 14:48:24.543372+00	1	The Unique Chair By PAVSHOP	1	[{"added": {}}]	12	1
24	2024-07-05 14:48:39.149188+00	2	The Unique Chair By PAVSHOP	1	[{"added": {}}]	12	1
25	2024-07-05 14:49:02.069644+00	3	We Craft An Awesome For You	1	[{"added": {}}]	12	1
26	2024-07-05 14:49:34.037491+00	4	The Classic Razor For Man	1	[{"added": {}}]	12	1
27	2024-07-05 14:49:52.202529+00	5	Graffiti Art On White Tshirt	1	[{"added": {}}]	12	1
28	2024-07-05 15:15:11.836309+00	1	G-Furniture BigYellow	1	[{"added": {}}]	15	1
29	2024-07-05 15:16:52.687867+00	1	Cha	1	[{"added": {}}]	16	1
30	2024-07-05 15:17:01.230255+00	2	Chair	1	[{"added": {}}]	16	1
31	2024-07-05 15:17:08.076169+00	1	Towels	1	[{"added": {}}]	18	1
32	2024-07-05 15:17:15.440802+00	1	Red	1	[{"added": {}}]	17	1
33	2024-07-05 15:17:25.062646+00	1	STONE CUP	1	[{"added": {}}]	19	1
34	2024-07-05 15:18:09.092855+00	3	Bag	1	[{"added": {}}]	16	1
35	2024-07-05 15:18:19.020156+00	2	TV Cabinets	1	[{"added": {}}]	18	1
36	2024-07-05 15:18:33.233367+00	2	blue	1	[{"added": {}}]	17	1
37	2024-07-05 15:18:42.589081+00	2	STONE CUP	1	[{"added": {}}]	19	1
38	2024-07-05 15:30:15.48242+00	1	STONE CUP 1	2	[{"changed": {"fields": ["Title"]}}]	19	1
39	2024-07-05 15:30:33.830088+00	2	STONE CUP 2	2	[{"changed": {"fields": ["Title", "Price", "Diccount"]}}]	19	1
40	2024-07-05 15:42:42.20964+00	2	WoodenBazaar	1	[{"added": {}}]	15	1
41	2024-07-05 15:43:16.511529+00	4	Soffa	1	[{"added": {}}]	16	1
42	2024-07-05 15:43:25.846634+00	3	Clocks	1	[{"added": {}}]	18	1
43	2024-07-05 15:43:38.089622+00	3	Yellow	1	[{"added": {}}]	17	1
44	2024-07-05 15:43:55.991998+00	3	STONE CUP 3	1	[{"added": {}}]	19	1
45	2024-07-05 15:44:23.013928+00	1	STONE CUP 1	2	[{"changed": {"fields": ["Price"]}}]	19	1
46	2024-07-05 15:44:56.216508+00	2	STONE CUP 2	2	[{"changed": {"fields": ["Color"]}}]	19	1
47	2024-07-05 15:45:19.158716+00	5	Shoes	1	[{"added": {}}]	16	1
48	2024-07-05 15:45:25.670992+00	6	Curtains	1	[{"added": {}}]	16	1
49	2024-07-05 15:45:32.435778+00	7	Bedsheets	1	[{"added": {}}]	16	1
50	2024-07-05 15:45:38.343065+00	1	Cha	3		16	1
51	2024-07-05 15:45:59.109641+00	8	Bedsheets	1	[{"added": {}}]	16	1
52	2024-07-05 15:46:11.501105+00	8	Towels	2	[{"changed": {"fields": ["Title"]}}]	16	1
53	2024-07-05 15:46:29.947014+00	2	Blue	2	[{"changed": {"fields": ["Title"]}}]	17	1
54	2024-07-05 15:46:36.860019+00	4	Black	1	[{"added": {}}]	17	1
55	2024-07-05 15:46:43.61445+00	5	Purple	1	[{"added": {}}]	17	1
56	2024-07-05 15:47:25.884178+00	3	GreenWoods	1	[{"added": {}}]	15	1
57	2024-07-05 15:48:01.916714+00	4	s	1	[{"added": {}}]	18	1
58	2024-07-05 15:48:15.76601+00	4	STONE CUP 4	1	[{"added": {}}]	19	1
59	2024-07-05 15:48:39.20733+00	4	Best Seller	2	[{"changed": {"fields": ["Title"]}}]	18	1
60	2024-07-05 15:48:49.124937+00	5	Curtains	1	[{"added": {}}]	18	1
61	2024-07-05 15:49:41.695696+00	5	STONE CUP 5	1	[{"added": {}}]	19	1
62	2024-07-05 15:50:13.813434+00	4	Hot-n-Fire	1	[{"added": {}}]	15	1
63	2024-07-05 15:50:49.795164+00	6	STONE CUP 6	1	[{"added": {}}]	19	1
64	2024-07-05 15:51:26.443177+00	7	STONE CUP 7	1	[{"added": {}}]	19	1
65	2024-07-05 15:51:59.301247+00	8	STONE CUP 8	1	[{"added": {}}]	19	1
66	2024-07-05 15:52:57.787237+00	9	STONE CUP 9	1	[{"added": {}}]	19	1
67	2024-07-05 15:59:19.317764+00	9	STONE CUP 9	2	[]	19	1
68	2024-07-05 15:59:43.177413+00	8	STONE CUP 8	2	[{"changed": {"fields": ["Cover_image"]}}]	19	1
69	2024-07-05 15:59:57.171494+00	7	STONE CUP 7	2	[{"changed": {"fields": ["Cover_image"]}}]	19	1
70	2024-07-05 16:00:35.805831+00	9	STONE CUP 9	2	[{"changed": {"fields": ["Cover_image"]}}]	19	1
71	2024-07-05 16:00:53.43815+00	6	STONE CUP 6	2	[{"changed": {"fields": ["Cover_image"]}}]	19	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	accounts	user
7	core	contact_detail
8	core	our_address
9	blog	blogtag
10	blog	category
11	blog	blogcomment
12	blog	blogpost
13	order	billingdetails
14	order	checkout
15	product	brand
16	product	category
17	product	color
18	product	tag
19	product	product
20	product	product_image
21	product	review
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-07-05 14:33:06.572759+00
2	contenttypes	0002_remove_content_type_name	2024-07-05 14:33:06.584939+00
3	auth	0001_initial	2024-07-05 14:33:06.736471+00
4	auth	0002_alter_permission_name_max_length	2024-07-05 14:33:06.751777+00
5	auth	0003_alter_user_email_max_length	2024-07-05 14:33:06.774522+00
6	auth	0004_alter_user_username_opts	2024-07-05 14:33:06.794451+00
7	auth	0005_alter_user_last_login_null	2024-07-05 14:33:06.81552+00
8	auth	0006_require_contenttypes_0002	2024-07-05 14:33:06.823544+00
9	auth	0007_alter_validators_add_error_messages	2024-07-05 14:33:06.847544+00
10	auth	0008_alter_user_username_max_length	2024-07-05 14:33:06.88039+00
11	auth	0009_alter_user_last_name_max_length	2024-07-05 14:33:06.900572+00
12	auth	0010_alter_group_name_max_length	2024-07-05 14:33:06.933989+00
13	auth	0011_update_proxy_permissions	2024-07-05 14:33:06.953699+00
14	auth	0012_alter_user_first_name_max_length	2024-07-05 14:33:06.973894+00
15	accounts	0001_initial	2024-07-05 14:33:07.147729+00
16	admin	0001_initial	2024-07-05 14:33:07.232013+00
17	admin	0002_logentry_remove_auto_add	2024-07-05 14:33:07.24252+00
18	admin	0003_logentry_add_action_flag_choices	2024-07-05 14:33:07.251841+00
19	blog	0001_initial	2024-07-05 14:33:07.434449+00
20	core	0001_initial	2024-07-05 14:33:07.467594+00
21	product	0001_initial	2024-07-05 14:33:07.74503+00
22	order	0001_initial	2024-07-05 14:33:07.833099+00
23	sessions	0001_initial	2024-07-05 14:33:07.898068+00
24	product	0002_product_diccount_product_price	2024-07-05 15:29:46.680071+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
lvgabi40pcb3u2ea3fpi5uc53oetf4n2	.eJxVjDsOwjAQBe_iGlk48W8p6XMGa9dr4wCypTipEHeHSCmgfTPzXiLgtpaw9bSEmcVFKHH63QjjI9Ud8B3rrcnY6rrMJHdFHrTLqXF6Xg_376BgL98as_IDM-szZm08eM7AUSMBERqbsjGjVZHQAjmTGUZrgAYVlcsOAMX7Aw69OK4:1sPk4x:kRPu8nivZzcJOjOubXeDBjn8lybxmompYbaQGWDuR2o	2024-07-19 14:38:27.434716+00
\.


--
-- Data for Name: order_billingdetails; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.order_billingdetails (id, created_at, updated_at, first_name, last_name, company_name, address, city, country, email, phone) FROM stdin;
\.


--
-- Data for Name: order_checkout; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.order_checkout (id, created_at, updated_at, number, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: product_brand; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.product_brand (id, created_at, updated_at, title) FROM stdin;
1	2024-07-05 15:15:11.82731+00	2024-07-05 15:15:11.82731+00	G-Furniture BigYellow
2	2024-07-05 15:42:42.207638+00	2024-07-05 15:42:42.207638+00	WoodenBazaar
3	2024-07-05 15:47:25.882165+00	2024-07-05 15:47:25.882165+00	GreenWoods
4	2024-07-05 15:50:13.811436+00	2024-07-05 15:50:13.811436+00	Hot-n-Fire
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.product_category (id, created_at, updated_at, title) FROM stdin;
2	2024-07-05 15:17:01.224514+00	2024-07-05 15:17:01.224514+00	Chair
3	2024-07-05 15:18:09.086126+00	2024-07-05 15:18:09.086126+00	Bag
4	2024-07-05 15:43:16.509529+00	2024-07-05 15:43:16.509529+00	Soffa
5	2024-07-05 15:45:19.155717+00	2024-07-05 15:45:19.155717+00	Shoes
6	2024-07-05 15:45:25.668992+00	2024-07-05 15:45:25.668992+00	Curtains
7	2024-07-05 15:45:32.43378+00	2024-07-05 15:45:32.43378+00	Bedsheets
8	2024-07-05 15:45:59.10764+00	2024-07-05 15:46:11.499105+00	Towels
\.


--
-- Data for Name: product_color; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.product_color (id, created_at, updated_at, title) FROM stdin;
1	2024-07-05 15:17:15.434448+00	2024-07-05 15:17:15.434448+00	Red
3	2024-07-05 15:43:38.087624+00	2024-07-05 15:43:38.087624+00	Yellow
2	2024-07-05 15:18:33.228807+00	2024-07-05 15:46:29.945014+00	Blue
4	2024-07-05 15:46:36.858018+00	2024-07-05 15:46:36.858018+00	Black
5	2024-07-05 15:46:43.61145+00	2024-07-05 15:46:43.61145+00	Purple
\.


--
-- Data for Name: product_product; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.product_product (id, created_at, updated_at, title, cover_image, small_description, base_description, description, simple_facts, brand_id, category_id, diccount, price) FROM stdin;
3	2024-07-05 15:43:55.981313+00	2024-07-05 15:43:55.981313+00	STONE CUP 3	products/product-10.jpg	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	2	4	\N	200.00
1	2024-07-05 15:17:25.038644+00	2024-07-05 15:44:23.009114+00	STONE CUP 1	products/product-1.jpg	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	1	2	\N	200.00
2	2024-07-05 15:18:42.56612+00	2024-07-05 15:44:56.209017+00	STONE CUP 2	products/product-2-3.jpg	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	1	3	20	200.00
4	2024-07-05 15:48:15.757358+00	2024-07-05 15:48:15.757358+00	STONE CUP 4	products/product-2-1.jpg	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	3	6	\N	200.00
5	2024-07-05 15:49:41.687697+00	2024-07-05 15:49:41.687697+00	STONE CUP 5	products/product-12.jpg	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	3	5	\N	200.00
8	2024-07-05 15:51:59.292197+00	2024-07-05 15:59:43.171508+00	STONE CUP 8	products/product-9.jpg	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	3	3	\N	200.00
7	2024-07-05 15:51:26.434184+00	2024-07-05 15:59:57.165579+00	STONE CUP 7	products/product-6.jpg	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	3	2	\N	200.00
9	2024-07-05 15:52:57.77537+00	2024-07-05 16:00:35.80083+00	STONE CUP 9	products/product-2-4.jpg	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	2	7	\N	200.00
6	2024-07-05 15:50:49.784166+00	2024-07-05 16:00:53.432601+00	STONE CUP 6	products/product-10_Hx1ZxR0.jpg	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	Lorem ipsum dolor sit amet	4	3	\N	200.00
\.


--
-- Data for Name: product_product_color; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.product_product_color (id, product_id, color_id) FROM stdin;
1	1	1
3	3	3
4	2	3
5	4	5
6	5	4
7	6	2
8	7	1
9	8	5
10	9	4
\.


--
-- Data for Name: product_product_image; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.product_product_image (id, created_at, updated_at, image, product_id) FROM stdin;
\.


--
-- Data for Name: product_product_tag; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.product_product_tag (id, product_id, tag_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	3
5	5	5
6	6	2
7	7	4
8	8	4
9	9	2
\.


--
-- Data for Name: product_review; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.product_review (id, created_at, updated_at, title, product_id) FROM stdin;
\.


--
-- Data for Name: product_tag; Type: TABLE DATA; Schema: public; Owner: tech
--

COPY public.product_tag (id, created_at, updated_at, title) FROM stdin;
1	2024-07-05 15:17:08.069147+00	2024-07-05 15:17:08.070145+00	Towels
2	2024-07-05 15:18:19.014986+00	2024-07-05 15:18:19.014986+00	TV Cabinets
3	2024-07-05 15:43:25.843634+00	2024-07-05 15:43:25.843634+00	Clocks
4	2024-07-05 15:48:01.914543+00	2024-07-05 15:48:39.20531+00	Best Seller
5	2024-07-05 15:48:49.122873+00	2024-07-05 15:48:49.122873+00	Curtains
\.


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.accounts_user_groups_id_seq', 1, false);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.accounts_user_id_seq', 1, true);


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.accounts_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 84, true);


--
-- Name: blog_blogcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.blog_blogcomment_id_seq', 1, false);


--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.blog_blogpost_id_seq', 5, true);


--
-- Name: blog_blogpost_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.blog_blogpost_tag_id_seq', 5, true);


--
-- Name: blog_blogtag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.blog_blogtag_id_seq', 9, true);


--
-- Name: blog_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.blog_category_id_seq', 11, true);


--
-- Name: core_contact_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.core_contact_detail_id_seq', 1, false);


--
-- Name: core_our_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.core_our_address_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 71, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: order_billingdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.order_billingdetails_id_seq', 1, false);


--
-- Name: order_checkout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.order_checkout_id_seq', 1, false);


--
-- Name: product_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.product_brand_id_seq', 4, true);


--
-- Name: product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.product_category_id_seq', 8, true);


--
-- Name: product_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.product_color_id_seq', 5, true);


--
-- Name: product_product_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.product_product_color_id_seq', 10, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.product_product_id_seq', 9, true);


--
-- Name: product_product_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.product_product_image_id_seq', 1, false);


--
-- Name: product_product_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.product_product_tag_id_seq', 9, true);


--
-- Name: product_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.product_review_id_seq', 1, false);


--
-- Name: product_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tech
--

SELECT pg_catalog.setval('public.product_tag_id_seq', 5, true);


--
-- Name: accounts_user_groups accounts_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups accounts_user_groups_user_id_group_id_59c0b32f_uniq; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_group_id_59c0b32f_uniq UNIQUE (user_id, group_id);


--
-- Name: accounts_user accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq UNIQUE (user_id, permission_id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_user accounts_user_username_key; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_username_key UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: blog_blogcomment blog_blogcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.blog_blogcomment
    ADD CONSTRAINT blog_blogcomment_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost blog_blogpost_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.blog_blogpost
    ADD CONSTRAINT blog_blogpost_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost_tag blog_blogpost_tag_blogpost_id_blogtag_id_69ade9dd_uniq; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.blog_blogpost_tag
    ADD CONSTRAINT blog_blogpost_tag_blogpost_id_blogtag_id_69ade9dd_uniq UNIQUE (blogpost_id, blogtag_id);


--
-- Name: blog_blogpost_tag blog_blogpost_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.blog_blogpost_tag
    ADD CONSTRAINT blog_blogpost_tag_pkey PRIMARY KEY (id);


--
-- Name: blog_blogtag blog_blogtag_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.blog_blogtag
    ADD CONSTRAINT blog_blogtag_pkey PRIMARY KEY (id);


--
-- Name: blog_category blog_category_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.blog_category
    ADD CONSTRAINT blog_category_pkey PRIMARY KEY (id);


--
-- Name: core_contact_detail core_contact_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.core_contact_detail
    ADD CONSTRAINT core_contact_detail_pkey PRIMARY KEY (id);


--
-- Name: core_our_address core_our_address_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.core_our_address
    ADD CONSTRAINT core_our_address_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: order_billingdetails order_billingdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.order_billingdetails
    ADD CONSTRAINT order_billingdetails_pkey PRIMARY KEY (id);


--
-- Name: order_checkout order_checkout_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.order_checkout
    ADD CONSTRAINT order_checkout_pkey PRIMARY KEY (id);


--
-- Name: product_brand product_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_brand
    ADD CONSTRAINT product_brand_pkey PRIMARY KEY (id);


--
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);


--
-- Name: product_color product_color_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_color
    ADD CONSTRAINT product_color_pkey PRIMARY KEY (id);


--
-- Name: product_product_color product_product_color_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_product_color
    ADD CONSTRAINT product_product_color_pkey PRIMARY KEY (id);


--
-- Name: product_product_color product_product_color_product_id_color_id_d1cf75c1_uniq; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_product_color
    ADD CONSTRAINT product_product_color_product_id_color_id_d1cf75c1_uniq UNIQUE (product_id, color_id);


--
-- Name: product_product_image product_product_image_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_product_image
    ADD CONSTRAINT product_product_image_pkey PRIMARY KEY (id);


--
-- Name: product_product product_product_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_pkey PRIMARY KEY (id);


--
-- Name: product_product_tag product_product_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_product_tag
    ADD CONSTRAINT product_product_tag_pkey PRIMARY KEY (id);


--
-- Name: product_product_tag product_product_tag_product_id_tag_id_c15ed811_uniq; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_product_tag
    ADD CONSTRAINT product_product_tag_product_id_tag_id_c15ed811_uniq UNIQUE (product_id, tag_id);


--
-- Name: product_review product_review_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_review
    ADD CONSTRAINT product_review_pkey PRIMARY KEY (id);


--
-- Name: product_tag product_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_tag
    ADD CONSTRAINT product_tag_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups_group_id_bd11a704; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX accounts_user_groups_group_id_bd11a704 ON public.accounts_user_groups USING btree (group_id);


--
-- Name: accounts_user_groups_user_id_52b62117; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX accounts_user_groups_user_id_52b62117 ON public.accounts_user_groups USING btree (user_id);


--
-- Name: accounts_user_user_permissions_permission_id_113bb443; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX accounts_user_user_permissions_permission_id_113bb443 ON public.accounts_user_user_permissions USING btree (permission_id);


--
-- Name: accounts_user_user_permissions_user_id_e4f0a161; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX accounts_user_user_permissions_user_id_e4f0a161 ON public.accounts_user_user_permissions USING btree (user_id);


--
-- Name: accounts_user_username_6088629e_like; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX accounts_user_username_6088629e_like ON public.accounts_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: blog_blogcomment_user_id_dc3b3111; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX blog_blogcomment_user_id_dc3b3111 ON public.blog_blogcomment USING btree (user_id);


--
-- Name: blog_blogpost_category_id_0e9835dd; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX blog_blogpost_category_id_0e9835dd ON public.blog_blogpost USING btree (category_id);


--
-- Name: blog_blogpost_tag_blogpost_id_d9887497; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX blog_blogpost_tag_blogpost_id_d9887497 ON public.blog_blogpost_tag USING btree (blogpost_id);


--
-- Name: blog_blogpost_tag_blogtag_id_d599d611; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX blog_blogpost_tag_blogtag_id_d599d611 ON public.blog_blogpost_tag USING btree (blogtag_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: order_checkout_product_id_c5b932dc; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX order_checkout_product_id_c5b932dc ON public.order_checkout USING btree (product_id);


--
-- Name: order_checkout_user_id_7d6d3160; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX order_checkout_user_id_7d6d3160 ON public.order_checkout USING btree (user_id);


--
-- Name: product_product_brand_id_fcf1b3f3; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX product_product_brand_id_fcf1b3f3 ON public.product_product USING btree (brand_id);


--
-- Name: product_product_category_id_0c725779; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX product_product_category_id_0c725779 ON public.product_product USING btree (category_id);


--
-- Name: product_product_color_color_id_8f3ae534; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX product_product_color_color_id_8f3ae534 ON public.product_product_color USING btree (color_id);


--
-- Name: product_product_color_product_id_31c3247c; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX product_product_color_product_id_31c3247c ON public.product_product_color USING btree (product_id);


--
-- Name: product_product_image_product_id_9badf910; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX product_product_image_product_id_9badf910 ON public.product_product_image USING btree (product_id);


--
-- Name: product_product_tag_product_id_456d9764; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX product_product_tag_product_id_456d9764 ON public.product_product_tag USING btree (product_id);


--
-- Name: product_product_tag_tag_id_fe2f1952; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX product_product_tag_tag_id_fe2f1952 ON public.product_product_tag USING btree (tag_id);


--
-- Name: product_review_product_id_428b0c5c; Type: INDEX; Schema: public; Owner: tech
--

CREATE INDEX product_review_product_id_428b0c5c ON public.product_review USING btree (product_id);


--
-- Name: accounts_user_groups accounts_user_groups_group_id_bd11a704_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_group_id_bd11a704_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_user_id_52b62117_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_52b62117_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_permission_id_113bb443_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_permission_id_113bb443_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_user_id_e4f0a161_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_user_id_e4f0a161_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogcomment blog_blogcomment_user_id_dc3b3111_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.blog_blogcomment
    ADD CONSTRAINT blog_blogcomment_user_id_dc3b3111_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost blog_blogpost_category_id_0e9835dd_fk_blog_category_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.blog_blogpost
    ADD CONSTRAINT blog_blogpost_category_id_0e9835dd_fk_blog_category_id FOREIGN KEY (category_id) REFERENCES public.blog_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_tag blog_blogpost_tag_blogpost_id_d9887497_fk_blog_blogpost_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.blog_blogpost_tag
    ADD CONSTRAINT blog_blogpost_tag_blogpost_id_d9887497_fk_blog_blogpost_id FOREIGN KEY (blogpost_id) REFERENCES public.blog_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_tag blog_blogpost_tag_blogtag_id_d599d611_fk_blog_blogtag_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.blog_blogpost_tag
    ADD CONSTRAINT blog_blogpost_tag_blogtag_id_d599d611_fk_blog_blogtag_id FOREIGN KEY (blogtag_id) REFERENCES public.blog_blogtag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_checkout order_checkout_product_id_c5b932dc_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.order_checkout
    ADD CONSTRAINT order_checkout_product_id_c5b932dc_fk_product_product_id FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_checkout order_checkout_user_id_7d6d3160_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.order_checkout
    ADD CONSTRAINT order_checkout_user_id_7d6d3160_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product product_product_brand_id_fcf1b3f3_fk_product_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_brand_id_fcf1b3f3_fk_product_brand_id FOREIGN KEY (brand_id) REFERENCES public.product_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product product_product_category_id_0c725779_fk_product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_category_id_0c725779_fk_product_category_id FOREIGN KEY (category_id) REFERENCES public.product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product_color product_product_color_color_id_8f3ae534_fk_product_color_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_product_color
    ADD CONSTRAINT product_product_color_color_id_8f3ae534_fk_product_color_id FOREIGN KEY (color_id) REFERENCES public.product_color(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product_color product_product_color_product_id_31c3247c_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_product_color
    ADD CONSTRAINT product_product_color_product_id_31c3247c_fk_product_product_id FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product_image product_product_image_product_id_9badf910_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_product_image
    ADD CONSTRAINT product_product_image_product_id_9badf910_fk_product_product_id FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product_tag product_product_tag_product_id_456d9764_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_product_tag
    ADD CONSTRAINT product_product_tag_product_id_456d9764_fk_product_product_id FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product_tag product_product_tag_tag_id_fe2f1952_fk_product_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_product_tag
    ADD CONSTRAINT product_product_tag_tag_id_fe2f1952_fk_product_tag_id FOREIGN KEY (tag_id) REFERENCES public.product_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_review product_review_product_id_428b0c5c_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: tech
--

ALTER TABLE ONLY public.product_review
    ADD CONSTRAINT product_review_product_id_428b0c5c_fk_product_product_id FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

