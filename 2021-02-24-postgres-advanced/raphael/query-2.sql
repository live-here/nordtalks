select 
  username,
  rank() over (
      partition by username
      order by id
  ) 
from message;

with frames as (
select m.id,
       m.thread_id,
       m.username,
       m.message,
       count(1) over (
           partition by m.username, m.thread_id
               order by m.id
               range between 1 preceding
                 and 0 following
       ) as count
  from message m
), first_of_last_seq as (
select max(frames.id) as id, frames.username 
  from frames 
 where frames.count = 1
 group by 2
)
select * 
  from message m join first_of_last_seq fols on fols.id = m.id