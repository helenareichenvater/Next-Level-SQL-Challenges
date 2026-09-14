-- FROM : Joins

-- Return all the rows and columns where there is a matching customer_id between the Orders table and the Customers table. 

select 
    c.customer_id,
    o.customer_id
from orders as o
    inner join
        customers as c
            on c.customer_id = o.customer_id
;