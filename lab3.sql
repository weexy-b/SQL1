SELECT name
FROM cities
WHERE name LIKE '%ськ'
AND region IS NOT NULL;

SELECT name
FROM cities
WHERE name LIKE '%донец%'
AND region IS NOT NULL;

SELECT CONCAT(name, ' (', region, ')') AS city_region
FROM cities
WHERE population > 100000
AND region IS NOT NULL
ORDER BY name ASC;

SELECT name, population, 
       ROUND((population / 40000000) * 100, 2) AS population_percentage
FROM cities
WHERE region IS NOT NULL
ORDER BY population DESC
LIMIT 10;

SELECT CONCAT(name, ' - ', ROUND((population / 40000000) * 100, 2), '%') AS city_population_percentage
FROM cities
WHERE (population / 40000000) * 100 >= 0.1
AND region IS NOT NULL
ORDER BY (population / 40000000) * 100 DESC;

