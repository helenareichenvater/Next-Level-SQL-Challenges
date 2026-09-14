-- Produce a list of all customers and sales reps so we can see where there are sales reps with no custoemrs and customers with no sales rep.

select distinct
c.customer_name,
sr.sales_person_fullname
from customer_sales_rep as sr
full join customers as c
    on c.customer_id = sr.customer_id
;