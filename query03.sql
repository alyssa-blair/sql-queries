-- Retrieve all states that have their abbreviartion names starting with 'A' 
-- and contain at least 20 counties,
-- ordered by the total area. 

SELECT abbr FROM state 
  JOIN county 
    ON (state.id = county.state)
WHERE abbr LIKE "A%" 
GROUP BY abbr 
HAVING COUNT(abbr) > 20 
ORDER BY SUM(sq_km);
