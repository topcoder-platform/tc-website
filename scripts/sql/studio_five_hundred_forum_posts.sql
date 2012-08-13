select tjm.userid::INTEGER AS user_id, extend(dbinfo("UTC_TO_DATETIME",tjm.creationdate/1000), year to fraction) AS earned_date
from (
  select jm.userid, jm.creationdate,
   (select count(*)
     from (select userid, creationdate from studio_jive:jivemessage) as i
     where i.userid = jm.userid and i.creationdate < jm.creationdate
   ) + 1 as row_num
   from studio_jive:jivemessage jm
) as tjm where tjm.row_num=500