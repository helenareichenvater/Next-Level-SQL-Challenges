-- QUALIFY
-- Use the qualify clause to deduplicate the website_traffic tables. The activityIid column should be unique. 


select
        *
from
    website_traffic
qualify
    row_number()over(partition by activity_id order by event_timestamp) = 1
order by activity_id
;
