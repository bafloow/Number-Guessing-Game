--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    username_id integer,
    number_of_guesses integer,
    game_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: tries; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.tries (
    tries integer
);


ALTER TABLE public.tries OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username_id integer NOT NULL,
    username character varying(30) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_username_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_username_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_username_id_seq OWNER TO freecodecamp;

--
-- Name: users_username_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_username_id_seq OWNED BY public.users.username_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users username_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN username_id SET DEFAULT nextval('public.users_username_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (94, 15, 1);
INSERT INTO public.games VALUES (97, 305, 2);
INSERT INTO public.games VALUES (97, 42, 3);


--
-- Data for Name: tries; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.tries VALUES (0);
INSERT INTO public.tries VALUES (1);
INSERT INTO public.tries VALUES (2);
INSERT INTO public.tries VALUES (3);
INSERT INTO public.tries VALUES (4);
INSERT INTO public.tries VALUES (5);
INSERT INTO public.tries VALUES (6);
INSERT INTO public.tries VALUES (7);
INSERT INTO public.tries VALUES (8);
INSERT INTO public.tries VALUES (9);
INSERT INTO public.tries VALUES (10);
INSERT INTO public.tries VALUES (11);
INSERT INTO public.tries VALUES (12);
INSERT INTO public.tries VALUES (13);
INSERT INTO public.tries VALUES (14);
INSERT INTO public.tries VALUES (15);
INSERT INTO public.tries VALUES (16);
INSERT INTO public.tries VALUES (17);
INSERT INTO public.tries VALUES (18);
INSERT INTO public.tries VALUES (19);
INSERT INTO public.tries VALUES (20);
INSERT INTO public.tries VALUES (21);
INSERT INTO public.tries VALUES (22);
INSERT INTO public.tries VALUES (23);
INSERT INTO public.tries VALUES (24);
INSERT INTO public.tries VALUES (25);
INSERT INTO public.tries VALUES (26);
INSERT INTO public.tries VALUES (27);
INSERT INTO public.tries VALUES (28);
INSERT INTO public.tries VALUES (29);
INSERT INTO public.tries VALUES (30);
INSERT INTO public.tries VALUES (31);
INSERT INTO public.tries VALUES (32);
INSERT INTO public.tries VALUES (33);
INSERT INTO public.tries VALUES (34);
INSERT INTO public.tries VALUES (35);
INSERT INTO public.tries VALUES (36);
INSERT INTO public.tries VALUES (37);
INSERT INTO public.tries VALUES (38);
INSERT INTO public.tries VALUES (39);
INSERT INTO public.tries VALUES (40);
INSERT INTO public.tries VALUES (41);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (94, 'Bartek');
INSERT INTO public.users VALUES (95, 'user_1735396519876');
INSERT INTO public.users VALUES (96, 'user_1735396519875');
INSERT INTO public.users VALUES (97, 'user_1735396667996');
INSERT INTO public.users VALUES (98, 'user_1735396667995');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 3, true);


--
-- Name: users_username_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_username_id_seq', 98, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username_id);


--
-- Name: games games_username_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_id_fkey FOREIGN KEY (username_id) REFERENCES public.users(username_id);


--
-- PostgreSQL database dump complete
--

