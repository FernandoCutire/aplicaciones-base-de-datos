/* Ayudar con eso*/
/* Cuatrimestres */
SELECT
    SUM(CASE WHEN extract(quarter from fecha_booking) = 1 ) AS "Primer Cuatrimestre",
    SUM(CASE WHEN extract(quarter from fecha_booking) = 2) AS "Segundo Cuatrimestre",
    SUM(CASE WHEN extract(quarter from fecha_booking) = 3) AS "Tercer Cuatrimestre",
    SUM(CASE WHEN extract(quarter from fecha_booking) = 4) AS "Cuarto Cuatrimestre"
 FROM BOOKING;


/*

OUTPUT:

1 CUATRIMESTRE
5

2 CUATRIMESTRE
5

3 CUATRIMESTRE
10

4 CUATRIMESTRE
8
*/