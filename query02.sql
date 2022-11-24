-- Retrieve the list of states (showing both the id and abbreviation) 
-- and their corresponding total area, 
-- not accounting for the counties that have more than 10000 population in the year of 2010, 
-- sorted by area in descending order.

select id, abbr, sum(sq_km) as "area" from state 
  join county 
    on (state.id = county.state) 
  join countypopulation 
    on (county.fips = countypopulation.county)
where not county in 
    (Select county from countypopulation 
     where year = 2010 and population > 10000) 
group by abbr 
order by sum(sq_km) desc;
