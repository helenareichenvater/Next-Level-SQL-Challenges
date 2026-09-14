-- GROUP BY: SUM

-- What are the total sales made by the company for each category? Call the returned field 'total_categorical_sales.' 


select
    sum(o.sales) as total_categorical_sales,
    category
from
    orders as o
        inner join products as p
            on o.product_id = p.product_id
group by
    category
;
