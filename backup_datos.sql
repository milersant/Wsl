--
-- PostgreSQL database dump
--

\restrict sJccz2hWxBZgzVyx4ddMtd3ZzBtKFNzwwwkPMmujsZkAljMlnUNY8Njf0wGbT5v

-- Dumped from database version 15.17
-- Dumped by pg_dump version 15.17

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
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: curso; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.curso (
    id_curso integer NOT NULL,
    clave_curso character varying(30) NOT NULL,
    numero_de_actividad character varying(30),
    nombre_curso character varying(150) NOT NULL,
    fecha_inicio date,
    fecha_fin date,
    horario character varying(100),
    incluye_alimento boolean DEFAULT false,
    id_estatus_curso integer,
    observaciones text,
    total_horas integer,
    id_sede integer,
    id_modalidad integer
);


ALTER TABLE public.curso OWNER TO cfe_user;

--
-- Name: curso_id_curso_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.curso_id_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curso_id_curso_seq OWNER TO cfe_user;

--
-- Name: curso_id_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.curso_id_curso_seq OWNED BY public.curso.id_curso;


--
-- Name: departamento; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.departamento (
    id_departamento integer NOT NULL,
    nombre_departamento character varying(100) NOT NULL,
    clave_departamento character varying(20),
    id_jefe_departamento integer
);


ALTER TABLE public.departamento OWNER TO cfe_user;

--
-- Name: departamento_id_departamento_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.departamento_id_departamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departamento_id_departamento_seq OWNER TO cfe_user;

--
-- Name: departamento_id_departamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.departamento_id_departamento_seq OWNED BY public.departamento.id_departamento;


--
-- Name: documento_pdf; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.documento_pdf (
    id_documento integer NOT NULL,
    id_curso integer NOT NULL,
    id_persona integer,
    nombre_archivo character varying(150),
    ruta_archivo text,
    fecha_generacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    tipo_pdf character varying(50)
);


ALTER TABLE public.documento_pdf OWNER TO cfe_user;

--
-- Name: documento_pdf_id_documento_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.documento_pdf_id_documento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documento_pdf_id_documento_seq OWNER TO cfe_user;

--
-- Name: documento_pdf_id_documento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.documento_pdf_id_documento_seq OWNED BY public.documento_pdf.id_documento;


--
-- Name: estatus_curso; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.estatus_curso (
    id_estatus_curso integer NOT NULL,
    nombre_estatus character varying(50) NOT NULL
);


ALTER TABLE public.estatus_curso OWNER TO cfe_user;

--
-- Name: estatus_curso_id_estatus_curso_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.estatus_curso_id_estatus_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estatus_curso_id_estatus_curso_seq OWNER TO cfe_user;

--
-- Name: estatus_curso_id_estatus_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.estatus_curso_id_estatus_curso_seq OWNED BY public.estatus_curso.id_estatus_curso;


--
-- Name: estatus_laboral; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.estatus_laboral (
    id_estatus integer NOT NULL,
    nombre_estatus character varying(50) NOT NULL
);


ALTER TABLE public.estatus_laboral OWNER TO cfe_user;

--
-- Name: estatus_laboral_id_estatus_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.estatus_laboral_id_estatus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estatus_laboral_id_estatus_seq OWNER TO cfe_user;

--
-- Name: estatus_laboral_id_estatus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.estatus_laboral_id_estatus_seq OWNED BY public.estatus_laboral.id_estatus;


