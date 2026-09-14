-- Return the results table along with two extra columns: A column containing the proportion of the total race points earned by the driver. Call this column pct_race_points AND A column containing the proportion of the driver’s career points scored in that race. Call this column pct_career_points. Exclude drivers with 0 career points


with totalracepoints as
    (
    select
    raceid,
    sum(points) as racepointstotal
    from driver_standings as ds
    group by raceid
    )
    ,
 drivercareerpoints as
    (
    select
    driverid,
    sum(points) as careerpointstotal
    from driver_standings as ds
    group by driverid
    )
select
    ds.*,
    div0null(ds.points, trp.racepointstotal) as pct_race_points,
    div0null(ds.points, dcp.careerpointstotal) as pct_career_points
from driver_standings as ds
    inner join
        totalracepoints as trp
            on trp.raceid = ds.raceid
                inner join
                    drivercareerpoints as dcp
                        on dcp.driverid = ds.driverid

where dcp.careerpointstotal > 0
;