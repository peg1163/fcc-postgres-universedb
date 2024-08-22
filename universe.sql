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
-- Name: astronomical_object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomical_object (
    astronomical_object_id integer NOT NULL,
    object_type character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    parent_id integer,
    parent_type character varying(50),
    distance_from_earth numeric,
    description text
);


ALTER TABLE public.astronomical_object OWNER TO freecodecamp;

--
-- Name: astronomical_objects_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomical_objects_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomical_objects_object_id_seq OWNER TO freecodecamp;

--
-- Name: astronomical_objects_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomical_objects_object_id_seq OWNED BY public.astronomical_object.astronomical_object_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    age_in_millions_of_years integer NOT NULL,
    galaxy_types character varying(30)
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
    name character varying(30),
    distance_from_earth numeric NOT NULL,
    planet_id integer,
    description text
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
    name character varying(30),
    distance_from_earth numeric,
    star_id integer NOT NULL,
    is_spherical boolean,
    has_life boolean,
    age_in_millions_of_years integer
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
    name character varying(30),
    distance_from_earth numeric NOT NULL,
    galaxy_id integer,
    description text
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
-- Name: astronomical_object astronomical_object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_object ALTER COLUMN astronomical_object_id SET DEFAULT nextval('public.astronomical_objects_object_id_seq'::regclass);


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
-- Data for Name: astronomical_object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomical_object VALUES (1, 'Galaxy', 'Andromeda', NULL, NULL, 2500000, 'La galaxia más cercana a la Vía Láctea.');
INSERT INTO public.astronomical_object VALUES (2, 'Star', 'Star A1', 1, 'Galaxy', 2500000, 'Una de las estrellas en la galaxia Andromeda.');
INSERT INTO public.astronomical_object VALUES (3, 'Planet', 'Planeta A1b', 2, 'Star', 2500000, 'Un planeta en órbita alrededor de Star A1 en Andromeda.');
INSERT INTO public.astronomical_object VALUES (4, 'Moon', 'Luna A1b1', 3, 'Planet', 2500000, 'Una luna orbitando Planeta A1b.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 'Galaxia donde vivimos', 13600, 'Espiral Barrada');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Galaxia mas cercana', 10000, 'Espiral');
INSERT INTO public.galaxy VALUES (3, 'Centaurus A', 'Tiene una banda prominente de plvo oscuro que atraviesa su nucleo', 10000, 'Eliptica');
INSERT INTO public.galaxy VALUES (4, 'Enana de Acuario', 'Esta ubicada en la constelacion de Acuario', 10000, 'Enana ESferoidal');
INSERT INTO public.galaxy VALUES (5, 'Enana de Can Mayor', 'Enana mas cercana a la Via Lactea', 12000, 'Enana ESferoidal');
INSERT INTO public.galaxy VALUES (6, 'Baby Boom', 'Llamada :fabrica de estrellas del Universo', 12200, 'Starburst');
INSERT INTO public.galaxy VALUES (7, 'M33', 'Galaxia del Triangulo', 10000, 'Espiral no Barrada');
INSERT INTO public.galaxy VALUES (8, 'NGC 253', 'Galaxia del Escultor', 10000, 'Espiral Barrada');
INSERT INTO public.galaxy VALUES (9, 'M81', 'Galaxia del Bode', 12000, 'Espiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 384400, 3, 'La única luna natural de la Tierra.');
INSERT INTO public.moon VALUES (2, 'Fobos', 9377, 4, 'Una de las dos lunas de Marte.');
INSERT INTO public.moon VALUES (3, 'Deimos', 23460, 4, 'La luna más pequeña y externa de Marte.');
INSERT INTO public.moon VALUES (4, 'Io', 628300000, 5, 'Una de las lunas más grandes y geológicamente activa.');
INSERT INTO public.moon VALUES (5, 'Europa', 628300000, 5, 'Luna helada de Júpiter con un océano subterráneo.');
INSERT INTO public.moon VALUES (6, 'Titán', 1427000000, 6, 'Luna más grande de Saturno con una atmósfera densa.');
INSERT INTO public.moon VALUES (7, 'Encélado', 1427000000, 6, 'Pequeña luna de Saturno con géiseres activos.');
INSERT INTO public.moon VALUES (8, 'Miranda', 2871000000, 7, 'Luna de Urano con una superficie muy variada.');
INSERT INTO public.moon VALUES (9, 'Ariel', 2871000000, 7, 'Una de las mayores lunas de Urano.');
INSERT INTO public.moon VALUES (10, 'Tritón', 4503000000, 8, 'La mayor luna de Neptuno, conocida por su órbita retrógrada.');
INSERT INTO public.moon VALUES (11, 'Proxima b-1', 4.25, 9, 'Luna hipotética alrededor del exoplaneta Proxima Centauri b.');
INSERT INTO public.moon VALUES (14, 'Ganímedes', 628300000, 5, 'La mayor luna de Júpiter y del sistema solar.');
INSERT INTO public.moon VALUES (20, 'Proxima b-2', 4.26, 9, 'Otra luna hipotética alrededor del exoplaneta Proxima Centauri b.');
INSERT INTO public.moon VALUES (12, 'Io I', 628300000, 5, 'Una de las lunas más grandes de Júpiter, geológicamente activa.');
INSERT INTO public.moon VALUES (13, 'Europa I', 628300000, 5, 'Luna helada de Júpiter con un océano subterráneo.');
INSERT INTO public.moon VALUES (15, 'Titán I', 628300000, 5, 'Luna de Júpiter, conocida por su antigua superficie craterizada.');
INSERT INTO public.moon VALUES (16, 'Encélado I', 1427000000, 6, 'Luna más grande de Saturno con una atmósfera densa.');
INSERT INTO public.moon VALUES (17, 'Fobos I', 1427000000, 6, 'Pequeña luna de Saturno con géiseres activos.');
INSERT INTO public.moon VALUES (18, 'Deimos I', 9377, 4, 'Una de las dos lunas de Marte.');
INSERT INTO public.moon VALUES (19, 'Proxima b-1 I', 23460, 4, 'La luna más pequeña y externa de Marte.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 57.91, 1, true, false, 4500);
INSERT INTO public.planet VALUES (2, 'Venus', 108.2, 1, true, false, 4500);
INSERT INTO public.planet VALUES (3, 'Tierra', 149.6, 1, true, true, 4500);
INSERT INTO public.planet VALUES (4, 'Marte', 227.9, 1, true, false, 4500);
INSERT INTO public.planet VALUES (5, 'Proxima Centauri b', 4.24, 4, true, false, 5000);
INSERT INTO public.planet VALUES (6, 'Planeta Centauri A', 390, 5, true, false, 4500);
INSERT INTO public.planet VALUES (7, 'Planeta Centauri B', 390.5, 5, true, false, 4500);
INSERT INTO public.planet VALUES (8, 'Planeta Mirach I', 197.5, 2, true, false, 6000);
INSERT INTO public.planet VALUES (9, 'Planeta Almach A', 350.1, 3, true, false, 6000);
INSERT INTO public.planet VALUES (10, 'Planeta Triangulum I', 3.1, 6, true, false, 10000);
INSERT INTO public.planet VALUES (11, 'Planeta Escultor I', 11.1, 8, true, false, 11000);
INSERT INTO public.planet VALUES (12, 'Planeta Bode I', 12.2, 9, true, false, 12000);
INSERT INTO public.planet VALUES (13, 'Planeta Bode II', 12.3, 10, true, false, 12000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 149.6, 1, 'Estrella del sistema solar');
INSERT INTO public.star VALUES (2, 'Mirach', 197, 2, 'Estrella de la constelacion de Andromeda');
INSERT INTO public.star VALUES (3, 'Almach', 350, 2, 'Estrella de la constelacion de Andromeda');
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 4.37, 3, 'Estrella de la constelacion de Centaurus');
INSERT INTO public.star VALUES (5, 'Beta Centauri', 390, 3, 'Estrella de la constelacion de Centaurus');
INSERT INTO public.star VALUES (6, 'Variable Cepheid', 3, 7, 'Perteneciente a la galaxia Triangulo');
INSERT INTO public.star VALUES (7, 'Nebula NGC 604', 3, 7, 'Perteneciente a la galaxia de Triangulo');
INSERT INTO public.star VALUES (8, 'Supernova SN 2012ec', 11, 8, 'Perteneciente a la galaxia del Escultor');
INSERT INTO public.star VALUES (10, 'Supernova SN 1993J', 12, 9, 'Perteneciente a la galaxia d Bode');
INSERT INTO public.star VALUES (9, 'Cumulo estelar compacto', 11, 8, 'Perteneciente a la galaxia del Escultor');


--
-- Name: astronomical_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomical_objects_object_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: astronomical_object astronomical_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_object
    ADD CONSTRAINT astronomical_objects_pkey PRIMARY KEY (astronomical_object_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: astronomical_object unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_object
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