--
-- Name: instructor_certificacion; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.instructor_certificacion (
    id_certificacion integer NOT NULL,
    id_persona integer NOT NULL,
    codigo_ec character varying(30),
    nombre_certificacion character varying(1000),
    organismo_certificador character varying(150),
    fecha_certificacion character varying(100),
    calificacion numeric(5,2),
    observaciones text,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.instructor_certificacion OWNER TO cfe_user;

--
-- Name: TABLE instructor_certificacion; Type: COMMENT; Schema: public; Owner: cfe_user
--

COMMENT ON TABLE public.instructor_certificacion IS 'Certificaciones EC y NIC obtenidas por cada instructor. Un instructor puede tener N certificaciones';


--
-- Name: instructor_certificacion_id_certificacion_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.instructor_certificacion_id_certificacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructor_certificacion_id_certificacion_seq OWNER TO cfe_user;

--
-- Name: instructor_certificacion_id_certificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.instructor_certificacion_id_certificacion_seq OWNED BY public.instructor_certificacion.id_certificacion;


--
-- Name: instructor_detalle; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.instructor_detalle (
    id_instructor integer NOT NULL,
    id_persona integer NOT NULL,
    curp character varying(20),
    correo_personal character varying(150),
    telefono_oficina character varying(20),
    extension character varying(10),
    celular character varying(20),
    tipo_contrato character varying(30),
    fecha_ingreso_cfe date,
    centro_trabajo character varying(100),
    domicilio_centro text,
    escolaridad character varying(50),
    carrera character varying(150),
    tipo_instructor character varying(50),
    temas_que_imparte text,
    anos_experiencia character varying(20),
    nombre_curso_formacion character varying(500),
    fecha_curso_formacion date,
    duracion_formacion character varying(30),
    calificacion_formacion numeric(5,2),
    nombre_instructor_formador character varying(150),
    instructor_homologado boolean DEFAULT false,
    instructor_alineado boolean DEFAULT false,
    fecha_alineacion character varying(50),
    duracion_alineacion character varying(30),
    calificacion_alineacion numeric(5,2),
    instructor_certificado boolean DEFAULT false,
    fecha_certificacion_instructor date,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.instructor_detalle OWNER TO cfe_user;

--
-- Name: TABLE instructor_detalle; Type: COMMENT; Schema: public; Owner: cfe_user
--

COMMENT ON TABLE public.instructor_detalle IS 'Datos específicos de instructores CFE, extiende la tabla persona en relación 1:1';


--
-- Name: instructor_detalle_id_instructor_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.instructor_detalle_id_instructor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructor_detalle_id_instructor_seq OWNER TO cfe_user;

--
-- Name: instructor_detalle_id_instructor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.instructor_detalle_id_instructor_seq OWNED BY public.instructor_detalle.id_instructor;


--
-- Name: mensaje; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.mensaje (
    id_mensaje integer NOT NULL,
    id_curso integer,
    id_tipo_mensaje integer,
    asunto character varying(150),
    contenido text,
    fecha_programada timestamp without time zone,
    estatus character varying(20) DEFAULT 'pendiente'::character varying,
    medio character varying(50),
    intentos integer DEFAULT 0,
    proximo_intento timestamp without time zone,
    fecha_envio timestamp without time zone
);


ALTER TABLE public.mensaje OWNER TO cfe_user;

--
-- Name: mensaje_destinatario; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.mensaje_destinatario (
    id_mensaje_destinatario integer NOT NULL,
    id_mensaje integer NOT NULL,
    id_persona integer NOT NULL,
    id_rol_destinatario integer,
    canal_envio character varying(30),
    estatus_envio character varying(30),
    fecha_envio timestamp without time zone,
    contacto character varying(150)
);


ALTER TABLE public.mensaje_destinatario OWNER TO cfe_user;

--
-- Name: mensaje_destinatario_id_mensaje_destinatario_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.mensaje_destinatario_id_mensaje_destinatario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mensaje_destinatario_id_mensaje_destinatario_seq OWNER TO cfe_user;

--
-- Name: mensaje_destinatario_id_mensaje_destinatario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.mensaje_destinatario_id_mensaje_destinatario_seq OWNED BY public.mensaje_destinatario.id_mensaje_destinatario;


--
-- Name: mensaje_id_mensaje_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.mensaje_id_mensaje_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mensaje_id_mensaje_seq OWNER TO cfe_user;

--
-- Name: mensaje_id_mensaje_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.mensaje_id_mensaje_seq OWNED BY public.mensaje.id_mensaje;


--
-- Name: modalidad_curso; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.modalidad_curso (
    id_modalidad integer NOT NULL,
    nombre_modalidad character varying(50) NOT NULL,
    descripcion text
);


ALTER TABLE public.modalidad_curso OWNER TO cfe_user;

--
-- Name: modalidad_curso_modalidad_curso_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.modalidad_curso_modalidad_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modalidad_curso_modalidad_curso_seq OWNER TO cfe_user;

--
-- Name: modalidad_curso_modalidad_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.modalidad_curso_modalidad_curso_seq OWNED BY public.modalidad_curso.id_modalidad;


--
-- Name: participacion_curso; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.participacion_curso (
    id_participacion integer NOT NULL,
    id_curso integer NOT NULL,
    id_persona integer NOT NULL,
    id_rol_curso integer NOT NULL,
    asistencia integer,
    calificacion numeric(5,2),
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    indicador character varying(10) DEFAULT NULL::character varying
);


ALTER TABLE public.participacion_curso OWNER TO cfe_user;

--
-- Name: participacion_curso_id_participacion_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.participacion_curso_id_participacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.participacion_curso_id_participacion_seq OWNER TO cfe_user;

--
-- Name: participacion_curso_id_participacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.participacion_curso_id_participacion_seq OWNED BY public.participacion_curso.id_participacion;


--
-- Name: persona; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.persona (
    id_persona integer NOT NULL,
    rpe character varying(20) NOT NULL,
    nombre_completo character varying(150) NOT NULL,
    correo_institucional character varying(150),
    telefono character varying(20),
    puesto character varying(100),
    plaza character varying(50),
    id_estatus_laboral integer,
    fecha_alta date DEFAULT CURRENT_DATE,
    id_departamento integer,
    sexo character varying(1),
    tipo_contrato character varying(30),
    antiguedad character varying(30),
    clave character varying(20),
    curp character varying(20),
    ubicacion character varying(20),
    area character varying(20),
    centro_costos character varying(20),
    whatsapp_autorizado character varying(20) DEFAULT 'pendiente'::character varying
);


ALTER TABLE public.persona OWNER TO cfe_user;

--
-- Name: persona_id_persona_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.persona_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_id_persona_seq OWNER TO cfe_user;

--
-- Name: persona_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.persona_id_persona_seq OWNED BY public.persona.id_persona;


--
-- Name: rol_curso; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.rol_curso (
    id_rol_curso integer NOT NULL,
    nombre_rol character varying(50) NOT NULL
);


ALTER TABLE public.rol_curso OWNER TO cfe_user;

--
-- Name: rol_curso_id_rol_curso_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.rol_curso_id_rol_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_curso_id_rol_curso_seq OWNER TO cfe_user;

--
-- Name: rol_curso_id_rol_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.rol_curso_id_rol_curso_seq OWNED BY public.rol_curso.id_rol_curso;


--
-- Name: rol_destinatario; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.rol_destinatario (
    id_rol_destinatario integer NOT NULL,
    nombre_rol character varying(50) NOT NULL
);


ALTER TABLE public.rol_destinatario OWNER TO cfe_user;

--
-- Name: rol_destinatario_id_rol_destinatario_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.rol_destinatario_id_rol_destinatario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_destinatario_id_rol_destinatario_seq OWNER TO cfe_user;

--
-- Name: rol_destinatario_id_rol_destinatario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.rol_destinatario_id_rol_destinatario_seq OWNED BY public.rol_destinatario.id_rol_destinatario;


--
-- Name: rol_usuario; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.rol_usuario (
    id_rol_usuario integer NOT NULL,
    nombre_rol character varying(50) NOT NULL
);


ALTER TABLE public.rol_usuario OWNER TO cfe_user;

--
-- Name: rol_usuario_id_rol_usuario_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.rol_usuario_id_rol_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_usuario_id_rol_usuario_seq OWNER TO cfe_user;

--
-- Name: rol_usuario_id_rol_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.rol_usuario_id_rol_usuario_seq OWNED BY public.rol_usuario.id_rol_usuario;


--
-- Name: sede; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.sede (
    id_sede integer NOT NULL,
    nombre_sede character varying(100) NOT NULL,
    sala character varying(50),
    direccion text,
    capacidad integer
);


ALTER TABLE public.sede OWNER TO cfe_user;

--
-- Name: sede_id_sede_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.sede_id_sede_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sede_id_sede_seq OWNER TO cfe_user;

--
-- Name: sede_id_sede_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.sede_id_sede_seq OWNED BY public.sede.id_sede;


--
-- Name: tipo_mensaje; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.tipo_mensaje (
    id_tipo_mensaje integer NOT NULL,
    nombre_tipo character varying(50) NOT NULL
);


ALTER TABLE public.tipo_mensaje OWNER TO cfe_user;

--
-- Name: tipo_mensaje_id_tipo_mensaje_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.tipo_mensaje_id_tipo_mensaje_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_mensaje_id_tipo_mensaje_seq OWNER TO cfe_user;

--
-- Name: tipo_mensaje_id_tipo_mensaje_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.tipo_mensaje_id_tipo_mensaje_seq OWNED BY public.tipo_mensaje.id_tipo_mensaje;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: cfe_user
--

CREATE TABLE public.usuarios (
    id_usuarios integer NOT NULL,
    id_persona integer NOT NULL,
    usuario character varying(50) NOT NULL,
    contrasena_hash text NOT NULL,
    id_rol integer NOT NULL,
    activo boolean DEFAULT true,
    ultimo_acceso timestamp without time zone
);


ALTER TABLE public.usuarios OWNER TO cfe_user;

--
-- Name: usuarios_id_usuarios_seq; Type: SEQUENCE; Schema: public; Owner: cfe_user
--

CREATE SEQUENCE public.usuarios_id_usuarios_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_usuarios_seq OWNER TO cfe_user;

--
-- Name: usuarios_id_usuarios_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfe_user
--

ALTER SEQUENCE public.usuarios_id_usuarios_seq OWNED BY public.usuarios.id_usuarios;


--
-- Name: curso id_curso; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.curso ALTER COLUMN id_curso SET DEFAULT nextval('public.curso_id_curso_seq'::regclass);


--
-- Name: departamento id_departamento; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.departamento ALTER COLUMN id_departamento SET DEFAULT nextval('public.departamento_id_departamento_seq'::regclass);


--
-- Name: documento_pdf id_documento; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.documento_pdf ALTER COLUMN id_documento SET DEFAULT nextval('public.documento_pdf_id_documento_seq'::regclass);


--
-- Name: estatus_curso id_estatus_curso; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.estatus_curso ALTER COLUMN id_estatus_curso SET DEFAULT nextval('public.estatus_curso_id_estatus_curso_seq'::regclass);


--
-- Name: estatus_laboral id_estatus; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.estatus_laboral ALTER COLUMN id_estatus SET DEFAULT nextval('public.estatus_laboral_id_estatus_seq'::regclass);


--
-- Name: instructor_certificacion id_certificacion; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.instructor_certificacion ALTER COLUMN id_certificacion SET DEFAULT nextval('public.instructor_certificacion_id_certificacion_seq'::regclass);


--
-- Name: instructor_detalle id_instructor; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.instructor_detalle ALTER COLUMN id_instructor SET DEFAULT nextval('public.instructor_detalle_id_instructor_seq'::regclass);


--
-- Name: mensaje id_mensaje; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.mensaje ALTER COLUMN id_mensaje SET DEFAULT nextval('public.mensaje_id_mensaje_seq'::regclass);


--
-- Name: mensaje_destinatario id_mensaje_destinatario; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.mensaje_destinatario ALTER COLUMN id_mensaje_destinatario SET DEFAULT nextval('public.mensaje_destinatario_id_mensaje_destinatario_seq'::regclass);


--
-- Name: modalidad_curso id_modalidad; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.modalidad_curso ALTER COLUMN id_modalidad SET DEFAULT nextval('public.modalidad_curso_modalidad_curso_seq'::regclass);


--
-- Name: participacion_curso id_participacion; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.participacion_curso ALTER COLUMN id_participacion SET DEFAULT nextval('public.participacion_curso_id_participacion_seq'::regclass);


--
-- Name: persona id_persona; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.persona ALTER COLUMN id_persona SET DEFAULT nextval('public.persona_id_persona_seq'::regclass);


--
-- Name: rol_curso id_rol_curso; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.rol_curso ALTER COLUMN id_rol_curso SET DEFAULT nextval('public.rol_curso_id_rol_curso_seq'::regclass);


--
-- Name: rol_destinatario id_rol_destinatario; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.rol_destinatario ALTER COLUMN id_rol_destinatario SET DEFAULT nextval('public.rol_destinatario_id_rol_destinatario_seq'::regclass);


--
-- Name: rol_usuario id_rol_usuario; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.rol_usuario ALTER COLUMN id_rol_usuario SET DEFAULT nextval('public.rol_usuario_id_rol_usuario_seq'::regclass);


--
-- Name: sede id_sede; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.sede ALTER COLUMN id_sede SET DEFAULT nextval('public.sede_id_sede_seq'::regclass);


--
-- Name: tipo_mensaje id_tipo_mensaje; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.tipo_mensaje ALTER COLUMN id_tipo_mensaje SET DEFAULT nextval('public.tipo_mensaje_id_tipo_mensaje_seq'::regclass);


--
-- Name: usuarios id_usuarios; Type: DEFAULT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuarios SET DEFAULT nextval('public.usuarios_id_usuarios_seq'::regclass);


--
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.curso (id_curso, clave_curso, numero_de_actividad, nombre_curso, fecha_inicio, fecha_fin, horario, incluye_alimento, id_estatus_curso, observaciones, total_horas, id_sede, id_modalidad) FROM stdin;
25	12345	ACT-2026-001	Prueba correo	2026-04-23	2026-04-24	09:00 - 17:00	t	1	\N	20	16	7
27	CAP-001	ACT-2026-001	Análisis de Riesgo en Sitio y RIM	2026-04-27	2026-05-07	9:00 a 17:00	t	1	FAVOR DE TRAER EQUIPO DE COMPUTO	500	22	7
28	CAP-002	ACT-2026-003	Trabajo en Alturas	2026-04-30	2026-05-09	9:00 a 17:00	t	1	traer equipo de computo	500	16	7
\.


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.departamento (id_departamento, nombre_departamento, clave_departamento, id_jefe_departamento) FROM stdin;
1	DISTRIBUCIÓN	\N	\N
2	ADMINISTRACION	\N	\N
3	CCC	\N	\N
4	COMERCIAL	\N	\N
5	DISTRIBUCION	\N	\N
6	JURIDICO	\N	\N
7	MEDICION	\N	\N
8	OPERACIÓN	\N	\N
9	PLANEACION	\N	\N
10	SUPERINTENDENCIA	\N	\N
11	TEMPORAL	\N	\N
12	TI	\N	\N
13	TRABAJO	\N	\N
\.


--
-- Data for Name: documento_pdf; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.documento_pdf (id_documento, id_curso, id_persona, nombre_archivo, ruta_archivo, fecha_generacion, tipo_pdf) FROM stdin;
\.


--
-- Data for Name: estatus_curso; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.estatus_curso (id_estatus_curso, nombre_estatus) FROM stdin;
1	Programado
2	En proceso
3	Completado
4	Cancelado
\.


--
-- Data for Name: estatus_laboral; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.estatus_laboral (id_estatus, nombre_estatus) FROM stdin;
1	Activo
2	Inactivo
3	Baja de trabajador
4	Cambio de adscripcion
\.


--
-- Data for Name: instructor_certificacion; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.instructor_certificacion (id_certificacion, id_persona, codigo_ec, nombre_certificacion, organismo_certificador, fecha_certificacion, calificacion, observaciones, fecha_registro) FROM stdin;
17	3	NIC	EJECUCION DEL MNTTO A LINEAS Y REDES AEREAS DE DIST EN MT Y BT	UTH	07/07/1905	90.00	\N	2026-03-17 18:41:40.538918
18	5	NIC	NIC-U/CL_031.01 EJECUCION DEL MNTTO A LINEAS Y REDES AEREAS MT Y BT	UTH	06/07/2015	90.00	\N	2026-03-17 18:41:40.538918
20	11	NIC	NIC_INTEGRACION DE EQUIPOS DE MEDICION DE EE EN BT	UTH	08/07/1905	90.00	\N	2026-03-17 18:41:40.538918
21	12	NIC	AGENTE CAPACITADOR EXTERNO	STPS	29/09/2014	80.00	\N	2026-03-17 18:41:40.538918
22	14	NIC	ELABORACION DE PRESENTACIONES GRAFICAS MEDIANTE HERRAMIENTAS DE COMPUTO, ELABORACION DE DOCUMENTOS MEDIANTE UN PROCESADOR DE TEXTOS	CONOCER	05/07/1905	90.00	\N	2026-03-17 18:41:40.538918
23	16	NIC	NIC_EJECUCION DEL MNTTO A REDES Y LINEAS SUBTERRANEAS DE DIST., NIC_ELABORACION DE LIBROS MEDIANTE EL USO DE PROCESADORES DE HOJA DE CALCULO	UTH, CONOCER	2014, 2013	90.00	\N	2026-03-17 18:41:40.538918
24	19	NIC	NIC_EJECUCION DEL MNTTO A LINEAS Y REDES AEREAS DE DIST EN MT Y BT	UTH	06/07/2015	80.00	\N	2026-03-17 18:41:40.538918
25	20	NIC	*NIC_U/CO_001.01 ELABORACION DE PROPUESTAS DE AHORRO DE ENERGIA                                                                                                          *ELABORACION DE DOCUMENTOS MEDIANTE UN PROCESADOR DE TEXTOS	UTH	*01/08/2015              *16/08/2013	90.00	\N	2026-03-17 18:41:40.538918
26	28	NIC	ESOL INTERNATIONAL CERTIFICATE IN ADVANCE ENGLISH	UNIVERISTY OF CAMBRIDGE	05/07/1905	80.00	\N	2026-03-17 18:41:40.538918
27	31	NIC	ELABORACION DE PRESENTACIONES GRAFICAS MEDIANTE HERRAMIENTAS DE COMPUTO	CONOCER	29/11/2013	90.00	\N	2026-03-17 18:41:40.538918
28	32	NIC	ELABORACION DE DOCUMENTOS MEDIANTE UN PROCESADOR DE TEXTOS	UTH	06/07/1905	90.00	\N	2026-03-17 18:41:40.538918
29	33	NIC	ELABORACION DE DOCUMENTOS MEDIANTE UN PROCESADOR DE TEXTOS, DISEÑO E IMPARTICION DE CURSOS	CONOCER	05/07/1905	90.00	\N	2026-03-17 18:41:40.538918
30	41	NIC	NIC_FACTURACION DE LA EE CONSUMIDA	UTH	06/07/1905	90.00	\N	2026-03-17 18:41:40.538918
31	42	NIC	NIC_EJECUCION DEL MNTTO A LINEAS Y REDES SUBT DE DIST, NIC_ELABORACION DE PROPUESTAS DE AHORRO DE EE,                 ELABORACION DE DOCUMENTOS MEDIANTE UN PROCESADOR DE TEXTOS	UTH, CONOCER	2015, 2013	90.00	\N	2026-03-17 18:41:40.538918
32	43	NIC	NIC_U/CL_029.02 INTEGRACION DE EQUIPOS DE MEDICION DE EE EN BT	UTH	30/09/2016	97.00	\N	2026-03-17 18:41:40.538918
33	45	NIC	COMP. EN CERTIF. ELAB. DE LIB. MED. EL USO DE PROC. DE HOJA DE CALC.             COMP. EN PROGRAMA DE AHORRO DE ENERGIA NIC-U/CO_001.01                             CERTIF IMPARTICIÓN DE CURSOS DE MANERA PRESENCIAL GRUPAL NIC_EC0217	CONOCER  Y UTH	09/08/2013         18/02/2014                   2025	80.00	\N	2026-03-17 18:41:40.538918
34	45	EC0217.01	Imparticion de cursos de capacitacion	\N	\N	\N	\N	2026-03-17 18:41:40.538918
35	51	NIC	SOPORTE VITAL BASICO (AHA)	AMERICAN HEART ASOCIATION	09/07/1905	90.00	\N	2026-03-17 18:41:40.538918
36	55	NIC	NIC_EJECUCION DEL PROCESO DE SUMINISTRO DE EE EN SERVICIOS DE BT	UTH	07/07/1905	90.00	\N	2026-03-17 18:41:40.538918
37	57	NIC	GENETICA EMPRESARIAL SC, DIPLOMADO DE LA ESPECIALIDAD EN EL AREA COMERCIAL	CONOCER, CECAL	2006, 2011	90.00	\N	2026-03-17 18:41:40.538918
38	67	NIC	FORMACION DE CAPITAL HUMANO DE MANERA PRESENCIAL GRUPAL, NIC_ATENCION TELEFONICA A CLIENTES DEL SERVICIO DE EE, ELABORACION DE DOCUMENTOS MEDIANTE UN PROCESADOR DE TEXTOS, ELABORACION DE PRESENTACIONES GRAFICAS, ATENCION TELEFONICA AL CLIENTE DE SUMINISTRO BASICO DE EE	CONOCER, UTH	2021, 2014, 2012, 2013, 2017	90.00	\N	2026-03-17 18:41:40.538918
39	68	NIC	ELABORACION DE PRESENTACIONES GRAFICAS MEDIANTE HERRAMIENTAS DE COMPUTO	CONOCER	05/07/1905	90.00	\N	2026-03-17 18:41:40.538918
40	73	NIC	NIC_ELABORACION DE PRESENTACIONES GRAFICAS MEDIANTE HERRAMIENTAS DE COMPUTO, NIC_ELABORACION DE PROPUESTAS DE AHORRO DE ENERGIA ELECTRICA EN LOS ESPACIOS FAMILIAR Y LABORAL	CONOCER, UTH	2013 Y 2014	90.00	\N	2026-03-17 18:41:40.538918
41	73	EC0217.01	Imparticion de cursos de capacitacion	\N	\N	\N	\N	2026-03-17 18:41:40.538918
42	73	EC0076	Evaluacion de la competencia de candidatos	\N	\N	\N	\N	2026-03-17 18:41:40.538918
43	74	NIC	NIC_EJECUCION DEL MNTTO A LINEAS Y REDES AEREAS DE DIST EN MT Y BT	UTH	07/07/1905	90.00	\N	2026-03-17 18:41:40.538918
44	85	NIC	IMPARTICION DE CURSOS DE CAPACITACION PRESENCIALES	CONOCER	01/07/1905	90.00	\N	2026-03-17 18:41:40.538918
45	86	NIC	NIC_TOMA DE LECTURAS DE ENERGIA ELECTRICA EN SERVICIOS DE BAJA Y MEDIA TENSION	UTH	06/07/1905	90.00	\N	2026-03-17 18:41:40.538918
46	91	NIC	NIC_INTEGRACION DE EQUIPOS DE MEDICION DE EE EN BT	UTH	08/07/1905	96.00	\N	2026-03-17 18:41:40.538918
47	93	NIC	FORMACION DE PSICOLOGOS			\N	\N	2026-03-17 18:41:40.538918
48	96	NIC	CLAVE DE AGENTE CONTRATANTE	GERENCIA DE ABASTECIMIENTOS	01/02/2021	90.00	\N	2026-03-17 18:41:40.538918
64	101	NIC	G	\N	2026-03-12	\N	\N	2026-03-30 16:40:27.10058
65	101	EC0217.01	Imparticion de cursos de capacitacion y asistencia educativa	\N	\N	\N	\N	2026-03-30 16:40:27.10058
66	101	EC1307	Herramientas digitales	\N	\N	\N	\N	2026-03-30 16:40:27.10058
\.


--
-- Data for Name: instructor_detalle; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.instructor_detalle (id_instructor, id_persona, curp, correo_personal, telefono_oficina, extension, celular, tipo_contrato, fecha_ingreso_cfe, centro_trabajo, domicilio_centro, escolaridad, carrera, tipo_instructor, temas_que_imparte, anos_experiencia, nombre_curso_formacion, fecha_curso_formacion, duracion_formacion, calificacion_formacion, nombre_instructor_formador, instructor_homologado, instructor_alineado, fecha_alineacion, duracion_alineacion, calificacion_alineacion, instructor_certificado, fecha_certificacion_instructor, fecha_registro) FROM stdin;
43	3	FAAA850320HCSSRL06	melanifr@outlook.es	(55)52294400	18916	5540262142	SINDICALIZADO	2004-12-16	TULYEHUALCO	BELISARIO DOMINGUEZ 83 COL. SANTIAGO TULYEHUALCO C.P. 16700 XOCHIMILCO CD MX	BACHILLERATO	\N	ALTO RIESGO	TRABAJOS EN LINEAS ENERGIZADAS 3A ETAPA (AISLADO SOBRE AISLADO, MANEJO Y OPERACIÓN DE GRUA,  MANUAL DE POLITICAS, CRITERIOS Y LINEAMIENTOS PARA LA GESTION DE LICENCIAS EN GIL, OPERACION Y MANEJO DE RESTAURADORES, SECCIONADORES, TRANSFORMADORES, REGULADORES, BANCO DE CAPACITORES, INSTALACION Y CONEXION DE CUCHILLAS MONOPOLARES, EQUIPO ELECTRICO EN LV, TOPOLOGIA DE REDES DE AT, SISTEMA DE PRODUCTIVIDAD CFECAD, SIAD), INSPECCION Y MNTTO A LINEAS Y REDES ENERGIZADAS 2A ETAPA, CONTROLES PRIORITARIOS (TA,AA,AQSV), BASICO DE LINIERO	5 AÑOS	FORMACION DE INSTRUCTORES	2015-10-19	32 HRS	95.00	GUADALUPE ZAZUETA MORALES	t	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
44	4	RUDA850302HOCDZL08	\N	(55)52294400	18990	5534359301	SINDICALIZADO	2007-12-04	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	INGENIERO ELECTRICO	ADMINISTRATIVO	INTEGRACION DE AJUSTES, ANALISIS FASORIAL, PRUEBAS A EQUIPOS DE MEDICION, ENERGIAS RENOVABLES	5 AÑOS	FORMACION DE INSTRUCTORES	2018-04-02	40 HRS	85.00	XIPATLI LARA NAVA	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
45	5	OIHA740627HDFRRL01	Alonso_oliortiz@hotmail.es	(55)52294400	18942	(99)32771514	SINDICALIZADO	2009-12-07	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardines del sur,Delegacion Xochimilco C.P.16050,CDMX	BACHILLERATO	MECANICA	ALTO RIESGO	BASICO DE LINIERO	13 AÑOS	FORMACION DE INSTRUCTORES	2016-06-20	40 HRS	90.00	JORGE MENDOZA CAÑAS Y SERGIO ESTRELLA SEGURA	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
46	6	TOGA890416MDFRNZ05	\N	(55)52294400	18942	5539050533	CONFIANZA	2012-07-02	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	INGENIERIA INDUSTRIAL EN PRODUCCION	ADMINISTRATIVO	PROGRAMA DE MEJORA DE ACTITUDES	5 AÑOS	FORMACION DE INSTRUCTORES	2018-11-26	40 HRS	90.00	VICTOR MANUEL PEREZ SANCHEZ	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
48	8	COCB860102HSLTTR04	\N	(55)52294400	18916	55 2239 9469	CONFIANZA	2010-10-08	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	INGENIERIA INDUSTRIAL	ADMINISTRATIVO	MANTENIMIENTO A LINEAS Y REDES DE DISTRIBUCION	5 AÑOS	FORMACION DE INSTRUCTORES	2014-08-11	37 HRS	90.00	EDGAR RODRIGUEZ MADRID	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
49	9	\N	\N	\N	\N	\N	CONFIANZA	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	FORMACION DE INSTRUCTORES	2024-07-19	\N	\N	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
50	10	\N	sarabiocamachocandido@yahoo.com	5552294400	19010	5529222333	CONFIANZA	\N	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	MAESTRIA	DERECHO	ADMINISTRATIVO	ACTAS ADMINISTRATIVAS, LEY DE LA INDUSTRIA ELECTRICA Y SU REGLAMENTO, LEY DEL SERVICIO PUBLICO DE EE, RESPONSABILIDADES DE LOS SERVIDORES PUBLICOS	10 AÑOS	FORMACION DE INSTRUCTORES	2012-02-20	40 HRS	90.00	GABRIEL DIAZ Y OLMEDO	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
51	11	AUGC740824HSLGSR08	\N	(55)52294400	18988	55 2233 7363	SINDICALIZADO	2000-01-10	COAPA	Ejido No 10 col. Las peritas Del. Xochimilco c.p. 16010	LICENCIATURA	ING. ELECTRICISTA	ADMINISTRATIVO	CALIBRACION DE MEDIDORES DE ESTADO SOLIDO CON TRANSFORMADORES DE INSTRUMENTO EN LABORATORIO Y EN CAMPO, VERIFICACION  Y CALIBRACION DE MEDIDORES	12 AÑOS	FORMACION DE INSTRUCTORES	2013-07-01	40 HRS	95.00	VERONICA MORALES RAMOS	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
52	12	GOJC840808HJCNMR01	carcfec@hotmail.com	(55)52294400	18946	5619948847	SINDICALIZADO	2010-01-11	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardine del sur,Delegacion Xochimilco C.P.16050,CDMX	MAESTRIA EN ADMINISTRACION DE LA SEG E HIG	ING. INDUSTRIAL	ALTO RIESGO	PRIMEROS AUXILIOS, PREVENCION DE INCENDIOS Y COMBATE DE FUEGO, GIRD PROTECCION CIVIL, ARS Y RIM, CONTROLES PRIORITARIOS, SUPERVISIONES EFECTIVAS,INVESTIGACION DE ACCIDENTES, PROGRAMA DE MEJORA DE ACTITUDES	12 AÑOS	FORMACION DE INSTRUCTORES	2012-02-20	40 HRS	95.00	GABRIEL DIAZ Y OLMEDO	f	f	11/03/2025-14/03/2025	\N	\N	f	\N	2026-03-17 18:41:40.538918
53	13	\N	\N	\N	\N	\N	SINDICALIZADO	\N	\N	\N	\N	\N	ALTO RIESGO	\N	\N	\N	\N	\N	\N	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
54	14	RUNC790619MDFZNR02	caritocyrjg@gmail.com	(55)52294400	18908	5514837630	SINDICALIZADO	2010-01-27	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	BACHILLERATO	TECNICO EN CONTABILIDAD	ADMINISTRATIVO	TESORERIA	12 AÑOS	FORMACION DE INSTRUCTORES	2022-03-28	40 HRS	71.00	MARIA F SABIDO PEDRAZA	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
55	15	GODC780322HPLNRR01	\N	(55)52294400	\N	\N	SINDICALIZADO	1997-03-26	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	\N	\N	ALTO RIESGO	BASICO DE LINIERO	5 AÑOS	FORMACION DE INSTRUCTORES	2016-06-20	40 HRS	84.00	JORGE MENDOZA CAÑAS Y SERGIO ESTRELLA SEGURA	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
56	16	VAVC781126HDFRRR00	\N	(55)52294400	\N	5546172526	SINDICALIZADO	2010-09-13	CABECERA DE ZONA COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	BACHILLERATO	\N	ALTO RIESGO	MANTENIMIENTO A LINEAS Y REDES SUBTERRANEAS	5 AÑOS	FORMACION DE INSTRUCTORES	2013-09-30	40 HRS	80.00	EDGAR RODRIGUEZ MADRID	t	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
57	17	\N	\N	\N	\N	\N	CONFIANZA	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	\N	\N	\N	\N	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
58	18	VEBD871010HSLXJV03	David.vea10@gmail.com	(55)54819200	18930	(55)1915726	CONFIANZA	2010-05-17	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardines del sur,Delegacion Xochimilco C.P.16050,CDMX	LICENCIATURA	ING ELECTRONICA	ADMINISTRATIVO	MANEJO Y OPERACIÓN DE UTR,PROTOCOLO DNP 3.0,REDES CONVERGENTES,COMUNICACIONES BASICO,COMUNICACIONES AVANZADOS,MODULO SAID,PLANES DE TRABAJO ,COMUNICACIONES Y CONTROL AVANZADO,MANEJO Y OPERACIÓN DE EQUIPO VHF UHF	5 AÑOS	FORMACION DE INSTRUCTORES	2019-06-28	40 HRS	90.00	XIPATLI LARA NAVA	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
59	19	PEDE770822HBCRMD09	Edgarpreciado36@gmail.com	(55)52294400	\N	(55)86869554	SINDICALIZADO	1997-02-18	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardine del sur,Delegacion Xochimilco C.P.16050,CDMX	SECUNDARIA	\N	ALTO RIESGO	CONTROLES PRIORITARIOS (TA,AA,AQSV),ANALISIS DE RIESGOS EN SITIO Y RIM, TRABAJOS EN LINEAS ENERGIZADAS, AISLADO SOBRE AISLADO	5 AÑOS	FORMACION DE INSTRUCTORES	2015-05-04	40 HRS	96.00	GABRIEL DIAZ Y OLMEDO	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
60	20	OUAE741029HPLLVD04	eolguin_avila@hotmail.com	(55)52294400	18916	5543278582	SINDICALIZADO	2010-12-20	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardine del sur,Delegacion Xochimilco C.P.16050,CDMX	BACHILLERATO	\N	ALTO RIESGO	BASICO DE LINEAS Y REDES SUBTERRANEAS, ELABORACION DE EMPALMES Y ACCESORIOS, PRUEBAS A CABLES Y EQUIPOS SUBTERRANEOS, MNTTO A LINEAS SUBTERRANEAS	12 AÑOS	FORMACION DE INSTRUCTORES	2012-09-17	40 HRS	88.00	VERONICA MORALES Y XIPATLI LARA NAVA	f	f	08/04/2025-11/04/2025	\N	\N	f	\N	2026-03-17 18:41:40.538918
61	21	AALE840513HCMYPD08	\N	(55)52294400	\N	\N	CONFIANZA	2010-12-20	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	FORMACION DE INSTRUCTORES	2014-02-24	40 HRS	\N	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
62	22	AUCE780620HVZGRL02	\N	(55)52294400	18926	5563477988	SINDICALIZADO	2010-05-21	COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardines del sur,Delegacion Xochimilco C.P.16050,CDMX	LICENCIATURA	INGENIERO ELECTROMECANICO	ADMINISTRATIVO	ELABORACION DE PROGRAMA DE MANTENIMIENTO DE DISTRIBUCION	5 AÑOS	FORMACION DE INSTRUCTORES	2015-04-06	40 HRS	97.00	GUADALUPE ZAZUETA MORALES	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
63	23	VIFE740924MJCLLR09	\N	(55)52294400	19051	5586176941	SINDICALIZADO	2010-03-01	NORIA	Felipe Angeles S/N Col.La Noria C.P.16030	LICENCIATURA	CIRUJANO DENTISTA	ADMINISTRATIVO	CCC	10 AÑOS	FORMACION DE INSTRUCTORES	2015-05-04	40 HRS	97.00	GABRIEL DIAZ Y OLMEDO	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
64	24	COME770306HPLRRS08	\N	(55)52294400	19051	5537061578	SINDICALIZADO	2002-02-15	NORIA	Ejido No 10 col. Las peritas Del. Xochimilco c.p. 16010	BACHILLERATO	TECNICO EN ELECTRICIDAD INDUSTRIAL	ADMINISTRATIVO	CCC	5 AÑOS	FORMACION DE INSTRUCTORES	2017-04-03	40 HRS	75.00	EDGAR RODRIGUEZ MADRID	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
65	25	GAGF851121HPLRLR00	\N	(55)52294400	\N	\N	CONFIANZA	2012-06-11	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	FORMACION DE INSTRUCTORES	2019-03-25	40 HRS	90.00	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
66	26	VAQF780923HDFLNR01	fervallejoq@yahoo.com.mx	(55)52294400	18940	5559663524	SINDICALIZADO	2010-09-13	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	INGENIERO ELECTRICO ELECTRONICO	ADMINISTRATIVO	ELECTRICIDAD Y MAGNETISMO, ALGEBRA ELEMENTAL, INTRODUCCION A LA METROLOGIA, ESTUDIO DE CORTO CIRCUITO, ESTUDIO DE FLUJO DE POTENCIA, ANALISIS FASORIAL, ELECTRICIDAD BASICA	5 AÑOS	FORMACION DE INSTRUCTORES	2013-07-01	40 HRS	90.00	VERONICA MORALES RAMOS	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
67	27	CUVF930514HDFRRR01	Pakoiio1405@gmail.com	(55)52294400	\N	(55)43931095	SINDICALIZADO	2011-07-11	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardines del sur,Delegacion Xochimilco C.P.16050,CDMX	SECUNDARIA	\N	ALTO RIESGO	CONTROLES PRIORITARIOS (TA,AA,AQSV)	5 AÑOS	FORMACION DE INSTRUCTORES	2022-07-29	40 HRS	85.00	MANUEL ALEJANDRO ALTAMIRANO JIMENEZ	t	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
68	28	DECF780916HDFLHR02	pacochong@yahoo.com	(55)53342380	18929	(55)38952580	SINDICALIZADO	2010-06-18	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardine del sur,Delegacion Xochimilco C.P.16050,CDMX	LICENCIATURA	INGENERIA CIVIL	ADMINISTRATIVO	ENSEÑANZA DEL IDIOMA INGLES	9 AÑOS	FORMACION DE INSTRUCTORES	2013-04-19	40 HRS	95.00	VERONICA MORALES RAMOS	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
69	29	LIOF821220HMCXCR00	\N	(55)52294400	19051	5524063371	CONFIANZA	2010-11-08	NORIA	Ejido No 10 col. Las peritas Del. Xochimilco c.p. 16010	LICENCIATURA	INGENIERO MECANICO ELECTRICISTA	ADMINISTRATIVO	SICOSS, COMPROMISOS DE SERVICIO Y SUMINISTRO	5 AÑOS	FORMACION DE INSTRUCTORES EN LA NIC	2021-06-28	40 HRS	90.00	GUADALUPE ZAZUETA MORALES	f	f	21/04/2025-24/04/2025	\N	\N	f	\N	2026-03-17 18:41:40.538918
70	30	ROLF810103HMNDPR06	\N	(55)52294400	\N	\N	CONFIANZA	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	FORMACION DE INSTRUCTORES	2015-06-08	40 HRS	94.00	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
71	31	JECG810701HVZSLR08	\N	(55)52294400	\N	5612081356	CONFIANZA	2008-07-25	COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardine del sur,Delegacion Xochimilco C.P.16050,CDMX	LICENCIATURA	INGENIERO ELECTRICO	ADMINISTRATIVO	REPARACIONES ELECTRICAS	5 AÑOS	FORMACION DE INSTRUCTORES	2022-09-28	24 HRS	97.00	JOSE ANTONIO RUVALCABA LOPEZ	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
72	32	REGH770330MMCYLL01	hilrega@hotmail.com	(55)54819200	18969	(55)79637845	SINDICALIZADO	2010-05-31	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardine del sur,Delegacion Xochimilco C.P.16050,CDMX	MAESTRIA	ADMINISTRACION DE NEGOCIOS	ADMINISTRATIVO	HERRAMIENTAS DE COMPUTO(EXCEL INTERMEDIO),PROCESADOR DE TEXTOS(WORD BASICO),EXCEL AVANZADO,PRESENTACIONES EJECUTIVAS EN POWER POINT, PRIMEROS AUXILIOS	12 AÑOS	FORMACION DE INSTRUCTORES	2018-11-30	40 HRS	96.00	VICTOR M PEREZ SANCHEZ	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
73	33	AEOH791019HOCRLG04	\N	(55)52294400	18928	5546502826	CONFIANZA	2011-02-28	ZONA COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	INGENIERIA ELECTRICA	ADMINISTRATIVO	MANEJO DE RESIDUOS PELIGROSOS, PRUEBAS A EQUIPO ELECTRICO, SIG, CODIGO DE RED, GESTION DE LICENCIAS	5 AÑOS	FORMACION DE INSTRUCTORES	2008-02-21	40 HRS	90.00	CONOCER	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
74	34	DODH850621HYNRRG07	\N	(55)52294400	19008	5518001969	SINDICALIZADO	2010-03-29	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	BACHILLERATO	\N	ADMINISTRATIVO	SIAD MODULO DE ATENCION DE SOLICITUDES Y CONSTRUCCION DE OBRAS, SIAD MODULO DE PRESUPUESTO E INVERSIONES, SISTEMA DE ADMINISTRACION DE DISTRIBUCION SIAD, CALIDAD EN EL SERVICIO	5 AÑOS	FORMACION DE INSTRUCTORES	2015-04-06	40 HRS	98.00	GUADALUPE ZAZUETA MORALES	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
75	35	VELI791227HGTLRN04	INTYOMAR@GMAIL.COM	(55)52294400	\N	5585757811	SINDICALIZADO	2001-08-06	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	SECUNDARIA	\N	ALTO RIESGO	RESCATE DE LINIERO ACCIDENTADO	5 AÑOS	FORMACION DE INSTRUCTORES	2016-09-19	40 HRS	90.00	JORGE MENDOZA CAÑAS	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
76	36	FODI840919MBSLRR05	\N	(55)52294400	\N	\N	SINDICALIZADO	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	FORMACION DE INSTRUCTORES	2015-05-04	40 HRS	98.00	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
77	37	\N	\N	\N	\N	\N	CONFIANZA	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	\N	\N	\N	\N	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
78	38	HESI720912HMCRNS00	\N	(55)52294400	\N	5514963759	SINDICALIZADO	2010-08-11	COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardine del sur,Delegacion Xochimilco C.P.16050,CDMX	SECUNDARIA	\N	ALTO RIESGO	RESCATE DE LINIERO ACCIDENTADO	5 AÑOS	FORMACION DE INSTRUCTORES	2022-03-28	40 HRS	76.00	MARIA F SABIDO PEDRAZA	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
79	39	REBJ771021HDFYRM07	\N	(55)52294400	\N	\N	CONFIANZA	2010-12-13	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	FORMACION DE INSTRUCTORES	2015-11-09	40 HRS	84.00	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
80	40	REIJ800521HDFYSV05	jrimx@yahoo.com.mx	(55)52294400	\N	5537311802	SINDICALIZADO	2010-05-10	NORIA	Ejido No 10 col. Las peritas Del. Xochimilco c.p. 16010	LICENCIATURA	DISEÑO GRAFICO	ADMINISTRATIVO	CCC	5 AÑOS	FORMACION DE INSTRUCTORES	2018-01-29	40 HRS	86.00	VICTOR MANUEL PEREZ SANCHEZ	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
81	41	CANJ841202HMNHVS07	jchn_itj@hotmail.com	(55)53342380	18967	(55)31176693	SINDICALIZADO	2010-01-27	ZONA COAPA	Justo Sierra 9, Barrio San Pedro, C.P.19030,Xochimilco,CDMX	LICENCIATURA	LICENCIATURA EN ADMINISTRACION	ADMINISTRATIVO	FACTURACION,SICOM,SICOSS,TARIFAS ELECTRICAS,AJUSTES A LA FACTURACION,ESTRUCTURACION DE CICLOS Y RUTAS COMBATE CONTRA INCENDIOS	12 AÑOS	FORMACION DE INSTRUCTORES	2022-04-01	40 HRS	82.00	MARIA F SABIDO PEDRAZA	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
82	42	GAHJ740318HDFLRS09	\N	(55)52294400	18928	5529403739	SINDICALIZADO	2010-05-10	TULYEHUALCO	BELISARIO DOMINGUEZ 83 COL. SANTIAGO TULYEHUALCO C.P. 16700 XOCHIMILCO CD MX	BACHILLERATO	\N	ALTO RIESGO	BASICO DE LINIERO (CAP 100, MANEAS, ELECTRICIDAD BASICA, FISICA, NUDOS, ASCENSO Y DESCENSO, GRUAS, CATALOGO DE EQUIPO Y HERRAMIENTAS, CATALOGO DE MATERIALES, ESPECIFICACIONES, CODIGO DE RED, GIL, ALEN 3D, ROMEPCARGAS, EUQIPO DE PUESTA A TIERRA, RESCATE DE LINIERO, IDENTIFICACION DE EQUIPOS DE SE, ESPACIOS CONFINADOS, RESIDUOS PELIGROSOS, DETECCION DE FALLAS EN LAS RGD AEREAS), TRABAJOS EN LINEAS ENEGIZADAS LV 3A ETAPA	5 AÑOS	FORMACION DE INSTRUCTORES	2018-02-26	40 HRS	74.00	GUADALUPE ZAZUETA MORALES	t	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
127	87	\N	\N	\N	\N	\N	CONFIANZA	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	FORMACION DE INSTRUCTORES	2023-10-30	40 HRS.	84.00	SAMUEL DOMINGUEZ BECERRIL	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
83	43	MOGJ841225HVZRRS00	jesus.mora01@outlook.com	(55)52294400	18989	(55)43134002	CONFIANZA	2008-04-14	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardine del sur,Delegacion Xochimilco C.P.16050,CDMX	LICENCIATURA	INGENIERIA ELECTROMECANICA	ADMINISTRATIVO	ANALISIS DE FALLAS EN EQUIPOS DE MEDICION,ANALISIS FASORIAL,TRANSFORMADORES DE MEDIDA (TCs y TPs),TOMA DE LECTURA TARIFA GDMTH(HM-73),ESPECIFICACIONES PARA SERVICIOS NUEVOS MT,CALIBRACION DE EQUIPOS DE MEDICION ELECTROMECANICO Y DE ESTADO SOLIDO, TARIFAS ELECTRICAS	5 AÑOS	FORMACION DE INSTRUCTORES	2015-04-06	40 HRS	98.00	GUADALUPE ZAZUETA MORALES	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
84	44	ZUAJ861018HGRXGS09	\N	(55)52294400	\N	5545810114	SINDICALIZADO	\N	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	EDUCACION SECUNDARIA CON ESPECIALIDAD EN ESPAÑOL	ALTO RIESGO	ORTOGRAFIA Y REDACCION	5 AÑOS	FORMACION DE INSTRUCTORES	2022-07-25	40 HRS	90.00	MANUEL ALEJANDRO ALTAMIRANO JIMENEZ	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
85	45	FUBJ760217HDFNRS00	jesussfb1@hotmail.com	(55)52294400	18917	5514845762	SINDICALIZADO	2010-05-10	CABECERA DE ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardines del sur,Delegacion Xochimilco C.P.16050,CDMX	LICENCIATURA	ING  COMUNICACIONES Y ELECTRONICA	ADMINISTRATIVO	HERRAMIENTAS DE COMPUTO(EXCEL BASICO, INTERMEDIO, AVANZADO),PROCESADOR DE TEXTOS(WORD BASICO),PRESENTACIONES EJECUTIVAS EN POWER POINT	12 AÑOS	FORMACION Y CERTIFICACION DE INSTRUCTORES	2012-02-20	40 HRS	90.00	GABRIEL DIAZ Y OLMEDO	f	t	25/03/2025-28/03/2025	\N	\N	t	2025-12-05	2026-03-17 18:41:40.538918
86	46	\N	\N	\N	\N	\N	SINDICALIZADO	\N	\N	\N	\N	\N	ALTO RIESGO	\N	\N	FORMACION DE INSTRUCTORES	2024-07-19	\N	\N	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
87	47	AASA800405HOCLNN06	\N	(55)52294400	\N	5512794247	SINDICALIZADO	2008-05-26	NORIA	Ejido No 10 col. Las peritas Del. Xochimilco c.p. 16010	LICENCIATURA	INGENIERO MECANICO	ADMINISTRATIVO	PRUEBAS A EQUIPO ELECTRICO	5 AÑOS	FORMACION DE INSTRUCTORES	2015-04-06	40 HRS	99.00	GUADALUPE ZAZUETA MORALES	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
88	48	VARA770611HMNCDN03	\N	(55)52294400	\N	5568724274	SINDICALIZADO	2010-03-28	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	COMERCIO INTERNACIONAL	ALTO RIESGO	RESCATE DE LINIERO ACCIDENTADO	5 AÑOS	FORMACION DE INSTRUCTORES	2015-04-06	40 HRS	95.00	GUADALUPE ZAZUETA MORALES	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
89	49	\N	\N	\N	\N	\N	CONFIANZA	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	\N	\N	\N	\N	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
90	50	MIAF811029HDFLLR05	PACOMILLARESALVAREZ@GMAIL.COM	(55)52294400	18974	5529005581	SINDICALIZADO	2010-01-27	JUSTO SIERRA	Justo Sierra 9, Barrio San Pedro, C.P.19030,Xochimilco,CDMX	BACHILLERATO	\N	ALTO RIESGO	TOMA DE LECTURAS	5 AÑOS	FORMACION DE INSTRUCTORES	2015-11-23	40 HRS	80.00	JOSE ANTONIO RUVALCABA	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
91	51	MOAF720401HDFNVR03	francisco.monteroa@hotmail.com	(55)52294400	EXT	5529444633	SINDICALIZADO	2011-11-17	LA NORIA	Ejido No 10 col. Las peritas Del. Xochimilco c.p. 16010	LICENCIATURA	SISTEMAS DE COMPUTACION ADMINISTRATIVA	ALTO RIESGO	PRIMEROS AUXILIOS, BRIGADAS EVACUACION DE INSTALACIONES, BUSQUEDA Y RESCATE, CATALOGO DE EQUIPO Y HERRAMIENTA, CORTES Y RECONEXIONES DE SERVICIOS DE POSTE,IMPACTO AMBIENTAL, INFRAESTRUCTURA DE MEDICION AVANZADA, LINIERO CCC, LINIERO HOMBRE SOLO, MANEJO DE TERMINAL PORTATIL CCC, MANIOBRAS EN ACOMETIDAS DE BT	8 AÑOS	FORMACION DE INSTRUCTORES	2014-12-08	35 HRS	90.00	GUADALUPE ZAZUETA MORALES	t	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
92	52	\N	\N	\N	\N	\N	CONFIANZA	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	\N	\N	\N	\N	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
93	53	MANM830530HQTLVN03	\N	(55)52294400	\N	\N	SINDICALIZADO	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	FORMACION DE INSTRUCTORES	2016-06-20	40 HRS	96.00	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
94	54	RAPM910602HTSNCR00	mario_cfe91@hotmail.com	(55)52294400	18990	(55)35063008	SINDICALIZADO	2010-06-24	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardine del sur,Delegacion Xochimilco C.P.16050,CDMX	LICENCIATURA EN CURSO	INGENERIA INDUSTRIAL EN PRODUCCION	ALTO RIESGO	VERIFICADOR CALIBRADOR I	2 AÑOS	FORMACION DE INSTRUCTORES	2022-03-28	40 HRS	81.00	MARIA F SABIDO PEDRAZA	t	f	25/03/2025-28/03/2025	\N	\N	f	\N	2026-03-17 18:41:40.538918
95	55	TEMJ850808HMNJNN00	\N	(55)52294400	19050	5577352550	SINDICALIZADO	2010-03-28	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	BACHILLERATO	TECNICO EN INFORMATICA	ALTO RIESGO	MNTTO A LINEAS Y REDES AEREAS	5 AÑOS	FORMACION DE INSTRUCTORES EN LA NIC	2021-06-28	40 HRS	82.00	GUADALUPE ZAZUETA MORALES	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
96	56	CEGJ811126MGTRLN02	\N	(55)52294400	\N	\N	CONFIANZA	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	FORMACION DE INSTRUCTORES	2013-01-28	40 HRS	85.00	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
97	57	FIMK830306MGRGRR02	karlavfigueroam@gmail.com	(55)54819200	18954	(55)1012852	SINDICALIZADO	2010-03-22	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardines del sur,Delegacion Xochimilco C.P.16050,CDMX	LICENCIATURA	INFORMATICA	ADMINISTRATIVO	FACTURACION ,TARIFAS DE DISTRIBUCION,INTEGRACION Y ANALISIS DE AJUSTES,ESTRUCTURACION DE CICLOS Y RUTAS,SICOM	12 AÑOS	FORMACION DE INSTRUCTORES	2022-03-28	40 HRS	83.00	MARIA F SABIDO PEDRAZA	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
98	58	HEML831219MMNRCL04	\N	(55)52294400	18965	5549128009	SINDICALIZADO	2010-01-27	JUSTO SIERRA	Justo Sierra 9, Barrio San Pedro, C.P.19030,Xochimilco,CDMX	LICENCIATURA	ADMINISTRACION	ADMINISTRATIVO	TRABAJO EN EQUIPO	5 AÑOS	FORMACION DE INSTRUCTORES	2019-03-15	40 HRS	83.00	VICTOR MANUEL PEREZ SANCHEZ	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
99	59	\N	\N	\N	\N	\N	CONFIANZA	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	FORMACION DE INSTRUCTORES	2023-10-30	\N	\N	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
100	60	IACL860411HSLBNS07	\N	(55)52294400	19001	5551015332	SINDICALIZADO	2009-12-16	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	INGENIERIA ELECTRICA	ADMINISTRATIVO	SIGED, DEPRORED	5 AÑOS	FORMACION DE INSTRUCTORES	2019-11-11	40 HRS	95.00	GUADALUPE ZAZUETA MORALES	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
101	61	UXBL841016HYNCLS03	\N	(55)52294400	19001	5514350300	SINDICALIZADO	2008-03-25	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	INGENIERIA INDUSTRIAL	ADMINISTRATIVO	NORMAS DE REDES AEREAS	5 AÑOS	FORMACION DE INSTRUCTORES	2012-09-17	40 HRS	93.00	VERONICA MORALES RAMOS	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
102	62	GAPL820513HMNRXS00	\N	(55)52294400	19093	5562114417	CONFIANZA	\N	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	INFORMATICA	ADMINISTRATIVO	AJUSTES A LA FACTURACION, SINOT, ANOMALIAS Y CALCULO DE NOTIFICACIONES	5 AÑOS	FORMACION DE INSTRUCTORES	2022-03-28	40 HRS	72.00	MARIA F SABIDO PEDRAZA	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
103	63	EALL800713HGRNPS09	\N	(55)52294400	19098	5532675478	SINDICALIZADO	2009-10-02	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	BACHILLERATO	\N	ALTO RIESGO	TOMA DE LECTURAS	5 AÑOS	FORMACION DE INSTRUCTORES	2018-02-26	40 HRS	71.00	GUADALUPE ZAZUETA MORALES	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
104	64	SAML761111HMNLNS01	\N	(55)52294400	19001	5525143797	SINDICALIZADO	2010-01-27	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	BACHILLERATO	\N	ADMINISTRATIVO	CONTRATO COLECTIVO DE TRABAJO	10 AÑOS	FORMACION DE INSTRUCTORES	2016-06-20	40 HRS	98.00	SERGIO SEGURA ESTRELLA Y JORGE A MENDOZA CAÑAS	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
105	65	GANM870901HDFRTL03	\N	(55)52294400	19051	5519334124	SINDICALIZADO	2014-04-07	NORIA	Ejido No 10 col. Las peritas Del. Xochimilco c.p. 16010	BACHILLERATO	\N	ALTO RIESGO	LINIERO HOMBRE SOLO	5 AÑOS	FORMACION DE INSTRUCTORES	2019-08-26	40 HRS	79.00	VICTOR MANUEL PEREZ SANCHEZ	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
106	66	\N	\N	\N	\N	\N	SINDICALIZADO	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	\N	\N	\N	\N	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
107	67	SAPF770626MDFBDR00	mfsbido@gmail.com	(55)52294400	19001	5523026543	SINDICALIZADO	2010-10-19	COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardines del sur,Delegacion Xochimilco C.P.16050,CDMX	LICENCIATURA	DERECHO	ADMINISTRATIVO	FORMACION DE INSTRUCTORES, NEGOCIACION Y MANEJO DE CONFLICTOS, CONTROL DE ESTRÉS, COMPORTAMIENTO PROACTIVO EN EL TRABAJO, SALUD EN EL TRABAJO, REGLAMENTOS INTERNOS DE CFE, CONTRATO COLECTIVO, CODIGO DE ETICA, CALIDAD EN EL SERVICIO AL CLIENTE	5 AÑOS	FORMACION DE INSTRUCTORES EN LA NIC	2021-04-26	40 HRS	98.00	GUADALUPE ZAZUETA MORALES	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
108	68	SECM861231HDFRRR02	\N	(55)52294400	18936	5536550179	SINDICALIZADO	2013-11-07	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	BACHILLERATO	\N	ADMINISTRATIVO	MANEJO A LA DEFENSIVA	5 AÑOS	FORMACION DE INSTRUCTORES	2016-09-19	40 HRS	98.00	JORGE ALBERTO MENDOZA CAÑAS	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
109	69	RIFM840730HDFJLR09	\N	(55)52294400	19051	5540978737	SINDICALIZADO	2010-11-16	NORIA	Ejido No 10 col. Las peritas Del. Xochimilco c.p. 16010	LICENCIATURA	INGENIERIA CIVIL	ALTO RIESGO	LINIERO HOMBRE SOLO	5 AÑOS	FORMACION DE INSTRUCTORES	2019-08-26	40 HRS	80.00	VICTOR MANUEL PEREZ SANCHEZ	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
110	70	DIIM880818HSRZBR07	\N	(55)52294400	19074	5516372270	CONFIANZA	2012-05-02	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	INGENIERO ELECTRICISTA	ADMINISTRATIVO	MATEMATICAS Y TERMODINAMICA, NORMAS DE MEDICION	7 AÑOS	FORMACION DE INSTRUCTORES	2014-02-24	40 HRS	90.00	GABRIEL DIAZ Y OLMEDO Y GUADALUPE ZAZUETA MORALES	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
111	71	JITM741111MCSMRR00	\N	(55)52294400	18992	5515250470	SINDICALIZADO	2006-07-24	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	INGENIERIA EN SISTEMAS COMPUTACIONALES	ADMINISTRATIVO	SEGURIDAD INFORMATICA, SOPORTE TECNICO EN WINDOWS, MANEJO DE CFEMATICO EN ATENCION DE FALLAS	10 AÑOS	FORMACION DE INSTRUCTORES	2012-09-17	40 HRS	90.00	VERONICA MORALES RAMOS	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
112	72	\N	\N	\N	\N	\N	CONFIANZA	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	\N	\N	\N	\N	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
113	73	MORM820207HMSNDR03	\N	(55)52294400	18943	7775220452	SINDICALIZADO	2010-08-09	LA NORIA	Ejido No 10 col. Las peritas Del. Xochimilco c.p. 16010	LICENCIATURA	INGENIERO INDUSTRIAL	ALTO RIESGO	ANALISIS DE RIESGO EN SITIO Y RIM, DIAGNOSTICO Y FALLAS DE TRANSFORMADORES, PRUEBAS A TRANSFORMADORES, RESTAURADORES Y EQUIPO ELECTRICO	5 AÑOS	FORMACION DE INSTRUCTORES	2016-06-20	40 HRS	88.00	SERGIO SEGURA ESTRELLA Y JORGE A MENDOZA CAÑAS	f	f	\N	\N	\N	t	2026-01-19	2026-03-17 18:41:40.538918
114	74	EIHM860723HMNSGG01	miguel.nat2307@gmail.com	(55)52294400	\N	5563537204	SINDICALIZADO	2010-03-23	CABECERA DE ZONA COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	INGENIERIA INDUSTRIAL Y ADMINISTRACION	ALTO RIESGO	SUPERVISIONES EN ACTIVIDADES DE CAMPO, ANALISIS DE RIESGO EN SITIO Y RIM, BASICO DE LINIERO( CAP 100, MANEAS, ELECTRICIDAD BASICA, FISICA, NUDOS, ASCENSO Y DESCENSO, GRUAS, CATALOGO DE EQUIPO Y HERRAMIENTAS, CATALOGO DE MATERIALES, ESPECIFICACIONES, CODIGO DE RED, GIL, ALEN 3D, ROMEPCARGAS, EUQIPO DE PUESTA A TIERRA, RESCATE DE LINIERO, IDENTIFICACION DE EQUIPOS DE SE, ESPACIOS CONFINADOS, RESIDUOS PELIGROSOS, DETECCION DE FALLAS EN LAS RGD AEREAS)	5 AÑOS	FORMACION DE INSTRUCTORES	2017-10-16	40 HRS	90.00	VICTOR M PEREZ SANCHEZ	t	f	10/06/2025-13/06/2025	\N	\N	f	\N	2026-03-17 18:41:40.538918
115	75	LOCM740708HBCYSG02	\N	(55)52294400	\N	\N	SINDICALIZADO	1997-02-24	\N	\N	\N	\N	ALTO RIESGO	\N	\N	FORMACION DE INSTRUCTORES	2014-12-08	35 HRS	70.00	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
116	76	UIMM811025HDFRRG05	umma_1081@hotmail.com	(55)52294400	\N	(55)21420168	SINDICALIZADO	2011-02-14	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardine del sur,Delegacion Xochimilco C.P.16050,CDMX	LICENCIATURA	INGENIERO ELECTRICISTA	ADMINISTRATIVO	INTEGRACION Y ANALISIS DE AJUSTES, TOMA DE LECTURA EN MEDIDORES DE EE	5 AÑOS	FORMACION DE INSTRUCTORES	2022-03-28	40 HRS	81.00	MARIA F SABIDO PEDRAZA	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
117	77	HEEM740923HHGRSS02	\N	(55)52294400	18926	5517914478	CONFIANZA	1999-10-25	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	INGENIERO ELECTROMECANICO	ALTO RIESGO	GESTION DE LICENCIAS, SUPERVISION DE ACTIVIDADES DE CAMPO	10 AÑOS	FORMACION DE INSTRUCTORES	2007-12-03	32 HRS	90.00	CONOCER	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
118	78	AAVO750503HNLRLL08	oliverio.aranda@gmail.com	(55)52294400	18953	(55)4191-7036	CONFIANZA	1997-08-19	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardine del sur,Delegacion Xochimilco C.P.16050,CDMX	POSGRADO	ADMINISTRACION DE NEGOCIOS	ADMINISTRATIVO	FACTURACION, LIDERAZGO	2 años	FORMACION DE INSTRUCTORES	2015-10-05	40 HRS	91.00	GUADALUPE ZAZUETA MORALES	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
119	79	MOBO851204HMSNLM02	\N	(55)52294400	\N	\N	SINDICALIZADO	2010-04-21	\N	\N	\N	\N	ALTO RIESGO	TOMA DE LECTURAS	\N	FORMACION DE INSTRUCTORES	2016-09-19	40 HRS	80.00	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
120	80	0	\N	\N	\N	\N	SINDICALIZADO	2010-07-19	\N	\N	\N	\N	ALTO RIESGO	\N	\N	FORMACION DE INSTRUCTORES	2022-07-25	40 HRS	85.00	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
121	81	AUGO820516HMNGRS08	\N	(55)52294400	19051	5527984280	SINDICALIZADO	2010-04-21	NORIA	EJIDO No 10 COL. LAS PERITAS DEL. XOCHIMILCO	BACHILLERATO	TECNICO ELECTROMECANICO	ALTO RIESGO	LINIERO HOMBRE SOLO	10 AÑOS	FORMACION DE INSTRUCTORES	2015-04-06	40 HRS	99.00	GUADALUPE ZAZUETA MORALES	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
122	82	LOHO821011HCSPRS08	\N	(55)52294400	18916	5540456638	SINDICALIZADO	2010-01-11	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	INGENIERO ELECTRONICO	ADMINISTRATIVO	FORMULACION Y CONTROL DE LOS PROGRAMAS DE MNTTO	5 AÑOS	FORMACION DE INSTRUCTORES	2022-03-28	40 HRS	76.00	MARIA F SABIDO PEDRAZA	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
123	83	SOAO700728HDFLYS02	\N	(55)52294400	18986	5514898882	SINDICALIZADO	2010-04-15	NORIA	EJIDO No 10 COL. LAS PERITAS DEL. XOCHIMILCO	BACHILLERATO	TECNICO ELECTRICISTA	ADMINISTRATIVO	LABORATORIO DE MEDICION	5 AÑOS	FORMACION DE INSTRUCTORES	2018-02-26	40 HRS	82.00	GUADALUPE ZAZUETA MORALES	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
124	84	MELP800718HSLLLV09	\N	5552294400	19000	33366667440	SINDICALIZADO	2005-06-28	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	ARQUITECTURA	ADMINISTRATIVO	AUTOCAD	10 AÑOS	FORMACION DE INSTRUCTORES	2012-02-20	40 HRS	95.00	GABRIEL DIAZ Y OLMEDO	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
125	85	RUGP750128HOCZRD03	\N	(55)52294400	18916	5514361746	CONFIANZA	2002-02-11	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CDMX	LICENCIATURA	INGENIERO ELECTROMECANICO	ADMINISTRATIVO	INSPECCION DE CIRCUITOS DE DISTRIBUCION, NORMAS DE DISTRIBUCION AEREAS	5 AÑOS	FORMACION DE INSTRUCTORES	2022-03-28	40 HRS	89.00	MARIA F SABIDO PEDRAZA	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
126	86	SOCP840512HCCLXD02	pedrosolis84@hotmail.com	(55)52294400	18942	(55)15904239	SINDICALIZADO	2005-09-25	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardine del sur,Delegacion Xochimilco C.P.16050,CDMX	BACHILLERATO	0	ALTO RIESGO	FORMACION DE AUXILIAR COMERCIAL (INDUCCION A LA LEGISLACION DEL SE, NORMAS DE ELECTRICIDAD BASICA, TARIFAS I Y II, AHORRO Y USO EFICIENTE DE EE, SICOSS Y SICOM, TOMA DE LECTURAS EN MT Y MT, USO Y MANEJO DE DISPOSITIVOS ELECTRONICOS (TP, TABLET Y CELULAR), RUTAS EN PROPIEDAS, CORTES Y RECONEXIONES EN BT, ESPECIFICACIONES TECNICAS EN BT, ANOMALIAS DE LOS CENTROS DE CARGA, PRUEBAS A EQUIPOS DE MEDICION, CENSO DE ALUMBRADO PUBLICO, REPARTO AVISO RECIBO	2 AÑOS	FORMACION DE INSTRUCTORES	2017-10-16	40 HRS	91.00	VICTOR M. PEREZ SANCHEZ	t	f	25/03/2025-28/03/2025	\N	\N	f	\N	2026-03-17 18:41:40.538918
128	88	\N	\N	\N	\N	\N	CONFIANZA	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	\N	\N	\N	\N	\N	f	f	25/03/2025-28/03/2025	\N	\N	f	\N	2026-03-17 18:41:40.538918
129	89	CARR790414HDFHBC09	\N	(55)52294400	18916	5528016512	SINDICALIZADO	2010-04-21	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	BACHILLERATO	\N	ALTO RIESGO	ANALISIS DE RIESGO EN SITIO Y RIM	5 AÑOS	FORMACION DE INSTRUCTORES EN LA NIC	2021-06-28	40 HRS	70.00	GUADALUPE ZAZUETA MORALES	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
130	90	\N	\N	\N	\N	\N	SINDICALIZADO	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	\N	\N	\N	\N	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
131	91	BAFR700722HTSTLD06	rodolfobautistarfb.70@gmail.com	(55)52294400	18989	5525761219	SINDICALIZADO	2010-04-26	NORIA	Ejido No 10 col. Las peritas Del. Xochimilco c.p. 16010	BACHILLERATO	\N	ALTO RIESGO	LINIERO VERIFICADOR, CORTES, RECONEXIONES Y DETECCION DE ANOMALIAS, PRINCIPIOS PARA EL COMBATE DE INCENDIOS	5 AÑOS	FORMACION DE INSTRUCTORES	2015-04-06	40 HRS	91.00	GUADALUPE ZAZUETA MORALES	f	f	19/07/2024-29/07/2024	\N	\N	f	\N	2026-03-17 18:41:40.538918
132	92	\N	\N	\N	\N	\N	CONFIANZA	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	\N	\N	\N	\N	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
133	93	GOSS761015MDFNNN02	mystick888@yahoo.com.mx	(55)52294400	18996	(55)32506892	SINDICALIZADO	2011-07-25	ZONA COAPA	Felipe Angeles S/N Col.La Noria C.P.16030	LICENCIATURA	PSICOLOGIA	ADMINISTRATIVO	PRINCIPIOS PARA EL COMBATE DE INCENDIOS	5 AÑOS	FORMACION DE INSTRUCTORES	2017-06-26	40 HRS	92.00	ING. OLIVERIO ARANDA VILLARREAL	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
134	94	TOMS870512HMNRRR08	Kike14torres@gmail.com	(55)52294400	\N	(55)41581376	SINDICALIZADO	2010-01-27	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardine del sur,Delegacion Xochimilco C.P.16050,CDMX	BACHILLERATO	TECNICO AGROPECUARIO	ALTO RIESGO	ANALISIS DE RIESGO EN SITIO Y RIM, TRABAJOS EN LINEAS ENERGIZADAS LV 3A ETAPA (METODO AISLADO SOBRE AISLADO, MANEJO Y OPERACIÓN DE GRUA, MANUAL POLITICAS, OPERACIÓN  Y MANEJO DE RESTAURADORES, SECCIONADORES, OPERACIÓN DE TRANSFORMADORES, REGULADORES, OPERACION Y MANEJO DE CAPACITORES, INSTALACION DE CUCHILLAS MONOPOLARES, INSTALACION Y CONEXION DE EQUIPO ELECTRICO, TOPOLOGIA ALTA TENSION, SISTEMA PRODUCTIVIDAD Y EFICIENCIA, INSPECCION Y MNTTO, APLICACION Y EXPLOTACION DEL SIAD)	5 AÑOS	FORMACION DE INSTRUCTORES	2018-04-02	40 HRS	80.00	XIPATLI LARA NAVA	t	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
135	95	SART800729HTCLZL00	\N	(55)52294400	18916	\N	SINDICALIZADO	2007-10-13	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	\N	ALTO RIESGO	RESCATE DE LINIERO ACCIDENTADO	5 AÑOS	FORMACION DE INSTRUCTORES EN LA NIC	2021-06-28	40 HRS	72.00	GUADALUPE ZAZUETA MORALES	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
136	96	EIHV900227MDFLRR01	viriminna@gmail.com	(55)52294400	18911	(22)23303780	CONFIANZA	2016-03-14	ZONA COAPA	Av.20 de noviembre s/n Prolongacion División Del Norte,Col.Jardines del sur,Delegacion Xochimilco C.P.16050,CDMX	LICENCIATURA	CONTADURIA PUBLICA Y AUDITORA	ADMINISTRATIVO	MY SAP MODULO MM, DISPOSICIONES GENERALES EN MATERIA DE ADQUISISCION ARRENDAMIENTOS CONTRATACION DE SERVICIOS Y EJECUCION DE OBRAS DE LA CFE Y SUS EMPRESAS PRODUCTIVAS SUBSIDIARIAS	4 AÑOS	FORMACION DE INSTRUCTORES	2018-11-30	40 HRS	89.00	VICTOR M PEREZ SANCHEZ	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
137	97	\N	\N	\N	\N	\N	CONFIANZA	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	FORMACION DE INSTRUCTORES	2023-10-30	40 HRS.	82.00	SAMUEL DOMINGUEZ BECERRIL	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
138	98	\N	\N	\N	\N	\N	CONFIANZA	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	\N	\N	\N	\N	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
139	99	\N	\N	\N	\N	\N	SINDICALIZADO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
42	2	SAAA690919HPLNMG02	zaar@live.com.mx	(55)52294400	19001	5527281500	SINDICALIZADO	2010-09-13	COAPA	AV 20 DE NOV S/N ESQ PROL. DIVISION DEL NORTE, COL. JARDINES DEL SUR C.P. 16050 XOCHIMILCO, CD MX	LICENCIATURA	INGENIERO MECANICO ELECTRICISTA	ADMINISTRATIVO	SIAD	5 AÑOS	FORMACION DE INSTRUCTORES	2016-07-25	40 HRS	80.00	JOSE ANTONIO RUVALCABA LOPEZ	f	f	\N	\N	\N	f	\N	2026-03-17 18:41:40.538918
141	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	ADMINISTRATIVO	\N	\N	\N	\N	\N	\N	\N	f	t	\N	\N	\N	t	\N	2026-03-18 17:03:01.685427
\.


--
-- Data for Name: mensaje; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.mensaje (id_mensaje, id_curso, id_tipo_mensaje, asunto, contenido, fecha_programada, estatus, medio, intentos, proximo_intento, fecha_envio) FROM stdin;
1	25	\N	[CFE Capacitación] Notificación - Prueba correo	Te comunico que se envió por correo oficial la notificación del curso: "Prueba correo" próximo a efectuarse del: 2026-04-23 al 2026-04-24, modalidad: Virtual en el cual se encuentran participantes adscritos a tu área de trabajo. Es primordial que recabes la firma de enterado del trabajador para notificarle oficialmente su inscripción en el curso. Para mayores informes favor de comunicarte a nuestros medios de contacto oficiales con:\nLic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx ext 18943	2026-04-14 15:01:00.309988	enviado	whatsapp,correo	0	\N	2026-04-14 15:01:07.856145
7	25	\N	[CFE Capacitación] Recordatorio - Prueba correo	Este mensaje es con carácter de recordatorio de que se efectuará el curso: "Prueba correo" del 2026-04-23 al 2026-04-24, modalidad: Virtual en el cual se encuentran participantes adscritos a tu área de trabajo. Es primordial que recabes la firma de enterado del trabajador para notificarle oficialmente su inscripción en el curso. Para mayores informes favor de comunicarte a nuestros medios de contacto oficiales con:\nLic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx ext 18943	2026-04-14 17:04:08.603439	enviado	whatsapp	0	\N	2026-04-14 17:04:09.074575
2	25	\N	[CFE Capacitación] Reprogramación - Prueba correo	Te comunico que el curso: "Prueba correo" anteriormente a efectuarse del 2026-04-23, Se REPROGRAMA.\nhasta nuevo aviso.\nLic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx ext 18943	2026-04-14 09:30:00	enviado	whatsapp,correo	1	\N	2026-04-14 15:30:54.327859
3	25	\N	[CFE Capacitación] Reprogramación - Prueba correo	Te comunico que el curso: "Prueba correo" anteriormente a efectuarse del 2026-04-23, Se REPROGRAMA.\nhasta nuevo aviso.\nLic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx ext 18943	2026-04-14 09:30:00	enviado	whatsapp,correo	1	\N	2026-04-14 15:30:57.440713
5	25	\N	[CFE Capacitación] Recordatorio - Prueba correo	Este mensaje es con carácter de recordatorio de que se efectuará el curso: "Prueba correo" del 2026-04-23 al 2026-04-24, modalidad: Virtual en el cual se encuentran participantes adscritos a tu área de trabajo. Es primordial que recabes la firma de enterado del trabajador para notificarle oficialmente su inscripción en el curso. Para mayores informes favor de comunicarte a nuestros medios de contacto oficiales con:\nLic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx ext 18943	2026-04-14 15:58:05.089753	enviado	whatsapp	0	\N	2026-04-14 15:58:22.577254
6	25	\N	[CFE Capacitación]  - Prueba correo	hola	2026-04-14 16:07:08.177864	enviado	whatsapp	0	\N	2026-04-14 16:07:20.465124
8	25	\N	[CFE Capacitación] Recordatorio - Prueba correo	Este mensaje es con carácter de recordatorio de que se efectuará el curso: "Prueba correo" del 2026-04-23 al 2026-04-24, modalidad: Virtual en el cual se encuentran participantes adscritos a tu área de trabajo. Es primordial que recabes la firma de enterado del trabajador para notificarle oficialmente su inscripción en el curso. Para mayores informes favor de comunicarte a nuestros medios de contacto oficiales con:\nLic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx ext 18943	2026-04-14 17:04:45.015779	enviado	whatsapp	0	\N	2026-04-14 17:04:45.670936
4	25	\N	[CFE Capacitación] Recordatorio - Prueba correo	Este mensaje es con carácter de recordatorio de que se efectuará el curso: "Prueba correo" del 2026-04-23 al 2026-04-24, modalidad: Virtual en el cual se encuentran participantes adscritos a tu área de trabajo. Es primordial que recabes la firma de enterado del trabajador para notificarle oficialmente su inscripción en el curso. Para mayores informes favor de comunicarte a nuestros medios de contacto oficiales con:\nLic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx ext 18943	2026-04-14 11:00:00	fallido	whatsapp,correo	1	2026-04-14 17:11:27.081528	\N
9	25	\N	[CFE] Notificación (inscripción) - Prueba correo	Te comunico que te encuentras inscrito en el curso: *Prueba correo* Que se llevará a cabo del: *2026-04-23* al *2026-04-24*, en el horario de: *09:00 - 17:00, Modalidad: Virtual, con sede: ZONA COAPA CABECERA DE ZONA COAPA SALA 3* y domicilio: 0, Instructor *ADRIAN ISRAEL* Nota: *0*. *** Este mensaje es de carácter informativo, para validar la información es necesario recabar tu firma de enterado. Por lo que, agradeceré acudas con: Lic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx Tel: 5554819200 Ext. 18943 y/o con tu Representación Sindical ***	2026-04-20 15:38:28.412908	enviado	whatsapp	0	\N	2026-04-20 15:41:36.579517
10	25	\N	[CFE] Notificación (inscripción) - Prueba correo	Te comunico que te encuentras inscrito en el curso: *Prueba correo* Que se llevará a cabo del: *2026-04-23* al *2026-04-24*, en el horario de: *09:00 - 17:00, Modalidad: Virtual, con sede: ZONA COAPA CABECERA DE ZONA COAPA SALA 3* y domicilio: 0, Instructor *ADRIAN ISRAEL* Nota: *0*. *** Este mensaje es de carácter informativo, para validar la información es necesario recabar tu firma de enterado. Por lo que, agradeceré acudas con: Lic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx Tel: 5554819200 Ext. 18943 y/o con tu Representación Sindical ***	2026-04-20 15:40:07.004827	enviado	whatsapp	0	\N	2026-04-20 15:43:15.412159
11	25	\N	[CFE] Notificación (inscripción) - Prueba correo	Te comunico que te encuentras inscrito en el curso: *Prueba correo* Que se llevará a cabo del: *2026-04-23* al *2026-04-24*, en el horario de: *09:00 - 17:00, Modalidad: Virtual, con sede: ZONA COAPA CABECERA DE ZONA COAPA SALA 3* y domicilio: 0, Instructor *ADRIAN ISRAEL* Nota: *0*. *** Este mensaje es de carácter informativo, para validar la información es necesario recabar tu firma de enterado. Por lo que, agradeceré acudas con: Lic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx Tel: 5554819200 Ext. 18943 y/o con tu Representación Sindical ***	2026-04-20 15:42:36.741899	enviado	whatsapp	0	\N	2026-04-20 15:45:39.219319
12	25	\N	[CFE] Notificación (inscripción) - Prueba correo	Te comunico que te encuentras inscrito en el curso: *Prueba correo* Que se llevará a cabo del: *2026-04-23* al *2026-04-24*, en el horario de: *09:00 - 17:00, Modalidad: Virtual, con sede: ZONA COAPA CABECERA DE ZONA COAPA SALA 3* y domicilio: 0, Instructor *ADRIAN ISRAEL* Nota: *0*. *** Este mensaje es de carácter informativo, para validar la información es necesario recabar tu firma de enterado. Por lo que, agradeceré acudas con: Lic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx Tel: 5554819200 Ext. 18943 y/o con tu Representación Sindical ***	2026-04-21 14:36:39.884659	enviado	whatsapp,correo	0	\N	2026-04-21 14:37:04.969641
13	25	\N	[CFE] Notificación (inscripción) - Prueba correo	Te comunico que te encuentras inscrito en el curso: Prueba correo Que se llevará a cabo del: 2026-04-23 al 2026-04-24, en el horario de: 09:00 - 17:00, Modalidad: Virtual, con sede: ZONA COAPA CABECERA DE ZONA COAPA SALA 3 y domicilio: 0, Instructor ADRIAN ISRAEL Nota: 0. Este mensaje es de carácter informativo, para validar la información es necesario recabar tu firma de enterado. Por lo que, agradeceré acudas con: Lic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx Tel: 5554819200 Ext. 18943 y/o con tu Representación Sindical.	2026-04-21 15:12:35.911051	enviado	whatsapp	0	\N	2026-04-21 15:12:40.826279
14	25	\N	[CFE] Notificación (inscripción) - Prueba correo	Te comunico que te encuentras inscrito en el curso: Prueba correo Que se llevará a cabo del: 2026-04-23 al 2026-04-24, en el horario de: 09:00 - 17:00, Modalidad: Virtual, con sede: ZONA COAPA CABECERA DE ZONA COAPA SALA 3 y domicilio: 0, Instructor ADRIAN ISRAEL Nota: 0. Este mensaje es de carácter informativo, para validar la información es necesario recabar tu firma de enterado. Por lo que, agradeceré acudas con: Lic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx Tel: 5554819200 Ext. 18943 y/o con tu Representación Sindical.	2026-04-21 15:59:07.042482	enviado	whatsapp	0	\N	2026-04-21 16:06:32.120574
15	25	\N	[CFE] Notificación (inscripción) - Prueba correo	Te comunico que te encuentras inscrito en el curso: Prueba correo Que se llevará a cabo del: 2026-04-23 al 2026-04-24, en el horario de: 09:00 - 17:00, Modalidad: Virtual, con sede: ZONA COAPA CABECERA DE ZONA COAPA SALA 3 y domicilio: 0, Instructor ADRIAN ISRAEL Nota: 0. Este mensaje es de carácter informativo, para validar la información es necesario recabar tu firma de enterado. Por lo que, agradeceré acudas con: Lic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx Tel: 5554819200 Ext. 18943 y/o con tu Representación Sindical.	2026-04-21 16:36:31.832823	enviado	whatsapp	0	\N	2026-04-21 16:36:49.821361
18	25	\N	[CFE] Notificación (inscripción) - Prueba correo	Te comunico que te encuentras inscrito en el curso: Prueba correo Que se llevará a cabo del: 2026-04-23 al 2026-04-24, en el horario de: 09:00 - 17:00, Modalidad: Virtual, con sede: ZONA COAPA CABECERA DE ZONA COAPA SALA 3 y domicilio: 0, Instructor ADRIAN ISRAEL Nota: 0. Este mensaje es de carácter informativo, para validar la información es necesario recabar tu firma de enterado. Por lo que, agradeceré acudas con: Lic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx Tel: 5554819200 Ext. 18943 y/o con tu Representación Sindical.	2026-04-21 11:47:00	fallido	whatsapp	0	\N	\N
16	25	\N	[CFE] Notificación (inscripción) - Prueba correo	Te comunico que te encuentras inscrito en el curso: Prueba correo Que se llevará a cabo del: 2026-04-23 al 2026-04-24, en el horario de: 09:00 - 17:00, Modalidad: Virtual, con sede: ZONA COAPA CABECERA DE ZONA COAPA SALA 3 y domicilio: 0, Instructor ADRIAN ISRAEL Nota: 0. Este mensaje es de carácter informativo, para validar la información es necesario recabar tu firma de enterado. Por lo que, agradeceré acudas con: Lic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx Tel: 5554819200 Ext. 18943 y/o con tu Representación Sindical.	2026-04-21 10:40:00	enviado	whatsapp	1	\N	2026-04-21 16:40:51.319773
17	25	\N	[CFE] Notificación (inscripción) - Prueba correo	Te comunico que te encuentras inscrito en el curso: Prueba correo Que se llevará a cabo del: 2026-04-23 al 2026-04-24, en el horario de: 09:00 - 17:00, Modalidad: Virtual, con sede: ZONA COAPA CABECERA DE ZONA COAPA SALA 3 y domicilio: 0, Instructor ADRIAN ISRAEL Nota: 0. Este mensaje es de carácter informativo, para validar la información es necesario recabar tu firma de enterado. Por lo que, agradeceré acudas con: Lic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx Tel: 5554819200 Ext. 18943 y/o con tu Representación Sindical.	2026-04-21 11:47:00	fallido	whatsapp	0	\N	\N
20	25	\N	[CFE] Notificación (inscripción) - Prueba correo	Te comunico que te encuentras inscrito en el curso: Prueba correo Que se llevará a cabo del: 2026-04-23 al 2026-04-24, en el horario de: 09:00 - 17:00, Modalidad: Virtual, con sede: ZONA COAPA CABECERA DE ZONA COAPA SALA 3 y domicilio: 0, Instructor ADRIAN ISRAEL Nota: 0. Este mensaje es de carácter informativo, para validar la información es necesario recabar tu firma de enterado. Por lo que, agradeceré acudas con: Lic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx Tel: 5554819200 Ext. 18943 y/o con tu Representación Sindical.	2026-04-22 15:36:02.823398	enviado	whatsapp	0	\N	2026-04-22 15:36:17.872778
19	25	\N	[CFE] Notificación (inscripción) - Prueba correo	Te comunico que te encuentras inscrito en el curso: Prueba correo Que se llevará a cabo del: 2026-04-23 al 2026-04-24, en el horario de: 09:00 - 17:00, Modalidad: Virtual, con sede: ZONA COAPA CABECERA DE ZONA COAPA SALA 3 y domicilio: 0, Instructor ADRIAN ISRAEL Nota: 0. Este mensaje es de carácter informativo, para validar la información es necesario recabar tu firma de enterado. Por lo que, agradeceré acudas con: Lic. Zully Sanabria Sánchez, mail: zully.sanabria@cfe.mx Tel: 5554819200 Ext. 18943 y/o con tu Representación Sindical.	2026-04-21 11:47:00	fallido	whatsapp	2	2026-04-22 02:28:40.335529	\N
\.


--
-- Data for Name: mensaje_destinatario; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.mensaje_destinatario (id_mensaje_destinatario, id_mensaje, id_persona, id_rol_destinatario, canal_envio, estatus_envio, fecha_envio, contacto) FROM stdin;
1	1	482	\N	correo	enviado	2026-04-14 15:01:04.950128	giovanisantana167@gmail.com
2	1	482	\N	whatsapp	enviado	2026-04-14 15:01:07.542393	5588010253
3	2	482	\N	correo	enviado	2026-04-14 15:30:51.293958	giovanisantana167@gmail.com
4	2	482	\N	whatsapp	enviado	2026-04-14 15:30:54.269048	5588010253
5	3	482	\N	correo	enviado	2026-04-14 15:30:56.140415	giovanisantana167@gmail.com
6	3	482	\N	whatsapp	enviado	2026-04-14 15:30:57.385077	5588010253
9	5	482	\N	whatsapp	enviado	2026-04-14 15:58:22.57251	5588010253
10	6	482	\N	whatsapp	enviado	2026-04-14 16:07:20.151687	5588010253
7	4	482	\N	correo	enviado	2026-04-14 17:01:26.673836	giovanisantana167@gmail.com
8	4	482	\N	whatsapp	fallido	2026-04-14 17:01:27.028873	5588010253
11	7	482	\N	whatsapp	fallido	2026-04-14 17:04:08.790175	5588010253
12	8	482	\N	whatsapp	fallido	2026-04-14 17:04:45.558108	5588010253
13	9	482	\N	whatsapp	fallido	2026-04-20 15:41:36.166614	5588010253
14	10	482	\N	whatsapp	fallido	2026-04-20 15:43:15.279421	5588010253
15	11	482	\N	whatsapp	fallido	2026-04-20 15:45:39.029871	5588010253
16	12	482	\N	correo	enviado	2026-04-21 14:36:53.089496	giovanisantana167@gmail.com
17	12	482	\N	whatsapp	enviado	2026-04-21 14:37:04.969631	5588010253
18	13	482	\N	whatsapp	enviado	2026-04-21 15:12:40.82627	5588010253
19	14	482	\N	whatsapp	fallido	2026-04-21 16:02:10.644758	5588010253
20	14	100	\N	whatsapp	fallido	2026-04-21 16:06:31.831089	5519541491
21	15	482	\N	whatsapp	enviado	2026-04-21 16:36:47.08996	5588010253
22	16	482	\N	whatsapp	enviado	2026-04-21 16:40:51.305257	5588010253
23	17	482	\N	whatsapp	pendiente	\N	5588010253
24	18	482	\N	whatsapp	pendiente	\N	5588010253
25	19	482	\N	whatsapp	fallido	2026-04-22 02:18:39.509536	5588010253
26	20	482	\N	whatsapp	enviado	2026-04-22 15:36:16.390859	5588010253
\.


--
-- Data for Name: modalidad_curso; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.modalidad_curso (id_modalidad, nombre_modalidad, descripcion) FROM stdin;
1	Presencial	Curso impartido de forma presencial en sede
2	En linea	Curso impartido de forma virtual
3	Hibrido	Combinacion de presencial y en linea
4	Campo	Curso practico en campo de trabajo
6	Híbrido	\N
7	Virtual	\N
\.


--
-- Data for Name: participacion_curso; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.participacion_curso (id_participacion, id_curso, id_persona, id_rol_curso, asistencia, calificacion, fecha_registro, indicador) FROM stdin;
53	25	101	2	\N	\N	2026-04-10 17:18:07.374692	\N
54	25	100	1	\N	\N	2026-04-10 17:18:07.374692	\N
55	25	482	1	\N	\N	2026-04-10 17:18:07.374692	\N
61	27	57	2	\N	\N	2026-04-23 18:17:54.119201	\N
62	27	4	1	\N	\N	2026-04-23 18:17:54.119201	\N
63	27	6	1	\N	\N	2026-04-23 18:17:54.119201	\N
64	27	8	1	\N	\N	2026-04-23 18:17:54.119201	\N
65	27	9	1	\N	\N	2026-04-23 18:17:54.119201	\N
66	27	100	1	\N	\N	2026-04-23 18:17:54.119201	\N
67	27	482	1	\N	\N	2026-04-23 18:17:54.119201	\N
68	27	89	1	\N	\N	2026-04-23 18:17:54.119201	\N
69	27	94	1	\N	\N	2026-04-23 18:17:54.119201	\N
70	28	3	2	\N	\N	2026-04-27 16:04:48.075182	\N
71	28	459	1	\N	\N	2026-04-27 16:04:48.075182	CAPI
72	28	101	1	\N	\N	2026-04-27 16:04:48.075182	CAPI
73	28	239	1	\N	\N	2026-04-27 16:04:48.075182	REE
74	28	2	1	\N	\N	2026-04-27 16:04:48.075182	REE
75	28	342	1	\N	\N	2026-04-27 16:04:48.075182	CAPI
76	28	205	1	\N	\N	2026-04-27 16:04:48.075182	CAP
77	28	3	1	\N	\N	2026-04-27 16:04:48.075182	CAP
78	28	146	1	\N	\N	2026-04-27 16:04:48.075182	CAP
79	28	353	1	\N	\N	2026-04-27 16:04:48.075182	REE
\.


--
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.persona (id_persona, rpe, nombre_completo, correo_institucional, telefono, puesto, plaza, id_estatus_laboral, fecha_alta, id_departamento, sexo, tipo_contrato, antiguedad, clave, curp, ubicacion, area, centro_costos, whatsapp_autorizado) FROM stdin;
459	GARBV	ABIGAIL ALVARADO DELGADO	\N	\N	AUXILIAR COMERCIAL	37SA0039	1	2026-03-19	11	F	SINDICALIZADO	2023-11-23	64365	PRUEBA	37316	DN70D	88144	pendiente
482	123	Giovani Jesus Puebla Santana	giovanisantana167@gmail.com	5588010253	RESIDENTE	\N	1	2026-04-01	\N	M	CONFIANZA	2026-01-12	\N	PUSG030902HDFBNVA5	\N	\N	\N	pendiente
282	9MJLB	LEOBARDO CASTELLANOS VELAZQUEZ	\N	\N	AUXILIAR ADMINISTRATIVO	37SA0344	1	2026-03-19	6	M	SINDICALIZADO	2010-06-14	65341	CAVL740413HDFSLB07	37740	DN7A0	82323	pendiente
4	9K91U	ALEX FERNANDO RUEDA DIAZ	alex.rueda@cfe.mx	5534359301	PROFESIONISTA	37SA0180	1	2026-03-17	7	M	SINDICALIZADO	2008-10-27	69361	RUDA850302HOCDZL08	37418	DN70D	82354	pendiente
25	9MJA7	FERNANDO JESUS GARCIA GALLINA	\N	\N	JEFE OFICINA ZONA III	37CA0037	3	2026-03-17	\N	\N	\N	\N	\N	\N	\N	\N	\N	pendiente
30	9K62E	FRANCISCO RODRIGUEZ LOPEZ	\N	\N	JEFE OFICINA ZONA III	None	4	2026-03-17	\N	\N	\N	\N	\N	\N	\N	\N	\N	pendiente
36	9L4NG	IRMA NANITZIN GUADALUPE FLORES DURAN	\N	\N	SUMINISTRO BASICO	37SA0031	1	2026-03-17	\N	\N	\N	\N	\N	\N	\N	\N	\N	pendiente
52	9MJA4	JOSE JUAN NIEVES SANTANDER	\N	\N	JEFE OFICINA ZONA III	None	4	2026-03-17	\N	\N	\N	\N	\N	\N	\N	\N	\N	pendiente
53	K777N	JOSE MANUEL MALDONADO NAVA	\N	\N	SUPERVISOR	None	3	2026-03-17	\N	\N	\N	\N	\N	\N	\N	\N	\N	pendiente
56	9MJA8	JUANITA CERVANTES GIL	\N	\N	JEFE OFICINA ZONA III	None	4	2026-03-17	\N	\N	\N	\N	\N	\N	\N	\N	\N	pendiente
10	87124	CANDIDO SARABIO CAMACHO	candido.sarabio@cfe.mx	5529222333	JEFE DEPARTAMENTO ZONA III	37CA0017	1	2026-03-17	6	M	CONFIANZA	2001-08-19	193A2	\N	37740	DN7A0	82323	pendiente
100	9K67X	ZULLY SANABRIA SANCHEZ	zully.sanabria@cfe.mx	5519541491	PROFESIONISTA	37SA0004	1	2026-03-17	13	F	SINDICALIZADO	2010-03-25	69361	SASZ820324MMSNNL03	37512	DN7E1	82358	pendiente
70	9MJAF	MARIO DIAZ IBARRA	mario.diazi@cfe.mx	5516372270	JEFE OFICINA ZONA III	37CA0020	1	2026-03-17	\N	\N	\N	\N	\N	\N	\N	\N	\N	pendiente
75	9B7K5	MIGUEL ANGEL LOYA COSTA	\N	\N	SOBRESTANTE	37SA0117	1	2026-03-17	\N	\N	\N	\N	\N	\N	\N	\N	\N	pendiente
78	9AY1P	OLIVERIO ARANDA VILLARREAL	oliverio.aranda@cfe.com	(55)4191-7036	JEFE DEPARTAMENTO ZONA III	33CA0021	1	2026-03-17	\N	\N	\N	\N	\N	\N	\N	\N	\N	pendiente
79	9K90V	OMAR ENRIQUE MONTES DE OCA BELLO	\N	\N	AUXILIAR COMERCIAL	37SA0250	1	2026-03-17	\N	\N	\N	\N	\N	\N	\N	\N	\N	pendiente
88	G731P	RICARDO GARCIA ESTEVEZ	\N	\N	JEFE OFICINA ZONA III	None	4	2026-03-17	\N	\N	\N	\N	\N	\N	\N	\N	\N	pendiente
92	9MKH0	RODRIGO ISMAEL CUADROS PEREZ	\N	\N	JEFE OFICINA ZONA III	None	4	2026-03-17	\N	\N	\N	\N	\N	\N	\N	\N	\N	pendiente
85	9EF1X	PEDRO EDY RUIZ GARCIA	pedro.ruiz@cfe.mx	5514361746	JEFE OFICINA ZONA III	37CA0058	1	2026-03-17	5	M	CONFIANZA	2002-04-09	183B4	RUGP750128HOCZRD03	37212	DN7B0	82357	pendiente
33	9EF1Y	HUGO EDGAR ARELLANO OLMOS	hugo.arellano@cfe.mx	5546502826	JEFE DEPARTAMENTO ZONA III	37CA0041	1	2026-03-17	8	M	CONFIANZA	2006-05-17	19392	AEOH791019HOCRLG04	37220	DN7K0	82308	pendiente
116	9EMAU	GIL FILOMENO GALVAN VALENZUELA	\N	\N	JEFE OFICINA ZONA III	37CA0038	1	2026-03-19	4	M	CONFIANZA	1996-04-01	18394	\N	37311	DN7C1	82328	pendiente
117	9JEVH	GUILLERMO MARIN LOBATO	\N	\N	SUPERINTENDENTE ZONA III	37CA0001	1	2026-03-19	10	M	CONFIANZA	2007-09-09	1B361	\N	37010	DN7A0	82300	pendiente
118	9JKJ3	MA. ELENA PEREZ VALLADAREZ	\N	\N	AGENTE COMERCIAL III	37CA0011	1	2026-03-19	4	F	CONFIANZA	2010-05-14	17381	\N	37315	DN70C	82327	pendiente
15	9B7KM	CRISTHIAN RODOLFO GONZALEZ DURAN	\N	\N	LINIERO ENCARGADO LV	37SA0156	1	2026-03-17	5	M	SINDICALIZADO	1997-04-02	663D4	GODC78322HPLNRR01	37216	DN70D	82329	pendiente
106	9B7LF	HUGO ALBERTO ELIZALDE MORALES	\N	\N	ADMINISTRADOR ZONA III	37CA0004	1	2026-03-19	2	M	CONFIANZA	2001-02-03	193A3	\N	37610	DN7F0	82313	pendiente
77	9B81A	MISAEL HERNANDEZ ESPINOSA	misael.hernandeze@cfe.mx	5517914478	JEFE OFICINA ZONA III	37CA0059	1	2026-03-17	8	M	CONFIANZA	1999-11-07	183C4	HEEM740923HHGRSS02	37223	DN7K3	82338	pendiente
108	9B8MR	HECTOR GOMEZ LOPEZ	\N	\N	LINIERO LV	37SA0163	1	2026-03-19	5	M	SINDICALIZADO	1998-07-21	653C4	GOLH730718HMNMPC02	37216	DN70D	82329	pendiente
24	9DX0U	EUSEBIO CORONA MARQUEZ	eusebio.corona@cfe.mx	5537061578	TÉCNICO	37SA0186	1	2026-03-17	3	M	SINDICALIZADO	2002-02-26	68381	COME770306HPLRRS08	37411	DN7H1	82302	pendiente
13	9DY19	CARMELO CANTERO GOMEZ	\N	\N	LINIERO ENCARGADO LV	37SA0179	1	2026-03-17	5	M	SINDICALIZADO	2002-04-11	663B4	CAGC830716HMSNMR05	37113	DN7L1	82345	pendiente
111	9DY1A	ALFREDO RODRIGUEZ VICTORIANO	\N	\N	LINIERO ENCARGADO LV	37SA0134	1	2026-03-19	5	M	SINDICALIZADO	2002-03-26	663C4	ROVA771028HPLDCL06	37113	DN7L1	82345	pendiente
19	9EEFA	EDGAR ALBERTO PRECIADO DOMINGUEZ	Edgar.preciado@cfe.mx	(55)86869554	SOBRESTANTE	37SA0270	1	2026-03-17	5	M	SINDICALIZADO	1997-10-04	673D6	PEDE770822HBCRMD09	37215	DN70C	82324	pendiente
17	9EF1K	DANIEL HERIBERTO MEDINA ZAZUETA	\N	\N	JEFE OFICINA ZONA III	37CA0030	4	2026-03-17	13	M	CONFIANZA	2005-09-23	18394	MEZD820412G10	37512	DN7E1	82358	pendiente
119	9JNMU	ELOY TELLO TORRES	\N	\N	LINIERO LV	37SA0101	1	2026-03-19	5	M	SINDICALIZADO	2006-07-19	65364	TETE801103HPLLRL06	37113	DN7L1	82345	pendiente
120	9K626	BLODYWEED HERNANDEZ PINEDA	\N	\N	JEFE OFICINA ZONA III	37CA0050	1	2026-03-19	10	F	CONFIANZA	2006-09-18	183C4	HEPB850311MDFRNL04	37721	DN7A0	82359	pendiente
121	9K63T	CARLOS ARTURO HERNANDEZ OCAÑA	\N	\N	VERIFICADOR CALIBRADOR I	37SA0334	1	2026-03-19	7	M	SINDICALIZADO	2007-12-11	66362	HEOC770911HTCRCR09	37416	DN70A	82355	pendiente
57	9K63U	KARLA VIANEY FIGUEROA MORENO	karla.figueroa@cfe.mx	(55)1012852	ENCARGADO DE SECCION	37SA0045	1	2026-03-17	4	F	SINDICALIZADO	2010-04-22	67352	FIMK830306MGRGRR02	37313	DN70A	82317	pendiente
123	9K63V	LUIS MIGUEL VALDOVINOS GOMEZ	\N	\N	LINIERO ENCARGADO LV	37SA0204	1	2026-03-19	5	M	SINDICALIZADO	2010-07-22	66384	VAGL850111HCMLMS04	37214	DN70B	82319	pendiente
5	9K63W	ALONSO ORTIZ HERNANDEZ	\N	(99)32771514	LINIERO ENCARGADO LV	37SA0157	1	2026-03-17	5	M	SINDICALIZADO	2001-03-01	66384	OIHA740627HDFRRL01	37216	DN70D	82329	pendiente
3	9K63X	ALBERTO EMETERIO FAUSTO ARIAS	alberto.fausto@cfe.mx	5540262142	SOBRESTANTE	37SA0116	1	2026-03-17	5	M	SINDICALIZADO	2005-07-04	67386	FAAA850320HCSSRL06	37214	DN70B	82319	pendiente
126	9K63Y	DANIEL SANCHEZ TORRES	\N	\N	LINIERO LV	37SA0222	1	2026-03-19	5	M	SINDICALIZADO	2009-03-20	65374	SATD790821HCSNRN01	37217	DN70E	82334	pendiente
127	9K64W	CARLOS OLIVER GONZALEZ GOMEZ	\N	\N	PROFESIONISTA	37SA0165	1	2026-03-19	5	M	SINDICALIZADO	2010-01-11	69361	GOGC820622HCSNMR08	37214	DN70B	82319	pendiente
128	9K64X	IVAN IGNACIO CRUZ GOMEZ	\N	\N	PROFESIONISTA	37SA0188	1	2026-03-19	5	M	SINDICALIZADO	2010-06-12	69361	CUGI860807HSLRMV01	37213	DN70A	82314	pendiente
82	9K64Y	OSCAR LOPEZ HERNANDEZ	oscar.lopezh@cfe.mx	5540456638	PROFESIONISTA	37SA0142	1	2026-03-17	5	M	SINDICALIZADO	2010-01-11	69361	LOHO821011HCSPRS08	37215	DN70C	82324	pendiente
130	9K677	JORGE HUGO MORALES ARIAS	\N	\N	VERIFICADOR CALIBRADOR I	37SA0333	1	2026-03-19	7	M	SINDICALIZADO	2010-02-02	66372	MOAJ830426HGRRRR03	37416	DN70A	82355	pendiente
131	9K678	LUIS ALBERTO GUTIERREZ ARIZAGA	\N	\N	AUXILIAR COMERCIAL	37SA0024	1	2026-03-19	4	M	SINDICALIZADO	2010-02-02	64385	GUAL801105HDFTRS04	37315	DN70C	88143	pendiente
132	9K67B	JESUS HERNANDEZ TAPIA	\N	\N	LINIERO LV	37SA0183	1	2026-03-19	5	M	SINDICALIZADO	2010-04-21	65364	HETJ890528HMNRPS06	37213	DN70A	82314	pendiente
94	9K67C	SERGIO ENRIQUE TORRES MIRANDA	Sergio.torres@cfe.mx	(55)41581376	SOBRESTANTE	37SA0227	1	2026-03-17	5	M	SINDICALIZADO	2010-02-02	67376	TOMS870512HMNRRR08	37216	DN70D	82329	pendiente
74	9K67D	MIGUEL ANGEL ESPINOZA HIGAREDA	miguel.espinoza@cfe.mx	5563537204	SOBRESTANTE	37SA0188	1	2026-03-17	5	M	SINDICALIZADO	2010-04-23	67366	EIHM860723HMNSGG01	37217	DN70E	82334	pendiente
135	9K67E	JOSE ALBERTO RUELAS GONZALEZ	\N	\N	LINIERO ENCARGADO LV	37SA0181	1	2026-03-19	5	M	SINDICALIZADO	2010-02-02	66374	RUGA770526HMNLNL07	37213	DN70A	82314	pendiente
50	9K67G	JOSE FRANCISCO MILLARES ALVAREZ	\N	5529005581	AUXILIAR COMERCIAL	37SA0333	2	2026-03-17	4	M	SINDICALIZADO	2010-02-04	64385	MIAF811029HDFLLR05	37313	DN70A	88141	pendiente
64	9K67K	LUIS SALCEDO MANZO	luis.salcedo@cfe.mx	5525143797	TÉCNICO (DISTRIBUCION)	37SA0103	2	2026-03-17	9	M	SINDICALIZADO	2010-02-02	68371	SAML761111HMNLNS01	37111	DN7B0	82361	pendiente
14	9K67N	CAROLINA RUIZ NUÑEZ	carolina.ruiz@cfe.mx	5514837630	ENCARGADO DE SECCION	37SA0228	1	2026-03-17	2	F	SINDICALIZADO	2010-02-02	67362	RUNC790619MDFZNR02	37612	DN7F2	82349	pendiente
41	9K67P	JESUS CHAVEZ NOVOA	Jesus.chavez@cfe.mx	(55)31176693	ENCARGADO DE SECCION	37SA0015	1	2026-03-17	4	M	SINDICALIZADO	2010-02-02	67362	CANJ841202HMNHVS07	37315	DN70C	82327	pendiente
58	9K67R	LILIANA HEREDIA MACIAS	liliana.heredia@cfe.mx	5549128009	ENCARGADO DE SECCION	37SA0074	2	2026-03-17	4	F	SINDICALIZADO	2010-02-02	67352	HEML831219MMNRCL04	37313	DN70A	82317	pendiente
141	9K67T	MARCO TULIO CAMPOS RUIZ	\N	\N	ENCARGADO SECCION	37SA0059	1	2026-03-19	4	M	SINDICALIZADO	2010-02-03	67362	CARM801122HMNMZR07	37316	DN70D	82332	pendiente
34	9K680	HUGO ERNESTO DORANTES DORANTES	hugo.dorantes@cfe.mx	5518001969	TÉCNICO (DISTRIBUCION)	37SA0102	1	2026-03-17	9	M	SINDICALIZADO	2010-03-30	68371	DODH850621HYNRRG07	37112	DN7L2	82360	pendiente
83	9K682	OSCAR SOLANO AYALA	oscar.solano@cfe.mx	5514898882	VERIFICADOR CALIBRADOR I	37SA0336	2	2026-03-17	7	M	SINDICALIZADO	2010-04-18	66352	SOAO700728HDFLYS02	37418	DN70D	82354	pendiente
145	9K683	RICARDO RODRIGUEZ VEGA	\N	\N	LINIERO LV	37SA0138	1	2026-03-19	5	M	SINDICALIZADO	2010-05-12	65364	ROVR750313HJCDGC00	37215	DN70C	82324	pendiente
146	9K686	ALBERTO VIDAL GONZALEZ RODRIGUEZ	\N	\N	AUXILIAR COMERCIAL	37SA0038	1	2026-03-19	4	M	SINDICALIZADO	2010-01-14	64385	GORA701022HJCNDL00	37313	DN70A	88141	pendiente
147	9K687	FERNANDO JARA LANDEROS	\N	\N	VERIFICADOR CALIBRADOR I	37SA0335	1	2026-03-19	7	M	SINDICALIZADO	2010-01-23	66362	JALF810530HJCRNR00	37418	DN70D	82354	pendiente
148	9K688	RAFAEL JARA LANDEROS	\N	\N	AUXILIAR COMERCIAL	37SA0081	1	2026-03-19	4	M	SINDICALIZADO	2010-01-23	64385	JALR720420HJCRNF06	37317	DN70E	88145	pendiente
149	9K689	PABLO PEREGRINA RAMIREZ	\N	\N	LINIERO ENCARGADO LV	37SA0099	1	2026-03-19	5	M	SINDICALIZADO	2010-05-13	66374	PERP690108HJCRMB00	37215	DN70C	82324	pendiente
150	9K68A	ATZAYACALTH SALVADOR ALVAREZ MONTES	\N	\N	LINIERO ENCARGADO LV	37SA0097	1	2026-03-19	5	M	SINDICALIZADO	2003-02-14	663A4	AAMA841014HNTLNT02	37113	DN7L1	82345	pendiente
151	9K68D	MARIO ALBERTO RAMIREZ GOMEZ	\N	\N	VERIFICADOR CALIBRADOR I	37SA0332	1	2026-03-19	7	M	SINDICALIZADO	2010-01-28	66362	RAGM710219HJCMMR03	37416	DN70A	82355	pendiente
152	9K68G	DARIO ALBERTO OLIVA PINEDO	\N	\N	VERIFICADOR CALIBRADOR I	37SA0252	1	2026-03-19	7	M	SINDICALIZADO	2010-01-11	66362	OIPD770427HZSLNR04	37418	DN70D	82354	pendiente
153	9K68K	DAVID HERROS BRIBIESCA	\N	\N	ENCARGADO SECCION	37SA0075	1	2026-03-19	4	M	SINDICALIZADO	2010-01-28	67362	HEBD611010HJCRRV07	37317	DN70E	82337	pendiente
12	9K68N	CARLOS GONZALEZ JIMENEZ	carlos.gonzalezj@cfe.mx	5619948847	PROFESIONISTA	37SA0001	1	2026-03-17	13	M	SINDICALIZADO	2010-01-11	69361	GOJC840808HJCNMR01	37513	DN7E4	82311	pendiente
156	9K766	HUGO ALBERTO TRUJILLO HERRERA	\N	\N	LINIERO ENCARGADO LV	37SA0221	1	2026-03-19	5	M	SINDICALIZADO	2009-05-02	66374	TUHH800712HJCRRG08	37217	DN70E	82334	pendiente
95	9K767	TILO JESUS SALDIVAR RUIZ	\N	\N	LINIERO ENCARGADO LV	37SA0154	2	2026-03-17	5	M	SINDICALIZADO	2007-08-18	66384	SART800729HTCLZL00	37213	DN70A	82314	pendiente
46	9K768	JOAQUIN GUZMAN LAYNES	\N	\N	LINIERO ENCARGADO LV	37SA0203	2	2026-03-17	5	M	SINDICALIZADO	2009-10-07	66374	GULJ810102HTCZYQ01	37214	DN70B	82319	pendiente
159	9K769	JUAN PABLO RAMIREZ CRUZ	\N	\N	AUXILIAR COMERCIAL	37SA0065	1	2026-03-19	4	M	SINDICALIZADO	2000-01-04	64365	0	37317	DN70E	88145	pendiente
35	9K76A	INTY OMAR VELAZQUEZ LIRA	\N	5585757811	LINIERO ENCARGADO LV	37SA0178	2	2026-03-17	5	M	SINDICALIZADO	2010-08-20	66394	VELI791227HGTLRN04	37213	DN70A	82314	pendiente
101	9K765	ADRIAN ISRAEL	\N	\N	\N	\N	1	2026-03-18	5	M	SINDICALIZADO	2005-08-10	66394	SIGA820411HCSRND00	37215	DN70C	82324	pendiente
161	9K76B	IVAN ZETINA PEREZ	\N	\N	VERIFICADOR CALIBRADOR II	37SA0090	1	2026-03-19	7	M	SINDICALIZADO	2009-09-20	67363	ZEPI810818HVZTRV09	37416	DN70A	82355	pendiente
22	9K76C	ELIEZER AGUILANDO CRUZ	eliezer.aguilando @cfe.mx	5563477988	PROFESIONISTA	37SA0210	1	2026-03-17	5	M	SINDICALIZADO	2010-05-21	69351	AUCE780620HVZGRL02	37217	DN70E	82334	pendiente
163	9K76D	OSCAR ROLANDO BRISEÑO PORRAS	\N	\N	VERIFICADOR CALIBRADOR II	37SA0071	1	2026-03-19	7	M	SINDICALIZADO	2010-06-19	67353	BIPO821206HNLRRS07	37417	DN70C	82371	pendiente
164	9K76E	NAPOLEON CARLO JOSE CORONADO CORTES	\N	\N	VERIFICADOR CALIBRADOR II	37SA0088	1	2026-03-19	7	M	SINDICALIZADO	2010-05-24	67353	COCN841011HNLRRP04	37418	DN70D	82354	pendiente
165	9K76G	JUAN DE DIOS GONZAGA RAMIREZ	\N	\N	LINIERO ENCARGADO LV	37SA0220	1	2026-03-19	5	M	SINDICALIZADO	2008-05-16	66384	GORJ780308HOCNMN02	37217	DN70E	82334	pendiente
23	9K76J	ERIKA VILLARREAL FLORES	erika.villarreal@cfe.mx	5586176941	TÉCNICO	37SA0206	1	2026-03-17	3	F	SINDICALIZADO	2010-03-08	68361	VIFE740924MJCLLR09	37411	DN7H1	82302	pendiente
167	9K76M	JORGE ALAN RUIZ DAVILA	\N	\N	VERIFICADOR CALIBRADOR II	37SA0029	1	2026-03-19	7	M	SINDICALIZADO	2010-05-11	67353	\N	37417	DN70C	82371	pendiente
168	9K76P	JOSE GILBERTO DUARTE MARTINEZ	\N	\N	AUXILIAR COMERCIAL	37SA0025	1	2026-03-19	4	M	SINDICALIZADO	2009-05-28	64385	DUMG810411HCCRRL02	37315	DN70C	88143	pendiente
169	9K76R	EDGAR RAYMUNDO CASIQUE GARCIA	\N	\N	VERIFICADOR CALIBRADOR II	37SA0028	1	2026-03-19	7	M	SINDICALIZADO	2007-07-02	67373	CAGE810129HMSSRD01	37418	DN70D	82354	pendiente
91	9K76T	RODOLFO BAUTISTA FLORES	rodolfo.bautista@cfe.mx	5525761219	VERIFICADOR CALIBRADOR II	37SA0058	1	2026-03-17	7	M	SINDICALIZADO	2010-05-07	67353	BAFR700722HTSTLD06	37418	DN70D	82354	pendiente
54	9K76U	JOSE MARIO RANGEL PICASO	jose.rangel@cfe.gob.mx	(55)35063008	VERIFICADOR CALIBRADOR II	37SA0070	1	2026-03-17	7	M	SINDICALIZADO	2010-08-16	67353	RAPM910602HTSNCR00	37418	DN70D	82354	pendiente
172	9K76V	MAXIMINO ANTONIO DEL ANGEL	\N	\N	TECNICO	37SA0219	1	2026-03-19	3	M	SINDICALIZADO	2010-06-27	68341	AOAM801122HVZNNX07	37411	DN7H1	82302	pendiente
71	9K76W	MARITZA DE JESUS JIMENEZ TORRES	maritza.jimenez@cfe.mx	5515250470	PROFESIONISTA	37SA0003	1	2026-03-17	12	F	SINDICALIZADO	2008-03-22	69361	JITM741111MCSMRR00	37710	DN7A1	82301	pendiente
174	9K76X	RAMIRO ALBERTO GAXIOLA MERCADO	\N	\N	AUXILIAR COMERCIAL	37SA0020	1	2026-03-19	4	M	SINDICALIZADO	2008-12-15	64385	GAMR840909HMSXRM04	37315	DN70C	82327	pendiente
63	9K76Y	LUIS OCTAVIO ENCARNACION LOPEZ	luis.encarnacion@cfe.mx	5532675478	AUXILIAR COMERCIAL	37SA0034	2	2026-03-17	4	M	SINDICALIZADO	2010-01-09	64375	EALL800713HGRNPS09	37314	DN70B	88142	pendiente
176	9K770	LUIS ALBERTO BASILIO CARRANZA	\N	\N	OFICINISTA COMERCIAL	37SA0281	1	2026-03-19	4	M	SINDICALIZADO	2009-04-26	66363	BACL880428HGRSRS03	37314	DN70B	88142	pendiente
177	9K771	SANTOS DE LOS ANGELES SEGOVIA CHI	\N	\N	AUXILIAR COMERCIAL	37SA0021	1	2026-03-19	4	M	SINDICALIZADO	2009-09-04	64385	SECS780909HCCGHN02	37316	DN70D	88144	pendiente
86	9K772	PEDRO GUADALUPE SOLIS CU	\N	(55)15904239	AUXILIAR COMERCIAL	37SA0052	1	2026-03-17	4	M	SINDICALIZADO	2008-10-28	64385	SOCP840512HCCLXD02	37315	DN70C	88143	pendiente
179	9K773	VICTOR MANUEL CONSTANTINO SANABRIA	\N	\N	PROFESIONISTA	37SA0092	1	2026-03-19	8	M	SINDICALIZADO	2009-10-09	69361	COSV821130HDFNNC04	37222	DN7K1	82339	pendiente
180	9K831	OSCAR TOMAS JARA LANDEROS	\N	\N	AUXILIAR COMERCIAL	37SA0040	1	2026-03-19	4	M	SINDICALIZADO	2009-11-30	64375	JALO781127HJCRNS17	37313	DN70A	88141	pendiente
47	9K832	JOSE ANTONIO ALTAMIRANO SANCHEZ	jose.altamirano@cfe.mx	5512794247	PROFESIONISTA	37SA0164	2	2026-03-17	8	M	SINDICALIZADO	2008-08-20	69361	AASA800405HOCLNN06	37221	DN7K2	82340	pendiente
182	9K902	RAFAEL MOSQUEDA RAMIREZ	\N	\N	AUXILIAR COMERCIAL	37SA0069	1	2026-03-19	4	M	SINDICALIZADO	2005-11-01	64375	MORR780123HCSSMF17	37314	DN70B	88142	pendiente
183	9K90P	MARCOS ABRAHAM AGUILAR GOMEZ	\N	\N	PROFESIONISTA	37SA0119	1	2026-03-19	5	M	SINDICALIZADO	2010-04-13	69361	AUGM840425HQRGMR09	37216	DN70D	82329	pendiente
184	9K91P	CESAR ANTONIO CRUCES AVALOS	\N	\N	TECNICO	37SA0218	1	2026-03-19	3	M	SINDICALIZADO	2010-04-09	68351	CUAC700422HGTRVS04	37411	DN7H1	82302	pendiente
185	9K91R	JUAN EVARISTO CAZARES CERNA	\N	\N	LINIERO ENCARGADO LV	37SA0182	1	2026-03-19	5	M	SINDICALIZADO	2010-04-22	66374	CACJ871106HMNZRN16	37217	DN70E	82334	pendiente
187	9K91V	ANDRES IVAN MENDEZ ESPINOZA	\N	\N	LINIERO ENCARGADO LV	37SA0205	1	2026-03-19	5	M	SINDICALIZADO	2010-04-22	66374	MEEA810517HMNNSN01	37214	DN70B	82319	pendiente
188	9K91W	MARTIN ALFONSO GALVAN ESPARZA	\N	\N	PROFESIONISTA	37SA0162	1	2026-03-19	5	M	SINDICALIZADO	2010-01-25	69361	GAEM660311HJCLSR08	37212	DN7B0	82357	pendiente
81	9K91X	OSCAR FABIAN AGUILAR GUERRERO	\N	5527984280	LINIERO ENCARGADO HS	37SA0323	2	2026-03-17	3	M	SINDICALIZADO	2010-05-20	65353	AUGO820516HMNGRS08	37414	DN70C	88178	pendiente
190	9K920	SAUL HECTOR RODRIGUEZ MEDINA	\N	\N	LINIERO LV	37SA0201	1	2026-03-19	5	M	SINDICALIZADO	2010-02-02	65374	ROMS811027HMNDDL06	37216	DN70D	82329	pendiente
55	9K921	JUAN JOSE TEJEDA MENDEZ	juan.tejeda02@cfe.gob.mx	5577352550	LINIERO LV	37SA0161	2	2026-03-17	5	M	SINDICALIZADO	2010-02-02	65364	TEMJ850808HMNJNN00	37213	DN70A	82314	pendiente
192	9K922	VICTOR MANUEL RUIZ PAREDES	\N	\N	LINIERO ENCARGADO	37SA0314	1	2026-03-19	3	M	SINDICALIZADO	2012-06-15	65363	RUPV910130HMNZRC07	37412	DN70A	88178	pendiente
48	9K924	JOSE ANTONIO VACA RODRIGUEZ	\N	5568724274	LINIERO LV	37SA0137	2	2026-03-17	5	M	SINDICALIZADO	2010-02-02	65364	VARA770611HMNCDN03	37215	DN70C	82324	pendiente
194	9K925	VICTOR FELIPE ZAMORA VILLAGOMEZ	\N	\N	ELECTRICISTA	37SA0262	1	2026-03-19	5	M	SINDICALIZADO	2010-02-06	67365	ZAVV740728HMNMLC03	37211	DN7B0	82341	pendiente
195	9K929	SAUL SOLORZANO SOLORZANO	\N	\N	TECNICO	37SA0226	1	2026-03-19	3	M	SINDICALIZADO	2010-04-21	68351	SOSS871010HMNLLL09	37411	DN7H1	82302	pendiente
196	9L2BK	GERARDO MONTALVO GARCIA	\N	\N	AUXILIAR COMERCIAL	37SA0085	1	2026-03-19	4	M	SINDICALIZADO	2010-08-09	64375	MOGG751003HDFNRR03	37313	DN70A	88141	pendiente
197	9L4N1	JORGE ADELFO SOLIS PEREZ	\N	\N	LINIERO	37SA0355	1	2026-03-19	7	M	SINDICALIZADO	2010-07-11	64363	SOPJ760626HCCLRR03	37410	DN7B4	82375	pendiente
198	9L4N5	LUCIANO MOSQUEDA NOH	\N	\N	LINIERO LV	37SA0224	1	2026-03-19	5	M	SINDICALIZADO	2004-01-08	65384	MONL790803HTCSHC09	37217	DN70E	82334	pendiente
199	9L4PB	ANA MARICELA CAMPOSECO ORDOÑEZ	\N	\N	ENCARGADO SECCION	37SA0044	1	2026-03-19	4	F	SINDICALIZADO	2010-11-22	67352	CAOA860407MCSMRN02	37315	DN70C	82327	pendiente
28	9L4PG	FRANCISCO JAVIER DELGADO CHONG	francisco.delgado@cfe.mx	(55)38952580	TÉCNICO (DISTRIBUCION)	37SA0155	1	2026-03-17	8	M	SINDICALIZADO	2005-05-31	68361	DECF780916HDFLHR02	37221	DN7K2	82340	pendiente
201	9L4R6	RODOLFO EMANUEL TUT FERNANDEZ	\N	\N	TECNICO	37SA0131	1	2026-03-19	8	M	SINDICALIZADO	2009-07-26	68371	TUFR820327HCCTRD06	37222	DN7K1	82339	pendiente
202	9L4R7	CERVANDO RAFAEL CRUZ GONZALEZ	\N	\N	LINIERO ENCARGADO LV	37SA0272	1	2026-03-19	5	M	SINDICALIZADO	2009-09-17	66374	CUGC891024HCCRNR06	37216	DN70C	82329	pendiente
61	9L4RF	LUIS FERNANDO UCH BALAM	luis.uch@cfe.mx	5514350300	PROFESIONISTA	37SA0095	2	2026-03-17	9	M	SINDICALIZADO	2008-03-25	69361	UXBL841016HYNCLS03	37111	DN7L3	82361	pendiente
204	9L4XM	JOSE GUADALUPE BOCANEGRA MENDEZ	\N	\N	LINIERO ENCARGADO LV	37SA0136	1	2026-03-19	5	M	SINDICALIZADO	2006-09-17	66384	BOMG830926HCSCND06	37216	DN70D	82329	pendiente
205	9L4XX	ALBERTO BALLESTEROS FRANCO	\N	\N	TECNICO	37SA0225	1	2026-03-19	3	M	SINDICALIZADO	2010-02-11	68351	BAFA860228HDFLRL01	37411	DN7H1	82302	pendiente
89	9L4Y0	RICARDO GIOVANNI CHAVEZ RUBIO	\N	5528016512	LINIERO LV	37SA0207	2	2026-03-17	5	M	SINDICALIZADO	2010-04-29	65364	CARR790414HDFHBC09	37214	DN70B	82319	pendiente
32	9L4Y2	HILDA REYES GALINDO	hilda.reyes@cfe.mx	(55)79637845	AUXILIAR ESPECIALIZADO	37SA0241	1	2026-03-17	4	F	SINDICALIZADO	2010-05-31	66351	REGH770330MMCYLL01	37311	DN7C1	82328	pendiente
18	9L507	DAVID IGNACIO VEA BOJORQUEZ	David.vea@cfe.mx	(55)1915726	JEFE OFICINA ZONA III	37CA0040	1	2026-03-17	8	M	CONFIANZA	2010-05-21	18374	VEBD871010HSLXJV03	37222	DN7K1	82339	pendiente
209	9L50H	JOAQUIN TEJEDA SILVAN	\N	\N	LINIERO LV	37SA0223	1	2026-03-19	5	M	SINDICALIZADO	2002-12-18	65354	TESJ830727HTCJLQ04	37113	DN7L1	82345	pendiente
210	9L50J	CARLOS MARIO POSADA MORA	\N	\N	LINIERO ENCARGADO LV	37SA0365	1	2026-03-19	5	M	SINDICALIZADO	2010-04-12	66374	POMC810716HOCSRR05	37210	DN70C	82324	pendiente
211	9L519	ERIK MANUEL URIBE GODOY	\N	\N	PROFESIONISTA	37SA0276	1	2026-03-19	8	M	SINDICALIZADO	2010-12-09	69351	UIGE790603HDFRDR09	37223	DN7K3	82338	pendiente
29	9L51K	FRANCISCO LIÑAN OCEGUERA	francisco.linan@cfe.mx	5524063371	JEFE OFICINA ZONA III	37CA0034	1	2026-03-17	7	M	CONFIANZA	2010-11-29	18374	LIOF821220HMCXCR00	37417	DN70C	82371	pendiente
213	9L51L	JOSE ESTEBAN SANCHEZ PUC	\N	\N	LINIERO LV	37SA0177	1	2026-03-19	5	M	SINDICALIZADO	2010-04-12	65374	SAPE781121HYNNCS17	37214	DN70B	82319	pendiente
214	9L51M	EVERSAIN LANDERO PUC	\N	\N	LINIERO LV	37SA0269	1	2026-03-19	5	M	SINDICALIZADO	2010-06-22	65364	LAPE790301HDFNCV03	37214	DN70B	82319	pendiente
215	9L51R	JUAN CARLOS HAM ESPARZA	\N	\N	AUXILIAR COMERCIAL	37SA0086	1	2026-03-19	4	M	SINDICALIZADO	2002-06-27	64385	HAEJ711102HVZMSN02	37316	DN70D	88144	pendiente
216	9L51T	DIEGO ARMANDO PEREZ SANCHEZ	\N	\N	PROFESIONISTA	37SA0159	1	2026-03-19	7	M	SINDICALIZADO	2010-12-11	69351	PESD860617HCMRNG04	37417	DN70C	82371	pendiente
217	9L51U	PEDRO GARCIA ALVAREZ	\N	\N	AYUDANTE LINIERO	37SA0174	1	2026-03-19	3	M	SINDICALIZADO	2010-12-17	62365	GAAP640624HMCRLD07	37415	DN70D	88178	pendiente
218	9L51V	ALONSO NAVA ORTIZ	\N	\N	AUXILIAR ADMINISTRATIVO	37SA0315	1	2026-03-19	3	M	SINDICALIZADO	2011-01-05	65341	NAOA750218HDFVRL07	37413	DN70E	82369	pendiente
11	9L51W	CARLO ADAIR AGUILAR GASTELUM	carlo.aguilar@cfe.mx	55 2233 7363	PROFESIONISTA	37SA0139	1	2026-03-17	7	M	SINDICALIZADO	2000-01-10	69361	AUGC740824HSLGSR08	37416	DN70A	82355	pendiente
84	9L51X	PAVEL AMILCAR MELENDRES LLAMAS	pavel.melendres@cfe.mx	33366667440	TÉCNICO	37SA0132	2	2026-03-17	9	M	SINDICALIZADO	2005-06-28	68371	MELP800718HSLLLV09	37112	DN7L2	82360	pendiente
221	9L531	LUIS FABIAN PIERLUISI ZAMUDIO	\N	\N	JEFE OFICINA ZONA III	37CA0032	1	2026-03-19	3	M	CONFIANZA	2011-01-16	18374	PIZL821005HCSRMS01	37411	DN7H1	82302	pendiente
39	9L53L	JAIME REYES BARRERA	\N	\N	JEFE OFICINA ZONA III	37CA0039	1	2026-03-17	8	M	CONFIANZA	2010-12-19	18374	REBJ771021HDFYRM07	37221	DN7K2	82340	pendiente
223	9L55W	EDWING RICARDO LEYVA VELASCO	\N	\N	AUXILIAR COMERCIAL	37SA0023	1	2026-03-19	4	M	SINDICALIZADO	2011-06-02	64375	LEVE820502HDFYLD06	37315	DN70C	88143	pendiente
224	9L55X	OSCAR RAYA MORENO	\N	\N	AUXILIAR COMERCIAL	37SA0055	1	2026-03-19	4	M	SINDICALIZADO	2010-08-02	64375	RAMO740609HDFYRS01	37317	DN70E	82337	pendiente
225	9L57C	JOSE RAMON MENDIVIL RIVERA	\N	\N	PROFESIONISTA	37SA0118	1	2026-03-19	8	M	SINDICALIZADO	2010-05-31	69351	MERR860323HSLNVM04	37222	DN7K1	88177	pendiente
42	9L57D	JESUS GALINDO HERNANDEZ	jesus.galindo@cfe.gob.mx	5529403739	LINIERO ENCARGADO LV	37SA0267	1	2026-03-17	5	M	SINDICALIZADO	2010-05-18	66374	GAHJ740318HDFLRS09	37214	DN70B	82319	pendiente
227	9L57E	VICTOR HUGO TEXOCOTITLA SERRALDE	\N	\N	LINIERO ENCARGADO LV	37SA0363	1	2026-03-19	5	M	SINDICALIZADO	2010-05-18	66374	TESV741214HDFXRC03	37210	DN70B	82319	pendiente
228	9L57F	PEDRO SABINO GALICIA	\N	\N	LINIERO LV	37SA0209	1	2026-03-19	5	M	SINDICALIZADO	2010-05-19	65364	SAGP790826HDFBLD00	37215	DN70C	82324	pendiente
229	9L57J	JULIAN FUENTES SANCHEZ	\N	\N	AUXILIAR COMERCIAL	37SA0054	1	2026-03-19	4	M	SINDICALIZADO	2011-02-15	64375	FUSJ760109HDFNNL09	37313	DN70A	82317	pendiente
230	9L57L	RIGOBERTO SALAS MALDONADO	\N	\N	PROFESIONISTA	37SA0259	1	2026-03-19	5	M	SINDICALIZADO	2011-02-04	69351	SAMR820825HPLLLG04	37211	DN7B0	82341	pendiente
231	9L57N	PAULINO CRUZ CRUZ	\N	\N	LINIERO	37SA0121	1	2026-03-19	3	M	SINDICALIZADO	2010-01-12	64373	CUCP630730HOCRRL07	37414	DN70C	82367	pendiente
232	9L57P	VICTOR ALFONSO MELO QUIÑONEZ	\N	\N	PROFESIONISTA	37SA0187	1	2026-03-19	9	M	SINDICALIZADO	2010-10-26	69351	MEQV840224HMSLXC01	37111	DN7L3	82361	pendiente
233	9L57R	EDGAR EDMUNDO RAMIREZ JIMENEZ	\N	\N	PROFESIONISTA	37SA0091	1	2026-03-19	9	M	SINDICALIZADO	2010-10-26	69351	RAJE821116HDFMMD03	37112	DN7L2	82360	pendiente
60	9L57T	LUIS ARMANDO IBARRIA CUEN	luis.ibarria@cfe.mx	5551015332	PROFESIONISTA	37SA0096	1	2026-03-17	9	M	SINDICALIZADO	2009-12-31	69361	IACL860411HSLBNS07	37112	DN7L2	82360	pendiente
235	9L57V	ENRIQUE ORTIZ AGUAYO	\N	\N	AUXILIAR ADMINISTRATIVO	37SA0007	1	2026-03-19	2	M	SINDICALIZADO	2010-08-22	65341	OIAE731022HPLRYN00	37610	DN7F0	82313	pendiente
236	9L580	JUAN GERARDO FLORES ALMANZA	\N	\N	AYUDANTE LINIERO	37SA0327	1	2026-03-19	3	M	SINDICALIZADO	2011-01-10	62365	FOAJ651003HDFLLN07	37415	DN7H1	88178	pendiente
237	9L5C6	LLUVIA DANIELA VICTORIA LOPEZ	\N	\N	JEFE DEPARTAMENTO ZONA III	37CA0009	1	2026-03-19	9	F	CONFIANZA	2010-04-02	19372	VILL850609MOCCPL03	37110	DN7L0	82309	pendiente
238	9L5E8	VIRGINIA YOLANDA SARMIENTO ROJAS	\N	\N	AUXILIAR ESPECIALIZADO	37SA0013	1	2026-03-19	2	F	SINDICALIZADO	2011-09-25	66351	SARV820521MDFRJR01	37612	DN7F2	82349	pendiente
239	9L5EL	AFARID RAFAEL MURGUIA MONTES DE OCA	\N	\N	AUXILIAR ADMINISTRATIVO	37SA0008	1	2026-03-19	7	M	SINDICALIZADO	2012-02-23	65341	MUMA850401HDFRNF01	37410	DN7H0	82303	pendiente
240	9L5FN	JAIR HERNANDEZ CUERVO	\N	\N	JEFE OFICINA ZONA III	37CA0019	1	2026-03-19	9	M	CONFIANZA	2004-04-01	18374	HECJ741029HVZRRR04	37113	DN7L1	82345	pendiente
40	9L5FU	JAVIER REYNOSO ISLAS	\N	5537311802	TÉCNICO	37SA0310	2	2026-03-17	3	M	SINDICALIZADO	2010-05-31	68351	REIJ800521HDFYSV05	37411	DN7H1	82302	pendiente
242	9L5FV	FRANCISCO GALICIA CHAVEZ	\N	\N	TECNICO	37SA0311	1	2026-03-19	3	M	SINDICALIZADO	2010-06-04	68351	GACF761004HDFLHR07	37411	DN7H1	82302	pendiente
243	9L5G9	NERIC RAUL BOLAÑOS RETANA	\N	\N	LINIERO ENCARGADO LV	37SA0364	1	2026-03-19	5	M	SINDICALIZADO	2010-07-23	66374	BORN770709HMNLTR00	37210	DN70A	82314	pendiente
6	9L5JP	AZALIA CRISTINA TORRES GAONA	azalia.torres@cfe.mx	5539050533	SECRETARIA	37CA0030	1	2026-03-17	10	F	CONFIANZA	2012-12-05	11371	TOGA890416MDFRNZ05	37010	DN7A0	82300	pendiente
373	9MKTW	RAFAEL FIGUEROA FLORES	\N	\N	AYUDANTE LINIERO	37SA0326	1	2026-03-19	3	M	SINDICALIZADO	2016-11-10	62355	\N	37415	DN7H1	82302	pendiente
66	9L5JR	MARCO ANTONIO PLASCENCIA BELTRAN	\N	\N	JEFE DEPARTAMENTO ZONA III	37CA0003	1	2026-03-17	12	M	CONFIANZA	2006-06-11	19362	PABM790923HMSLLR08	37710	DN7A1	82301	pendiente
246	9L5K9	KARLA GPE. MONTES DE OCA LIMA	\N	\N	JEFE DEPARTAMENTO ZONA III	37CA0016	1	2026-03-19	13	F	CONFIANZA	2010-09-27	19372	MOLK830223MMSNMR10	37510	DN7E0	82310	pendiente
247	9L5KD	ESAUC RUBEN HUERTA ARRAZOLA	\N	\N	AUXILIAR TECNICO	37SA0257	1	2026-03-19	9	M	SINDICALIZADO	2011-02-13	65352	HUAE720903HDFRRS01	37113	DN7L1	82345	pendiente
248	9L85W	ALVARO PEREZ MARTINEZ	\N	\N	LINIERO LV	37SA0271	1	2026-03-19	5	M	SINDICALIZADO	2010-09-14	65374	PEMA780923HDFRRL02	37215	DN70C	82324	pendiente
249	9L8EV	RUBEN RIVERA CONTRERAS	\N	\N	LINIERO LV	37SA0208	1	2026-03-19	5	M	SINDICALIZADO	2010-08-15	65364	\N	37214	DN70B	82319	pendiente
90	9M5FM	ROBERTO MONROY LLANES	\N	\N	AUXILIAR COMERCIAL	37SA0063	1	2026-03-17	4	M	SINDICALIZADO	2011-02-09	64375	MOLR781115HDFNLB04	37314	DN70B	88142	pendiente
67	9M5VT	MARIA FERNANDA SABIDO PEDRAZA	maria.sabido@cfemx	5523026543	AUXILIAR DE SERVICIOS I	37SA0149	1	2026-03-17	13	F	SINDICALIZADO	2010-05-21	61351	SAPF770626MDFBDR00	37514	DN7E3	82347	pendiente
252	9M8D3	ERICK ARENAS FRAGOSO	\N	\N	VERIFICADOR CALIBRADOR II	37SA0056	1	2026-03-19	7	M	SINDICALIZADO	2015-09-29	67343	AEFE871020HDFRRR04	37417	DN70C	82371	pendiente
97	9MG0W	YADIRA RIOS GALLARDO	\N	\N	AGENTE COMERCIAL III	37CA0015	1	2026-03-17	4	F	CONFIANZA	2011-07-19	17371	RIGY810819MMCSLD01	37316	DN70D	82332	pendiente
31	9MJA5	GERARDO DE JESUS COLOHUA	gerardo.jesus@cfe.mx	5612081356	JEFE OFICINA ZONA III	37CA0022	1	2026-03-17	5	M	CONFIANZA	2008-10-17	18374	JECG810701HVZSLR08	37213	DN70A	82314	pendiente
255	9MJA6	JOSE ANGEL ANGULO URIAS	\N	\N	JEFE OFICINA ZONA III	37CA0026	1	2026-03-19	5	M	CONFIANZA	2013-08-02	18364	AUUA820302HSLNRN07	37217	DN70E	82334	pendiente
72	9MJA9	MARTIN PALMA HERRERA	\N	\N	JEFE OFICINA ZONA III	37CA0044	1	2026-03-17	5	M	CONFIANZA	2010-05-29	18374	PAHM810727HPLLRR00	37211	DN7B0	82341	pendiente
43	9MJAG	JESUS MANUEL MORA GARCIA	jesus.morag@cfe.mx	(55)43134002	JEFE OFICINA ZONA III	37CA0042	1	2026-03-17	7	M	CONFIANZA	2008-05-19	19362	MOGJ841225HVZRRS00	37410	DN7H0	82303	pendiente
258	9MJAH	LUIS ANTONIO RODRIGUEZ LIMA	\N	\N	JEFE OFICINA ZONA III	37CA0047	1	2026-03-19	3	M	CONFIANZA	2010-04-21	18374	ROLL790601HOCDMS07	37413	DN70E	82369	pendiente
21	9MJAJ	EDWAR ALAIN AYALA LOPEZ	\N	\N	JEFE DEPARTAMENTO ZONA III	37CA0068	3	2026-03-17	3	M	CONFIANZA	2011-01-04	19372	AALE840513HCMYPD08	37410	DN7I0	82303	pendiente
8	9MJAK	BERNABE COTA COTA	bernabe.cota@cfe.mx	55 2239 9469	JEFE DEPARTAMENTO ZONA III	37CA0021	3	2026-03-17	9	M	CONFIANZA	2010-10-31	19362	COCB860102HSLTTR04	37210	DN7B0	82307	pendiente
261	9MJBE	MARIA MONTSERRAT FERREIRA MARTINEZ	\N	\N	AUXILIAR ESPECIALIZADO	37SA0104	1	2026-03-19	2	F	SINDICALIZADO	2010-12-20	66351	FEMM810114MMNRRN09	37611	DN7F1	82348	pendiente
262	9MJBF	JAIME JESUS SOSA TRUJILLO	\N	\N	AUXILIAR ESPECIALIZADO	37SA0342	1	2026-03-19	2	M	SINDICALIZADO	2010-09-20	66351	SOTJ661009HDFSRM03	37613	DN7F3	82312	pendiente
263	9MJC6	HECTOR OCTAVIO VAZQUEZ VENEGAS	\N	\N	AUXILIAR COMERCIAL	37SA0287	1	2026-03-19	4	M	SINDICALIZADO	2010-10-09	64375	VAVH681226HDFZNC06	37317	DN70E	88145	pendiente
264	9MJC9	JOSE GARCIA GARCIA	\N	\N	AUXILIAR COMERCIAL	37SA0282	1	2026-03-19	4	M	SINDICALIZADO	2010-09-16	64375	GAGJ710918HDFRRS03	37315	DN70C	88143	pendiente
265	9MJCC	MOISES FIGUEROA LOYO	\N	\N	OFICINISTA COMERCIAL	37SA0289	1	2026-03-19	4	M	SINDICALIZADO	2010-10-04	66353	FILM860118HDFGYS01	37317	DN70E	88145	pendiente
266	9MJCF	ROBERTO SERGIO GUZMAN MERIDA	\N	\N	AUXILIAR COMERCIAL	37SA0284	1	2026-03-19	4	M	SINDICALIZADO	2010-10-09	64375	GUMR791231HJCZRB11	37316	DN70D	88144	pendiente
267	9MJCG	ROSALINDA ROSALES REYES	\N	\N	AUXILIAR ADMINISTRATIVO	37SA0328	1	2026-03-19	3	F	SINDICALIZADO	2010-11-28	65341	RORR710830MDFSYS05	37415	DN70D	82368	pendiente
268	9MJCH	SERGIO VALENCIA RAMOS	\N	\N	VERIFICADOR CALIBRADOR I	37SA0254	1	2026-03-19	7	M	SINDICALIZADO	2010-03-01	66352	VARS880214HTCLMR02	37416	DN70A	82355	pendiente
73	9MJE7	MAURICIO MONTALVO RODRIGUEZ	mauricio.montalvo@cfe.mx	7775220452	ELECTRICISTA	37SA0131	1	2026-03-17	5	M	SINDICALIZADO	2010-08-13	67355	MORM820207HMSNDR03	37211	DN7B0	82341	pendiente
270	9MJFV	CARLOS ERNESTO TORRES HIDALGO	\N	\N	AYUDANTE LINIERO	37SA0151	1	2026-03-19	3	M	SINDICALIZADO	2010-10-08	62365	TOHC680731HDFRDR06	37414	DN7H1	88178	pendiente
271	9MJFW	FELIPE DE JESUS SERRANO GONZALEZ	\N	\N	AUXILIAR COMERCIAL	37SA0082	1	2026-03-19	4	M	SINDICALIZADO	2010-09-14	64375	SEGF660205HDFRNL08	37317	DN70E	88145	pendiente
38	9MJFX	ISRAEL HERNANDEZ SANTIAGO	\N	5514963759	LINIERO LV	37SA0184	2	2026-03-17	5	M	SINDICALIZADO	2010-09-06	65364	HESI720912HMCRNS00	37213	DN70A	82314	pendiente
273	9MJFY	DANIEL VARGAS CASTRO	\N	\N	AUXILIAR ADMINISTRATIVO	37SA0312	1	2026-03-19	3	M	SINDICALIZADO	2010-10-29	65341	VACD710722HDFRSN09	37412	DN70A	82372	pendiente
274	9MJG0	JORGE ACOSTA DIAZ	\N	\N	AUXILIAR ESPECIALIZADO	37SA0011	1	2026-03-19	13	M	SINDICALIZADO	2010-08-11	66351	AODJ730305HDFCZR02	37514	DN7E3	82347	pendiente
275	9MJG1	RICHARD ALEXANDER MORALES LOPEZ	\N	\N	AUXILIAR COMERCIAL	37SA0080	1	2026-03-19	4	M	SINDICALIZADO	2004-06-02	64375	MOLR761121HTCRPC07	37317	DN70E	88145	pendiente
276	9MJG5	SERGIO ALBERTO ORTIZ ZAVALA	\N	\N	LINIERO ENCARGADO	37SA0322	1	2026-03-19	3	M	SINDICALIZADO	2010-11-23	65353	OIZS840708HDFRVR01	37414	DN70C	88178	pendiente
69	9MJGP	MARIO ALBERTO RIOJA FLORES	mario.rioja@cfe.gob.mx	5540978737	LINIERO ENCARGADO HS	37SA0316	2	2026-03-17	3	M	SINDICALIZADO	2010-12-02	65353	RIFM840730HDFJLR09	37413	DN70E	88178	pendiente
278	9MJJ2	HUMBERTO ROSAS REYES	\N	\N	LINIERO ENCARGADO LV	37SA0133	1	2026-03-19	5	M	SINDICALIZADO	2010-05-27	66374	RORH841120HDFSYM03	37215	DN70C	82324	pendiente
279	9MJJV	CHRISTIAN CHAVEZ FLORES	\N	\N	LINIERO ENCARGADO LV	37SA0268	1	2026-03-19	5	M	SINDICALIZADO	2010-05-23	66374	CAFC820214HDFHLH01	37214	DN70B	82319	pendiente
280	9MJKE	OSCAR URIBE VILLA	\N	\N	LINIERO	37SA0345	1	2026-03-19	7	M	SINDICALIZADO	2010-09-29	64363	UIVO691205HDFRLS01	37410	DN7B4	82375	pendiente
45	9MJLA	JESUS SILVERIO FUENTES BERROCAL	jesus.fuentesb@cfe.mx	5514845762	AUXILIAR ADMINISTRATIVO	37SA0258	1	2026-03-17	5	M	SINDICALIZADO	2010-05-18	65341	FUBJ760217HDFNRS00	37210	DN7B0	82307	pendiente
283	9MJLR	JOSE LUIS LUNA PEREZ	\N	\N	TECNICO	37SA0202	1	2026-03-19	9	M	SINDICALIZADO	2010-08-10	68361	LUPL730113HDFNRS08	37112	DN7L2	82360	pendiente
80	9MJMU	ORLANDO ISRAEL MENDOZA HERNANDEZ	\N	\N	LINIERO ENCARGADO HS	37SA0331	1	2026-03-17	3	M	SINDICALIZADO	2010-08-23	65353	MEHO830626HDFNRR00	37415	DN70D	82368	pendiente
285	9MJN8	CESAR EDUARDO GONZALEZ CAMARILLO	\N	\N	ENCARGADO SECCION	37SA0230	1	2026-03-19	4	M	SINDICALIZADO	2011-02-19	67352	GOCC760301HDFNMS00	37314	DN70B	82322	pendiente
286	9MJX6	JORGE REVIMAR GALLARDO	\N	\N	AUXILIAR COMERCIAL	37SA0037	1	2026-03-19	4	M	SINDICALIZADO	2011-02-23	64375	REGJ710709HDFVLR03	37316	DN70D	88144	pendiente
287	9MJX7	JOSE TRINIDAD GOMEZ AYALA	\N	\N	AUXILIAR COMERCIAL	37SA0288	1	2026-03-19	4	M	SINDICALIZADO	2011-02-15	64375	GOAT670521HMCMYR02	37317	DN70E	88145	pendiente
288	9MJX8	MANUEL HERNANDEZ AGUIRRE	\N	\N	AUXILIAR COMERCIAL	37SA0064	1	2026-03-19	4	M	SINDICALIZADO	2011-03-21	64375	HEAM680705HGRRGN07	37314	DN70B	88142	pendiente
289	9MJY8	EDGAR MARTINEZ RAMIREZ	\N	\N	LINIERO ENCARGADO	37SA0317	1	2026-03-19	3	M	SINDICALIZADO	2010-10-25	65353	MARE870504HMCRMD03	37413	DN70E	88178	pendiente
290	9MK0K	ALEJANDRO ROMERO AMAYA	\N	\N	ELECTRICISTA AYUDANTE	37SA0264	1	2026-03-19	5	M	SINDICALIZADO	2010-09-04	64367	ROAA720826HDFMML07	37211	DN7B0	82341	pendiente
291	9MK10	ERIC CORIA ALVARADO	\N	\N	AUXILIAR COMERCIAL	37SA0036	1	2026-03-19	4	M	SINDICALIZADO	2011-02-17	64375	COAE790316HDFRLR10	37316	DN70D	88144	pendiente
292	9MK24	ELIAS ROBERTO SURUR ROJAS	\N	\N	LINIERO LV	37SA0185	1	2026-03-19	5	M	SINDICALIZADO	2010-10-12	65364	SURE781103HDFRJL05	37216	DN70D	82329	pendiente
293	9MK41	LEONCIO FERNANDO VITE PEREZ	\N	\N	LINIERO LV	37SA0274	1	2026-03-19	5	M	SINDICALIZADO	2010-09-15	65364	VIPL650710HDFTRN03	37217	DN70E	82334	pendiente
51	9MK42	JOSE FRANCISCO MONTERO AVILA	\N	5529444633	LINIERO ENCARGADO HS	37SA0313	1	2026-03-17	3	M	SINDICALIZADO	2011-12-24	65353	MOAF720401HDFNVR03	37412	DN70A	88178	pendiente
295	9MK45	GUILLERMO HERNANDEZ HERNANDEZ	\N	\N	LINIERO ENCARGADO LV	37SA0098	1	2026-03-19	5	M	SINDICALIZADO	2011-02-18	66374	HEHG780111HPLRRL03	37216	DN70D	82329	pendiente
27	9MK46	FRANCISCO JAVIER CRUZ VARGAS	\N	(55)43931095	LINIERO LV	37SA0140	1	2026-03-17	5	M	SINDICALIZADO	2011-07-24	65364	CUVF930514HDFRRR01	37213	DN70A	82314	pendiente
297	9MK47	EMILIANO RODRIGUEZ MIRANDA	\N	\N	LINIERO LV	37SA0100	1	2026-03-19	5	M	SINDICALIZADO	2011-02-01	65364	ROME880511HPLDRM02	37113	DN7L1	82345	pendiente
20	9MK48	EDUARDO OLGUIN AVILA	eduardo.olguin@cfe.mx	5543278582	LINIERO LV	37SA0266	1	2026-03-17	5	M	SINDICALIZADO	2010-12-21	65364	OUAE741029HPLLVD04	37213	DN70A	82314	pendiente
16	9MK49	CRISTOBAL VARGAS VERGARA	cristobal.vargas@cfe.gob	5546172526	LINIERO LV	37SA0098	1	2026-03-17	5	M	SINDICALIZADO	2010-09-18	65364	VAVC781126HDFRRR00	37216	DN70D	82329	pendiente
300	9MK5D	RODRIGO LIRA FERNANDEZ	\N	\N	AUXILIAR COMERCIAL	37SA0251	1	2026-03-19	4	M	SINDICALIZADO	2011-02-20	64375	LIFR800513HDFRRD04	37316	DN70D	88144	pendiente
301	9MK5F	ULISES ABRAHAM ALMIRALLA MOTA	\N	\N	AUXILIAR ADMINISTRATIVO	37SA0275	1	2026-03-19	8	M	SINDICALIZADO	2010-07-13	65341	AIMU710210HDFLTL09	37220	DN7K0	82308	pendiente
62	9MK67	LUIS GARCIA PIÑA	luis.garciap@cfe.mx	5562114417	AGENTE COMERCIAL III	37CA0013	1	2026-03-17	4	M	CONFIANZA	2011-06-03	17371	GAPL820513HMNRXS00	37313	DN70A	82317	pendiente
303	9MK6C	LUIS ALBERTO ZAMACONA PINEDA	\N	\N	OFICINISTA COMERCIAL	37SA0286	1	2026-03-19	4	M	SINDICALIZADO	2011-08-03	66353	ZAPL890313HDFMNS06	37316	DN70D	88144	pendiente
76	9MK6E	MIGUEL ANGEL URIBE MORENO	miguel.uribem@cfe.mx	(55)21420168	OFICINISTA COMERCIAL	37SA0359	1	2026-03-17	7	M	SINDICALIZADO	2011-02-22	66353	UIMM811025HDFRRG05	37410	DN7B4	82375	pendiente
305	9MK6G	GUSTAVO ESPINAL GOMEZ	\N	\N	LINIERO	37SA0324	1	2026-03-19	3	M	SINDICALIZADO	2014-10-10	64353	\N	37415	DN70D	82368	pendiente
2	9MK6N	AGUSTIN RAZIEL SANTOS AMADOR	agustin.santos@cfe.mx	5527281500	AUXILIAR ADMINISTRATIVO	37SA0187	1	2026-03-17	9	M	SINDICALIZADO	2010-09-19	68361	SAAA690919HPLNMG02	37111	DN7L3	82361	pendiente
307	9MK6P	ALEJANDRO SOLIS MARTINEZ	\N	\N	ELECTRICISTA AYUDANTE	37SA0263	1	2026-03-19	5	M	SINDICALIZADO	2010-09-13	64367	SOMA740303HDFLRL04	37211	DN7B0	82341	pendiente
26	9MK6V	FERNANDO VALLEJO QUINTERO	fernando.vallejo@cfe.mx	5559663524	AUXILIAR ADMINISTRATIVO	37SA0010	1	2026-03-17	13	M	SINDICALIZADO	2010-09-23	66351	VAQF780923HDFLNR01	37511	DN7E2	82346	pendiente
309	9MK6W	JAVIER VELAZQUEZ GONZALEZ	\N	\N	AUXILIAR SERVICIOS I	37SA0009	1	2026-03-19	4	M	SINDICALIZADO	2010-09-14	61361	VEGJ710821HDFLNV07	37514	DN7E3	82347	pendiente
310	9MK6Y	RAUL MARTINEZ SAAVEDRA	\N	\N	AUXILIAR COMERCIAL	37SA0051	1	2026-03-19	8	M	SINDICALIZADO	2011-02-23	64375	MASR731107HPLRVL02	37313	DN70A	88141	pendiente
311	9MK70	RICARDO ALMERAYA HERNANDEZ	\N	\N	PROFESIONISTA	37SA0141	1	2026-03-19	13	M	SINDICALIZADO	2011-02-14	69351	AEHR710318HDFLRC04	37221	DN7K2	82340	pendiente
68	9MK7B	MARIO ADRIAN SERRANO CERVANTES	mario.serrano@cfe.mx	5536550179	ENCARGADO DE SECCION	37SA0338	1	2026-03-17	4	M	SINDICALIZADO	2013-11-28	67342	SECM861231HDFRRR02	37511	DN7E2	82346	pendiente
313	9MK8H	SABINO SOTRES MARTINEZ	\N	\N	AUXILIAR COMERCIAL	37SA0285	1	2026-03-19	3	M	SINDICALIZADO	2011-10-10	64375	SOMS780213HDFTRB03	37316	DN70D	88144	pendiente
314	9MK8U	RODRIGO MURILLO BECERRIL	\N	\N	AYUDANTE LINIERO	37SA0197	1	2026-03-19	13	M	SINDICALIZADO	2011-04-18	62365	MUBR720211HDFRCD02	37413	DN70E	88178	pendiente
315	9MK9W	YIRINA SANCHEZ ZAPIEN	\N	\N	AUXILIAR ADMINISTRATIVO	37SA0340	1	2026-03-19	3	F	SINDICALIZADO	2011-04-06	65331	SAZY821222MDFNPR07	37514	DN7E3	82347	pendiente
316	9MKAH	JUAN CARLOS ALONSO FUENTES	\N	\N	LINIERO	37SA0212	1	2026-03-19	3	M	SINDICALIZADO	2011-06-29	64353	AOFJ800415HTLLNN01	37413	DN7H1	88178	pendiente
317	9MKAK	ERICK NAVARRO BAUTISTA	\N	\N	LINIERO	37SA0247	1	2026-03-19	9	M	SINDICALIZADO	2011-08-10	64353	NABE780126HDFVTR02	37414	DN70C	88178	pendiente
318	9MKC3	LUIS JAVIER TORRES PEREZ	\N	\N	JEFE OFICINA ZONA III	37CA0031	1	2026-03-19	3	M	CONFIANZA	2016-02-26	18364	TOPL851011HDFRRS00	37112	DN7L2	82360	pendiente
319	9MKC5	FRANCISCO JAVIER DE JESUS AGUIRRE M	\N	\N	JEFE OFICINA ZONA III	37CA0049	1	2026-03-19	3	M	CONFIANZA	2010-04-08	18364	AUMF860830HTCGNR04	37415	DN70D	82368	pendiente
93	9MKCC	SANDRA XOCHITL GONZALEZ SANCHEZ	sandra.gonzalezs@cfe.mx	(55)32506892	AUXILIAR ADMINISTRATIVO	37SA0320	1	2026-03-17	3	F	SINDICALIZADO	2011-09-08	65331	LOTM740214MDFPRR06	37414	DN70C	82367	pendiente
321	9MKCT	HUGO ORTEGA GUTIERREZ	\N	\N	LINIERO ENCARGADO	37SA0329	1	2026-03-19	\N	M	SINDICALIZADO	2012-09-25	65343	OEGH821214HDFRTG08	37415	DN70D	88178	pendiente
322	9MKCU	JUAN CARLOS ZAMORA IBARIAS	\N	\N	LINIERO	37SA0347	1	2026-03-19	3	M	SINDICALIZADO	2011-12-02	64353	ZAIJ780609HDFMBN00	37410	DN7B4	82375	pendiente
323	9MKCV	OSWALDO URIEL TONINI VALDEZ	\N	\N	LINIERO	37SA0167	1	2026-03-19	4	M	SINDICALIZADO	2011-08-28	64353	CULJ710322HDFVGV07	37412	DN70A	88178	pendiente
324	9MKCW	HUMBERTO HERNANDEZ RODRIGUEZ	\N	\N	OFICINISTA COMERCIAL	37SA0278	1	2026-03-19	4	M	SINDICALIZADO	2014-05-15	66343	RUBE841214HDFBRD06	37313	DN70A	88141	pendiente
325	9MKCX	URIEL CARMONA RAMIREZ	\N	\N	AUXILIAR COMERCIAL	37SA0084	1	2026-03-19	4	M	SINDICALIZADO	2013-08-27	64365	CARU800625HDFRMR09	37314	DN70B	88142	pendiente
326	9MKD7	HECTOR DE LA LUZ MALDONADO	\N	\N	AUXILIAR COMERCIAL	37SA0280	1	2026-03-19	13	M	SINDICALIZADO	2013-07-07	64365	CARU800625HDFRMR09	37314	DN70B	88142	pendiente
327	9MKDD	JOSE FRANCISCO CASTRO AGUILAR	\N	\N	AUXILIAR ADMINISTRATIVO	37SA0106	1	2026-03-19	4	M	SINDICALIZADO	2011-09-17	65331	CAAF701004HDFSGR03	37511	DN7E2	82346	pendiente
328	9MKDV	MIGUEL ANGEL MARTINEZ MONTIEL	\N	\N	AUXILIAR COMERCIAL	37SA0026	1	2026-03-19	3	M	SINDICALIZADO	2013-08-24	64365	AUDA860618HOCGZL07	37315	DN70C	88143	pendiente
329	9MKDY	JOSE LUIS LOPEZ RAMOS	\N	\N	LINIERO	37SA0143	1	2026-03-19	13	M	SINDICALIZADO	2013-09-14	64353	NEGF760924HMCPMR02	37412	DN70A	82372	pendiente
330	9MKE1	BRIGIDA TERESA HERNANDEZ BAUTISTA	\N	\N	AUXILIAR SERVICIOS I	37SA0122	1	2026-03-19	3	F	SINDICALIZADO	2011-09-29	61351	HEBB591008MOCRTR07	37514	DN7E3	82347	pendiente
331	9MKEC	GIOVANNI LEONEL AVILA CHINCHILLA	\N	\N	LINIERO ENCARGADO	37SA0318	1	2026-03-19	3	M	SINDICALIZADO	2013-08-23	65343	AICG820523HDFVHV01	37413	DN70E	88178	pendiente
332	9MKET	CARLOS ERNESTO DEL RIO REYNA	\N	\N	LINIERO	37SA0114	1	2026-03-19	3	M	SINDICALIZADO	2013-08-24	64353	HERH870720HPLRDM01	37412	DN70A	88178	pendiente
65	9MKEU	MALIK GARCIA NATERAS	malik.garcia@cfe.mx	5519334124	LINIERO	37SA0160	1	2026-03-17	4	M	SINDICALIZADO	2014-04-29	65343	NARM930827HDFVDR09	37413	DN70E	82369	pendiente
334	9MKEV	MIGUEL ANGEL LOPEZ CUATOCHE	\N	\N	AUXILIAR COMERCIAL	37SA0039	1	2026-03-19	5	M	SINDICALIZADO	2013-09-19	64365	\N	37316	DN70D	88144	pendiente
335	9MKFJ	FERNANDO NEPOMUCENO GOMEZ	\N	\N	LINIERO LV	37SA0360	1	2026-03-19	13	M	SINDICALIZADO	2013-09-23	65354	NEGF760924HMCPMR02	37210	DN70C	82324	pendiente
336	9MKFY	MIRIAM GUADALUPE GALVAN SANCHEZ	\N	\N	AUXILIAR ESPECIALIZADO	37SA0012	1	2026-03-19	3	F	SINDICALIZADO	2014-01-24	66341	GASM820902MDFLNR05	37514	DN7E3	82347	pendiente
337	9MKG2	OMAR JOSE DE JESUS MORENO RETAMA	\N	\N	LINIERO	37SA0120	1	2026-03-19	5	M	SINDICALIZADO	2014-09-19	64353	MORO760503HMCRTM00	37413	DN70E	88178	pendiente
338	9MKH1	RICARDO HERNANDEZ HERNANDEZ	\N	\N	JEFE OFICINA ZONA III	37CA0025	1	2026-03-19	2	M	CONFIANZA	2017-11-10	18364	0	37214	DN70B	82319	pendiente
96	9MKH2	VIRIDIANA ELIOSA HERNANDEZ	Viridiana.eloisa@cfe.mx	(22)23303780	JEFE OFICINA ZONA III	37CA0006	1	2026-03-17	13	F	CONFIANZA	2016-03-14	18364	EIHV900227MDFLRR01	37613	DN7F3	82312	pendiente
340	9MKH3	PEDRO VALENTIN VERAZALUCE BARRAGAN	\N	\N	JEFE OFICINA ZONA III	37CA0046	1	2026-03-19	4	M	CONFIANZA	2016-09-29	18364	VEBP871005HMSRRD05	37513	DN7E4	82311	pendiente
341	9MKJY	YANET CASTILLO SEGURA	\N	\N	OFICINISTA COMERCIAL	37SA0283	1	2026-03-19	4	F	SINDICALIZADO	2014-01-09	66343	MEVH850425HDFJRG01	37315	DN70C	88143	pendiente
342	9MKK1	ALAN CHRISTIAN CUEVAS GONZALEZ	\N	\N	AUXILIAR COMERCIAL	37SA0035	1	2026-03-19	7	M	SINDICALIZADO	2018-07-11	64365	CUGA860226HDFRNL03	37313	DN70A	88141	pendiente
343	9MKK2	CARLOS TAPIA SANTIAGO	\N	\N	LINIERO	37SA0351	1	2026-03-19	7	M	SINDICALIZADO	2014-02-07	64353	PASN860213MDFCNY00	37410	DN7B4	82375	pendiente
344	9MKK4	JESUS IVAN SORIANO CHACON	\N	\N	LINIERO	37SA0353	1	2026-03-19	7	M	SINDICALIZADO	2014-10-29	64353	SOCJ941205HMCRHS02	37410	DN7B4	82375	pendiente
345	9MKK5	JOSE PABLO REYNA ARIAS	\N	\N	LINIERO	37SA0349	1	2026-03-19	5	M	SINDICALIZADO	2015-01-03	64353	REAP810911HDFYRB08	37410	DN7B4	82375	pendiente
346	9MKK6	JHONATAN JAIR PEREGRINA ABURTO	\N	\N	LINIERO ENCARGADO LV	37SA0265	1	2026-03-19	7	M	SINDICALIZADO	2016-05-03	66364	MORM820207HMSNDR03	37213	DN70A	82314	pendiente
347	9MKK8	EDGAR NOE CRUZ LINARES	\N	\N	LINIERO	37SA0356	1	2026-03-19	4	M	SINDICALIZADO	2015-04-25	64353	CULE920505HDFRND01	37410	DN7B4	82375	pendiente
348	9MKK9	FERNANDO VENEGAS MARTINEZ	\N	\N	AUXILIAR COMERCIAL	37SA0279	1	2026-03-19	5	M	SINDICALIZADO	2014-09-05	64365	BORA800605HDFLSL05	37314	DN70B	88142	pendiente
349	9MKKA	OSCAR RENE SANDOVAL VALDEZ	\N	\N	LINIERO LV	37SA0361	1	2026-03-19	13	M	SINDICALIZADO	2014-12-20	65354	SAVO830917HDFNLS05	37210	DN70B	82319	pendiente
350	9MKKB	EDUARDO EMMANUEL RUBIO BARRERA	\N	\N	AUXILIAR SERVICIOS I	37SA0125	1	2026-03-19	7	M	SINDICALIZADO	2014-02-07	61351	CASY821029MDFSGN09	37514	DN7E3	82347	pendiente
351	9MKKC	CHRISTIAN URIEL ORTIZ HERNANDEZ	\N	\N	LINIERO	37SA0358	1	2026-03-19	5	M	SINDICALIZADO	2014-12-23	64353	OIHC830711HDFRRH05	37410	DN7B4	82375	pendiente
352	9MKKE	MARIO GIOVANNY REYES REYES	\N	\N	LINIERO LV	37SA0362	1	2026-03-19	3	M	SINDICALIZADO	2016-05-23	65354	RERM940923HMNYYR09	37210	DN70A	82314	pendiente
353	9MKKN	ALBERTO ZAMANO PUGA	\N	\N	LINIERO	37SA0166	1	2026-03-19	3	M	SINDICALIZADO	2014-02-20	64353	HUCO880915HDFRHM09	37414	DN7H1	88178	pendiente
354	9MKKR	JOSE MANUEL SANCHEZ GARCIA	\N	\N	LINIERO	37SA0248	1	2026-03-19	9	M	SINDICALIZADO	2014-06-29	64353	GUPD660127HMCTRL09	37414	DN7H1	88178	pendiente
355	9MKKT	NAYELI PACHECO SANCHEZ	\N	\N	AUXILIAR ADMINISTRATIVO	37SA0256	1	2026-03-19	13	F	SINDICALIZADO	2014-04-13	65331	PASN860213MDFCNY00	37110	DN7L0	82309	pendiente
356	9MKKU	MARIA TERESA FLORES ORDAZ	\N	\N	AUXILIAR ESPECIALIZADO	37SA0005	1	2026-03-19	3	F	SINDICALIZADO	2016-08-19	66341	FOOT850705MDFLRR08	37511	DN7E2	82346	pendiente
357	9MKL0	JOSE EDGAR JIMENEZ CERVANTES	\N	\N	LINIERO ENCARGADO	37SA0330	1	2026-03-19	3	M	SINDICALIZADO	2016-06-24	65343	JICE850321HMNMRD02	37415	DN70D	88178	pendiente
358	9MKMN	JESUS HORACIO VELAZQUEZ RODRIGUEZ	\N	\N	AYUDANTE LINIERO	37SA0243	1	2026-03-19	4	M	SINDICALIZADO	2016-08-26	62355	VERJ900819HMNLDS06	37412	DN70A	88178	pendiente
359	9MKNP	RAFAEL QUINTANAR GONZALEZ	\N	\N	AUXILIAR COMERCIAL	37SA0083	1	2026-03-19	5	M	SINDICALIZADO	2013-12-26	64365	GOMF831226HDFNRR03	37317	DN70E	88145	pendiente
360	9MKNT	ALFONSO OCHOA ROSALES	\N	\N	JEFE OFICINA ZONA III	37CA0023	1	2026-03-19	7	M	CONFIANZA	2016-09-30	18364	OORA900127HDFCSL01	37216	DN70D	82329	pendiente
361	9MKNU	GLENDA GARCIA OREGON	\N	\N	SUPERVISOR ZONA III	37CA0062	1	2026-03-19	4	F	CONFIANZA	2017-03-13	16364	GOFF920812MSLDNR08	37410	DN7B4	82375	pendiente
362	9MKNV	ARMANDO DELGADO OSORIO	\N	\N	AGENTE COMERCIAL III	37CA0014	1	2026-03-19	7	M	CONFIANZA	2016-03-08	17361	DEOA930615HMCLSR05	37314	DN70B	82322	pendiente
363	9MKNX	EMMANUEL FUENTES MARQUEZ	\N	\N	SUPERVISOR ZONA III	37CA0061	1	2026-03-19	3	M	CONFIANZA	2016-01-05	16364	GOGB880625MMNMLR03	37410	DN7B4	82375	pendiente
364	9MKNY	MIGUEL ANGEL GUZMAN GUADARRAMA	\N	\N	JEFE OFICINA ZONA III	37CA0042	1	2026-03-19	7	M	CONFIANZA	2011-02-28	18364	GUGM830915HCMZDG09	37412	DN70A	82372	pendiente
365	9MKPE	EDGAR JAIR TORREBLANCA GARCIA	\N	\N	LINIERO	37SA0357	1	2026-03-19	3	M	SINDICALIZADO	2016-09-09	64353	TOGE900403HGRRRD05	37410	DN7B4	82375	pendiente
366	9MKPJ	CRUZ ISMAEL MOSQUEDA PEREZ	\N	\N	LINIERO	37SA0189	1	2026-03-19	7	M	SINDICALIZADO	2016-08-03	64353	MOPC950503HTCSRR01	37412	DN70A	88178	pendiente
367	9MKPK	RICARDO AVILA VERGARA	\N	\N	LINIERO	37SA0346	1	2026-03-19	4	M	SINDICALIZADO	2016-10-06	64353	AIVR900613HPLVRC01	37410	DN7B4	82375	pendiente
44	9MKPP	JESUS RAFAEL ZUÑIGA AGUIRRE	\N	5545810114	LINIERO	37SA0079	1	2026-03-17	7	M	SINDICALIZADO	2017-04-04	64365	ZUAJ861018HGRXGS09	37313	DN70A	88141	pendiente
369	9MKR9	JOSE HECTOR PIÑA ALMERAYA	\N	\N	JEFE OFICINA ZONA III	37CA0067	1	2026-03-19	3	M	CONFIANZA	2016-11-17	18364	PIAH780915HMCXLC03	37410	DN7B4	82375	pendiente
370	9MKT7	JORGE ENRIQUE RAMIREZ RICARDEZ	\N	\N	AYUDANTE LINIERO	37SA0115	1	2026-03-19	7	M	SINDICALIZADO	2014-07-23	62355	SOCJ941205HMCRHS02	37414	DN70C	82367	pendiente
371	9MKTU	DANIEL MORALES RIVAS	\N	\N	LINIERO	37SA0354	1	2026-03-19	3	M	SINDICALIZADO	2016-07-27	64353	MORD941114HMNRVN04	37410	DN7B4	82375	pendiente
372	9MKTV	ARMANDO HERNANDEZ DIAZ	\N	\N	AYUDANTE LINIERO	37SA0175	1	2026-03-19	3	M	SINDICALIZADO	2017-04-08	62355	HEDA900306HDFRZR00	37413	DN70E	88178	pendiente
374	9MKU2	PABLO PEREGRINA ABURTO	\N	\N	LINIERO	37SA0211	1	2026-03-19	3	M	SINDICALIZADO	2016-11-02	64353	PEAP970508HMNRBB05	37413	DN70E	88178	pendiente
375	9MKUL	ROBERTO ALEJANDRO CACERES RODRIGUEZ	\N	\N	AYUDANTE LINIERO	37SA0129	1	2026-03-19	3	M	SINDICALIZADO	2017-09-18	62355	CARR821001HYNCDB03	37414	DN70C	88178	pendiente
376	9MKUM	RIGOBERTO GARCIA CORDERO	\N	\N	LINIERO	37SA0246	1	2026-03-19	7	M	SINDICALIZADO	2017-09-15	64353	\N	37413	DN70E	82369	pendiente
377	9MKUN	IRVIN SALAZAR MENDEZ	\N	\N	LINIERO	37SA0350	1	2026-03-19	4	M	SINDICALIZADO	2017-11-27	64353	\N	37410	DN7B4	82375	pendiente
378	9MKUY	LUIS ANGEL LEON ALVAREZ	\N	\N	AUXILIAR COMERCIAL	37SA0066	1	2026-03-19	3	M	SINDICALIZADO	2015-09-13	64365	\N	37314	DN70B	88142	pendiente
379	9MKVD	JUAN JOSE FORTANELLY HERNANDEZ	\N	\N	SUPERVISOR ZONA III	37CA0043	1	2026-03-19	7	M	CONFIANZA	2019-03-07	16364	\N	37411	DN7H1	82302	pendiente
87	9MKVN	RAZIEL ERNESTO GARCIA GRAJEDA	\N	\N	JEFE OFICINA ZONA III	37CA0035	1	2026-03-17	4	M	CONFIANZA	2020-04-29	18364	0	37418	DN70A	82355	pendiente
381	9MKVU	OSCAR CORDERO BENITEZ	\N	\N	AUXILIAR COMERCIAL	37SA0049	1	2026-03-19	4	M	SINDICALIZADO	2015-04-13	64365	\N	37313	DN70A	88141	pendiente
382	9MLCG	FEDERICO JESUS HERNANDEZ ROJAS	\N	\N	AUXILIAR COMERCIAL	37SA0068	1	2026-03-19	4	M	SINDICALIZADO	2011-05-31	64375	HERF780120HDFRJD08	37315	DN70C	82327	pendiente
383	9MMMA	JORGE ALBERTO JIMENEZ LINARES	\N	\N	AUXILIAR COMERCIAL	37SA0067	1	2026-03-19	3	M	SINDICALIZADO	2014-05-12	64365	JILJ860124HMSMNR04	37314	DN70B	88142	pendiente
384	9MRTU	JOSUE IRAD MORALES GARCIA	\N	\N	LINIERO ENCARGADO	37SA0321	1	2026-03-19	4	M	SINDICALIZADO	2015-05-10	65343	\N	37414	DN70C	88178	pendiente
59	9NUP9	LIZETH ARACELY GALVAN GUERRERO	\N	\N	AGENTE COMERCIAL III	37CA0056	1	2026-03-17	7	F	CONFIANZA	2018-08-04	17361	\N	37317	DN70E	82337	pendiente
386	9NUPD	EDGAR ARTURO CORTES ABONZA	\N	\N	SUPERVISOR ZONA III	37CA0066	1	2026-03-19	3	M	CONFIANZA	2018-08-15	16364	\N	37410	DN7B4	82375	pendiente
387	9NUPF	JOAQUIN ALONSO QUINTANA LOPEZ	\N	\N	JEFE OFICINA ZONA III	37CA0045	1	2026-03-19	5	M	CONFIANZA	2021-06-21	18364	\N	37414	DN70C	82367	pendiente
49	9NUPK	JOSE CASTILLO VALDEZ	\N	\N	JEFE OFICINA ZONA III	37CA0024	1	2026-03-17	3	M	CONFIANZA	2020-09-15	18364	\N	37215	DN70C	82324	pendiente
389	9NUR3	LUIS GERARDO HERNANDEZ ZARATE	\N	\N	LINIERO	37SA0325	1	2026-03-19	3	M	SINDICALIZADO	2018-04-17	64353	\N	37415	DN70D	88178	pendiente
390	9NUR5	JUAN JOSE BERNAL SANDOVAL	\N	\N	AYUDANTE LINIERO	37SA0242	1	2026-03-19	3	M	SINDICALIZADO	2017-11-22	62355	BESJ911007HMNRNN02	37412	DN70A	88178	pendiente
391	9NUR6	RENE JUANILLO GONZALEZ	\N	\N	AYUDANTE LINIERO	37SA0216	1	2026-03-19	3	M	SINDICALIZADO	2018-04-19	62355	JUGR871113HMNNNN08	37413	DN70E	88178	pendiente
392	9NUR7	OMAR ROJAS CRUZ	\N	\N	AYUDANTE LINIERO	37SA0215	1	2026-03-19	4	M	SINDICALIZADO	2019-04-18	62355	\N	37414	DN7H1	88178	pendiente
393	9NUR9	ISRRAEL MENDIVIL RIVERA	\N	\N	AUXILIAR COMERCIAL	37SA0022	1	2026-03-19	3	M	SINDICALIZADO	2017-12-06	64365	\N	37315	DN70C	88143	pendiente
394	9NURY	GUILLERMO BAEZ LUNA	\N	\N	AYUDANTE LINIERO	37SA0245	1	2026-03-19	4	M	SINDICALIZADO	2017-03-30	62355	\N	37413	DN7H1	82302	pendiente
395	9NUT8	CARLOS ALBERTO JIMENEZ ESTRADA	\N	\N	AUXILIAR COMERCIAL	37SA0250	1	2026-03-19	7	M	SINDICALIZADO	2015-07-01	64365	\N	37317	DN70E	88145	pendiente
396	9NUTE	FRANCISCO CARDIEL CARRANZA	\N	\N	LINIERO	37SA0348	1	2026-03-19	13	M	SINDICALIZADO	2019-04-16	64353	\N	37410	DN7B4	82375	pendiente
397	9NUU3	MAURICIO NAVA RODRIGUEZ	\N	\N	AUXILIAR SERVICIOS I	37SA0124	1	2026-03-19	3	M	SINDICALIZADO	2016-10-04	61351	\N	37514	DN7E3	82347	pendiente
398	9NUU6	MARCO ANTONIO ROJAS SOLAR	\N	\N	AYUDANTE LINIERO	37SA0128	1	2026-03-19	13	M	SINDICALIZADO	2018-04-28	62355	\N	37412	DN70A	88178	pendiente
399	9NUVC	MIGUEL ANGEL RUEDA CALDERON	\N	\N	AUXILIAR SERVICIOS I	37SA0148	1	2026-03-19	7	M	SINDICALIZADO	2018-04-21	61351	\N	37514	DN7E3	82347	pendiente
99	9NUVF	NOE LEONEL ZAPOTITLA ROJAS	\N	\N	None	None	2	2026-03-17	7	M	SINDICALIZADO	2019-05-18	64353	\N	37410	DN7B4	82375	pendiente
401	9NUW4	JULIO CESAR PEREZ ZUÑIGA	\N	\N	SUPERVISOR ZONA III	37CA0065	1	2026-03-19	2	M	CONFIANZA	2021-05-03	16364	\N	37410	DN7B4	82375	pendiente
402	9NUWC	RUBI DE LA CRUZ SANCHEZ	\N	\N	JEFE OFICINA ZONA III	37CA0027	1	2026-03-19	9	F	CONFIANZA	2022-06-22	18364	\N	37611	DN7F1	82348	pendiente
403	9NUWF	SALVADOR LINO ARIAS	\N	\N	JEFE OFICINA ZONA III	37CA0033	1	2026-03-19	13	M	CONFIANZA	2019-05-25	18364	\N	37111	DN7L3	82361	pendiente
404	9NUWP	IVAN VELAZQUEZ GONZALEZ	\N	\N	JEFE OFICINA ZONA III	37CA0028	1	2026-03-19	7	M	CONFIANZA	2023-07-05	18364	\N	37514	DN7E3	82347	pendiente
405	9NUWX	ELIZABETH CAMPOS GARCIA	\N	\N	SUPERVISOR ZONA III	37CA0064	1	2026-03-19	7	F	CONFIANZA	2012-02-02	16364	\N	37410	DN7B4	82375	pendiente
406	9NUX4	RICARDO GARCIA ESTEVEZ	\N	\N	SUPERVISOR ZONA III	37CA0063	1	2026-03-19	3	M	CONFIANZA	2021-05-03	16364	\N	37410	DN7B4	82375	pendiente
407	9NUYP	VICTOR MANUEL RUEDA CANALES	\N	\N	AYUDANTE LINIERO	37SA0244	1	2026-03-19	11	M	SINDICALIZADO	2019-07-22	62355	\N	37412	DN70A	82372	pendiente
408	B572B	DIEGO GARDUÑO LEON	\N	\N	SUPERVISOR ZONA III	37CA0061	1	2026-03-19	11	M	CONFIANZA	2023-08-28	16364	\N	37410	DN7B4	82375	pendiente
409	G256P	DANIEL RAMIREZ CARRILLO	\N	\N	JEFE OFICINA ZONA III	37CA0028	1	2026-03-19	11	M	CONFIANZA	2023-03-23	18364	\N	37514	DN7E3	82347	pendiente
98	G308P	YAEL OSMAR GOMEZ AVILA	\N	\N	JEFE OFICINA ZONA III	None	1	2026-03-17	11	M	CONFIANZA	2021-01-15	18364	GOAY930307HDFMVL03	37513	DN7E4	82311	pendiente
9	G435P	BERNARDO SANCHEZ FERNANDEZ	\N	\N	JEFE OFICINA ZONA III	None	1	2026-03-17	11	M	CONFIANZA	2024-08-16	18364	\N	37413	DN70E	82369	pendiente
412	G467P	VICTOR HUGO RIVERA MATEO	\N	\N	JEFE OFICINA ZONA III	37CA0046	1	2026-03-19	11	M	CONFIANZA	2021-06-20	18364	\N	37513	DN7E4	82311	pendiente
413	G471P	HECTOR ALARCON SALOME	\N	\N	JEFE OFICINA ZONA III	37CA0026	1	2026-03-19	11	M	CONFIANZA	2022-01-05	18364	AASH910315HVZLLC03	37217	DN70E	82334	pendiente
414	G530P	ALDO MIGUEL MEDRANO OLMOS	\N	\N	LINIERO LV	37SA0163	1	2026-03-19	11	M	SINDICALIZADO	2019-05-29	65354	MEOA900621HDFDLL14	37216	DN70D	82329	pendiente
415	G540P	EDWIN VICTORIA ROMERO	\N	\N	AUXILIAR COMERCIAL	37SA0022	1	2026-03-19	11	M	SINDICALIZADO	2020-06-02	64365	VIRE830605HDFCMD04	37315	DN70C	88143	pendiente
416	G566F	KEREN BETANZOS ORDAZ	\N	\N	SUPERVISOR ZONA III	37CA0061	1	2026-03-19	11	F	CONFIANZA	2019-07-10	16364	BEOK891119MOCTRR02	37410	DN7B4	82375	pendiente
417	G571P	CHRISTIAN VILLALBA BARRAGAN	\N	\N	LINIERO LV	37SA0160	1	2026-03-19	11	M	SINDICALIZADO	2019-07-05	65354	VIBC900620HOCLRH09	37216	DN70D	82329	pendiente
418	G573P	ISAAC MELO QUIÑONES	\N	\N	AUXILIAR COMERCIAL	37SA0025	1	2026-03-19	11	M	SINDICALIZADO	2020-01-21	64365	MEQI881211HGRLXS01	37315	DN70C	88143	pendiente
419	G588P	RAMON VALENZUELA MEJIA	\N	\N	AUXILIAR COMERCIAL	37SA0064	1	2026-03-19	11	M	SINDICALIZADO	2019-08-30	64365	VAMR841111HDFLJM02	37314	DN70B	88142	pendiente
420	G596P	LUIS MARCELINO COLORADO DOMINGUEZ	\N	\N	LINIERO LV	37SA0184	1	2026-03-19	11	M	SINDICALIZADO	2019-06-14	65354	CODL841105HVZLMS08	37213	DN70A	82314	pendiente
421	G609P	JAVIER GONZALEZ FLORES	\N	\N	LINIERO LV	37SA0183	1	2026-03-19	11	M	SINDICALIZADO	2020-08-27	65354	GOFJ920519HDFNLV02	37213	DN70A	82314	pendiente
422	G702P	VIRIDIANA RODRIGUEZ PINEDA	\N	\N	AGENTE COMERCIAL III	37CA0014	1	2026-03-19	11	F	CONFIANZA	2022-01-17	17361	\N	37314	DN70B	82322	pendiente
423	G72D6	JAZIEL OBED HERNANDEZ REYES	\N	\N	AUXILIAR SERVICIOS I	37SA0126	1	2026-03-19	11	M	SINDICALIZADO	2022-01-23	61351	\N	37514	DN7E3	82347	pendiente
424	G72D7	OSCAR ROSAS REYES	\N	\N	AUXILIAR COMERCIAL	37SA0067	1	2026-03-19	11	M	SINDICALIZADO	2021-11-15	64365	\N	37314	DN70B	88142	pendiente
425	G73D7	JESUS EDUMIR VARGAS MENDOZA	\N	\N	AGENTE COMERCIAL III	37CA0011	1	2026-03-19	11	M	CONFIANZA	2022-10-23	17361	\N	37315	DN70C	82327	pendiente
37	G745P	ISRAEL GONZALEZ AGUILAR	\N	\N	JEFE OFICINA ZONA III	None	1	2026-03-17	11	M	CONFIANZA	2021-01-14	18364	GOAI900102HMSNGS02	37416	DN70D	82354	pendiente
427	G793P	FRANCISCO JAVIER SOLIS RANGEL	\N	\N	JEFE OFICINA ZONA III	37CA0040	1	2026-03-19	11	M	CONFIANZA	2023-04-04	18364	\N	37222	DN7K1	82339	pendiente
428	G808P	SERGIO SANCHEZ MENDEZ	\N	\N	SUPERVISOR ZONA III	37CA0063	1	2026-03-19	11	M	CONFIANZA	2025-03-18	16364	\N	37410	DN7B4	82375	pendiente
429	G865P	JUAN ISRAEL ORTEGA GARCIA	\N	\N	LINIERO	37SA0351	1	2026-03-19	11	M	SINDICALIZADO	2021-03-26	64353	OEGJ770710HJCRRN03	37410	DN7B4	82375	pendiente
430	G866P	JESUS GONZALEZ MIRANDA	\N	\N	AUXILIAR COMERCIAL	37SA0052	1	2026-03-19	11	M	SINDICALIZADO	2021-03-09	64365	GOMJ881109HDFNRS09	37315	DN70C	88143	pendiente
431	G867P	ALEXIS FUENTES GOMEZ	\N	\N	LINIERO	37SA0353	1	2026-03-19	11	M	SINDICALIZADO	2021-03-01	64353	FUGA000714HDFNMLA1	37410	DN7B4	82375	pendiente
432	G868P	CARLOS ALBERTO LOPEZ LOPEZ	\N	\N	ELECTRICISTA AYUDANTE	37SA0264	1	2026-03-19	11	M	SINDICALIZADO	2021-03-14	64357	LOLC860310HDFPPR03	37211	DN7B0	82341	pendiente
433	G936P	OSCAR AXEL LOPEZ VALDES	\N	\N	AUXILIAR COMERCIAL	37SA0040	1	2026-03-19	11	M	SINDICALIZADO	2022-07-28	64365	LOVO940216HDFPLS08	37313	DN70A	88141	pendiente
434	G960P	GILDARDO SILVA VERGARA	\N	\N	AGENTE COMERCIAL III	37CA0011	1	2026-03-19	11	M	CONFIANZA	2025-10-20	17361	\N	37315	DN70C	82327	pendiente
435	G995P	JUAN ULISES LOPEZ MARTINEZ	\N	\N	VERIFICADOR CALIBRADOR I	37SA0332	1	2026-03-19	11	M	SINDICALIZADO	2021-09-02	66342	\N	37416	DN70A	82355	pendiente
436	GA0CW	BRAYAN ORLANDO ESCOBAR SERRALDE	\N	\N	AUXILIAR SERVICIOS I	37SD6429	1	2026-03-19	11	M	SINDICALIZADO	2025-03-28	61311	\N	37512	DN700	82358	pendiente
437	GA0GW	JESUS ALBERTO GALINDO MALDONADO	\N	\N	AUXILIAR SERVICIOS I	37SD6430	1	2026-03-19	11	M	SINDICALIZADO	2025-04-03	61311	\N	37512	DN700	82358	pendiente
438	GA0HW	JOSHUA MIJANGOS NAVA	\N	\N	AUXILIAR SERVICIOS I	37SD6431	1	2026-03-19	11	M	SINDICALIZADO	2025-04-04	61311	\N	37512	DN700	82358	pendiente
439	GA1HW	BRUNO CABALLERO VALDEZ	\N	\N	AUXILIAR SERVICIOS I	37SD6432	1	2026-03-19	11	M	SINDICALIZADO	2025-07-05	61311	\N	37512	DN700	82358	pendiente
440	GA26W	SHALOM KARINA VILLA ARROYO	\N	\N	AUXILIAR SERVICIOS I	37SD6433	1	2026-03-19	11	F	SINDICALIZADO	2025-08-30	61311	\N	37512	DN700	82358	pendiente
441	GAJXV	VICTOR MANUEL HERNANDEZ PINEDA	\N	\N	T E M P O R A L	\N	1	2026-03-19	11	M	SINDICALIZADO	2023-06-05	\N	\N	37413	DN70E	88178	pendiente
442	GAK5V	ARTURO ROMERO SOTO	\N	\N	T E M P O R A L	\N	1	2026-03-19	11	M	SINDICALIZADO	2022-07-09	\N	\N	37511	DN7E2	82346	pendiente
443	GAK6V	RODOLFO BAUTISTA TREJO	\N	\N	AUXILIAR COMERCIAL	37SA0080	1	2026-03-19	11	M	SINDICALIZADO	2022-07-18	64365	\N	37317	DN70E	88145	pendiente
444	GAK7V	ISIDRO SEBASTIAN OLVERA MATA	\N	\N	LINIERO	37SA0352	1	2026-03-19	11	M	SINDICALIZADO	2022-06-06	64353	\N	37410	DN7B4	82375	pendiente
445	GAKAV	IRMA DORINDA LOPEZ MEDINA	\N	\N	JEFE OFICINA ZONA III	37CA0027	1	2026-03-19	11	F	CONFIANZA	2022-12-08	18364	\N	37611	DN7F1	82348	pendiente
446	GAKBV	ALONDRA DE LOS ANGELES HERNANDEZ LO	\N	\N	AUXILIAR SERVICIOS I	37SD6436	1	2026-03-19	11	F	SINDICALIZADO	2022-11-11	61311	\N	37512	DN700	82358	pendiente
447	GAKDV	DAMARIZ LIZETTE SILVA QUINTANAR	\N	\N	AUXILIAR COMERCIAL	37SA0039	1	2026-03-19	11	F	SINDICALIZADO	2022-11-19	64365	\N	37316	DN70D	88144	pendiente
448	GAKFV	FRANCISCO JAVIER JIMENEZ CERVANTES	\N	\N	LINIERO	37SA0324	1	2026-03-19	11	M	SINDICALIZADO	2022-11-09	64353	\N	37415	DN70D	82368	pendiente
449	GAKHV	KATIA SABRINA FLORES ROSAS	\N	\N	AUXILIAR SERVICIOS I	37SA0148	1	2026-03-19	11	F	SINDICALIZADO	2022-11-18	61351	\N	37514	DN7E3	82347	pendiente
450	GAL8V	MADAI KEREN LOPEZ SANCHEZ	\N	\N	AUXILIAR COMERCIAL	37SA0039	1	2026-03-19	11	F	SINDICALIZADO	2022-11-30	64365	\N	37316	DN70D	88144	pendiente
451	GALVV	LUIS FERNANDO CASTRO BUENDIA	\N	\N	AUXILIAR COMERCIAL	37SA0282	1	2026-03-19	11	M	SINDICALIZADO	2023-03-30	64365	\N	37315	DN70C	88143	pendiente
452	GALWV	LUIS ANGEL GUZMAN BUENDIA	\N	\N	AUXILIAR SERVICIOS I	37SD6434	1	2026-03-19	11	M	SINDICALIZADO	2025-08-01	61311	\N	37512	DN700	82358	pendiente
453	GALXV	IRVIN DANIEL RAMIREZ LOPEZ	\N	\N	AUXILIAR COMERCIAL	37SA0051	1	2026-03-19	11	M	SINDICALIZADO	2023-03-31	64365	\N	37313	DN70A	88141	pendiente
454	GALYV	ERIC ANDRES CORONA JARA	\N	\N	AUXILIAR COMERCIAL	37SA0036	1	2026-03-19	11	M	SINDICALIZADO	2023-04-25	64365	\N	37316	DN70D	88144	pendiente
455	GAM0V	SAMUEL MONDRAGON ARTEAGA	\N	\N	AUXILIAR COMERCIAL	37SA0068	1	2026-03-19	11	M	SINDICALIZADO	2023-07-08	64365	\N	37315	DN70C	82327	pendiente
456	GAM1V	GAEL AMAYA MELENDEZ	\N	\N	AUXILIAR COMERCIAL	37SA0037	1	2026-03-19	11	M	SINDICALIZADO	2023-04-03	64365	\N	37316	DN70D	88144	pendiente
457	GAM2V	RICARDO BACA MORALES	\N	\N	T E M P O R A L	\N	1	2026-03-19	11	M	SINDICALIZADO	2023-04-06	\N	\N	37313	DN70A	88141	pendiente
458	GANJV	KARLA FERNANDA HEREDIA ARANDA	\N	\N	T E M P O R A L	\N	1	2026-03-19	11	F	SINDICALIZADO	2023-08-01	\N	\N	37512	DN700	82358	pendiente
460	GARCV	IRVING ALEJANDRO SOLIS PEREZ	\N	\N	LINIERO	37SA0354	1	2026-03-19	11	M	SINDICALIZADO	2023-12-03	64353	\N	37410	DN7B4	82375	pendiente
461	GARDV	OSCAR URIEL SANCHEZ CASTAÑEDA	\N	\N	T E M P O R A L	\N	1	2026-03-19	11	M	SINDICALIZADO	2023-12-22	\N	\N	37512	DN700	82358	pendiente
462	GAREV	NICOLAS IVAN AVILA MEDINA	\N	\N	LINIERO	37SA0346	1	2026-03-19	11	M	SINDICALIZADO	2023-11-16	64353	\N	37410	DN7B4	82375	pendiente
463	GARFV	MISAEL FIGUEROA ORTEGA	\N	\N	AYUDANTE LINIERO	37SA0128	1	2026-03-19	11	M	SINDICALIZADO	2023-11-27	62355	\N	37412	DN70A	88178	pendiente
464	GARGV	ALEJANDRO VELAZQUEZ RUIZ	\N	\N	LINIERO ENCARGADO LV	37SA0364	1	2026-03-19	11	M	SINDICALIZADO	2023-11-21	66364	\N	37210	DN70A	82314	pendiente
465	GARHV	FRANCISCO RANGEL PICASO	\N	\N	AUXILIAR COMERCIAL	37SA0053	1	2026-03-19	11	M	SINDICALIZADO	2023-10-27	64365	\N	37316	DN70D	88144	pendiente
466	GAUAV	SERGIO IVAN HERNANDEZ ZARATE	\N	\N	AUXILIAR COMERCIAL	37SA0039	1	2026-03-19	11	M	SINDICALIZADO	2024-05-22	64365	\N	37316	DN70D	88144	pendiente
467	GAUVV	URIEL ELISEO GARCINIT DIAZ	\N	\N	AUXILIAR SERVICIOS I	37SA0149	1	2026-03-19	11	M	SINDICALIZADO	2024-07-17	61351	\N	37514	DN7E3	82347	pendiente
468	GAV0V	LUIS JUANPABLO CORONA JARA	\N	\N	AUXILIAR COMERCIAL	37SA0039	1	2026-03-19	11	M	SINDICALIZADO	2024-07-20	64365	\N	37316	DN70D	88144	pendiente
469	GAVGV	ISMAEL BOCANEGRA ARIAS	\N	\N	LINIERO	37SA0249	1	2026-03-19	11	M	SINDICALIZADO	2024-08-31	64353	\N	37415	DN70D	88178	pendiente
470	GAVQV	SANTIAGO VALENTIN SALAS VALDES	\N	\N	AUXILIAR COMERCIAL	37SA0039	1	2026-03-19	11	M	SINDICALIZADO	2024-11-05	64365	\N	37316	DN70D	88144	pendiente
471	GAW6V	CESAR RIVALDO TALAVERA REYES	\N	\N	AYUDANTE LINIERO	37SA0326	1	2026-03-19	11	M	SINDICALIZADO	2024-12-18	62355	\N	37415	DN7H1	82302	pendiente
472	GAW7V	MARIA FERNANDA DAVILA HERNANDEZ	\N	\N	AUXILIAR ADMINISTRATIVO	37SA0106	1	2026-03-19	11	F	SINDICALIZADO	2024-12-26	65331	\N	37511	DN7E2	82346	pendiente
473	GAW8V	RAUL ANTONIO GONZALEZ DAVILA	\N	\N	AUXILIAR COMERCIAL	37SA0039	1	2026-03-19	11	M	SINDICALIZADO	2024-12-19	64365	\N	37316	DN70D	88144	pendiente
474	GAXAV	DANIA CRISTINA CRUZ GOMEZ	\N	\N	AUXILIAR ADMINISTRATIVO	37SA0008	1	2026-03-19	11	F	SINDICALIZADO	2025-01-17	65331	\N	37410	DN7H0	82303	pendiente
475	GAXBV	SERGIO GUADALUPE GASTELUM GOMEZ	\N	\N	AUXILIAR COMERCIAL	37SA0069	1	2026-03-19	11	M	SINDICALIZADO	2025-01-20	64365	\N	37314	DN70B	88142	pendiente
476	GAXCV	SAMARA MONTAÑO VELAZQUEZ	\N	\N	AUXILIAR COMERCIAL	37SA0039	1	2026-03-19	11	F	SINDICALIZADO	2025-01-21	64365	\N	37316	DN70D	88144	pendiente
477	J509U	ALEJANDRO MONROY PEDRAZA	\N	\N	SUPERVISOR ZONA III	37CA0043	1	2026-03-19	11	M	CONFIANZA	2022-01-15	16364	MOPA820717HMCNDL03	37411	DN7H1	82302	pendiente
478	J882U	ERICK RENE CABAÑAS MOLGADO	\N	\N	JEFE OFICINA ZONA III	37CA0039	1	2026-03-19	11	M	CONFIANZA	2021-06-21	18364	0	37221	DN7K2	82340	pendiente
479	K444N	ANTONIO PEDRAZA GASCA	\N	\N	AUXILIAR COMERCIAL	37SA0038	1	2026-03-19	11	M	SINDICALIZADO	2018-11-06	64365	PEGA881209HMNDSN17	37313	DN70A	88141	pendiente
480	K586N	BRANDON QUEZADA RAMIREZ	\N	\N	AUXILIAR SERVICIOS I	37SD6435	1	2026-03-19	11	M	SINDICALIZADO	2021-06-20	61311	QURB951118HMCZMR04	37512	DN700	82358	pendiente
\.


--
-- Data for Name: rol_curso; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.rol_curso (id_rol_curso, nombre_rol) FROM stdin;
1	ASPIRANTE
2	INSTRUCTOR
\.


--
-- Data for Name: rol_destinatario; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.rol_destinatario (id_rol_destinatario, nombre_rol) FROM stdin;
1	ASPIRANTE
2	INSTRUCTOR
3	ADMINISTRADOR
\.


--
-- Data for Name: rol_usuario; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.rol_usuario (id_rol_usuario, nombre_rol) FROM stdin;
1	ADMINISTRADOR
2	OPERADOR
3	VISUALIZADOR
\.


--
-- Data for Name: sede; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.sede (id_sede, nombre_sede, sala, direccion, capacidad) FROM stdin;
9	ZONA COAPA CABECERA DE ZONA COAPA SALA 1	\N	\N	\N
15	ZONA COAPA CABECERA DE ZONA COAPA SALA 2	\N	\N	\N
16	ZONA COAPA CABECERA DE ZONA COAPA SALA 3	\N	\N	\N
18	ZONA COAPA SALA LA NORIA	\N	\N	\N
19	ZONA COAPA SALA FRANCISCO GOYTIA	\N	\N	\N
20	UTEC DVMS	\N	\N	\N
21	EPC ERMITA	\N	\N	\N
22	ZONA COPA SALA LA NORIA	\N	\N	\N
\.


--
-- Data for Name: tipo_mensaje; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.tipo_mensaje (id_tipo_mensaje, nombre_tipo) FROM stdin;
1	Recordatorio
2	Invitacion
3	Cancelacion
4	Confirmacion
5	Resultado
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: cfe_user
--

COPY public.usuarios (id_usuarios, id_persona, usuario, contrasena_hash, id_rol, activo, ultimo_acceso) FROM stdin;
53	14	9K67N	$2a$10$0pEtEYLbGA0ODQOxA6mgxOvzddfEgeFbxeuhD3HNdEmGlLDI2WoIq	2	t	2026-03-26 18:27:09.741005
5	77	9B81A	$2a$10$zsGRkildQQbf8TiJOySOreKNRrTci59w/GYmyeq7VpX0DFNXn.AC6	3	t	\N
6	108	9B8MR	$2a$10$uEeogOyCkoTauVbeXOFr0ekxguXFOXwOIYDpTVdPvthfCJHweRfOS	3	t	\N
7	116	9EMAU	$2a$10$edIsM7.D5E0GBaDEnariA.OLOpAviBmbOZgK7LQWv29e/.VunlLmW	3	t	\N
8	29	9L51K	$2a$10$HNT8Lc67.Kx8o/jhTN4GpeVrO.tZH4NTnFnxDeYbFgswH7vDh7xxi	3	t	\N
9	221	9L531	$2a$10$svXfNSmAJdOSUM666aBcle.OjTWm5i1f/NX6QhiiiePRXz7O.CrMq	3	t	\N
10	240	9L5FN	$2a$10$pybDqGnJSL/y.t./T8f84.pfZ8k8oo8k7bEj1Sjd6oe5gEPo/Mro6	3	t	\N
12	66	9L5JR	$2a$10$ZL9W3m6bHOHV00IiWHSNx.42eKAGXOLonPbiArVW8G5qElXn/UInG	3	t	\N
13	246	9L5K9	$2a$10$z.w5D2Zrhc7IXvXJUJbp7O6Qzhlua2NAFmMtdOHtGOBxBiiAowV5a	3	t	\N
14	97	9MG0W	$2a$10$pvTbYFKZcbU9.56tLNBcxeATdzg1OyYnvtTkDrIy2Xz8JLasxgg0.	3	t	\N
15	31	9MJA5	$2a$10$XGNU4hfogxgrGJVLhJA0JuSbxmsb3Jhuk3NncwRURXimEM32vffnC	3	t	\N
16	255	9MJA6	$2a$10$BLDzAKZb.szi5W2LXbKd9O8FTyTLuU.WOE1Bh6anUGgVSxKaWJBsG	3	t	\N
18	43	9MJAG	$2a$10$HpKt7Rjpd3/ufbayjtP1vuiB6QdBElT74CRLOk../Ivg4NTHkHKm6	3	t	\N
19	43	9MJAH	$2a$10$ZPYhRBCt4mj.NLlJZmOaSeIwpCEWawU5U2PBhVIXUiutuNyy5vwyK	3	t	\N
21	290	9MK0K	$2a$10$mtjG1nUuLGOJLr2VJREi6.pZPneG4o.qJQYyeBRTg9IgF06Bb54wa	3	t	\N
22	62	9MK67	$2a$10$vTsQnty6/dtx6mqH56JezOtWytK7EbOl7x4BFCyZDYqNP3sd8a3uG	3	t	\N
23	318	9MKC3	$2a$10$58CvVOwVEi2m1tCNlmUVwOh61UbpzcDGusb6JqkE381B72wi.frSa	3	t	\N
24	338	9MKH1	$2a$10$KYlZwmszzVT0FBYpmXNmC.geTh8E3k0eOKhUV768CJvjc5l3OnLbO	3	t	\N
25	96	9MKH2	$2a$10$tE7kFbN5CPN4bAec06b.M.fkDNkdIz6elcB.vBKUALuG9mP2LbVF2	3	t	\N
26	356	9MKKU	$2a$10$bQtvPq/ArEcghlcvDaqzBuzNT48GwqAdCFLFzrhJtWr6Eg7DYsfPy	3	t	\N
27	360	9MKNT	$2a$10$zciDBOyb1MLAw0N4zRXG6uInt5PzwPP3SN4FCDMqbxtIvU0sT4Pqi	3	t	\N
28	361	9MKNU	$2a$10$Fa7uMKLz1fKpi.YbPLEuYOcjRz5AHZMDZ6aAo9RQVanAwhxe.uNkm	3	t	\N
29	364	9MKNY	$2a$10$37yRPQOu1Lfnivcxwyiww.lXD2eD.ufgzSWOjFLWORtDzklEz8wR2	3	t	\N
30	369	9MKR9	$2a$10$0LLyK1NQ9tlvsIfB8fRI0.zGkVqPBgY7/Fl0VgKRAk2GtaZNVbZXm	3	t	\N
31	379	9MKVD	$2a$10$T7vH58fRA.T1eBpDFX8rSuepvjpNiOGRQ8rFwh1gFh.qXfqGSI6eu	3	t	\N
32	87	9MKVN	$2a$10$F5JMFlXst1MN8PqWeifoWuJ9HX40n6q.0058QyRLzBb.HX3feceN6	3	t	\N
33	59	9NUP9	$2a$10$39C7eMznPL8VnJ4pthLqEel/XZShE9gApQ1i42FYC8Ddv42LVRb5C	3	t	\N
35	387	9NUPF	$2a$10$PLlYOKkBv3dZgql1C1ani.v3qyW/Ct/B4MAHFsCFZYP/4k8jS06Z6	3	t	\N
36	49	9NUPK	$2a$10$a1m/sdtqCl4P7nPYRC52T.AfkYJgX1laVPOD0Jd.t19z2CzXJ2BWm	3	t	\N
37	401	9NUW4	$2a$10$rqgPXCLrAn7bcqZ27d4tMOnr6pUXvV/GqVg1RS7u23wcyADIHGWta	3	t	\N
38	403	9NUWF	$2a$10$bKZv2vcXAqRdD6IJ/0NEb.OFthN8nJ7jyb6CfJP.jXmjgixHq9K/2	3	t	\N
39	405	9NUWX	$2a$10$DuB7DdIEOgoRolb8HLRZ.O5ea1wxSJnU8muSL2n3X7U8tRwulg2EG	3	t	\N
40	409	G256P	$2a$10$o7iXqqD4h5J06bnnu2QY9euYFq8ZA/2B6QoaCo9OzwuGEFIWLw.Ui	3	t	\N
41	98	G308P	$2a$10$ot5Qi64kKnt7Mb8HUpRs0uaizfs4PS1utQEB2I3tt0sWa9Is0ysT.	3	t	\N
42	9	G435P	$2a$10$L4JtCxCbTn8iI1xIumzviOeEw88gRYQcefuCXGskhnC9GgjlvLUx2	3	t	\N
43	413	G471P	$2a$10$RapcZcJ.spp0P7ssfDio2.pkiqHtyhnbkgG/F5xtQc6P9Hb8yBADW	3	t	\N
44	422	G702P	$2a$10$LBMkZYVT07mtwk7OTmox0u8WN8jyqF.gD3oBZP/3UmnQVTB/09qNm	3	t	\N
45	425	G73D7	$2a$10$kILLLqi37G3Tj0PQs7Xm.ubT02b44c1cf1XUsbLvMHyvd2wvOOu6m	3	t	\N
46	37	G745P	$2a$10$Aj86qcpXj.AwZf4G7MNbp.Q4juy764hct1fdRcKp.pxcQYvcLS65W	3	t	\N
47	427	G793P	$2a$10$qj5cTpiEBjkH2rKUrI6gPeMu9aOqvhMierxleWYZ26WPE83IcUHGq	3	t	\N
48	434	G960P	$2a$10$R28fl57aQFx.xVUHcjfX5.XrnzeZT4o9kb1lJetrcp1RAT0TlKp3q	3	t	\N
49	442	GAK5V	$2a$10$VPERoiaN8DYIAdLVPRe6v.acAOC5zyjlqWNqM/Ibhtuk.60W6pIwW	3	t	\N
50	445	GAKAV	$2a$10$ifuCw5Uosb2cjg/0p/X2se0qCgFzA5L.KSiC2HDCInTRoq/Xk/sV.	3	t	\N
51	478	J882U	$2a$10$1NJFfKCUo5.6SfTkYSm7S.0/9EKmDnUB3h4v7KJMlY8C9xYfgTNoW	3	t	\N
52	78	9AY1P	$2a$10$bxBwKIyf9hped.uXlexTgeBMH4VJX7b5JXmNpi6QcPNF8YfxNVjrS	3	t	\N
4	10	87124	$2a$10$j2/PwqEUpx5KtEd4fdYZ8eg9RhMR7oV2ykjXzWQsZHGg8cJcEcZG6	3	t	2026-04-22 19:08:33.103779
17	72	9MJA9	$2a$10$f0x4EwUoMFYHjY89vOT8XuxfXPuqnz7L1mJq4rpvuMrFNRJzLN99a	3	t	2026-04-23 18:50:48.424591
34	386	9NUPD	$2a$10$SnwmmbCkx1gMt8ndNLqG5u7/tvVM4RxcK2Z52rDL3y5Oxp5lRafIm	3	t	2026-03-26 18:24:38.605826
2	100	9K67X	$2a$10$d.ArM9fKQjQc5HKuMYGUqOtPz4TlBJz0tAPQCpK73gHykmvMxGj.e	1	t	2026-04-30 16:56:01.452813
11	6	9L5JP	$2a$10$OHO8maR.EkbEDz7gnaZ7IO03/XOLmkZzVN8sVdXsSYtus8RAzq8ly	2	t	2026-04-21 14:22:06.342406
\.


--
-- Name: curso_id_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.curso_id_curso_seq', 28, true);


--
-- Name: departamento_id_departamento_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.departamento_id_departamento_seq', 13, true);


--
-- Name: documento_pdf_id_documento_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.documento_pdf_id_documento_seq', 1, false);


--
-- Name: estatus_curso_id_estatus_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.estatus_curso_id_estatus_curso_seq', 1, false);


--
-- Name: estatus_laboral_id_estatus_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.estatus_laboral_id_estatus_seq', 1, false);


--
-- Name: instructor_certificacion_id_certificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.instructor_certificacion_id_certificacion_seq', 66, true);


--
-- Name: instructor_detalle_id_instructor_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.instructor_detalle_id_instructor_seq', 142, true);


--
-- Name: mensaje_destinatario_id_mensaje_destinatario_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.mensaje_destinatario_id_mensaje_destinatario_seq', 26, true);


--
-- Name: mensaje_id_mensaje_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.mensaje_id_mensaje_seq', 20, true);


--
-- Name: modalidad_curso_modalidad_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.modalidad_curso_modalidad_curso_seq', 7, true);


--
-- Name: participacion_curso_id_participacion_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.participacion_curso_id_participacion_seq', 79, true);


--
-- Name: persona_id_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.persona_id_persona_seq', 483, true);


--
-- Name: rol_curso_id_rol_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.rol_curso_id_rol_curso_seq', 1, false);


--
-- Name: rol_destinatario_id_rol_destinatario_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.rol_destinatario_id_rol_destinatario_seq', 1, false);


--
-- Name: rol_usuario_id_rol_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.rol_usuario_id_rol_usuario_seq', 3, true);


--
-- Name: sede_id_sede_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.sede_id_sede_seq', 22, true);


--
-- Name: tipo_mensaje_id_tipo_mensaje_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.tipo_mensaje_id_tipo_mensaje_seq', 1, false);


--
-- Name: usuarios_id_usuarios_seq; Type: SEQUENCE SET; Schema: public; Owner: cfe_user
--

SELECT pg_catalog.setval('public.usuarios_id_usuarios_seq', 53, true);


--
-- Name: curso curso_clave_curso_key; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_clave_curso_key UNIQUE (clave_curso);


--
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id_curso);


--
-- Name: departamento departamento_clave_departamento_key; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_clave_departamento_key UNIQUE (clave_departamento);


--
-- Name: departamento departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id_departamento);


--
-- Name: documento_pdf documento_pdf_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.documento_pdf
    ADD CONSTRAINT documento_pdf_pkey PRIMARY KEY (id_documento);


--
-- Name: estatus_curso estatus_curso_nombre_estatus_key; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.estatus_curso
    ADD CONSTRAINT estatus_curso_nombre_estatus_key UNIQUE (nombre_estatus);


--
-- Name: estatus_curso estatus_curso_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.estatus_curso
    ADD CONSTRAINT estatus_curso_pkey PRIMARY KEY (id_estatus_curso);


--
-- Name: estatus_laboral estatus_laboral_nombre_estatus_key; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.estatus_laboral
    ADD CONSTRAINT estatus_laboral_nombre_estatus_key UNIQUE (nombre_estatus);


--
-- Name: estatus_laboral estatus_laboral_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.estatus_laboral
    ADD CONSTRAINT estatus_laboral_pkey PRIMARY KEY (id_estatus);


--
-- Name: instructor_certificacion instructor_certificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.instructor_certificacion
    ADD CONSTRAINT instructor_certificacion_pkey PRIMARY KEY (id_certificacion);


--
-- Name: instructor_detalle instructor_detalle_id_persona_key; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.instructor_detalle
    ADD CONSTRAINT instructor_detalle_id_persona_key UNIQUE (id_persona);


--
-- Name: instructor_detalle instructor_detalle_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.instructor_detalle
    ADD CONSTRAINT instructor_detalle_pkey PRIMARY KEY (id_instructor);


--
-- Name: mensaje_destinatario mensaje_destinatario_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.mensaje_destinatario
    ADD CONSTRAINT mensaje_destinatario_pkey PRIMARY KEY (id_mensaje_destinatario);


--
-- Name: mensaje mensaje_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT mensaje_pkey PRIMARY KEY (id_mensaje);


--
-- Name: modalidad_curso modalidad_curso_nombre_modalidad_key; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.modalidad_curso
    ADD CONSTRAINT modalidad_curso_nombre_modalidad_key UNIQUE (nombre_modalidad);


--
-- Name: modalidad_curso modalidad_curso_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.modalidad_curso
    ADD CONSTRAINT modalidad_curso_pkey PRIMARY KEY (id_modalidad);


--
-- Name: participacion_curso participacion_curso_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.participacion_curso
    ADD CONSTRAINT participacion_curso_pkey PRIMARY KEY (id_participacion);


--
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);


