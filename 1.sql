SELECT * FROM cities
ORDER BY population DESC
LIMIT 10 OFFSET 10;

SELECT * FROM cities
ORDER BY name DESC
LIMIT 30;

SELECT * FROM cities
ORDER BY region, population DESC;

SELECT DISTINCT region FROM cities;

SELECT * FROM cities
ORDER BY region DESC, name DESC;

