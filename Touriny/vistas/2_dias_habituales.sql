SELECT
    SUM(CASE WHEN extract(day_of_week from fecha_booking) = 1 ) AS "Primer Cuatrimestre",
    SUM(CASE WHEN extract(day_of_week from fecha_booking) = 2) AS "Segundo Cuatrimestre",
    SUM(CASE WHEN extract(day_of_week from fecha_booking) = 3) AS "Tercer Cuatrimestre",
    SUM(CASE WHEN extract(day_of_week from fecha_booking) = 4) AS "Cuarto Cuatrimestre"
 FROM BOOKING;
