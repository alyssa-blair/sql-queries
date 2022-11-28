-- Retrieve the list of abbreviations of states that have
-- a total precipitation of more than 1000 for each state,
-- ordered by the total precipitation in descending order.

SELECT abbr, SUM(precip) AS total 
FROM state 
  JOIN county 
    ON (county.state = state.id) 
GROUP BY state 
HAVING sum(precip) > 1000 
ORDER BY sum(precip) DESC;
