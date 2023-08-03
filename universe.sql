--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id numeric NOT NULL,
    name character varying(20) NOT NULL,
    messier_objects integer NOT NULL,
    col integer,
    col_4 text,
    col_5 boolean,
    col_6 boolean
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    distance_from_earth integer NOT NULL,
    number_of_black_holes integer NOT NULL,
    surface_brightness numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    distance_from_earth integer NOT NULL,
    number_of_black_holes integer NOT NULL,
    host_planet character varying(30),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    distance_from_earth integer NOT NULL,
    number_of_black_holes integer NOT NULL,
    radius integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    distance_from_earth integer NOT NULL,
    number_of_black_holes integer NOT NULL,
    gravity numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Aries', 1, 1, 'Zodiac', true, false);
INSERT INTO public.constellation VALUES (2, 'Taurus', 6, 2, 'A member of the Zodiac', false, false);
INSERT INTO public.constellation VALUES (3, 'Gemini', 2, 3, 'Also one of the Zodiac members.', true, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'The Andromeda Galaxy contains about 1 trillion stars.', false, false, 10000, 3, 35, 22.3);
INSERT INTO public.galaxy VALUES (2, 'Triangulum', 'The Triangulum galaxy contains about 40 billion stars.', false, false, 10000, 3, 20, 23.3);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'The Sombrero Galaxy contains about 100 billion stars.', false, false, 10000, 29, 1, 22);
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 'The Milky Way galaxy contains about 400 billion stars.', false, false, 13600, 27000, 1, 21.5);
INSERT INTO public.galaxy VALUES (5, 'M87', 'The M87 galaxy contains about 1 trillion stars.', false, false, 13240, 16, 1, 22.6);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'The Whirlpool galaxy contains about 100 billion stars.', false, false, 10000, 23, 1, 22.2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Io', 'Volcanically active', false, true, 4500, 421700, 0, 'Jupiter', 5);
INSERT INTO public.moon VALUES (2, 'Europa', 'Possibly has liquid water ocean', false, true, 4500, 671000, 0, 'Jupiter Returns', 5);
INSERT INTO public.moon VALUES (3, 'Ganymede', 'Largest moon in the solar system', false, true, 4500, 1070400, 0, ' Jupiter', 5);
INSERT INTO public.moon VALUES (4, 'Callisto', 'Cratered moon', false, true, 4500, 1882700, 0, 'J upiter', 5);
INSERT INTO public.moon VALUES (5, 'Amalthea', 'Irregularly shaped moon', false, true, 4500, 181000, 0, 'Ju piter', 5);
INSERT INTO public.moon VALUES (6, 'Thebe', 'Also irregularly shaped', false, true, 4500, 222000, 0, 'Jup iter', 5);
INSERT INTO public.moon VALUES (7, 'Metis', 'Small moon', false, true, 4500, 12800, 0, 'Jupi ter', 5);
INSERT INTO public.moon VALUES (8, 'Adrastea', 'small moon', false, true, 4500, 128000, 0, 'Jupit er', 5);
INSERT INTO public.moon VALUES (9, 'Ananke', 'small moon', false, true, 4500, 212000, 0, 'Jupiter ', 5);
INSERT INTO public.moon VALUES (10, 'Pasiphae', 'weird moon', false, true, 4500, 238000, 0, 'Jupite r', 5);
INSERT INTO public.moon VALUES (11, 'Titan', 'thick atmosphere and lakes of liquid methane', false, true, 4500, 1221870, 0, 'Saturn', 6);
INSERT INTO public.moon VALUES (12, 'Triton', 'Nitrogen-ice surface and geysers', false, true, 4500, 354750, 0, 'Neptune', 8);
INSERT INTO public.moon VALUES (13, 'Charon', 'largest moon of Pluto', false, true, 4500, 12575, 0, 'Pluto', 1);
INSERT INTO public.moon VALUES (14, 'Phobos', 'small irregularly-shaped moon', false, true, 4500, 9377, 0, 'Mars', 4);
INSERT INTO public.moon VALUES (15, 'Moon', 'no atmosphere', false, true, 4500, 384400, 0, 'Earth', 3);
INSERT INTO public.moon VALUES (16, 'Titania', 'largest moon of Uranus', false, true, 4500, 43600, 0, 'Ur anus', 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 'second largest moon of Uranus', false, true, 4500, 583599, 0, 'Ura nus', 7);
INSERT INTO public.moon VALUES (18, 'Styx', 'small moon', false, true, 4500, 63000, 0, 'Plutoo', 3);
INSERT INTO public.moon VALUES (19, 'Deimos', 'it is a moon', false, true, 4500, 23459, 0, 'Maars', 4);
INSERT INTO public.moon VALUES (20, 'Rhea', 'second largest moon in the solar system', false, true, 4500, 527000, 0, 'Saaturn', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The closest planet to the sun.', false, true, 4600, 60, 0, 2440, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'The hottest planet in the solar system.', false, true, 4600, 108, 0, 6052, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The only planet know to support life.', true, true, 4600, 0, 0, 6371, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The red planet.', false, true, 4600, 228, 0, 3390, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar system.', false, true, 4600, 779, 0, 71492, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The second-largest planet in the solar system.', false, true, 4600, 1433, 0, 58232, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The seventh planet from the sun.', false, true, 4600, 2870, 0, 25559, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The farthest planet from the Sun.', false, true, 4600, 4497, 0, 24766, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 'It is an earth-sized planet.', false, true, 4500, 1, 0, 13270, 7);
INSERT INTO public.planet VALUES (10, 'Gliese 832c', 'It is a planet.', false, true, 6600, 880, 0, 15380, 8);
INSERT INTO public.planet VALUES (11, 'HD 219134b', 'It is as big as Jupiter.', false, true, 6300, 2, 0, 112000, 9);
INSERT INTO public.planet VALUES (12, '55 Cancri e', 'A rocky planet.', false, true, 5400, 5, 0, 22400, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 'It is a yellow dwarf.', false, true, 4500, 150, 0, 274, 4);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'It is a red supergiant.', false, true, 8, 643, 0, 31.6, 4);
INSERT INTO public.star VALUES (3, 'Alpheratz', 'It is blue-white in color.', false, false, 100, 97, 0, 24.4, 1);
INSERT INTO public.star VALUES (4, 'S5 0014+81', 'It is a blue supergiant.', false, false, 10, 28, 0, 660, 3);
INSERT INTO public.star VALUES (5, 'S4716', 'It is a red supergiant.', false, false, 8, 53, 0, 32, 5);
INSERT INTO public.star VALUES (6, 'UY Scuti', 'It is a red hypergiant.', false, false, 10, 9500, 0, 200, 4);
INSERT INTO public.star VALUES (7, 'Kepler-186', 'It is a star. Haha!', false, false, 4.5, 11, 0, 9.5, 4);
INSERT INTO public.star VALUES (8, 'Gliese 832', 'It has 1 exoplanet.', false, false, 6.6, 16, 0, 12.4, 4);
INSERT INTO public.star VALUES (9, 'HD-219134', 'It is a star. Haha!', false, false, 6.3, 16, 0, 14.7, 4);
INSERT INTO public.star VALUES (10, '55 Cancri', 'It has 5 exoplanets.', false, false, 5.4, 40, 0, 13.6, 4);
INSERT INTO public.star VALUES (11, 'TRAPPIST-1', 'It is a star. Haha!', false, false, 9.4, 40, 0, 12.1, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: constellation constellation_col_4_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_col_4_key UNIQUE (col_4);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_surface_brightness_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_surface_brightness_key UNIQUE (surface_brightness);


--
-- Name: moon moon_host_planet_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_host_planet_key UNIQUE (host_planet);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_radius_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_radius_key UNIQUE (radius);


--
-- Name: star star_gravity_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_gravity_key UNIQUE (gravity);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

