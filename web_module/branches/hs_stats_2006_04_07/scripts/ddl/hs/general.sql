--informixoltp

drop table user;
drop procedure proc_user_update;
drop procedure proc_user_insert;


create synonym user
for common_oltp:user;


create synonym phone
for common_oltp:phone



