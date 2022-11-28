-- Retrieve abbreviations for the states which contain at least 5 counties, 
-- and their population in year 2010 to area ratio 
-- in decreasing order of the aforementioned ratio. 
-- Round the ratio to 2 decimal places.

SELECT abbr, ROUND(SUM(population)/SUM(sq_km),2) AS "popPerSqKm" 
FROM state 
  JOIN county 
    ON (id = state)
  JOIN countyPopulation 
    ON (county = fips)
WHERE year = 2010 
GROUP BY abbr 
HAVING COUNT(abbr) >= 5 
ORDER BY SUM(population)/SUM(sq_km) DESC;
