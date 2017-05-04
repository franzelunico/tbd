DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
/************ Update: Schemas ***************/

ALTER SCHEMA "schemaA" RENAME TO public;




/************ Add: Sequences ***************/

/* Autogenerated Sequences */

CREATE SEQUENCE "public"."Autor_id_autor_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Autor_id_autor_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Categoria_id_categoria_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Categoria_id_categoria_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Ciudad_id_ciudad_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Ciudad_id_ciudad_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Editorial_id_editorial_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Editorial_id_editorial_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Funcion_id_funcion_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Funcion_id_funcion_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Idioma_id_idioma_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Idioma_id_idioma_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Interface_id_interface_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Interface_id_interface_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Libro_id_producto_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Libro_id_producto_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Pais_id_pais_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Pais_id_pais_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Producto_id_producto_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Producto_id_producto_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Programa_id_producto_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Programa_id_producto_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Rol_id_rol_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Rol_id_rol_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Session_id_session_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Session_id_session_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Sistema_Operativo_id_sistema_operativo_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Sistema_Operativo_id_sistema_operativo_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Tarjeta_id_tarjeta_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Tarjeta_id_tarjeta_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Tipo_UI_id_tipo_ui_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Tipo_UI_id_tipo_ui_seq" IS 'DbWrench Autogenerated Sequence.';

CREATE SEQUENCE "public"."Usuario_id_usuario_seq" INCREMENT BY 1;
COMMENT ON SEQUENCE "public"."Usuario_id_usuario_seq" IS 'DbWrench Autogenerated Sequence.';




/************ Update: Tables ***************/

