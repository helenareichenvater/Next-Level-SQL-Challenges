-- Rank the races table by the date (with the earliest race having a rank of 1). Rank each race separately (using the name calculation).

select
races.*,
rank() over(partition by name order by date asc) as date_rank
from races
order by
    name,
    date
;