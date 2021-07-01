CREATE TABLE CURSO_ACAD (cod_curso number PRIMARY KEY not null,
  f_inicio date not null,
  f_final date not null
);


CREATE TABLE ALUMNO (cod_alum number PRIMARY KEY not null,
  nom_al varchar2(20) not null,
  tel_al varchar2(20) not null,
  f_nac date not null
);

CREATE TABLE GENERO (cod_genero number PRIMARY KEY not null,
  nom_genero varchar(20) not null 
);  


CREATE TABLE PROFESOR (cod_prof number PRIMARY KEY not null,
  nom_prof varchar2(20) not null,
  tel_prof varchar2(20) not null,
  f_nac date not null, 
  especialidad varchar2(20) not null,
  salario number(8,2) default 0,
  cod_genero number not null,
  CONSTRAINT fk_genero FOREIGN KEY (cod_genero) REFERENCES GENERO (cod_genero)
);


CREATE TABLE ASIGNATURA (cod_asig number PRIMARY KEY not null,
  nom_asig varchar2(20) not null, 
  creditos number not null
);

CREATE TABLE FACULTAD (cod_fac number PRIMARY KEY  not null,
  nom_fac varchar2(20) not null
);

CREATE TABLE PROFESOR_ASIGNATURA_FACULTAD (cod_asig number not null,
  cod_prof number not null,
  cod_fac number not null,
  /* PAF = PROFESOR-ASIGNATURA-FACULTAD */
  CONSTRAINT fk_paf PRIMARY KEY (cod_asig, cod_prof, cod_fac),
  CONSTRAINT fk_prof FOREIGN KEY (cod_prof) REFERENCES PROFESOR (cod_prof),
  CONSTRAINT fk_asig FOREIGN KEY (cod_asig) REFERENCES ASIGNATURA (cod_asig),
  CONSTRAINT fk_fac FOREIGN KEY (cod_fac) REFERENCES FACULTAD (cod_fac)  
);

 
CREATE TABLE MATRICULA (cod_asig number not null,
  cod_curso number not null,
  cod_alum number not null, 
  nota number not null,
  CONSTRAINT fk_matr PRIMARY KEY (cod_alum, cod_asig, cod_curso),
  CONSTRAINT fk_asig_m FOREIGN KEY (cod_asig) REFERENCES ASIGNATURA (cod_asig),
  CONSTRAINT fk_curso_m FOREIGN KEY (cod_curso) REFERENCES CURSO_ACAD (cod_curso),
  CONSTRAINT fk_alum_m FOREIGN KEY (cod_alum) REFERENCES ALUMNO (cod_alum)
);

CREATE TABLE GRUPOS_ESTUDIANTILES (
  cod_grupo number PRIMARY KEY not null,
  nom_grupo varchar2(20) not null,
  tel_grupo varchar(20) not null,
  dir_grupo varchar(20) not null
);


CREATE TABLE ALUMNO_GRUPOS_ESTUDIANTILES (cod_alum number not null,
  cod_grupo number not null,
  /* AGE = ALUMNO-GRUPOS_ESTUDIANTILES*/
  CONSTRAINT fk_agre PRIMARY KEY (cod_alum,cod_grupo),
  CONSTRAINT fk_asig_e FOREIGN KEY (cod_alum) REFERENCES ALUMNO (cod_alum),
  CONSTRAINT fk_grupo FOREIGN KEY (cod_grupo) REFERENCES GRUPOS_ESTUDIANTILES (cod_grupo)
);



/* INSERCIONES */

/* CURSO_ACAD*/
/* (cod_curso, f_inicio, f_final)*/

INSERT INTO CURSO_ACAD VALUES(1, '10-mar-2021', '17-jul-2021');


/* ALUMNO */
/* (num_matr, nom_al, f_nac, tel_al) */

INSERT INTO ALUMNO VALUES(1, 'Fernando', '12-jul-2001', '6454-2367');

/* GENERO */

INSERT INTO GENERO VALUES(0,'masculino');
INSERT INTO GENERO VALUES(1,'femenino');


/* PROFESOR nombre, telefono, f nacimiento, especialidad, salario, genero*/

INSERT INTO PROFESOR  VALUES(1, 'Ariel Reluz', '8888-4444', '15-mar-2000', 'Ciberseguridad', 10000.00, 1);
INSERT INTO PROFESOR VALUES(2, 'Alexander Cañate', '8912-9876', '20-mar-1987','Cadena de Suministro',  10000.00, 0);

/* ASIGNATURA */ 
  
/* (cod_asig, nom_asig, creditos) */
INSERT INTO ASIGNATURA  VALUES(1,'Base de Datos', 4);
INSERT INTO ASIGNATURA  VALUES(2,'Base de Datos II', 4);


/* FACULTAD */

INSERT INTO FACULTAD VALUES(1, 'FISC');

/* PROFESOR-ASIGNATURA-FACULTAD */

INSERT INTO PROFESOR_ASIGNATURA_FACULTAD VALUES(1,1,1); 


/* GRUPOS_ESTUDIANTILES */
/* (cod_exhibicion, cod_cine, id_pelicula, cod_funcion) */

INSERT INTO GRUPOS_ESTUDIANTILES VALUES (1, 'IEEE CS', '6879-2156', 'Prof. Nilda Yanguez');

/* ALUMNO-GRUPOS_ESTUDIANTILES */
INSERT INTO ALUMNO_GRUPOS_ESTUDIANTILES VALUES (1, 1);


CREATE VIEW VISTA_FACULTAD AS
  SELECT f.nom_fac, p.nom_prof, p.salario, a.nom_asig
  FROM FACULTAD f, PROFESOR p, ASIGNATURA a;


  