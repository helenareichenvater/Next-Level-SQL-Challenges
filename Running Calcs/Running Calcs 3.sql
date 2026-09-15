-- Using the results and races tables, get the running count of races in which each driver has completed across their whole career

select
ra.year,
r.driverid,
r.points,
count(*) over(partition by r.driverid order by ra.date asc) as running_total_numraces
from
    results as r
        inner join races as ra
            on r.raceid = ra.raceid
order by r.driverid, ra.date
;
