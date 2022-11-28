-- Retrieve the top 5 industries 
-- in a decreasing order by number of employees, 
-- together with the corresponding number of employments 
-- and the average payroll. 

SELECT name, SUM(employees) AS totalEmployees, AVG(payroll) AS "avgPayroll" 
FROM Industry 
  JOIN countyIndustries 
    ON (industry = id)
GROUP BY name 
ORDER BY SUM(employees) DESC 
LIMIT 5;
