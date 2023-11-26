with start_list(rn, start_date) as (
    select row_number() over (order by start_date), start_date
    from projects
    where start_date not in (select end_date from projects)
    order by start_date
), end_list(rn, end_date) as (
    select row_number() over (order by start_date), end_date
    from projects
    where end_date not in (select start_date from projects)
    order by start_date
)
select 
    start_date
    , end_date
from 
    start_list s
    , end_list e
where
    s.rn = e.rn
order by
    end_date - start_date
    , start_date
;
