create table 'informix'.payment (
    payment_id DECIMAL(10,0),
    payment_desc VARCHAR(100),
    payment_type_id DECIMAL(3,0),
    payment_type_desc VARCHAR(100),
    reference_id DECIMAL(10,0),
    parent_payment_id DECIMAL(10,0),
    charity_ind DECIMAL(1,0) default 1 not null,
    show_in_profile_ind DECIMAL(1,0) default 1 not null,
    show_details_ind DECIMAL(1,0) default 1 not null,
    payment_status_id DECIMAL(3,0),
    payment_status_desc VARCHAR(200)
)
extent size 3000 next size 1000
lock mode row;

alter table 'informix'.payment add constraint primary key 
    (payment_id)
    constraint payment_pk;
    
    
create table 'informix'.user_payment (
    payment_id DECIMAL(10,0),
    user_id DECIMAL(10,0),
    net_amount DECIMAL(12,2),
    gross_amount DECIMAL(12,2),
    due_calendar_id DECIMAL(10,0),
    paid_calendar_id DECIMAL(10,0)
)
extent size 1000 next size 1000
lock mode row;


alter table 'informix'.user_payment add constraint primary key 
    (payment_id)
    constraint user_payment_pk;

alter table 'informix'.user_payment add constraint foreign key 
    (payment_id)
    references 'informix'.payment
    (payment_id) 
    constraint fk_user_payment_payment;

--  add constraint after the load because there were coders that didn't existed in the dw.
--  alter table 'informix'.user_payment add constraint foreign key 
--  (user_id)
--  references 'informix'.coder
--  (coder_id) 
--  constraint fk_user_payment_coder;

alter table 'informix'.user_payment add constraint foreign key 
    (due_calendar_id)
    references 'informix'.calendar
    (calendar_id) 
    constraint fk_user_payment_calendar1;
        
alter table 'informix'.user_payment add constraint foreign key 
    (paid_calendar_id)
    references 'informix'.calendar
    (calendar_id) 
    constraint fk_user_payment_calendar2;
        
    
insert into log_type_lu values (6, "Payments load");

insert into update_log (log_id, calendar_id, timestamp, log_type_id)
values ((select max(log_id) from update_log) + 1, 0, "1980-01-01 00:00:00.000", 6);

