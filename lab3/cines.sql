/* orden de creacion de las tablas */

CREATE TABLE ACTORES (cod_actor number not null primary key,
	actor_nombre varchar2(25) not null,
	actor_apellido varchar2(25) not null
);

CREATE TABLE PELICULAS (cod_pelicula number not null primary key,
	pelicula_nombre varchar2(100) not null,
	cod_genero number,
	constraint fk_cod_genero foreign key (cod_genero) references GENEROS (cod_genero)
);

CREATE TABLE GENEROS (cod_genero number not null primary key,
	genero_nombre varchar2(50) not null
);

CREATE TABLE REPARTO (cod_pelicula number not null,
	cod_actor number not null,
	constraint cod_reparto_pk primary key (cod_pelicula, cod_actor),
	constraint fk_cod_pelicula foreign key (cod_pelicula) references PELICULAS (cod_pelicula),
	constraint fk_cod_actor foreign key (cod_actor) references ACTORES (cod_actor)
);

/*
CREATE TABLE EXHIBICIONES (cod_cine number not null,
	cod_pelicula number not null,
	fecha date not null,
	hora varchar2(5) not null,
	constraint cod_exhibicion_pk primary key (cod_cine, cod_pelicula),
	constraint fk_cod_cine foreign key (cod_cine) references CINES (cod_cine),
	constraint fk_pelicula_ex foreign key (cod_pelicula) references PELICULAS (cod_pelicula)
);
*/


CREATE TABLE EXHIBICIONES (cod_cine number not null,
	cod_pelicula number not null,
	fecha date not null,
	hora time not null,
	constraint cod_exhibicion_pk primary key (cod_cine, cod_pelicula),
	constraint fk_cod_cine_ex foreign key (cod_cine) references CINES (cod_cine),
	constraint fk_pelicula_ex foreign key (cod_pelicula) references PELICULAS (cod_pelicula)
);

CREATE TABLE CINES (cod_cine number not null primary key,
	cine_nombre varchar(100) not null,
	cod_ciudad number,
	constraint fk_cod_ciudad foreign key (cod_ciudad) references CIUDADES (cod_ciudad)
);

CREATE TABLE CIUDADES (cod_ciudad number not null primary key,
	ciudad_nombre varchar2(100) not null
);



/* INSERCIONES */

/* GENEROS*/

INSERT INTO GENEROS(cod_genero, genero_nombre) VALUES(1, 'accion');
INSERT INTO GENEROS(cod_genero, genero_nombre) VALUES(2, 'romance');
INSERT INTO GENEROS(cod_genero, genero_nombre) VALUES(3, 'documental');
INSERT INTO GENEROS(cod_genero, genero_nombre) VALUES(4, 'comedia');
INSERT INTO GENEROS(cod_genero, genero_nombre) VALUES(5, 'drama');


/* ACTORES */

INSERT INTO ACTORES(Cod_actor, actor_nombre, actor_apellido) VALUES(1, 'fernando', 'cutire');
INSERT INTO ACTORES(Cod_actor, actor_nombre, actor_apellido) VALUES(2, 'gabriel', 'diaz');
INSERT INTO ACTORES(Cod_actor, actor_nombre, actor_apellido) VALUES(3, 'jorge', 'escobar');
INSERT INTO ACTORES(Cod_actor, actor_nombre, actor_apellido) VALUES(4, 'william', 'feng');

/* CUIDADES */

INSERT INTO CIUDADES (cod_ciudad, ciudad_nombre) VALUES(1, 'ciudad de panama');
INSERT INTO CIUDADES (cod_ciudad, ciudad_nombre) VALUES(2, 'david');
INSERT INTO CIUDADES (cod_ciudad, ciudad_nombre) VALUES(3, 'colon');
INSERT INTO CIUDADES (cod_ciudad, ciudad_nombre) VALUES(4, 'santiago');
INSERT INTO CIUDADES (cod_ciudad, ciudad_nombre) VALUES(5, 'chitre');
INSERT INTO CIUDADES (cod_ciudad, ciudad_nombre) VALUES(6, 'PENONOME');

/* PELICULAS */ 

INSERT INTO PELICULAS (cod_pelicula, pelicula_nombre, cod_genero) VALUES(1, 'cutire y las ardillas', 4);
INSERT INTO PELICULAS (cod_pelicula, pelicula_nombre, cod_genero) VALUES(2, 'el regreso de escobar', 1);
INSERT INTO PELICULAS (cod_pelicula, pelicula_nombre, cod_genero) VALUES(3, 'feng man' 5, 1);
INSERT INTO PELICULAS (cod_pelicula, pelicula_nombre, cod_genero) VALUES(4, 'gabox' 3, 3);

/*CINES */

INSERT INTO CINES VALUES(1, 'CUTIROPOLIS 1', 1);
INSERT INTO CINES VALUES(2, 'CUTIROPOLIS 2', 3);
INSERT INTO CINES VALUES(3, 'ESCOMARK', 6);

/* EXHIBICIONES(cod_cine, id_pelicula, fecha, hora)*/

INSERT INTO EXHIBICIONES VALUES (1, 1, '30-jun-2021','08:00:00');
/* POR SI NO FUNCIONA */ 
INSERT INTO EXHIBICIONES VALUES (1, 2, '01-j-2021','08:00');

INSERT INTO EXHIBICIONES VALUES (2, 3, '','');
INSERT INTO EXHIBICIONES VALUES (3, 2, '','');   




/* vistas */

CREATE VIEW VISTA_CARTELERA AS 
	SELECT c.cine_nombre, p.pelicula_nombre,f.fecha
	FROM CINES c,PELICULAS p,FUNCIONES f;


CREATE VIEW VISTA_CINES AS 
	SELECT c.cine_nombre
	FROM CINES c;

CREATE VIEW VISTA_CARTELERA_FUNCION AS 
	SELECT c.cine_nombre, p.pelicula_nombre,f.cod_funcion
	FROM CINES c,PELICULAS p,FUNCIONES f;

/* AJUSTE DE VENTANA */
set lines 256
set trimout on
set tab off	

set linesize 100 pagesize 50
