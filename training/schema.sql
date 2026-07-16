--
-- PostgreSQL database dump
--

\restrict Mwp3ireq6qfwXrVJFkchqiA6qL5scPhCqhgxCuFM4gv8Q6vM3yewmeIctBO9vQP

-- Dumped from database version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)

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

--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: album; Type: TABLE; Schema: public; Owner: rybread
--

CREATE TABLE public.album (
    id integer NOT NULL,
    gid uuid,
    title text,
    artist_credit integer,
    release_year integer,
    tags text[],
    release_type text[],
    title_search text,
    cleaned_tags text[],
    variation_count integer DEFAULT 0 NOT NULL,
    duration bigint
);


ALTER TABLE public.album OWNER TO rybread;

--
-- Name: album_embedding_id_seq; Type: SEQUENCE; Schema: public; Owner: rybread
--

CREATE SEQUENCE public.album_embedding_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.album_embedding_id_seq OWNER TO rybread;

--
-- Name: album_variations; Type: TABLE; Schema: public; Owner: rybread
--

CREATE TABLE public.album_variations (
    id integer NOT NULL,
    title text,
    artist_credit_id integer,
    release_year integer,
    gid uuid,
    release_type text,
    album_group integer,
    is_canonical boolean DEFAULT false NOT NULL,
    duration bigint
);


ALTER TABLE public.album_variations OWNER TO rybread;

--
-- Name: album_id_seq; Type: SEQUENCE; Schema: public; Owner: rybread
--

CREATE SEQUENCE public.album_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.album_id_seq OWNER TO rybread;

--
-- Name: album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rybread
--

ALTER SEQUENCE public.album_id_seq OWNED BY public.album_variations.id;


--
-- Name: album_id_seq1; Type: SEQUENCE; Schema: public; Owner: rybread
--

CREATE SEQUENCE public.album_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.album_id_seq1 OWNER TO rybread;

--
-- Name: album_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: rybread
--

ALTER SEQUENCE public.album_id_seq1 OWNED BY public.album.id;


--
-- Name: artist; Type: TABLE; Schema: public; Owner: rybread
--

CREATE TABLE public.artist (
    id integer NOT NULL,
    gid uuid,
    name text,
    nationality text,
    name_search text,
    cleaned_tags text[]
);


ALTER TABLE public.artist OWNER TO rybread;

--
-- Name: artist_credit; Type: TABLE; Schema: public; Owner: rybread
--

CREATE TABLE public.artist_credit (
    id integer NOT NULL,
    name text,
    gid uuid,
    artist_id integer
);


ALTER TABLE public.artist_credit OWNER TO rybread;

--
-- Name: artist_embedding_id_seq; Type: SEQUENCE; Schema: public; Owner: rybread
--

CREATE SEQUENCE public.artist_embedding_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artist_embedding_id_seq OWNER TO rybread;

--
-- Name: artist_id_seq; Type: SEQUENCE; Schema: public; Owner: rybread
--

CREATE SEQUENCE public.artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artist_id_seq OWNER TO rybread;

--
-- Name: artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rybread
--

ALTER SEQUENCE public.artist_id_seq OWNED BY public.artist_credit.id;


--
-- Name: artist_id_seq1; Type: SEQUENCE; Schema: public; Owner: rybread
--

CREATE SEQUENCE public.artist_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artist_id_seq1 OWNER TO rybread;

--
-- Name: artist_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: rybread
--

ALTER SEQUENCE public.artist_id_seq1 OWNED BY public.artist.id;


--
-- Name: lb_harvest_log; Type: TABLE; Schema: public; Owner: rybread
--

