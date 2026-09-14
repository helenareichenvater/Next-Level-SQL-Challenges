
-- Sorting: ORDER BY
-- HAVING: Filtering aggregated values.

-- List of customers with total sales greater than 10,000, sorted by total sales descending. The sorting options are asc (default) and desc.

select
c.customer_id,
sum(sales) as total_sales
from orders as o
    inner join customers as c
        on c.customer_id = o.customer_id
group by c.customer_id
having sum(o.sales) > 10000
;

select
c.customer_id,
sum(o.sales) as total_sales
from orders as o
    inner join customers as c
        on c.customer_id = o.customer_id
group by c.customer_id
having sum(o.sales) > 10000
order by sum(o.sales) desc
;
