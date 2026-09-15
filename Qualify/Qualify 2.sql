-- Using the constructor_standings table, calculate the total races for each constructor. Only include the top 10 constructors by total races. 

select
    constructorid,
    count(distinct raceid) as total_races,
    rank() over(order by total_races desc) as num_race_rank
from
    constructor_standings
group by all
qualify
    num_race_rank <= 10
;
