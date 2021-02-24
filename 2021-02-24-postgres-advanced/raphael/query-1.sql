with last_id as (
  select username, max(id) as id from message group by 1
)
select m.usename, m.message
  from message m join last_id on last_id.id = m.id
 ;