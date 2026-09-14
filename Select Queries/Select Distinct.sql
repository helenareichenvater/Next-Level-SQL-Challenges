-- Return all unique ship modes per Customer ID from the Orders table but turn the underscore characters into spaces on the column headers. 
-- Select : Aliasing Field and Tables Names
select distinct
    ship_mode as 'Ship Mode',
    customer_id as 'Customer Id'
from
    orders
;