-- Retrieve the distinct abbreviations of states which have a county that does NOT have the 
-- "Management of companies and enterprises" industry 
-- and also the corresponding total number of counties in each state
-- in descending order of the number of distinct counties in each state, then in alphebatical order of the abbreviations.
-- Your query need to use the name "Management of companies and enterprises" to filter the tuples, instead of just the industry id as prior knowledge.


SELECT DISTINCT abbr, COUNT(DISTINCT county.fips) AS "numCounties" 
FROM state 
  JOIN county 
    ON (State.id = county.state) 
  LEFT JOIN countyIndustries 
    ON (countyIndustries.county = county.fips) 
  LEFT JOIN Industry 
    ON (countyIndustries.industry = industry.id) 
  WHERE county.fips NOT IN 
    (SELECT DISTINCT county 
    FROM countyIndustries 
      JOIN Industry 
        ON (countyIndustries.industry = industry.id)
    WHERE industry.name = "Management of companies and enterprises") 
GROUP BY state.id 
ORDER BY COUNT(DISTINCT county.fips) DESC, abbr;
