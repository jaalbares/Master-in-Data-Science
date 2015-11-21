    SELECT t1.country_name,npop,nairports, cast(nairports as float)/npop*100 AS pc
FROM 
    (select country_name, sum (population) as npop
    from optd_por_public
    where population is not null 
    group by country_name) as t1,

    (select country_name, count(*) as nairports
    from optd_por_public 
    where location_type='A' or location_type='CA'
    GROUP BY country_name) as t2

WHERE t1.country_name=t2.country_name 
and npop >0
 
ORDER BY pc desc limit 10;

-- con vistas

select population.country_name, npop, nairports
from population, airports
where population.country_name = airports.country_name
order by npop desc limit 10;

-- con sentencia inner join

select population.country_name, npop, nairports
from population
inner join airports
on population.country_name = airports.country_name
order by npop desc limit 10;

-- Dia 21-11-2015
-- Inner join entre aerolineas y numero de vuelos por aeorlineas
-- Tantas filas como la tabla 
SELECT airline_code_2c, name, flight_freq 
FROM ref_airline_nb_of_flights AS r
LEFT OUTER JOIN optd_airlines AS o
ON o."2char_code"=r.airline_code_2c
ORDER by flight_freq desc limit 10;

-- hay duplicados en la tabla optd_airlines por lo tanto hay que arreglar los datos de la tabla optd_airlines
-- utilizamos airline_code_2c porque el codigo IATA es ambiguo y puede haber duplicidades


SELECT airline_code_2c, name, flight_freq 
FROM optd_airlines AS o
LEFT OUTER JOIN ref_airline_nb_of_flights AS r
ON o."2char_code"=r.airline_code_2c;


-- Tantas filas como la tabla O
SELECT airline_code_2c, name, flight_freq 
FROM  ref_airline_nb_of_flights AS r
RIGHT OUTER JOIN optd_airlines AS o
ON o."2char_code"=r.airline_code_2c;


-- Esta query seria equivalente a
SELECT airline_code_2c, name, flight_freq 
FROM optd_airlines AS o
RIGHT OUTER JOIN  ref_airline_nb_of_flights AS r
ON o."2char_code"=r.airline_code_2c;
-- esta: 
SELECT airline_code_2c, name, flight_freq 
FROM ref_airline_nb_of_flights AS r
LEFT OUTER JOIN optd_airlines AS o
ON o."2char_code"=r.airline_code_2c;

-- Mostrar ciudades cuya ubicación sea superior a la media.

select country_name, count(*)
from optd_por_public
WHERE elevation > (select avg(elevation) from optd_por_public where elevation is not null and location_type='C') 
and location_type='C' group by country_name
LIMIT 10;


