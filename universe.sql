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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(25) NOT NULL,
    type character varying(25) NOT NULL,
    constellation text,
    origin_of_name text
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
    name character varying(25) NOT NULL,
    planet text NOT NULL,
    year_discovered integer,
    has_life boolean,
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
-- Name: orbit; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.orbit (
    orbit_id integer NOT NULL,
    body character varying(25) NOT NULL,
    focal_point text NOT NULL,
    period integer,
    circular boolean,
    axial_tilt integer,
    name character varying(25)
);


ALTER TABLE public.orbit OWNER TO freecodecamp;

--
-- Name: orbit_orbit_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.orbit_orbit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orbit_orbit_id_seq OWNER TO freecodecamp;

--
-- Name: orbit_orbit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.orbit_orbit_id_seq OWNED BY public.orbit.orbit_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(25) NOT NULL,
    star_system text NOT NULL,
    age_in_millions_of_years numeric,
    has_life boolean,
    star_id integer,
    moons integer
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
    name character varying(25) NOT NULL,
    type character varying(25) NOT NULL,
    mass double precision,
    visible_by_eye boolean,
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
-- Name: orbit orbit_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit ALTER COLUMN orbit_id SET DEFAULT nextval('public.orbit_orbit_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral galaxy', 'Sagittarius', 'The appearance from Earth of the galaxy—a band of light');
INSERT INTO public.galaxy VALUES (2, 'Eye of God', 'face-on spiral galaxy', 'Eridanus', 'Name after its structural appearance
');
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 'barred spiral galaxy', 'Andromeda', 'the area of the sky in which it appears, the constellation of Andromeda');
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', 'face-on unbarred spiral', 'Centaurus', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.');
INSERT INTO public.galaxy VALUES (5, 'Bear Paw Galaxy', 'blue compact dwarf', 'Lynx', 'It resembles the appearance of a bear claw.');
INSERT INTO public.galaxy VALUES (7, 'Butterfly Galaxies', 'unbarred spiral', 'Virgo', 'Looks are similar to a butterfly');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth', 0, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars', 1877, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars', 1877, false, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Jupiter', 1610, false, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Jupiter', 1610, false, 5);
INSERT INTO public.moon VALUES (6, 'Io', 'Jupiter', 1610, false, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 'Jupiter', 1610, false, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Jupiter', 1982, false, 5);
INSERT INTO public.moon VALUES (9, 'Euporie', 'Jupiter', 2001, false, 5);
INSERT INTO public.moon VALUES (10, 'Dia', 'Jupiter', 20000, false, 5);
INSERT INTO public.moon VALUES (11, 'Titan', 'Saturn', 1655, false, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 'Saturn', 1672, false, 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', 'Saturn', 1671, false, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 'Saturn', 1684, false, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', 'Saturn', 1684, false, 6);
INSERT INTO public.moon VALUES (16, 'Enceladus', 'Saturn', 1789, false, 6);
INSERT INTO public.moon VALUES (17, 'Mimas', 'Saturn', 1789, false, 6);
INSERT INTO public.moon VALUES (18, 'Titania', 'Uranus', 1787, false, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 'Uranus', 1787, false, 7);
INSERT INTO public.moon VALUES (20, 'Umbriel', 'Uranus', 1851, false, 7);


--
-- Data for Name: orbit; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.orbit VALUES (1, 'Earth', 'Sun', 365, false, 0, 'Earth Orbit');
INSERT INTO public.orbit VALUES (2, 'Mars', 'Sun', 687, false, 1, 'Mars Orbit');
INSERT INTO public.orbit VALUES (3, 'Venus', 'Sun', 224, false, 0, 'Venus Orbit');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Solar System', 4500, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Solar System', 4500, false, 1, 0);
INSERT INTO public.planet VALUES (3, 'Venus', 'Solar System', 4500, false, 1, 0);
INSERT INTO public.planet VALUES (4, 'Mars', 'Solar System', 4500, false, 1, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Solar System', 4500, false, 1, 95);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Solar System', 4500, false, 1, 145);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Solar System', 4500, false, 1, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Solar System', 4500, false, 1, 14);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', 'Alpha Centauri', 4500, false, 3, 0);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 'Alpha Centauri', 4500, false, 3, 0);
INSERT INTO public.planet VALUES (13, 'Spe', 'Toliman', 5000, true, 2, 5);
INSERT INTO public.planet VALUES (14, 'Arion', 'Epsilon Eridani', 5000, true, 6, 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf', 1, true, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Red Dwarf', 0.122, false, 1);
INSERT INTO public.star VALUES (4, 'Rigil Kentaurus', 'Double Dwarf', 1.079, true, 1);
INSERT INTO public.star VALUES (2, 'Toliman', 'orange main sequence', 0.909, true, 1);
INSERT INTO public.star VALUES (5, 'Barnards Star', 'red dwarf', 0.144, false, 1);
INSERT INTO public.star VALUES (6, 'Ran (Epsilon Eridani)', 'orange dwarf', 3.73, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: orbit_orbit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.orbit_orbit_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 4, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: orbit orbit_body_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit
    ADD CONSTRAINT orbit_body_key UNIQUE (body);


--
-- Name: orbit orbit_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit
    ADD CONSTRAINT orbit_pkey PRIMARY KEY (orbit_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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

