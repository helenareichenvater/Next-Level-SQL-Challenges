-- Calculate the total number of points scored by each constructor (team) in each year in which they competed. Then determine each constructor’s best season ever.

with yg as
    (select
        r.year,
        cs.constructorid,
        count(cs.wins) as yearlypoints
    from
        races as r
            inner join constructor_standings as cs
                on cs.raceid = r.raceid
    group by
        r.year,
        cs.constructorid
        )
    select
        yg.constructorid, 
        yg.year,
        yg.yearlypoints,
        case when yg.yearlypoints = max(yg.yearlypoints) over (partition by yg.constructorid) then 'Y' else 'N' end as bestseasonever
    from yg
    order by year, yg.constructorid desc
    ;