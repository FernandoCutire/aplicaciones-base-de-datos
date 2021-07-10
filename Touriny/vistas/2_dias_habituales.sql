SELECT
    SUM(CASE WHEN extract(day_of_week from fecha_booking) = 'Monday' ) AS "Lunes",
    SUM(CASE WHEN extract(day_of_week from fecha_booking) = 'Tuesday') AS "Martes",
    SUM(CASE WHEN extract(day_of_week from fecha_booking) = 'Wednesday') AS "Miércoles",
    SUM(CASE WHEN extract(day_of_week from fecha_booking) = 'Thursday') AS "Jueves"
    SUM(CASE WHEN extract(day_of_week from fecha_booking) = 'Friday') AS "Viernes"
 FROM BOOKING;


select extract <day_of_week from fecha_booking> as dias from BOOKING;

select EXTRACT("TimeStamp", DAY_OF_WEEK)