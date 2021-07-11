/* Cuatrimestres */
SELECT p.pais_nombre, COUNT(c.id_cliente)
FROM PAIS p
INNER JOIN Clientes c ON c.cod_pais = p.id_pais
GROUP BY P.pais_nombre
ORDER BY COUNT(c.id_cliente) DESC;


CREATE VIEW VIEW1_NACIONALIDADES
AS SELECT p.pais_nombre, COUNT(c.id_cliente) AS "Cantidad de clientes"
FROM PAIS p
INNER JOIN CLIENTES c ON c.cod_pais = p.id_pais
GROUP BY P.pais_nombre
ORDER BY "Cantidad de clientes" DESC;