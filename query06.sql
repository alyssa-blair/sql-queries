-- Retrieve the distinct IDs for states that 
-- have a county with an average income more than $100,000. 
-- Order the results by state ID in ascending order.

SELECT DISTINCT id 
FROM state 
  JOIN county 
    ON (state.id = county.state) 
WHERE county.avg_income > 100000 
ORDER BY id;
