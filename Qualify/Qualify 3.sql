-- Using the results and races tables, return all results from drivers that scored more points in that race in their previous race.

select
    driverid,
    date,
    points,
    lag(points, 1) over(partition by driverid order by date) as previous_race_points
from results as r
    inner join races as ra
        on r.raceid = ra.raceid
qualify
    r.points > previous_race_points
;


-- CTE Version
with previouspointcalc as
    (
    select
        r.driverid,
        ra.raceid,
        ra.date,
        r.points,
        lag(r.points, 1) over(partition by r.driverid order by ra.date) as previous_race_points
    from results as r
        inner join races as ra
            on r.raceid = ra.raceid
    )
select *
from previouspointcalc
where points > previous_race_points
;