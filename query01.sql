-- Retrieve the abbreviations of states that have over 150 counties 
-- which have an employment rate of at least 90% for each county in 2008, 
-- ordered by the number of counties in each state in descending order.

SELECT abbr FROM state 
  JOIN county 
    ON (state.id = county.state) 
  JOIN countyLabourstats 
    ON (fips = countyLabourstats.county) 
WHERE employed/(employed + unemployed) >= 0.9 AND year = 2008 
GROUP BY abbr HAVING count(abbr) > 150 
ORDER BY count(abbr) desc;

