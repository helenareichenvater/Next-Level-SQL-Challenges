-- Create a table called top_3_<your_initials> that contains the top three members of the group by games won

create table top_3_hr as
    (
    select
        person,
        games_won
    from
        table_1_hr
    qualify
        rank()over(order by games_won desc) <=3
    )
;