-- Type Casting : Change the data type of a column. 
-- Use both casting methods to convert the postal_code column for each customer to a varchar.

select
postal_code::varchar as pscolon,
cast(postal_code as varchar) as pscast,
customer_name
from customers
;
