-- Retrieve the list of states (showing both the id and abbreviation) 
-- and their corresponding total area, 
-- not accounting for the counties that have more than 10000 population in the year of 2010, 
-- sorted by area in descending order.

SELECT id, abbr, sum(sq_km) AS "area" FROM state 
  JOIN county 
    ON (state.id = county.state) 
  JOIN countypopulation 
    ON (county.fips = countypopulation.county)
WHERE NOT county IN 
    (SELECT county FROM countypopulation 
     WHERE year = 2010 AND population > 10000) 
GROUP BY abbr 
ORDER BY sum(sq_km) DESC;
