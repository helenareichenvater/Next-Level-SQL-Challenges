-- CTEs

-- Using the pit_stops table, add a boolean column that indicates whether that pit stop was faster or slower than that driver’s average pit stop in that race.


with avgt as (
    select
        p.driverid, 
        avg(p.milliseconds) as avg_time,
        p.raceid
    from pit_stops as p
    group by
    p.raceid,
    p.driverid
    )
    select
        p.*,
        avgt.avg_time,
        p.milliseconds as duration,
        (case when p.milliseconds > avgt.avg_time then 'Y' else 'N' end) as faster_than_avg
    from pit_stops as p
        inner join avgt
            on avgt.raceid = p.raceid
            and avgt.driverid = p.driverid
    ;