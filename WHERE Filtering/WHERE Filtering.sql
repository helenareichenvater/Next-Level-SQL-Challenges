-- WHERE: Filtering

-- Bring back all product sales between $50 and $100 in individual order that were shipped second class.

select
    order_id,
    sales,
    ship_mode
from
    orders
where
    sales between 50 and 100
    and ship_mode = 'Second Class'
;
