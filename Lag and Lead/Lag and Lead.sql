-- LAG & LEAD

-- Using the races table, find the days elapsed between each race and the last time the race was conducted.

select
    name,
    date,
    lag(date, 1) over(partition by name order by date asc) as previous_race,
    datediff('day', lag(date, 1) over(partition by name order by date asc), date) as days_between_races
from
    races
order by
    name, date
;
