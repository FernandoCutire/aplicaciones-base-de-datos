-- 1 Consultar cuántos clientes reservan por distintos periodos de tiempo.​

 CREATE VIEW VISTA_1_CUATRIMESTRE 
 AS SELECT TO_CHAR(fecha_booking, 'Q') as "Cuatrimestre", COUNT(fecha_booking) as "Cont" FROM booking
GROUP BY TO_CHAR(fecha_booking, 'Q') 
ORDER BY TO_CHAR(fecha_booking, 'Q');


-- 2 Conocer los dias más habituales de reserva. 

 CREATE VIEW VISTA_2_DIAS_HABITUALES 
AS SELECT TO_CHAR(fecha_booking, 'DAY') "Día", COUNT(fecha_booking) "Cuenta" FROM booking
    GROUP BY TO_CHAR(fecha_booking, 'DAY') 
    ORDER BY TO_CHAR(fecha_booking, 'DAY');


-- 3 Identificar al consumidor a partir de la nacionalidad. 

 CREATE VIEW VISTA_3_NACIONALIDADES
AS SELECT p.pais_nombre, COUNT(c.id_cliente) AS "Cantidad de clientes"
    FROM PAIS p
    INNER JOIN CLIENTES c ON c.cod_pais = p.id_pais
    GROUP BY P.pais_nombre
    ORDER BY "Cantidad de clientes" DESC;


-- 4 Crear paquetes a partir de la cantidad de personas que suelen reservar en grupo.​

 CREATE VIEW VIEW4_PAQUETES
AS SELECT
    SUM(CASE WHEN cantidad_personas BETWEEN 0 AND 1 THEN 1 ELSE 0 END) AS "Paquete Individual",
    SUM(CASE WHEN cantidad_personas BETWEEN 1 AND 2 THEN 1 ELSE 0 END) AS "Paquete Duo",
    SUM(CASE WHEN cantidad_personas BETWEEN 3 AND 4 THEN 1 ELSE 0 END) AS "Paquete Tripe",
    SUM(CASE WHEN cantidad_personas BETWEEN 5 AND 10 THEN 1 ELSE 0 END) AS "Paquete Familiar"
 FROM booking;


-- 5 Establecer los lugares destinos ofrecidos más frecuentados.​


-- 6 Determinar el rango de edades más frecuentes de los clientes. 

 CREATE VIEW VIEW_6_EDADES
AS SELECT
    SUM(CASE WHEN edad BETWEEN 18 AND 24 THEN 1 ELSE 0 END) AS "18-24 Años",
    SUM(CASE WHEN edad BETWEEN 25 AND 54 THEN 1 ELSE 0 END) AS "25-54 Años",
    SUM(CASE WHEN edad BETWEEN 55 AND 64 THEN 1 ELSE 0 END) AS "55-64 Años",
    SUM(CASE WHEN edad >65 THEN 1 ELSE 0 END) AS "65+ Años"
 FROM clientes;

-- 7 Comparar la cantidad de tours de cada guía turístico

 CREATE VIEW VISTA_7_GUIAS_TURISTICOS AS SELECT g.nombre1 "Nombre del Guia" , COUNT(t.id_guia) "Tours"
FROM Guias g
    INNER JOIN TOURS t ON g.id_guia = t.id_guia
    GROUP BY g.nombre1
    ORDER BY COUNT(t.id_guia) DESC;