-- Aggregations as Window Functions
-- Using the results table, create a boolean field that indicates whether each result is better than that driver's average finish position.

select
driverid,
raceid,
position,
avg(position)over(partition by driverid) as avg_position,
case when avg_position > position then 'Yes' else 'No' end as better_than_avg
from results as r
order by raceid, position
;