CREATE TABLE public.lb_harvest_log (
    artist_mbid uuid NOT NULL,
    checked_at timestamp with time zone DEFAULT now() NOT NULL,
    neighbor_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.lb_harvest_log OWNER TO rybread;

--
-- Name: similar_artist; Type: TABLE; Schema: public; Owner: rybread
--

CREATE TABLE public.similar_artist (
    artist_mbid uuid NOT NULL,
    similar_artist_mbid uuid NOT NULL,
    score integer NOT NULL,
    rank integer NOT NULL
);


ALTER TABLE public.similar_artist OWNER TO rybread;

--
-- Name: track; Type: TABLE; Schema: public; Owner: rybread
--

CREATE TABLE public.track (
    id integer NOT NULL,
    gid uuid,
    title text,
    album_id integer,
    duration integer,
    artist_credit integer,
    "position" integer,
    title_search text,
    cleaned_tags text[]
);


ALTER TABLE public.track OWNER TO rybread;

--
-- Name: track_embedding_id_seq; Type: SEQUENCE; Schema: public; Owner: rybread
--

CREATE SEQUENCE public.track_embedding_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.track_embedding_id_seq OWNER TO rybread;

--
-- Name: track_id_seq; Type: SEQUENCE; Schema: public; Owner: rybread
--

CREATE SEQUENCE public.track_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.track_id_seq OWNER TO rybread;

--
-- Name: track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rybread
--

ALTER SEQUENCE public.track_id_seq OWNED BY public.track.id;


--
-- Name: album id; Type: DEFAULT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.album ALTER COLUMN id SET DEFAULT nextval('public.album_id_seq1'::regclass);


--
-- Name: album_variations id; Type: DEFAULT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.album_variations ALTER COLUMN id SET DEFAULT nextval('public.album_id_seq'::regclass);


--
-- Name: artist id; Type: DEFAULT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.artist ALTER COLUMN id SET DEFAULT nextval('public.artist_id_seq1'::regclass);


--
-- Name: artist_credit id; Type: DEFAULT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.artist_credit ALTER COLUMN id SET DEFAULT nextval('public.artist_id_seq'::regclass);


--
-- Name: track id; Type: DEFAULT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.track ALTER COLUMN id SET DEFAULT nextval('public.track_id_seq'::regclass);


--
-- Name: album_variations album_pkey; Type: CONSTRAINT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.album_variations
    ADD CONSTRAINT album_pkey PRIMARY KEY (id);


--
-- Name: album album_pkey1; Type: CONSTRAINT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey1 PRIMARY KEY (id);


--
-- Name: artist_credit artist_pkey; Type: CONSTRAINT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.artist_credit
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id);


--
-- Name: artist artist_pkey1; Type: CONSTRAINT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey1 PRIMARY KEY (id);


--
-- Name: lb_harvest_log lb_harvest_log_pkey; Type: CONSTRAINT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.lb_harvest_log
    ADD CONSTRAINT lb_harvest_log_pkey PRIMARY KEY (artist_mbid);


--
-- Name: similar_artist similar_artist_pkey; Type: CONSTRAINT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.similar_artist
    ADD CONSTRAINT similar_artist_pkey PRIMARY KEY (artist_mbid, similar_artist_mbid);


--
-- Name: track track_pkey; Type: CONSTRAINT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_pkey PRIMARY KEY (id);


--
-- Name: album_title_search_trgm; Type: INDEX; Schema: public; Owner: rybread
--

CREATE INDEX album_title_search_trgm ON public.album USING gin (title_search public.gin_trgm_ops);


--
-- Name: artist_gid_uniq; Type: INDEX; Schema: public; Owner: rybread
--

CREATE UNIQUE INDEX artist_gid_uniq ON public.artist USING btree (gid);


--
-- Name: artist_name_search_idx; Type: INDEX; Schema: public; Owner: rybread
--

CREATE INDEX artist_name_search_idx ON public.artist USING gin (name_search public.gin_trgm_ops);


--
-- Name: artist_name_search_trgm; Type: INDEX; Schema: public; Owner: rybread
--

CREATE INDEX artist_name_search_trgm ON public.artist USING gin (name_search public.gin_trgm_ops);


--
-- Name: idx_alb_name_search; Type: INDEX; Schema: public; Owner: rybread
--

CREATE INDEX idx_alb_name_search ON public.album USING gin (title_search public.gin_trgm_ops);


--
-- Name: idx_artname_btree; Type: INDEX; Schema: public; Owner: rybread
--

CREATE INDEX idx_artname_btree ON public.artist USING btree (name);


--
-- Name: idx_artname_trgm; Type: INDEX; Schema: public; Owner: rybread
--

CREATE INDEX idx_artname_trgm ON public.artist USING gin (name public.gin_trgm_ops);


--
-- Name: idx_av_canonical; Type: INDEX; Schema: public; Owner: rybread
--

CREATE INDEX idx_av_canonical ON public.album_variations USING btree (album_group) WHERE is_canonical;


--
-- Name: idx_title_btree; Type: INDEX; Schema: public; Owner: rybread
--

CREATE INDEX idx_title_btree ON public.album USING btree (title);


--
-- Name: idx_title_trgm; Type: INDEX; Schema: public; Owner: rybread
--

CREATE INDEX idx_title_trgm ON public.album USING gin (title public.gin_trgm_ops);


--
-- Name: idx_track_title_search_trgm; Type: INDEX; Schema: public; Owner: rybread
--

CREATE INDEX idx_track_title_search_trgm ON public.track USING gin (title_search public.gin_trgm_ops);


--
-- Name: idx_trtitle_btree; Type: INDEX; Schema: public; Owner: rybread
--

CREATE INDEX idx_trtitle_btree ON public.track USING btree (title);


--
-- Name: idx_trtitle_trgm; Type: INDEX; Schema: public; Owner: rybread
--

