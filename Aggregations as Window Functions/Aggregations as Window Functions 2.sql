-- Return the races table along with a field that contains the total number of races in F1 history.

select
    *,
    count(*) over() as total_races
from
    races
;