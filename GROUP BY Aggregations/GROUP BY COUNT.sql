-- GROUP BY : COUNT

-- Find the distinct count of customers per state and sales person.


select
    c.state,
    count(distinct c.customer_id),
    count(distinct sales_person_id)
from
    customers as c
        inner join customer_sales_rep as rp
            on c.customer_id = rp.customer_id
group by c.state,
rp.sales_person_id
;