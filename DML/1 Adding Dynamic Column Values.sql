-- DML

-- Use DDL to create a column called first_name. Then use DML to set the value of first_name dynamically using the "person" column

alter table table_1_hr
add column first_name string
;

update table_1_hr
set first_name = split_part(person,' ',1)
;
