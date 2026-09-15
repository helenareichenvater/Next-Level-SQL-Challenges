-- Interpolate_ffill and Interpolate_bfill
-- FIll in the missing temperature readingvalues with nearby values from the same sensor (you choose which direction to fill). 

select
    *,
    interpolate_bfill(temp_f) over(partition by sensor_id order by reading_ts) as filled_temps
from
    sensor_readings
;