--
-- Name: persona persona_rpe_key; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_rpe_key UNIQUE (rpe);


--
-- Name: rol_curso rol_curso_nombre_rol_key; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.rol_curso
    ADD CONSTRAINT rol_curso_nombre_rol_key UNIQUE (nombre_rol);


--
-- Name: rol_curso rol_curso_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.rol_curso
    ADD CONSTRAINT rol_curso_pkey PRIMARY KEY (id_rol_curso);


--
-- Name: rol_destinatario rol_destinatario_nombre_rol_key; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.rol_destinatario
    ADD CONSTRAINT rol_destinatario_nombre_rol_key UNIQUE (nombre_rol);


--
-- Name: rol_destinatario rol_destinatario_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.rol_destinatario
    ADD CONSTRAINT rol_destinatario_pkey PRIMARY KEY (id_rol_destinatario);


--
-- Name: rol_usuario rol_usuario_nombre_rol_key; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.rol_usuario
    ADD CONSTRAINT rol_usuario_nombre_rol_key UNIQUE (nombre_rol);


--
-- Name: rol_usuario rol_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.rol_usuario
    ADD CONSTRAINT rol_usuario_pkey PRIMARY KEY (id_rol_usuario);


--
-- Name: sede sede_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.sede
    ADD CONSTRAINT sede_pkey PRIMARY KEY (id_sede);


