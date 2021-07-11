
Select g.nombre1 "Nombre del Guia" , COUNT(t.id_guia) "Tours"
FROM Guias g
INNER JOIN TOURS t ON g.id_guia = t.id_guia
GROUP BY g.nombre1
ORDER BY COUNT(t.id_guia) DESC;

CREATE VIEW GUIAS_TURISTICOS AS SELECT g.nombre1 "Nombre del Guia" , COUNT(t.id_guia) "Tours"
FROM Guias g
INNER JOIN TOURS t ON g.id_guia = t.id_guia
GROUP BY g.nombre1
ORDER BY COUNT(t.id_guia) DESC;