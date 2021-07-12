-- 1 Consultar cuántos clientes reservan por distintos periodos de tiempo.​

 CREATE VIEW VISTA_1_CUATRIMESTRE 
 AS SELECT TO_CHAR(fecha_booking, 'Q') as "Cuatrimestre", COUNT(fecha_booking) as "Cantidad" FROM booking
GROUP BY TO_CHAR(fecha_booking, 'Q') 
ORDER BY TO_CHAR(fecha_booking, 'Q');


-- 2 Conocer los dias más habituales de reserva. 

 CREATE VIEW VISTA_2_DIAS_HABITUALES 
AS SELECT TO_CHAR(fecha_booking, 'DAY') AS "Dia de la semana" , COUNT(fecha_booking) AS "Cantidad" FROM booking
GROUP BY TO_CHAR(fecha_booking, 'DAY') 
ORDER BY COUNT(fecha_booking) DESC;


-- 3 Identificar al consumidor a partir de la nacionalidad. 

 CREATE VIEW VISTA_3_NACIONALIDADES
AS SELECT p.pais_nombre AS "País", COUNT(c.id_cliente) AS "Cantidad de clientes"
    FROM PAIS p
    INNER JOIN CLIENTES c ON c.cod_pais = p.id_pais
    GROUP BY P.pais_nombre
    ORDER BY "Cantidad de clientes" DESC;


-- 4 Crear paquetes a partir de la cantidad de personas que suelen reservar en grupo.​

 CREATE VIEW VISTA_4_PAQUETES
AS SELECT
    SUM(CASE WHEN cantidad_personas BETWEEN 0 AND 1 THEN 1 ELSE 0 END) AS "Paquete Individual",
    SUM(CASE WHEN cantidad_personas BETWEEN 2 AND 2 THEN 1 ELSE 0 END) AS "Paquete Duo",
    SUM(CASE WHEN cantidad_personas BETWEEN 3 AND 3 THEN 1 ELSE 0 END) AS "Paquete Triple",
    SUM(CASE WHEN cantidad_personas BETWEEN 4 AND 10 THEN 1 ELSE 0 END) AS "Paquete Familiar"
 FROM booking;


-- 5 Establecer los tours ofrecidos más frecuentados.​

 CREATE VIEW VISTA_5_TOURS_FAVORITOS
AS SELECT  t.tour_nombre AS "Nombre del tour" , COUNT(b.tours_id_tours1) AS "Cantidad de bookings"
FROM tours t
INNER JOIN booking_tours b 
ON b.tours_id_tours1 = t.id_tours
GROUP BY t.tour_nombre
ORDER BY COUNT(b.tours_id_tours1) DESC;


-- 6 Determinar el rango de edades más frecuentes de los clientes. 

 CREATE VIEW VISTA_6_EDADES
AS SELECT
    SUM(CASE WHEN edad BETWEEN 18 AND 24 THEN 1 ELSE 0 END) AS "18-24 Años",
    SUM(CASE WHEN edad BETWEEN 25 AND 54 THEN 1 ELSE 0 END) AS "25-54 Años",
    SUM(CASE WHEN edad BETWEEN 55 AND 63 THEN 1 ELSE 0 END) AS "55-63 Años",
    SUM(CASE WHEN edad BETWEEN 64 AND 105 THEN 1 ELSE 0 END) AS "64+ Años"
 FROM clientes;

-- 7 Comparar la cantidad de tours de cada guía turístico

 CREATE VIEW VISTA_7_GUIAS_TURISTICOS AS SELECT (g.nombre1||' '||g.apellido1) as nombre, COUNT(t.id_guia) "Tours"
FROM Guias g
    INNER JOIN TOURS t ON g.id_guia = t.id_guia
    GROUP BY g.nombre1, g.apellido1
    ORDER BY COUNT(t.id_guia) DESC;