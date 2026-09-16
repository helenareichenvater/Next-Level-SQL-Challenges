-- Delete anyone whose first name is shorter than 6 characters.

delete
    from table_1_hr
where length(first_name) < 6
;
