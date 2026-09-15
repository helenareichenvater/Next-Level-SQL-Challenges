-- Running Calcs
-- Using the pit stops table, find the running total of seconds spent during pit stops for each driver in each race.

select
    driverid,
    raceid,
    stop,
    time,
    milliseconds / 1000 as seconds,
    sum(seconds)over(partition by raceid, driverid order by stop asc) as running_total_mil
from
    pit_stops
order by
    raceid,
    stop,
    time
;
