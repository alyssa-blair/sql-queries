# sql-queries

These are the queries from an assignment meant to:

  * demonstrate data analysis skills with SQL
  
    + write SQL queries with varied complexity to extract desired information
    from a relational database
    + optimise SQL queries towards simplicity
    
## Tables

The tables for this assignment were set up as below:

CensusYear:
  + year - int

County:
  + fips - int
  + name - string
  + state - int
  + sq_km - float
  + precip - float
  + snow - float
  + temp - float
  + life_expectancy - float
  + avg_income - float
  
CountyIndustries:
  + county - int
  + industry - int
  + payroll - int
  + employees - int
  
CountyLabourStats:
  + county - int
  + year - int
  + labour_force - int
  + employed - jnt
  + unemployed - int
  
CountyPopulation:
  + county - int
  + year - int
  + population - int
  
Election:
  + year - int
  
ElectionResult:
  + county - int
  + year - int
  + total_votes - int
  + dem - int
  + gop - int

Gender:
  + name - string

GenderBreakdown:
  + county - int
  + gender - string
  + population - int
  
Industry:
  + id - int
  + name - string
  
LabourSurvey:
  + year - int
  
State:
  + id - int
  + abbr - char(2)






