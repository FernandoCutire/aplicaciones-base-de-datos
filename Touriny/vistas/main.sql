-- Conocer los dias más habituales de reserva. 

CREATE VIEW DIAS_HABITUALES 
 AS SELECT TO_CHAR(fecha_booking, 'DAY') "Día", COUNT(fecha_booking) "Cuenta" FROM booking
GROUP BY TO_CHAR(fecha_booking, 'DAY') 
ORDER BY TO_CHAR(fecha_booking, 'DAY');

-- Identificar al consumidor a partir de la nacionalidad. 

CREATE VIEW VIEW1_NACIONALIDADES
AS SELECT p.pais_nombre, COUNT(c.id_cliente) AS "Cantidad de clientes"
FROM PAIS p
INNER JOIN CLIENTES c ON c.cod_pais = p.id_pais
GROUP BY P.pais_nombre
ORDER BY "Cantidad de clientes" DESC;

-- Determinar el rango de edades más frecuentes de los clientes. 

 CREATE VIEW VIEW1_EDADES
AS SELECT
    SUM(CASE WHEN edad BETWEEN 18 AND 24 THEN 1 ELSE 0 END) AS "18-24 Años",
    SUM(CASE WHEN edad BETWEEN 25 AND 54 THEN 1 ELSE 0 END) AS "25-54 Años",
    SUM(CASE WHEN edad BETWEEN 55 AND 64 THEN 1 ELSE 0 END) AS "55-64 Años",
    SUM(CASE WHEN edad >65 THEN 1 ELSE 0 END) AS "65+ Años"
 FROM clientes;

-- Crear paquetes a partir de la cantidad de personas que suelen reservar en grupo.​



-- Consultar cuántos clientes reservan por distintos periodos de tiempo.​

CREATE VIEW CUATRIMESTRE 
 AS SELECT TO_CHAR(fecha_booking, 'Q') as "Cuatrimestre", COUNT(fecha_booking) as "Cont" FROM booking
GROUP BY TO_CHAR(fecha_booking, 'Q') 
ORDER BY TO_CHAR(fecha_booking, 'Q');


-- Establecer los lugares destinos ofrecidos más frecuentados.​





-- Comparar la cantidad de tours de cada guía turístico

CREATE VIEW GUIAS_TURISTICOS AS SELECT g.nombre1 "Nombre del Guia" , COUNT(t.id_guia) "Tours"
FROM Guias g
INNER JOIN TOURS t ON g.id_guia = t.id_guia
GROUP BY g.nombre1
ORDER BY COUNT(t.id_guia) DESC;