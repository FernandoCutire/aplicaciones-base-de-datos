
-- -----------------------------------------------------
-- Schema touriny_db
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Table pais
-- -----------------------------------------------------
CREATE TABLE pais (id_pais NUMBER NOT NULL,
  pais_nombre VARCHAR2(45) NOT NULL,
  CONSTRAINT pk_id_pais PRIMARY KEY (id_pais)
  );

-- -----------------------------------------------------
-- Table cliente
-- -----------------------------------------------------
CREATE TABLE cliente (id_cliente NUMBER NOT NULL,
  dni VARCHAR2(45) NOT NULL,
  nombre1 VARCHAR2(45) NOT NULL,
  nombre2 VARCHAR2(45) NOT NULL,
  apellido1 VARCHAR2(45) NOT NULL,
  apellido2 VARCHAR2(45) NOT NULL,
  email VARCHAR2(45) NOT NULL,
  telefono VARCHAR2(45) NOT NULL,
  edad VARCHAR2(45) NOT NULL,
  cod_pais NUMBER NOT NULL,
  ciudad VARCHAR2(45) NOT NULL,
  CONSTRAINT pk_id_cliente PRIMARY KEY (id_cliente),
  CONSTRAINT fk_cod_pais FOREIGN KEY (cod_pais) REFERENCES pais (id_pais)
);


-- -----------------------------------------------------
-- Table guia
-- -----------------------------------------------------
CREATE TABLE guia (id_guia NUMBER NOT NULL,
  dni VARCHAR2(45) NOT NULL,
  nombre1 VARCHAR2(45) NOT NULL,
  apellido1 VARCHAR2(45) NOT NULL,
  email VARCHAR2(45) NOT NULL,
  telefono VARCHAR2(45) NOT NULL,
  edad VARCHAR2(45) NOT NULL,
  ciudad VARCHAR2(45) NOT NULL,
  CONSTRAINT pk_id_guia PRIMARY KEY (id_guia)
  );


-- -----------------------------------------------------
-- Table tours
-- -----------------------------------------------------
CREATE TABLE tours (id_tours NUMBER NOT NULL,
  tour_nombre VARCHAR2(45) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  duracion NUMBER NOT NULL,
  descripcion VARCHAR2(250) NOT NULL,
  precio VARCHAR2(45) NOT NULL,
  dificultad NUMBER NOT NULL,
  cod_destino NUMBER NOT NULL,
  id_guia NUMBER NOT NULL,
  CONSTRAINT pk_id_tours PRIMARY KEY (id_tours),
  CONSTRAINT fk_id_guia
    FOREIGN KEY (id_guia)
    REFERENCES guia (id_guia)
);


-- ----------------------------------------------------
-- Table estado
-- -----------------------------------------------------
CREATE TABLE estado (id_status NUMBER NOT NULL,
  descripcion VARCHAR2(45) NOT NULL,
  CONSTRAINT pk_id_status PRIMARY KEY (id_status)
  );


-- -----------------------------------------------------
-- Table booking
-- -----------------------------------------------------
CREATE TABLE booking (id_booking NUMBER NOT NULL,
  fecha_booking DATE NOT NULL,
  id_cliente NUMBER NOT NULL,
  id_status NUMBER NOT NULL,
  CONSTRAINT pk_id_booking PRIMARY KEY (id_booking),
  CONSTRAINT fk_id_status
    FOREIGN KEY (id_status)
    REFERENCES estado (id_status),
  CONSTRAINT fk_id_cliente
    FOREIGN KEY (id_cliente)
    REFERENCES cliente (id_cliente)
);


-- -----------------------------------------------------
-- Table booking_tours
-- -----------------------------------------------------
CREATE TABLE booking_tours (booking_id_booking NUMBER NOT NULL,
  tours_id_tours NUMBER NOT NULL,
  PRIMARY KEY (booking_id_booking, tours_id_tours),
  CONSTRAINT fk_booking1
    FOREIGN KEY (booking_id_booking)
    REFERENCES booking (id_booking),
  CONSTRAINT fk_tours1
    FOREIGN KEY (tours_id_tours)
    REFERENCES tours (id_tours)
);


-- -----------------------------------------------------
-- Table destinos
-- -----------------------------------------------------
CREATE TABLE destinos (id_destinos NUMBER NOT NULL,
  destino_nombre VARCHAR2(45) NOT NULL,
  CONSTRAINT pk_id_destinos PRIMARY KEY (id_destinos)
);

-- -----------------------------------------------------
-- Table destinos_tours
-- -----------------------------------------------------
CREATE TABLE destinos_tours (
  destinos_id_destinos NUMBER NOT NULL,
  tours_id_tours NUMBER NOT NULL,
  PRIMARY KEY (destinos_id_destinos, tours_id_tours),
  CONSTRAINT fk_tours_destinos1
    FOREIGN KEY (destinos_id_destinos)
    REFERENCES destinos (id_destinos),
  CONSTRAINT fk_destinos_tours1
    FOREIGN KEY (tours_id_tours)
    REFERENCES tours (id_tours)
);
