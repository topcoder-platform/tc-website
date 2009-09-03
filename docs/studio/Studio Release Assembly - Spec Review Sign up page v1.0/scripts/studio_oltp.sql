database studio_oltp;

-- create synonym for sequences.
create synonym 'informix'.PERMISSION_SEQ
for corporate_oltp:'informix'.PERMISSION_SEQ;

create synonym 'informix'.SPEC_REVIEW_REVIEWER_SEQ
for corporate_oltp:'informix'.SPEC_REVIEW_REVIEWER_SEQ;

create synonym 'informix'.SPEC_REVIEW_SEQ
for corporate_oltp:'informix'.SPEC_REVIEW_SEQ;

-- create new review board related tables
create table 'informix'.rboard_user (
 user_id DECIMAL(10,0) not null,
 contest_type_id DECIMAL(12,0) not null,
 status_id DECIMAL(3,0) not null,
 immune_ind DECIMAL(1,0) not null
);
create table 'informix'.rboard_status_lu (
 status_id DECIMAL(3,0) not null,
 status_desc VARCHAR(64)
);

alter table 'informix'.rboard_status_lu add constraint primary key
(status_id)
constraint rboard_stat_lu_pk;
alter table 'informix'.rboard_user add constraint primary key
(user_id, contest_type_id)
constraint rboard_user_pk;
alter table 'informix'.rboard_user add constraint foreign key
(status_id)
references 'informix'.rboard_status_lu
(status_id)
constraint rboard_user_status_fk;

create synonym 'informix'.permission_type
for corporate_oltp:'informix'.permission_type;

create synonym 'informix'.user_permission_grant
for corporate_oltp:'informix'.user_permission_grant;

create table 'informix'.rboard_user (
 user_id DECIMAL(10,0) not null,
 contest_type_id DECIMAL(12,0) not null,
 status_id DECIMAL(3,0) not null,
 immune_ind DECIMAL(1,0) not null
);
create table 'informix'.rboard_status_lu (
 status_id DECIMAL(3,0) not null,
 status_desc VARCHAR(64)
);

alter table 'informix'.rboard_status_lu add constraint primary key
(status_id)
constraint rboard_stat_lu_pk;
alter table 'informix'.rboard_user add constraint primary key
(user_id, contest_type_id)
constraint rboard_user_pk;
alter table 'informix'.rboard_user add constraint foreign key
(status_id)
references 'informix'.rboard_status_lu
(status_id)
constraint rboard_user_status_fk;

-- populate review board statuses
INSERT INTO 'informix'.rboard_status_lu(status_id,status_desc) VALUES (10, 'Invited');
INSERT INTO 'informix'.rboard_status_lu(status_id,status_desc) VALUES (20, 'Applied');
INSERT INTO 'informix'.rboard_status_lu(status_id,status_desc) VALUES (30, 'Rejected');
INSERT INTO 'informix'.rboard_status_lu(status_id,status_desc) VALUES (40, 'Not Interested');
INSERT INTO 'informix'.rboard_status_lu(status_id,status_desc) VALUES (50, 'Contact Again');
INSERT INTO 'informix'.rboard_status_lu(status_id,status_desc) VALUES (60, 'Suspended');
INSERT INTO 'informix'.rboard_status_lu(status_id,status_desc) VALUES (70, 'Resigned');
INSERT INTO 'informix'.rboard_status_lu(status_id,status_desc) VALUES (80, 'Kicked Out');
INSERT INTO 'informix'.rboard_status_lu(status_id,status_desc) VALUES (100, 'Active');
INSERT INTO 'informix'.rboard_status_lu(status_id,status_desc) VALUES (90, 'Currently Inactive');
INSERT INTO 'informix'.rboard_status_lu(status_id,status_desc) VALUES (110, 'Temporarily Deactivated (No Longer Meets Minimum Requirements)');
INSERT INTO 'informix'.rboard_status_lu(status_id,status_desc) VALUES (120, 'Permanently Deactivated (No Longer Meets Minimum Requirements)');
