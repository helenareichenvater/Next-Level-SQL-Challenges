-- WHERE: Filtering LIKE

-- Bring back all customers in cities ending in ...town.

select
    customer_name,
    city
from
    customers
where
  city like '%town'  