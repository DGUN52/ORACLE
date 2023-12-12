select
    t1.submission_date
    , t1.cnt
    , t2.hacker_id
    , t2.name
from
    (
    select
        s.submission_date
        , h.hacker_id
        , h.name
        , count(*) cnt
        , rank() over(partition by s.submission_date order by count(*) desc, h.hacker_id) rnk
    from
        submissions s
        , hackers h
    where
        h.hacker_id = s.hacker_id
    group by
        s.submission_date
        , h.hacker_id
        , h.name
    ) t2
    ,(
    select
        submission_date
        , count(*) cnt
    from
        (
        select 
            submission_date
            , hacker_id
            , sum(1) over(partition by hacker_id order by submission_date) submitted_days
        from 
            submissions s
        group by 
            submission_date
            , hacker_id        
        ) t
    where 
        submitted_days = submission_date - to_date('2016-03-01','yyyy-mm-dd') + 1
    group by
        submission_date
    ) t1
where 
    t1.submission_date = t2.submission_date
    and rnk = 1
order by
    t1.submission_date
;