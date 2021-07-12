
 CREATE VIEW VIEW4_PAQUETES
AS SELECT
    SUM(CASE WHEN cantidad_personas BETWEEN 0 AND 1 THEN 1 ELSE 0 END) AS "Paquete Individual",
    SUM(CASE WHEN cantidad_personas BETWEEN 1 AND 2 THEN 1 ELSE 0 END) AS "Paquete Duo",
    SUM(CASE WHEN cantidad_personas BETWEEN 3 AND 4 THEN 1 ELSE 0 END) AS "Paquete Tripe",
    SUM(CASE WHEN cantidad_personas BETWEEN 5 AND 10 THEN 1 ELSE 0 END) AS "Paquete Familiar"
 FROM booking;