
-- Using the results and races tables, find the running average of points for each driver per year.

select
ra.year,
r.driverid,
r.points,
avg(r.points) over(partition by r.driverid, ra.year order by ra.date asc) as running_average_points
from
    results as r
        inner join races as ra
            on r.raceid = ra.raceid
order by
    r.driverid, ra.year, ra.date
;

