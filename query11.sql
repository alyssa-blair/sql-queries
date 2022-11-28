-- Retrieve the county name, industry name, and the average payroll for the corresponding county and industry,
-- for counties with more than 2 percent of unemployment rate in any year. 
-- Order the results by county name, then industry name, then average payroll.

SELECT county.name AS "name", industry.name AS "indName", countyIndustries.payroll AS "averagePayroll" 
FROM county 
  JOIN countyIndustries 
    ON (county.fips = countyIndustries.county)
  JOIN industry 
    ON (countyIndustries.industry = industry.id)
WHERE county.fips IN
  (SELECT county 
  FROM countyLabourStats 
  WHERE unemployed/(employed + unemployed) > 0.02) 
ORDER BY name, indname, averagePayroll + 0;

