-- Concatenation
-- Create a single column with the city and state for each customer separated by a comma and space.

select
city||', '||state as city_and_state
from customers
;