/******************** Add Table: "public"."Autor" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Autor"
(
	id_autor INTEGER DEFAULT nextval('public."Autor_id_autor_seq"'::regclass) NOT NULL,
	nombres VARCHAR(200) NOT NULL,
	apellido_paterno VARCHAR(200) NOT NULL,
	apellido_materno VARCHAR(200) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Autor" ADD CONSTRAINT "pkAutor"
	PRIMARY KEY (id_autor);


/******************** Add Table: "public"."Categoria" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Categoria"
(
	id_categoria INTEGER DEFAULT nextval('public."Categoria_id_categoria_seq"'::regclass) NOT NULL,
	"Id_Editorial" INTEGER NOT NULL,
	nombre_cat VARCHAR(200) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Categoria" ADD CONSTRAINT "pkCategoria"
	PRIMARY KEY (id_categoria);


/******************** Add Table: "public"."Ciudad" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Ciudad"
(
	id_ciudad INTEGER DEFAULT nextval('public."Ciudad_id_ciudad_seq"'::regclass) NOT NULL,
	id_pais INTEGER NOT NULL,
	nombre_ciu VARCHAR(200) NOT NULL,
	codigo_postal INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Ciudad" ADD CONSTRAINT "pkCiudad"
	PRIMARY KEY (id_ciudad);


/******************** Add Table: "public"."Desposito_Bancario" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Desposito_Bancario"
(
	"Id_DepositoBancario" INTEGER NOT NULL,
	nro_cuenta VARCHAR(200) NOT NULL,
	banco VARCHAR(200) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Desposito_Bancario" ADD CONSTRAINT "pkDesposito_Bancario"
	PRIMARY KEY ("Id_DepositoBancario");


/******************** Add Table: "public"."Editorial" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Editorial"
(
	id_editorial INTEGER DEFAULT nextval('public."Editorial_id_editorial_seq"'::regclass) NOT NULL,
	nombre_edi VARCHAR(200) NOT NULL,
	fundacion DATE NOT NULL,
	pagina VARCHAR(200) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Editorial" ADD CONSTRAINT "pkEditorial"
	PRIMARY KEY (id_editorial);


/******************** Add Table: "public"."Factura" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Factura"
(
	id_producto INTEGER NOT NULL,
	fecha TIMESTAMP NOT NULL,
	id_ciudad INTEGER NULL,
	id_tarjeta INTEGER NULL,
	correo_e VARCHAR(200) NULL,
	nombre_p VARCHAR(200) NOT NULL,
	precio_p INTEGER NOT NULL,
	valor INTEGER NOT NULL,
	cantidad INTEGER DEFAULT 1 NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Factura" ADD CONSTRAINT "pkFactura"
	PRIMARY KEY (id_producto, fecha);


/******************** Add Table: "public"."Funcion" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Funcion"
(
	id_funcion INTEGER DEFAULT nextval('public."Funcion_id_funcion_seq"'::regclass) NOT NULL,
	nombre_f VARCHAR(200) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Funcion" ADD CONSTRAINT "pkFuncion"
	PRIMARY KEY (id_funcion);


/******************** Add Table: "public"."Funcion_Interface" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Funcion_Interface"
(
	id_funcion INTEGER NOT NULL,
	id_interface INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Funcion_Interface" ADD CONSTRAINT "pkFuncion_Interface"
	PRIMARY KEY (id_funcion, id_interface);


/******************** Add Table: "public"."Idioma" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Idioma"
(
	id_idioma INTEGER DEFAULT nextval('public."Idioma_id_idioma_seq"'::regclass) NOT NULL,
	nombre_idio VARCHAR(200) NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Idioma" ADD CONSTRAINT "pkIdioma"
	PRIMARY KEY (id_idioma);


/******************** Add Table: "public"."Interface" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Interface"
(
	id_interface INTEGER DEFAULT nextval('public."Interface_id_interface_seq"'::regclass) NOT NULL,
	id_tipo_ui INTEGER NOT NULL,
	nombre_in VARCHAR(200) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Interface" ADD CONSTRAINT "pkInterface"
	PRIMARY KEY (id_interface);


/******************** Add Table: "public"."Libro" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Libro"
(
	id_producto INTEGER DEFAULT nextval('public."Libro_id_producto_seq"'::regclass) NOT NULL,
	id_categoria INTEGER NULL,
	id_editorial INTEGER NULL,
	id_idioma INTEGER NULL,
	descripcion VARCHAR(200) NOT NULL,
	"ISB" VARCHAR(200) NOT NULL,
	fecha_publicacion DATE NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Libro" ADD CONSTRAINT "pkLibro"
	PRIMARY KEY (id_producto);


/******************** Add Table: "public"."Libro_Autores" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Libro_Autores"
(
	id_autor INTEGER NOT NULL,
	id_producto INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Libro_Autores" ADD CONSTRAINT "pkLibro_Autores"
	PRIMARY KEY (id_autor, id_producto);


/******************** Add Table: "public"."Oferta" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Oferta"
(
	"Id_Oferta" INTEGER NOT NULL,
	porcenta_descuento INTEGER NOT NULL,
	fecha_inicio TIMESTAMP NULL,
	fecha_fin TIMESTAMP NULL,
	"Id_Producto" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Oferta" ADD CONSTRAINT "pkOferta"
	PRIMARY KEY ("Id_Oferta");


/******************** Add Table: "public"."Pais" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Pais"
(
	id_pais INTEGER DEFAULT nextval('public."Pais_id_pais_seq"'::regclass) NOT NULL,
	nombre_pai VARCHAR(200) NOT NULL,
	codigo_pais INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Pais" ADD CONSTRAINT "pkPais"
	PRIMARY KEY (id_pais);


/******************** Add Table: "public"."Producto" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Producto"
(
	id_producto INTEGER DEFAULT nextval('public."Producto_id_producto_seq"'::regclass) NOT NULL,
	nombre_p VARCHAR(200) NULL,
	"tamanio_archivo_KB" INTEGER NOT NULL,
	precio INTEGER NOT NULL,
	porcentaje_descuento INTEGER DEFAULT 0 NOT NULL,
	oferta_inicio DATE NULL,
	oferta_fin DATE NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Producto" ADD CONSTRAINT "pkProducto"
	PRIMARY KEY (id_producto);


/******************** Add Table: "public"."Programa" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Programa"
(
	id_producto INTEGER DEFAULT nextval('public."Programa_id_producto_seq"'::regclass) NOT NULL,
	id_sistema_operativo INTEGER NULL,
	fecha_activacion DATE NULL,
	fecha_expiracion DATE NULL,
	version_pro VARCHAR(100) NOT NULL,
	dominio_32_64 VARCHAR(5) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Programa" ADD CONSTRAINT "pkPrograma"
	PRIMARY KEY (id_producto);


/******************** Add Table: "public"."Rol" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Rol"
(
	id_rol INTEGER DEFAULT nextval('public."Rol_id_rol_seq"'::regclass) NOT NULL,
	nombre_r VARCHAR(200) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Rol" ADD CONSTRAINT "pkRol"
	PRIMARY KEY (id_rol);


/******************** Add Table: "public"."Rol_Funcion" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Rol_Funcion"
(
	id_rol INTEGER NOT NULL,
	id_funcion INTEGER NOT NULL,
	activo BOOL DEFAULT False NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Rol_Funcion" ADD CONSTRAINT "pkRol_Funcion"
	PRIMARY KEY (id_rol, id_funcion);


/******************** Add Table: "public"."Session" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Session"
(
	id_session INTEGER DEFAULT nextval('public."Session_id_session_seq"'::regclass) NOT NULL,
	id_usuario INTEGER NOT NULL,
	pid INTEGER DEFAULT pg_backend_pid() NOT NULL,
	fecha TIMESTAMP DEFAULT now() NOT NULL,
	activo BOOL DEFAULT False NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Session" ADD CONSTRAINT "pkSession"
	PRIMARY KEY (id_session, id_usuario);


/******************** Add Table: "public"."Sistema_Operativo" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Sistema_Operativo"
(
	id_sistema_operativo INTEGER DEFAULT nextval('public."Sistema_Operativo_id_sistema_operativo_seq"'::regclass) NOT NULL,
	nombre_so VARCHAR(200) NOT NULL,
	version_so VARCHAR(200) NOT NULL,
	arquitectura VARCHAR(2) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Sistema_Operativo" ADD CONSTRAINT "pkSistema_Operativo"
	PRIMARY KEY (id_sistema_operativo);


/******************** Add Table: "public"."Tarjeta" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Tarjeta"
(
	id_tarjeta INTEGER DEFAULT nextval('public."Tarjeta_id_tarjeta_seq"'::regclass) NOT NULL,
	id_usuario INTEGER NULL,
	nombre_tar VARCHAR(200) NOT NULL,
	nro_tarjeta VARCHAR(16) NOT NULL,
	cardholder_name VARCHAR(200) NOT NULL,
	fecha_expiracion DATE NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Tarjeta" ADD CONSTRAINT "pkTarjeta"
	PRIMARY KEY (id_tarjeta);


/******************** Add Table: "public"."Tipo_UI" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Tipo_UI"
(
	id_tipo_ui INTEGER DEFAULT nextval('public."Tipo_UI_id_tipo_ui_seq"'::regclass) NOT NULL,
	nombre_t_u VARCHAR(200) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Tipo_UI" ADD CONSTRAINT "pkTipo_UI"
	PRIMARY KEY (id_tipo_ui);


/******************** Add Table: "public"."User_Rol" ************************/

