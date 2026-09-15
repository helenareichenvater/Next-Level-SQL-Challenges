-- Using the constructor_results table, find: total points scored across all races for each constructor (team) || the rank of each constructor by total points scored || the point margin between each constructor and the constructor one behind him in the ranking.

select
    constructorid,
    sum(points) as total_points,
    rank() over(order by total_points desc) as constructor_point_rank,
    total_points - lead(total_points, 1) over(order by total_points asc) as previous_con_points
from constructor_results
group by all
order by constructor_point_rank
;
