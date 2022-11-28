-- Retrieve the abbreviations of states containing at least 5 counties
-- and their ratio of snow per square megameter.
-- Order by area. 
-- Use ROUND() to round the result to 2 decimal places, eg., ROUND(1.2345, 2) = 1.23. 
-- (1 sq kilometer = 0.000001 sq megameter)

SELECT abbr, ROUND(1000000 * SUM(snow)/SUM(sq_km),2) AS "snowAreaRatio" 
FROM state 
  JOIN county 
    ON (county.state = state.id)
GROUP BY state 
HAVING COUNT(abbr) >= 5 
ORDER BY SUM(sq_km);
