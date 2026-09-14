-- CASE Statements
-- Create a column grouping the ship times int he orders table into two categories: fast (shipped in <= 3 days) and slow (anything more). 

select
    case
    when datediff('day', order_date, ship_date) <= 3 then 'fast'
    else 'slow'
    end as ship_speed
from
    orders
;