CREATE INDEX idx_trtitle_trgm ON public.track USING gin (title public.gin_trgm_ops);


--
-- Name: similar_artist_target_idx; Type: INDEX; Schema: public; Owner: rybread
--

CREATE INDEX similar_artist_target_idx ON public.similar_artist USING btree (similar_artist_mbid);


--
-- Name: track_title_search_btree; Type: INDEX; Schema: public; Owner: rybread
--

CREATE INDEX track_title_search_btree ON public.track USING btree (title_search);


--
-- Name: track_title_search_trgm; Type: INDEX; Schema: public; Owner: rybread
--

CREATE INDEX track_title_search_trgm ON public.track USING gin (title_search public.gin_trgm_ops);


--
-- Name: album album_artist_credit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_artist_credit_fkey FOREIGN KEY (artist_credit) REFERENCES public.artist_credit(id);


--
-- Name: album_variations album_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.album_variations
    ADD CONSTRAINT album_artist_id_fkey FOREIGN KEY (artist_credit_id) REFERENCES public.artist_credit(id);


--
-- Name: artist_credit artist_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.artist_credit
    ADD CONSTRAINT artist_id_fk FOREIGN KEY (artist_id) REFERENCES public.artist(id);


--
-- Name: track fk_track_artist_id; Type: FK CONSTRAINT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT fk_track_artist_id FOREIGN KEY (artist_credit) REFERENCES public.artist_credit(id);


--
-- Name: track track_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rybread
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.album_variations(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO music_prisoner;


--
-- Name: TABLE album; Type: ACL; Schema: public; Owner: rybread
--

GRANT SELECT ON TABLE public.album TO music_prisoner;


--
-- Name: SEQUENCE album_embedding_id_seq; Type: ACL; Schema: public; Owner: rybread
--

GRANT SELECT ON SEQUENCE public.album_embedding_id_seq TO music_prisoner;


--
-- Name: TABLE album_variations; Type: ACL; Schema: public; Owner: rybread
--

GRANT SELECT ON TABLE public.album_variations TO music_prisoner;


--
-- Name: SEQUENCE album_id_seq; Type: ACL; Schema: public; Owner: rybread
--

GRANT SELECT ON SEQUENCE public.album_id_seq TO music_prisoner;


--
-- Name: SEQUENCE album_id_seq1; Type: ACL; Schema: public; Owner: rybread
--

GRANT SELECT ON SEQUENCE public.album_id_seq1 TO music_prisoner;


--
-- Name: TABLE artist; Type: ACL; Schema: public; Owner: rybread
--

GRANT SELECT ON TABLE public.artist TO music_prisoner;


--
-- Name: TABLE artist_credit; Type: ACL; Schema: public; Owner: rybread
--

GRANT SELECT ON TABLE public.artist_credit TO music_prisoner;


--
-- Name: SEQUENCE artist_embedding_id_seq; Type: ACL; Schema: public; Owner: rybread
--

GRANT SELECT ON SEQUENCE public.artist_embedding_id_seq TO music_prisoner;


--
-- Name: SEQUENCE artist_id_seq; Type: ACL; Schema: public; Owner: rybread
--

GRANT SELECT ON SEQUENCE public.artist_id_seq TO music_prisoner;


--
-- Name: SEQUENCE artist_id_seq1; Type: ACL; Schema: public; Owner: rybread
--

GRANT SELECT ON SEQUENCE public.artist_id_seq1 TO music_prisoner;


--
-- Name: TABLE lb_harvest_log; Type: ACL; Schema: public; Owner: rybread
--

GRANT SELECT ON TABLE public.lb_harvest_log TO music_prisoner;


--
-- Name: TABLE similar_artist; Type: ACL; Schema: public; Owner: rybread
--

GRANT SELECT ON TABLE public.similar_artist TO music_prisoner;


--
-- Name: TABLE track; Type: ACL; Schema: public; Owner: rybread
--

GRANT SELECT ON TABLE public.track TO music_prisoner;


--
-- Name: SEQUENCE track_embedding_id_seq; Type: ACL; Schema: public; Owner: rybread
--

GRANT SELECT ON SEQUENCE public.track_embedding_id_seq TO music_prisoner;


--
-- Name: SEQUENCE track_id_seq; Type: ACL; Schema: public; Owner: rybread
--

GRANT SELECT ON SEQUENCE public.track_id_seq TO music_prisoner;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: rybread
--

ALTER DEFAULT PRIVILEGES FOR ROLE rybread IN SCHEMA public GRANT SELECT ON TABLES TO music_prisoner;


--
-- PostgreSQL database dump complete
--

\unrestrict Mwp3ireq6qfwXrVJFkchqiA6qL5scPhCqhgxCuFM4gv8Q6vM3yewmeIctBO9vQP