--
-- Name: tipo_mensaje tipo_mensaje_nombre_tipo_key; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.tipo_mensaje
    ADD CONSTRAINT tipo_mensaje_nombre_tipo_key UNIQUE (nombre_tipo);


--
-- Name: tipo_mensaje tipo_mensaje_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.tipo_mensaje
    ADD CONSTRAINT tipo_mensaje_pkey PRIMARY KEY (id_tipo_mensaje);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuarios);


--
-- Name: usuarios usuarios_usuario_key; Type: CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);


--
-- Name: idx_cert_persona; Type: INDEX; Schema: public; Owner: cfe_user
--

CREATE INDEX idx_cert_persona ON public.instructor_certificacion USING btree (id_persona);


--
-- Name: persona fk_departamento; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT fk_departamento FOREIGN KEY (id_departamento) REFERENCES public.departamento(id_departamento);


--
-- Name: mensaje_destinatario fk_destinatario_mensaje; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.mensaje_destinatario
    ADD CONSTRAINT fk_destinatario_mensaje FOREIGN KEY (id_mensaje) REFERENCES public.mensaje(id_mensaje);


--
-- Name: mensaje_destinatario fk_destinatario_persona; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.mensaje_destinatario
    ADD CONSTRAINT fk_destinatario_persona FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona);


