
SELECT TO_CHAR(fecha_booking, 'DAY'), COUNT(fecha_booking) FROM booking
GROUP BY TO_CHAR(fecha_booking, 'DAY') 
ORDER BY COUNT(fecha_booking) DESC;

CREATE VIEW DIAS_HABITUALES 
 AS SELECT TO_CHAR(fecha_booking, 'DAY') "Día", COUNT(fecha_booking) "Cuenta" FROM booking
GROUP BY TO_CHAR(fecha_booking, 'DAY') 
ORDER BY TO_CHAR(fecha_booking, 'DAY');
