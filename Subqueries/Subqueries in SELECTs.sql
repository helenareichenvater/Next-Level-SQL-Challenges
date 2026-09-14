-- Subqueries in SELECTs

-- List of drivers and their fastest lap speed at the MOnaco Grand Prix in 2021. 

select
    d.forename,
    d.surname,
    max(r.fastestlapspeed) as DriverMaxSpeed,
(select
    max(r.fastestlapspeed)
from results as r
    inner join races as ra
        on ra.raceid = r.raceid
where ra.name = 'Monaco Grand Prix') as FastestEver
from races as ra
     inner join results as r
        on r.raceid = ra.raceid
    inner join drivers as d
        on d.driverid = r.driverid
where
    ra.name = 'Monaco Grand Prix' and year = '2021' 
group by
    r.driverid,
    d.forename,
    d.surname
order by max (r.fastestlapspeed) desc
;
