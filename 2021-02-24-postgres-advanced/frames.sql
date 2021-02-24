WITH t(id, v) AS (VALUES
   (1, 1)
  ,(2, 2)
  ,(3, 2)
  ,(4, 3)
  ,(5, 5)
  ,(6, 5)
  ,(7, 5)
  ,(8, 6)
  ,(9, 6)
)
SELECT
  id
 ,v
 ,array_agg(id) OVER rows as rows_id
 ,array_agg(id) OVER range as range_id
 ,array_agg(id) OVER groups as groups_id
 ,array_agg(id) OVER unboundeds as unboundeds_id

FROM t
WINDOW
  o AS (ORDER BY v)
  /* In ROWS mode, the offset must yield a non-null, non-negative integer,
    and the option means that the frame starts or ends the specified number
    of rows before or after the current row. */
 ,rows AS ( o ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING )

 /* In RANGE mode, these options require that the ORDER BY clause specify exactly one column.
     The offset specifies the maximum difference between the value of that column in the current row
     and its value in preceding or following rows of the frame. The data type of the offset
     expression varies depending on the data type of the ordering column. For numeric ordering columns
     it is typically of the same type as the ordering column, but for datetime ordering columns it is an interval.
     For example, if the ordering column is of type date or timestamp, one could write R
     ANGE BETWEEN '1 day' PRECEDING AND '10 days' FOLLOWING.
     The offset is still required to be non-null and non-negative, though the meaning of “non-negative”
     depends on its data type.
  */
 ,range AS ( o RANGE BETWEEN 1 PRECEDING AND 2 FOLLOWING )

  /* In GROUPS mode, the offset again must yield a non-null, non-negative integer,
    and the option means that the frame starts or ends the specified number of peer groups
    before or after the current row's peer group, where a peer group is a set of rows that
    are equivalent in the ORDER BY ordering. (There must be an ORDER BY clause in the window
    definition to use GROUPS mode.)
 */
 ,groups AS (o GROUPS BETWEEN 1 PRECEDING AND 1 FOLLOWING)

 ,unboundeds AS (
     PARTITION BY v

     ORDER BY id

     ROWS
--      RANGE
--      GROUPS

--     UNBOUNDED PRECEDING
--       CURRENT ROW
       BETWEEN UNBOUNDED PRECEDING
           AND UNBOUNDED FOLLOWING

--      EXCLUDE CURRENT ROW
--      EXCLUDE GROUP
--      EXCLUDE TIESf
)
