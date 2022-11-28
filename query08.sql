-- Retrieve the list of counties sorted by the ratio 
-- between male and female population for each county 
-- in descending order or the aforementioned ratio, and then in the ascending order of county FIP.
-- Exclude tuples with ratio of 1:1 from returned result.

SELECT t1.county, t1.population/t2.population AS "ratio" 
FROM genderbreakdown AS t1 
  JOIN genderbreakdown AS t2 
    ON (t1.county = t2.county) 
WHERE t1.gender = "male" 
  AND t2.gender = "female" 
  AND t1.population != t2.population 
ORDER BY t1.population/t2.population DESC, t1.county;
