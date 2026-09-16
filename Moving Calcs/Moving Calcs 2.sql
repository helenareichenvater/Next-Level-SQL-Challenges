-- Using the results and races tables, find the results where drivers scored more points than they had scored in their prior 3 races put together

-- Using boolean column

select
    r.driverid,
    r.raceid,
    r.points,
    (sum(r.points)over(partition by r.driverid order by date rows between 3 preceding and 1 preceding)) as three_race_sum,
    case when three_race_sum < r.points then 'yes' else 'no' end as most_than_pre_three
    from results as r
        inner join races as ra
            on r.raceid = ra.raceid
order by
    date,
    r.driverid
;

-- Using qualify

select
    r.driverid,
    r.raceid,
    r.points,
    (sum(r.points)over(partition by r.driverid order by date rows between 3 preceding and 1 preceding)) as three_race_sum
    from results as r
        inner join races as ra
            on r.raceid = ra.raceid
qualify points > three_race_sum
order by
    date,
    r.driverid
;
