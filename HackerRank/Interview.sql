with svs as (
    select 
        challenge_id
        , sum(total_views) stv
        , sum(total_unique_views) stuv
    from
        view_stats
    group by
        challenge_id
), sss as (
    select
        challenge_id
        , sum(total_submissions) sts
        , sum(total_accepted_submissions) stas
    from
        submission_stats
    group by
        challenge_id
)
select
    con.contest_id
    , con.hacker_id
    , con.name
    , sum(sss.sts)
    , sum(sss.stas)
    , sum(svs.stv)
    , sum(svs.stuv)
from
    contests con
    left join colleges col on con.contest_id = col.contest_id
    left join challenges chal on col.college_id = chal.college_id
    left join svs on chal.challenge_id = svs.challenge_id
    left join sss on chal.challenge_id = sss.challenge_id
group by
    con.contest_id
    , con.hacker_id
    , con.name
having
    sum(sss.sts)+sum(sss.stas)+sum(svs.stv)+sum(svs.stuv) > 0
order by 
    con.contest_id
;