-- Retrieve the years that exist in CensusYear but not in LabourSurvey. 
-- The ordering should be in the existing physical order of the data.

SELECT censusyear.year 
FROM censusyear 
  LEFT JOIN laboursurvey 
    ON (censusyear.year = laboursurvey.year)
WHERE laboursurvey.year IS NULL;
