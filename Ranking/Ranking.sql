-- Ranking
-- Rank the races table by the date (with the earliest race having a rank of one).

select
races.*,
rank() over(order by date asc) as date_rank
from races
;