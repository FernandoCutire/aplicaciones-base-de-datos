
SELECT TO_CHAR(fecha_booking, 'DAY'), COUNT(fecha_booking) FROM booking
GROUP BY TO_CHAR(fecha_booking, 'DAY') 
ORDER BY TO_CHAR(fecha_booking, 'DAY');

  
