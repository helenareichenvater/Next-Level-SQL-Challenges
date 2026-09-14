-- WHERE: Filtering ILIKE (case insensitive)

-- Bring back all customers in cities that contain "town" or "city" (case insensitive) in their names. 

select
    customer_name,
    city
from
    customers
where
  city ilike '%town%' or city ilike '%city%' 
;
