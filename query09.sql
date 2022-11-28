-- Out of those counties with temperature of more than 60, 
-- retrieve the pair that had the largest absolute difference in temperature
-- and their corresponding temperatures.
-- The second county in the pair has a temperature larger than the first county's temperature. 
-- If multiple pairs exist, retrieve the pair with the smallest FIP of the first county in the pair.


SELECT c1.name AS "name", c1.temp AS "temp", c2.name AS "name", c2.temp AS "temp" 
FROM county AS c1 
  JOIN county AS c2 
WHERE c1.temp > 60 
  AND c2.temp > 60 
  AND c1.temp < c2.temp 
ORDER BY (c2.temp - c1.temp) DESC, c1.fips 
LIMIT 1;
