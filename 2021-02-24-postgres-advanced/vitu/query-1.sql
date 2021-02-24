select 
    m.username,
    m.message
from
    message m join
    (
        select
            m2.username,
            max(m2.id) as id
        from
            message m2
        where m2.thread_id = 1
        group by 1
    ) as last_m on last_m.id = m.id
where
    m.thread_id = 1
;
