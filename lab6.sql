SELECT 
    cities.name AS city_name,
    cities.region AS region_code
FROM 
    cities
WHERE 
    cities.population > 350000;

SELECT 
    cities.name AS city_name,
    regions.name AS region_name
FROM 
    cities
JOIN 
    regions
ON 
    cities.region = regions.uuid
WHERE 
    regions.name = 'Nord';


