
SELECT TO_CHAR(fecha_booking, 'Q') as "Cuatrimestre", COUNT(fecha_booking) as "Cont" FROM booking
GROUP BY TO_CHAR(fecha_booking, 'Q') 
ORDER BY TO_CHAR(fecha_booking, 'Q');


CREATE VIEW CUATRIMESTRE 
 AS SELECT TO_CHAR(fecha_booking, 'Q') as "Cuatrimestre", COUNT(fecha_booking) as "Cont" FROM booking
GROUP BY TO_CHAR(fecha_booking, 'Q') 
ORDER BY TO_CHAR(fecha_booking, 'Q');
 
