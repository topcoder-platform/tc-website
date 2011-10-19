create table current_school_audit (
    coder_id DECIMAL(10,0),
    school_id DECIMAL(10,0),
    gpa DECIMAL(4,2),
    gpa_scale DECIMAL(4,2),
    viewable DECIMAL(1,0) default 1,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 3000 next size 1500
lock mode row;

alter table current_school_audit add constraint foreign key 
	(school_id)
	references school
	(school_id) 
	constraint currschoolaudit_school_fk;


create procedure proc_current_school_update(
old_coder_id DECIMAL(10,0),
old_school_id decimal(10,0),
new_school_id decimal(10,0),
old_gpa decimal(4,2),
old_gpa_scale decimal(4,2),
old_viewable VARCHAR(1,0)
)
 
      if (old_school_id != new_school_id) then
         insert into current_school_audit (coder_id, school_id, gpa, gpa_scale, viewable)
         values (old_coder_id, old_school_id, old_gpa, old_gpa_scale, old_viewable);
      End if;

      update current_school set modify_date = current where coder_id = old_coder_id;

end procedure;


drop trigger trig_currentschool_modified;

create trigger trig_audit_current_school update of school_id on current_school referencing old as old new as new    for each row
        (
        execute procedure proc_current_school_update(old.coder_id, old.school_id, new.school_id, old.gpa, old.gpa_scale, old.viewable));


alter table current_school drop school_name;
alter table current_school drop degree_number;

create table school_type_lu (
    school_type_id DECIMAL(3,0),
    school_type_desc VARCHAR(100)
)
extent size 16 next size 16
lock mode row;

alter table school_type_lu add constraint primary key 
	(school_type_id)
	constraint schooltypelu_pk;

insert into school_type_lu values (1, 'University');
insert into school_type_lu values (2, 'High School');

alter table school add school_type_id decimal(3,0);

alter table school add constraint foreign key 
	(school_type_id)
	references school_type_lu
	(school_type_id) 
	constraint school_schooltype_fk;

alter table school add address_id decimal(10,0);  
alter table school modify sort_letter CHAR(1) ;
alter table school modify city VARCHAR(50); 
alter table school modify    country_code VARCHAR(3);


--drop all the adress like columns at some point
