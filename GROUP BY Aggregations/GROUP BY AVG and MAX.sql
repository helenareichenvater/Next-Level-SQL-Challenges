-- GROUP BY: AVG and MAX

-- What is the largest discount and average profit per state?

select
max(o.discount),
avg(o.profit),
c.state
from
    orders as o
        join customers as c
group by
    state
;