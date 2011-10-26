insert into preference_lu (preference_id, preference_name, preference_desc, preference_group_id, preference_type_id, sort_order)
values(24, 'contact member enabled', 'Do you want to be contacted by other members?', 4, 1, 1);

insert into user_preference(user_id, preference_id, value)
select user_id, 24, 'false' from user;

insert into id_sequences values ('MEMBER_CONTACT_MESSAGE_SEQ', 1,10,0);