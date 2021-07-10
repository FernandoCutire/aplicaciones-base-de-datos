SELECT
    SUM(CASE WHEN edad BETWEEN 18 AND 24 THEN 1 ELSE 0 END) AS "18-24 Años",
    SUM(CASE WHEN edad BETWEEN 25 AND 54 THEN 1 ELSE 0 END) AS "25-54 Años",
    SUM(CASE WHEN edad BETWEEN 55 AND 64 THEN 1 ELSE 0 END) AS "55-64 Años",
    SUM(CASE WHEN edad >65 THEN 1 ELSE 0 END) AS "65+ Años"
 FROM clientes;