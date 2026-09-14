-- UNION Stacking data sets

-- Union the January and February library data.

select *
from
    library_february

union

select *
from
    library_january
;

