with first_clustered_messages as
(
select
    m.*
from 
    message m join
    (
        select 
            m1.id as first_id,
            m1.username,
            m1.message,
            m2.id,
            m2.username,
            m2.message
        from
            message m1 join
            message m2 on m1.username = m2.username and (m2.id - m1.id = 1)
        where
            m1.thread_id = 1
        order by m1.id, m2.id
    ) as m_cluster on m_cluster.first_id = m.id
where
    m.thread_id = 1
)

select
    m.*
from
    message m
where
    m.thread_id = 1 and
    not exists (
        select
            cm.id
        from first_clustered_messages cm
        where cm.username = m.username
    )

union

select *
from first_clustered_messages
;