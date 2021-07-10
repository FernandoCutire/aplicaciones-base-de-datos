/* Cuatrimestres */


SELECT p.pais_nombre, COUNT(c.id_cliente)
FROM PAIS p
INNER JOIN Clientes c ON c.cod_pais = p.id_pais
GROUP BY P.pais_nombre
ORDER BY COUNT(c.id_cliente) DESC;