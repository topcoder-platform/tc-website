--informixoltp

drop table user;
drop procedure proc_user_update;
drop procedure proc_user_insert;


create synonym user
for common_oltp:user;


create synonym phone
for common_oltp:phone




alter table resume modify timestamp DATETIME YEAR TO FRACTION default current;
create trigger "informix".trig_resume_modified update of coder_id, file_name, file_type_id, file on "informix".resume referencing old as old    for each row
        (
        execute function "informix".get_current() into "informix".resume.timestamp);


	
drop table country;
create synonym country
for hs_common_oltp:country;