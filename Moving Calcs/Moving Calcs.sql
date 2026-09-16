--Moving Calcs

-- Using the results and races tables, calculate the 4 year moving avg in annual points scored per driver (between the current year and 3 prior)

select
    r.driverid,
    ra.year,
    sum(points) as yearly_points,
    (
    avg(yearly_points)over(partition by r.driverid order by year rows between 3 preceding and current row
    ))
    as four_yr_mv_avg
from
    results as r
        inner join
            races as ra
                on ra.raceid = r.raceid
group by all
;