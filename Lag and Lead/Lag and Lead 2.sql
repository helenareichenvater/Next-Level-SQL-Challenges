-- Use the driver_standings table to answer the following: In each race, how many more points does each driver have than the driver one behind them in the standings? RETURN: raceid, position, driverid, points, next_driver_points, and diff

select
    raceid,
    driverid,
    position,
    points,
    lead(position, 1) over(partition by raceid order by position asc) as next_driver_points,
    points - next_driver_points as diff
from driver_standings
order by raceid, position asc
;

