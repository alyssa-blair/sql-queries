-- Retrieve counties that have the life expectancy more than the average value of all life expectancies, 
-- and also have the average income less than the avaerge of all average incomes, 
-- order by county names alphabetically, then by life expectancy increasingly.

SELECT name, life_expectancy, avg_income 
FROM county 
GROUP BY fips 
HAVING life_expectancy > 
  (SELECT AVG(life_expectancy) FROM county) 
AND avg_income < 
  (SELECT AVG(avg_income) FROM county) 
ORDER BY county.name, life_expectancy;