/* Build Table Structure */
CREATE TABLE "public"."User_Rol"
(
	id_usuario INTEGER NOT NULL,
	id_rol INTEGER NOT NULL,
	activo BOOL DEFAULT False NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."User_Rol" ADD CONSTRAINT "pkUser_Rol"
	PRIMARY KEY (id_usuario, id_rol);


/******************** Add Table: "public"."Usuario" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Usuario"
(
	id_usuario INTEGER DEFAULT nextval('public."Usuario_id_usuario_seq"'::regclass) NOT NULL,
	nombre_u VARCHAR(200) NOT NULL,
	password VARCHAR(200) NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Usuario" ADD CONSTRAINT "pkUsuario"
	PRIMARY KEY (id_usuario);


/******************** Add Table: "public"."Venta_Libro" ************************/

/* Build Table Structure */
CREATE TABLE "public"."Venta_Libro"
(
	"Id_Venta_Libro" INTEGER NOT NULL,
	"Id_Producto" INTEGER NOT NULL
);

/* Add Primary Key */
ALTER TABLE "public"."Venta_Libro" ADD CONSTRAINT "pkVenta_Libro"
	PRIMARY KEY ("Id_Venta_Libro");





/************ Add Foreign Keys ***************/

/* Add Foreign Key: fk_Ciudad_Pais */
ALTER TABLE "public"."Ciudad" ADD CONSTRAINT "fk_Ciudad_Pais"
	FOREIGN KEY (id_pais) REFERENCES "public"."Pais" (id_pais)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Factura_Tarjeta */
ALTER TABLE "public"."Factura" ADD CONSTRAINT "fk_Factura_Tarjeta"
	FOREIGN KEY (id_tarjeta) REFERENCES "public"."Tarjeta" (id_tarjeta)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Venta_Producto_Ciudad */
ALTER TABLE "public"."Factura" ADD CONSTRAINT "fk_Venta_Producto_Ciudad"
	FOREIGN KEY (id_ciudad) REFERENCES "public"."Ciudad" (id_ciudad)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Venta_Producto_Producto */
ALTER TABLE "public"."Factura" ADD CONSTRAINT "fk_Venta_Producto_Producto"
	FOREIGN KEY (id_producto) REFERENCES "public"."Producto" (id_producto)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Funcion_Interface_Funcion */
ALTER TABLE "public"."Funcion_Interface" ADD CONSTRAINT "fk_Funcion_Interface_Funcion"
	FOREIGN KEY (id_funcion) REFERENCES "public"."Funcion" (id_funcion)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Funcion_Interface_Interface */
ALTER TABLE "public"."Funcion_Interface" ADD CONSTRAINT "fk_Funcion_Interface_Interface"
	FOREIGN KEY (id_interface) REFERENCES "public"."Interface" (id_interface)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Interface_Tipo_UI */
ALTER TABLE "public"."Interface" ADD CONSTRAINT "fk_Interface_Tipo_UI"
	FOREIGN KEY (id_tipo_ui) REFERENCES "public"."Tipo_UI" (id_tipo_ui)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Libro_Categoria */
ALTER TABLE "public"."Libro" ADD CONSTRAINT "fk_Libro_Categoria"
	FOREIGN KEY (id_categoria) REFERENCES "public"."Categoria" (id_categoria)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Libro_Editorial */
ALTER TABLE "public"."Libro" ADD CONSTRAINT "fk_Libro_Editorial"
	FOREIGN KEY (id_editorial) REFERENCES "public"."Editorial" (id_editorial)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Libro_Idioma */
ALTER TABLE "public"."Libro" ADD CONSTRAINT "fk_Libro_Idioma"
	FOREIGN KEY (id_idioma) REFERENCES "public"."Idioma" (id_idioma)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Libro_Producto */
ALTER TABLE "public"."Libro" ADD CONSTRAINT "fk_Libro_Producto"
	FOREIGN KEY (id_producto) REFERENCES "public"."Producto" (id_producto)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Libro_Autores_Autor */
ALTER TABLE "public"."Libro_Autores" ADD CONSTRAINT "fk_Libro_Autores_Autor"
	FOREIGN KEY (id_autor) REFERENCES "public"."Autor" (id_autor)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Libro_Autores_Libro */
ALTER TABLE "public"."Libro_Autores" ADD CONSTRAINT "fk_Libro_Autores_Libro"
	FOREIGN KEY (id_producto) REFERENCES "public"."Libro" (id_producto)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Oferta_Producto */
ALTER TABLE "public"."Oferta" ADD CONSTRAINT "fk_Oferta_Producto"
	FOREIGN KEY ("Id_Producto") REFERENCES "public"."Producto" (id_producto)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Programa_Producto */
ALTER TABLE "public"."Programa" ADD CONSTRAINT "fk_Programa_Producto"
	FOREIGN KEY (id_producto) REFERENCES "public"."Producto" (id_producto)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Programa_SistemaOperativo */
ALTER TABLE "public"."Programa" ADD CONSTRAINT "fk_Programa_SistemaOperativo"
	FOREIGN KEY (id_sistema_operativo) REFERENCES "public"."Sistema_Operativo" (id_sistema_operativo)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Rol_Funcion_Funcion */
ALTER TABLE "public"."Rol_Funcion" ADD CONSTRAINT "fk_Rol_Funcion_Funcion"
	FOREIGN KEY (id_funcion) REFERENCES "public"."Funcion" (id_funcion)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Rol_Funcion_Rol */
ALTER TABLE "public"."Rol_Funcion" ADD CONSTRAINT "fk_Rol_Funcion_Rol"
	FOREIGN KEY (id_rol) REFERENCES "public"."Rol" (id_rol)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Session_Usuario */
ALTER TABLE "public"."Session" ADD CONSTRAINT "fk_Session_Usuario"
	FOREIGN KEY (id_usuario) REFERENCES "public"."Usuario" (id_usuario)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_Tarjeta_Usuario */
ALTER TABLE "public"."Tarjeta" ADD CONSTRAINT "fk_Tarjeta_Usuario"
	FOREIGN KEY (id_usuario) REFERENCES "public"."Usuario" (id_usuario)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_User_Rol_Rol */
ALTER TABLE "public"."User_Rol" ADD CONSTRAINT "fk_User_Rol_Rol"
	FOREIGN KEY (id_rol) REFERENCES "public"."Rol" (id_rol)
	ON UPDATE NO ACTION ON DELETE NO ACTION;

/* Add Foreign Key: fk_User_Rol_Usuario */
ALTER TABLE "public"."User_Rol" ADD CONSTRAINT "fk_User_Rol_Usuario"
	FOREIGN KEY (id_usuario) REFERENCES "public"."Usuario" (id_usuario)
	ON UPDATE NO ACTION ON DELETE NO ACTION;INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('Argentina', 54);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('Bolivia', 591);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('Brazil', 55);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('Chile', 56);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('Colombia', 57);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('Costa Rica', 506);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('Cuba', 53);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('Ecuador', 593);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('El Salvador', 503);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('México', 52);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('Honduras', 504);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('Nicaragua', 505);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('Panamá', 507);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('Paraguay', 595);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('Perú', 51);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('República Dominicana', 849);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('Uruguay', 598);
INSERT INTO "Pais"(nombre_pai, codigo_pais) VALUES ('Venezuela', 58);


INSERT INTO "Ciudad"(id_pais, nombre_ciu, codigo_postal) VALUES (1, 'buenos aires', 122);
INSERT INTO "Ciudad"(id_pais, nombre_ciu, codigo_postal) VALUES (1, 'catamarca', 122);
INSERT INTO "Ciudad"(id_pais, nombre_ciu, codigo_postal) VALUES (1, 'chaco', 122);
INSERT INTO "Ciudad"(id_pais, nombre_ciu, codigo_postal) VALUES (2, 'beni', 122);
INSERT INTO "Ciudad"(id_pais, nombre_ciu, codigo_postal) VALUES (2, 'chuquisaca', 44);
INSERT INTO "Ciudad"(id_pais, nombre_ciu, codigo_postal) VALUES (2, 'cochabamba', 45);
INSERT INTO "Ciudad"(id_pais, nombre_ciu, codigo_postal) VALUES (2, 'la paz', 2);
INSERT INTO "Ciudad"(id_pais, nombre_ciu, codigo_postal) VALUES (2, 'oruro', 252);
INSERT INTO "Ciudad"(id_pais, nombre_ciu, codigo_postal) VALUES (2, 'pando', 4);
INSERT INTO "Ciudad"(id_pais, nombre_ciu, codigo_postal) VALUES (2, 'potosi', 256);
INSERT INTO "Ciudad"(id_pais, nombre_ciu, codigo_postal) VALUES (2, 'santa cruz', 3311);
INSERT INTO "Ciudad"(id_pais, nombre_ciu, codigo_postal) VALUES (2, 'tarija', 446);




/******************** GESTION USUARIOS ************************/
INSERT INTO "Tipo_UI"(nombre_t_u) VALUES ('formulario');
INSERT INTO "Interface"(id_tipo_ui, nombre_in) VALUES (1,'comprar');
INSERT INTO "Interface"(id_tipo_ui, nombre_in) VALUES (1,'tarjeta');
INSERT INTO "Interface"(id_tipo_ui, nombre_in) VALUES (1,'producto');

INSERT INTO "Usuario"(nombre_u, password) VALUES ('jose', 'pjose');
INSERT INTO "Usuario"(nombre_u, password) VALUES ('ana', 'pana');
INSERT INTO "Usuario"(nombre_u, password) VALUES ('franz', 'pfranz');
INSERT INTO "Usuario"(nombre_u, password) VALUES ('mario', 'pmario');

INSERT INTO "Rol"(nombre_r) VALUES ('cliente');
INSERT INTO "Rol"(nombre_r) VALUES ('contador');
INSERT INTO "Rol"(nombre_r) VALUES ('admin');

INSERT INTO "Funcion"(nombre_f) VALUES ('comprar_producto');
INSERT INTO "Funcion"(nombre_f) VALUES ('agregar_tarjeta');
INSERT INTO "Funcion"(nombre_f) VALUES ('agregar_pais');

INSERT INTO "User_Rol"(id_usuario,id_rol) VALUES (1,1);
INSERT INTO "User_Rol"(id_usuario,id_rol) VALUES (2,1);
INSERT INTO "User_Rol"(id_usuario,id_rol) VALUES (3,1);
INSERT INTO "User_Rol"(id_usuario,id_rol) VALUES (4,3);


INSERT INTO "Rol_Funcion"(id_rol,id_funcion) VALUES (1,1);
INSERT INTO "Rol_Funcion"(id_rol,id_funcion) VALUES (1,2);
INSERT INTO "Rol_Funcion"(id_rol,id_funcion) VALUES (3,3);


INSERT INTO "Funcion_Interface"(id_funcion, id_interface) VALUES (1, 1);
INSERT INTO "Funcion_Interface"(id_funcion, id_interface) VALUES (2, 2);
INSERT INTO "Funcion_Interface"(id_funcion, id_interface) VALUES (3, 3);

INSERT INTO "Tarjeta"(
            id_usuario, nombre_tar, nro_tarjeta, cardholder_name, fecha_expiracion)
    VALUES (1,'FLOPEZ', 9010, 'visa', '2019-07-13');
INSERT INTO "Tarjeta"(
            id_usuario, nombre_tar, nro_tarjeta, cardholder_name, fecha_expiracion)
    VALUES (1,'FLOPEZ', 9010, 'mastercard', '2019-07-13');

INSERT INTO "Tarjeta"(
            id_usuario, nombre_tar, nro_tarjeta, cardholder_name, fecha_expiracion)
    VALUES (2,'MCHOQUE', 9010, 'visa', '2019-07-13');
INSERT INTO "Tarjeta"(
            id_usuario, nombre_tar, nro_tarjeta, cardholder_name, fecha_expiracion)
    VALUES (2,'MCHOQUE', 9010, 'mastercard', '2019-07-13');
/******************** GESTION USUARIOS ************************/



/******************** MODELO DE NEGOCIO ************************/
/***************************************************************/
INSERT INTO "Sistema_Operativo"(nombre_so, version_so, arquitectura) VALUES ('Windows', '10' , '86');
INSERT INTO "Sistema_Operativo"(nombre_so, version_so, arquitectura) VALUES ('Debian', '8' , '86');
INSERT INTO "Sistema_Operativo"(nombre_so, version_so, arquitectura) VALUES ('OS X', '10.11' , '86');


INSERT INTO "Producto"(
            nombre_p, "tamanio_archivo_KB", precio, porcentaje_descuento, 
            oferta_inicio, oferta_fin)
    VALUES ('VIM', 2300, 20, 0,
            NULL, NULL);
INSERT INTO "Programa"(
            id_producto, id_sistema_operativo, fecha_activacion, fecha_expiracion, 
            version_pro, dominio_32_64)
    VALUES (1, 1, NULL, NULL, 
            '8', '64');


INSERT INTO "Producto"(
            nombre_p, "tamanio_archivo_KB", precio, porcentaje_descuento, 
            oferta_inicio, oferta_fin)
    VALUES ('netbeans', 30000, 40, 0,
            NULL, NULL);
INSERT INTO "Programa"(
            id_producto, id_sistema_operativo, fecha_activacion, fecha_expiracion, 
            version_pro, dominio_32_64)
    VALUES (2, 1, NULL, NULL, 
            '8.2', '64');



INSERT INTO "Producto"(
            nombre_p, "tamanio_archivo_KB", precio, porcentaje_descuento, 
            oferta_inicio, oferta_fin)
    VALUES ('eclipse', 40000, 50, 0,
            NULL, NULL);
INSERT INTO "Programa"(
            id_producto, id_sistema_operativo, fecha_activacion, fecha_expiracion, 
            version_pro, dominio_32_64)
    VALUES (3, 1, NULL, NULL, 
            '2017.1', '64');


INSERT INTO "Producto"(
            nombre_p, "tamanio_archivo_KB", precio, porcentaje_descuento, 
            oferta_inicio, oferta_fin)
    VALUES ('phpstorm', 2300, 20, 0,
            NULL, NULL);
INSERT INTO "Programa"(
            id_producto, id_sistema_operativo, fecha_activacion, fecha_expiracion, 
            version_pro, dominio_32_64)
    VALUES (4, 1, NULL, NULL, 
            '2017', '64');


INSERT INTO "Producto"(
            nombre_p, "tamanio_archivo_KB", precio, porcentaje_descuento, 
            oferta_inicio, oferta_fin)
    VALUES ('Bluej', 2300, 20, 0,
            NULL, NULL);
INSERT INTO "Programa"(
            id_producto, id_sistema_operativo, fecha_activacion, fecha_expiracion, 
            version_pro, dominio_32_64)
    VALUES (5, 1, NULL, NULL, 
            '2017.1', '64');

/******************** MODELO DE NEGOCIO ************************/
