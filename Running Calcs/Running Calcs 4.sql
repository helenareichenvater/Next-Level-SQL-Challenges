-- Using the results and races tables, get the following for each driver: whether the race in queston was worse or better than their average finish || the running sum of wins || the amount of time in days between tehir first and most recent race


select
    r.raceid,
    r.driverid,
    r.position,
    avg(r.position) over(partition by r.driverid) as avg_position,
    case
        when r.position > avg(r.position) over(partition by r.driverid) then 'no'
        when r.position < avg(r.position) over(partition by r.driverid) then 'yes'
        else 'avg'
    end as above_average,
    sum(case when r.position = 1 then 1 else 0 end) over(partition by r.driverid order by ra.date asc) as win_run_sum,
    datediff('day',
        min(ra.date) over(partition by r.driverid),
        max(ra.date) over(partition by r.driverid)
    ) as days_btwn_first_and_most_recent
from results as r
    inner join races as ra
        on r.raceid = ra.raceid
order by r.driverid, ra.date
;


-- pg 72