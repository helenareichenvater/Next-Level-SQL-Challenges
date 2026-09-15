-- Aggregate the results table to get the total number of races in which each driver has competed for each constructor (team)
    -- For each constructor, rank their drivers by how many races those drivers have completed for that constructor (use dense rank)
        -- Use a window function to create a primary key for the resulting data


select
    cs.constructorid,
    dr.driverid,
    count(distinct cs.raceid) as number_of_races,
    dense_rank() over(partition by cs.constructorid order by count(distinct cs.raceid) desc) as driver_ranking,
    row_number() over(order by cs.constructorid, count(distinct cs.raceid) desc) as primary_key
from
    constructor_standings as cs
join
    driver_standings as r
    on
        r.raceid = cs.raceid
join
    drivers as dr
    on
        dr.driverid = r.driverid
group by
    cs.constructorid,
    dr.driverid
;
