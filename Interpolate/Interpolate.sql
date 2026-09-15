-- Interpolate_ffill and Interpolate_bfill
-- Fill in the missing stock prices with the nearest non-null prior values of the same stock. 
-- Interpolate F fill will fill with the most recent value before the null and Bfill will show you the most recent after the null.

select
    *,
    interpolate_ffill(close_price) over(partition by index_id order by date) as filled_price
from
    stock_prices
;
