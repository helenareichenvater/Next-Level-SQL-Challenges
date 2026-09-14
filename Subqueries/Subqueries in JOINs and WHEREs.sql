-- Subqueries in JOINs and WHEREs


-- List of Drivers + Fastest Lap Speed in Monaco in 2021, with a column for their number of wins in Monaco

select
    d.forename,
    d.surname,
    m.monaco_wins
from races as r
    inner join
        results as re
            on r.raceid = re.raceid
    inner join drivers as d
        on re.driverid = d.driverid
    left join
        (select
            driverid,
            count(driverid) as monaco_wins
        from results as re
        inner join races as r
            on r.raceid = re.raceid
        where
            name = 'Monaco Grand Prix'
            and position = 1
        group by driverid
        ) as m
    on d.driverid = m.driverid
where
    name = 'Monaco Grand Prix'
    and year = 2021
;