--
-- Name: mensaje_destinatario fk_destinatario_rol; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.mensaje_destinatario
    ADD CONSTRAINT fk_destinatario_rol FOREIGN KEY (id_rol_destinatario) REFERENCES public.rol_destinatario(id_rol_destinatario);


--
-- Name: documento_pdf fk_documento_curso; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.documento_pdf
    ADD CONSTRAINT fk_documento_curso FOREIGN KEY (id_curso) REFERENCES public.curso(id_curso);


--
-- Name: documento_pdf fk_documento_persona; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.documento_pdf
    ADD CONSTRAINT fk_documento_persona FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona);


--
-- Name: curso fk_estatus_curso; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fk_estatus_curso FOREIGN KEY (id_estatus_curso) REFERENCES public.estatus_curso(id_estatus_curso);


--
-- Name: persona fk_estatus_laboral; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT fk_estatus_laboral FOREIGN KEY (id_estatus_laboral) REFERENCES public.estatus_laboral(id_estatus);


--
-- Name: departamento fk_jefe_departamento; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT fk_jefe_departamento FOREIGN KEY (id_jefe_departamento) REFERENCES public.persona(id_persona);


--
-- Name: mensaje fk_mensaje_curso; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT fk_mensaje_curso FOREIGN KEY (id_curso) REFERENCES public.curso(id_curso);


