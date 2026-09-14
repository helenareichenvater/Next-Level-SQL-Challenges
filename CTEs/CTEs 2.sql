-- Add a boolean column that indicates whether that stop was slower or faster than that driver's average pit stop on that race.

with totalwins as (
    select
        driverid,
        count(*) as numwins
    from results as r
    where position = 1
    group by
    driverid
    )
select
r.*,
totalwins.numwins
from results as r
    inner join totalwins on
        r.driverid = totalwins.driverid
order by numwins desc
;
