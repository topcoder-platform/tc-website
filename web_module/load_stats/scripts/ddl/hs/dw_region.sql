create table 'informix'.region (
    region_id DECIMAL(3,0),
    region_type_id DECIMAL(3,0),
    region_type_desc VARCHAR(100),
    region_name VARCHAR(30)
)
extent size 64 next size 64
lock mode row;

alter table 'informix'.region add constraint primary key 
    (region_id)
    constraint region_pkey;
    

insert into region(region_id, region_type_id, region_type_desc, region_name) values (1, 1, 'High School Region', 'Alpha');
insert into region(region_id, region_type_id, region_type_desc, region_name) values (2, 1, 'High School Region', 'Beta');
insert into region(region_id, region_type_id, region_type_desc, region_name) values (3, 1, 'High School Region', 'Gamma');
insert into region(region_id, region_type_id, region_type_desc, region_name) values (4, 1, 'High School Region', 'Delta');

alter table round add region_id DECIMAL(3,0);

alter table round add constraint foreign key
      (region_id)
      references region
      (region_id)
      constraint round_region_fkey;
      
      
alter table room_result add region_placed DECIMAL(5,0);  

alter table coder drop coder_region_code;