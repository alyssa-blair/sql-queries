-- Retrieve names of top 10 counties and 
-- their growth ratio in terms of population compared between the latest census year and the oldest census year, 
-- in an descending order by their growth ratio.

SELECT county.name, t2.population/t1.population AS "popGrowthRatio" 
FROM county 
  JOIN countyPopulation AS t1 
    ON (t1.county = county.fips) 
  JOIN countyPopulation AS t2 
    ON (t1.county = t2.county) 
  JOIN 
    (SELECT county, MIN(year) AS "minYear", MAX(year) AS "maxYear" 
    FROM countyPopulation 
    GROUP BY county) AS t3 
      ON (t3.county = t1.county) 
WHERE t1.year = minYear 
  AND t2.year = maxYear 
GROUP BY t1.county 
ORDER BY t2.population/t1.population DESC 
LIMIT 10;
