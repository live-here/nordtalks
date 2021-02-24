select 
  username,
  message,
  id,
  lead(id, 1) over (
      partition by message
      order by id desc
  ) as next_row
from message
-- where id = next_row + 1