--
-- Name: mensaje fk_mensaje_tipo; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT fk_mensaje_tipo FOREIGN KEY (id_tipo_mensaje) REFERENCES public.tipo_mensaje(id_tipo_mensaje);


--
-- Name: curso fk_modalidad; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fk_modalidad FOREIGN KEY (id_modalidad) REFERENCES public.modalidad_curso(id_modalidad);


--
-- Name: participacion_curso fk_participacion_curso; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.participacion_curso
    ADD CONSTRAINT fk_participacion_curso FOREIGN KEY (id_curso) REFERENCES public.curso(id_curso);


--
-- Name: participacion_curso fk_participacion_persona; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.participacion_curso
    ADD CONSTRAINT fk_participacion_persona FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona);


--
-- Name: participacion_curso fk_participacion_rol; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.participacion_curso
    ADD CONSTRAINT fk_participacion_rol FOREIGN KEY (id_rol_curso) REFERENCES public.rol_curso(id_rol_curso);


--
-- Name: curso fk_sede; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT fk_sede FOREIGN KEY (id_sede) REFERENCES public.sede(id_sede);


--
-- Name: usuarios fk_usuario_persona; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuario_persona FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona);


--
-- Name: usuarios fk_usuario_rol; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES public.rol_usuario(id_rol_usuario);


--
-- Name: instructor_certificacion instructor_certificacion_id_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.instructor_certificacion
    ADD CONSTRAINT instructor_certificacion_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON DELETE CASCADE;


--
-- Name: instructor_detalle instructor_detalle_id_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cfe_user
--

ALTER TABLE ONLY public.instructor_detalle
    ADD CONSTRAINT instructor_detalle_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict sJccz2hWxBZgzVyx4ddMtd3ZzBtKFNzwwwkPMmujsZkAljMlnUNY8Njf0wGbT5v

