-- WHERE: Filtering IN

-- Select the customers that live in Texas, Oregon, or New York.

select
customer_name,
state
from customers
where state in ('Texas', 'Oregon', 'New York')
;