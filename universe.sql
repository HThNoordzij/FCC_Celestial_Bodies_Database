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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    discovery date,
    discovered_by character varying(100)
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    morphology character varying(30),
    diameter_pc numeric(7,0),
    local_group boolean
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
    name character varying(30) NOT NULL,
    planet_id integer,
    orbital_speed_in_km_per_sec numeric(3,1),
    temperature_in_kelvin integer
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
    name character varying(30) NOT NULL,
    quote text,
    quote_author character varying(60),
    star_id integer,
    has_life boolean
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    solar_mass numeric(4,1),
    age_my integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Vesta', 1, '1807-03-29', 'Heinrich Wilhelm Olbers');
INSERT INTO public.asteroid VALUES (2, 'Eros', 1, '1898-08-13', 'Gustav Witt');
INSERT INTO public.asteroid VALUES (3, 'Itokawa', 1, '1998-09-26', 'Lincoln Laboratory Near-Earth Asteroid Research Team');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 26800, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'spiral', 46560, true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 'peculiar', 30000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'spiral', 23580, false);
INSERT INTO public.galaxy VALUES (5, 'Sunflower Galaxy', 'spiral', 8000, false);
INSERT INTO public.galaxy VALUES (6, 'Hercules A', 'elliptical', NULL, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 'Deimos', 6, 1.4, 233);
INSERT INTO public.moon VALUES (2, 'Phobos', 6, 2.1, 233);
INSERT INTO public.moon VALUES (1, 'Luna', 2, 1.0, 250);
INSERT INTO public.moon VALUES (4, 'Titania', 8, 3.6, 70);
INSERT INTO public.moon VALUES (5, 'Oberon', 8, 3.2, 75);
INSERT INTO public.moon VALUES (6, 'Perdita', 8, NULL, 64);
INSERT INTO public.moon VALUES (7, 'Mab', 8, 7.7, 63);
INSERT INTO public.moon VALUES (8, 'Larissa', 9, NULL, 51);
INSERT INTO public.moon VALUES (9, 'Naiad', 9, NULL, 51);
INSERT INTO public.moon VALUES (10, 'Thalassa', 9, NULL, 51);
INSERT INTO public.moon VALUES (11, 'S/2021 N 1', 9, 0.4, NULL);
INSERT INTO public.moon VALUES (12, 'Halimede', 9, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Ganymede', 7, 10.9, 110);
INSERT INTO public.moon VALUES (14, 'Amalthea', 7, 26.6, 120);
INSERT INTO public.moon VALUES (15, 'Leda', 7, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Rhea', 3, 8.5, 53);
INSERT INTO public.moon VALUES (17, 'Enceladus', 3, NULL, 75);
INSERT INTO public.moon VALUES (18, 'Mimas', 3, 14.3, 64);
INSERT INTO public.moon VALUES (19, 'Phoebe', 3, NULL, 73);
INSERT INTO public.moon VALUES (20, 'Hyperion', 3, NULL, 93);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Saturn', 'Saturn doesn’t ask us to give up our dreams, only to make them real.', 'Steven Forrest', 1, true);
INSERT INTO public.planet VALUES (4, 'Venus', 'Earth might one day soon resemble the planet Venus.', 'Stephen Hawking', 1, false);
INSERT INTO public.planet VALUES (2, 'Earth', 'Those who contemplate the beauty of the earth find reserve of strenght that will endure as long as life lasts. There is something infinitely healing in the repeated refrains of nature. The assurance that dawn comes after night, and spring after winter.', 'Rachel Carson', 1, false);
INSERT INTO public.planet VALUES (5, 'Mercury', 'I had rather be Mercury, the smallest among seven [planets], revolving round the sun, than the first among five [moons] revolving round Saturn.', 'Johann Wolfgang von Goethe', 1, false);
INSERT INTO public.planet VALUES (6, 'Mars', 'The planet’s famous red color is from iron oxide coating everything. So it’s not just a desert. It’s a desert so old it’s literally rusting.', 'Andy Weir', 1, false);
INSERT INTO public.planet VALUES (7, 'Jupiter', 'What do I care about Jupiter? Justice is a human issue, and I do not need a god to teach it to me.', 'Jean-Paul Sartre', 1, false);
INSERT INTO public.planet VALUES (1, 'Poltergeist', 'There are three known planets in the PSR B1257 system, which have been named Draugr, Poltergeist and Phobetor. Poltergeist was the first to be discovered. I know, I was curious about their names as well. Poletrgeist means "pounding ghost". The draugr are the unded in Norse legends who live in their graves. And Phobetor is the personification of nightmares, and the son of Nyx, Greek goddess of the night. Astronomers are goths.', 'Brian Cox', 4, NULL);
INSERT INTO public.planet VALUES (8, 'Uranus', 'A human being born at one of Uranus’s poles would be a middle-aged man at sunset and a very old man before it was time for a second sunrise.', 'Isaac Asimov', 1, false);
INSERT INTO public.planet VALUES (9, 'Neptune', 'Either you repeat the same conventional doctrines that everybody else is saying, or else you say something which in fact is true, and it will sound like it’s from Neptune.', 'Noam Chomsky', 1, false);
INSERT INTO public.planet VALUES (10, 'Pluto', 'It used to be said that Pluto is a misfit. But now we know Earth is the misfit. This is the most populous class of planet in our solar system and we have never sent a mission to this class.', 'Alan Stern', 1, false);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 'It will not be we who reach Alpha Centauri, and the other nearby stars. It will be a species very like us – but with more of our strengths and fewer of our weaknesses.', 'Carl Sagan', 2, NULL);
INSERT INTO public.planet VALUES (12, 'Draugr', NULL, NULL, 4, NULL);
INSERT INTO public.planet VALUES (13, 'Phobetor', NULL, NULL, 4, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, 4600);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0.1, 1091);
INSERT INTO public.star VALUES (3, 'Zeta Leporis', 1, 1.5, 231);
INSERT INTO public.star VALUES (4, 'Lich', 1, 1.4, 450);
INSERT INTO public.star VALUES (5, 'Stephenson 2 DFK 1', 1, NULL, NULL);
INSERT INTO public.star VALUES (6, 'GJ 3379', 1, 0.2, NULL);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

