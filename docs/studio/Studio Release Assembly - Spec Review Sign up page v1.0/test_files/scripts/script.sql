database corporate_oltp;

-- add dependant Database objects from previous assemblies.

create table "informix".permission_type
  (
    permission_type_id decimal(10,0) not null ,
    name varchar(254) not null ,
    primary key (permission_type_id)  constraint "informix".pk_permission_type
  );

create table "informix".user_permission_grant
  (
    user_permission_grant_id decimal(10,0) not null ,
    user_id decimal(10,0) not null ,
    resource_id decimal(10,0) not null ,
    permission_type_id decimal(10,0) not null ,
    is_studio smallint,
    primary key (user_permission_grant_id)  constraint "informix".pk_user_permission_grant_id
  );

insert into 'informix'.permission_type (permission_type_id, name) values(1, 'project_read');
insert into 'informix'.permission_type (permission_type_id, name) values(2, 'project_write');
insert into 'informix'.permission_type (permission_type_id, name) values(3, 'project_full');
insert into 'informix'.permission_type (permission_type_id, name) values(4, 'contest_read');
insert into 'informix'.permission_type (permission_type_id, name) values(5, 'contest_write');
insert into 'informix'.permission_type (permission_type_id, name) values(6, 'contest_full');

--
-- New tables and inserts for spec_review related.
--
create table spec_review_status_type_lu (
    review_status_type_id decimal(3,0) NOT NULL,
    name varchar(254),
    PRIMARY KEY (review_status_type_id)
);

-- Version 1.0.1: changed to include one more value NOT_READY
insert into spec_review_status_type_lu(review_status_type_id, name)
values (1, 'PASSED');

insert into spec_review_status_type_lu(review_status_type_id, name)
values (2, 'FAILED');

insert into spec_review_status_type_lu(review_status_type_id, name)
values (3, 'PENDING');

insert into spec_review_status_type_lu(review_status_type_id, name)
values (4, 'READY');

insert into spec_review_status_type_lu(review_status_type_id, name)
values (5, 'REVIEWER_ASSIGNED');

insert into spec_review_status_type_lu(review_status_type_id, name)
values (6, 'NOT_READY');

create table spec_review_section_type_lu (
    review_section_type_id decimal(3,0) NOT NULL,
    is_studio SMALLINT,
    name varchar(254),
    PRIMARY KEY (review_section_type_id)
);
insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (1, 0, 'ALL');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (2, 1, 'Contest Selection');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (3, 1, 'Contest Overview');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (4, 1, 'Contest Details');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (5, 1, 'Contest Specs');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (6, 1, 'Attached Files');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (7, 1, 'Contest Schedule');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (8, 0, 'Contest Selection');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (9, 0, 'Contest Overview');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (10, 0, 'Contest Details');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (11, 0, 'Attached Files');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (12, 0, 'Contest Schedule');

create table spec_review_user_role_type_lu (
    review_user_role_type_id decimal(3,0) NOT NULL,
    name varchar(254),
    PRIMARY KEY(review_user_role_type_id)
);

insert into spec_review_user_role_type_lu(review_user_role_type_id, name)
values (1, 'ADMIN');

insert into spec_review_user_role_type_lu(review_user_role_type_id, name)
values (2, 'CREATOR');

insert into spec_review_user_role_type_lu(review_user_role_type_id, name)
values (3, 'REVIEWER');

create table spec_review (
    spec_review_id decimal(10,0) NOT NULL,
    contest_id decimal(10,0) NOT NULL ,
    is_studio SMALLINT NOT NULL,
    review_status_type_id decimal(3,0) NOT NULL, -- READY, REVIEWER_ASSIGNED
    creation_time DATETIME YEAR to FRACTION(3),
    creation_user VARCHAR(64),
    modification_time DATETIME YEAR to FRACTION(3),
    modification_user VARCHAR(64),
    ready_for_review_time DATETIME YEAR TO FRACTION(3),
    review_done_time DATETIME YEAR TO FRACTION(3),
    PRIMARY KEY (spec_review_id),
    FOREIGN KEY(review_status_type_id) REFERENCES spec_review_status_type_lu(review_status_type_id)
);

create table spec_review_reviewer_xref (
    spec_review_reviewer_id decimal(10,0) NOT NULL,
    spec_review_id decimal(10,0) NOT NULL,
    review_user_id decimal(10,0),
    review_start_time DATETIME YEAR to FRACTION(3) NOT NULL,
    is_active SMALLINT, -- Would be true only for the last active reviewer.
    creation_user VARCHAR(64),
    creation_time DATETIME YEAR to FRACTION(3),
    PRIMARY KEY(spec_review_reviewer_id),
    FOREIGN KEY(spec_review_id) REFERENCES spec_review(spec_review_id)
);

-- Version 1.0.1 Change Notes:
--      changed the name to spec_section_review from spec_review_status
--      changed the field name to spec_section_review_id from spec_review_status_id
--      review_user_role_type_id is not needed
--      introduced new fields modification_time and modification_user
create table spec_section_review (
    spec_section_review_id decimal(10,0) NOT NULL,
    spec_review_id decimal(10,0) NOT NULL,
    review_status_type_id decimal(3,0) NOT NULL,
    review_section_type_id decimal(3,0) NOT NULL,
    create_time DATETIME YEAR to FRACTION(3),
    create_user VARCHAR(64),
    modification_time DATETIME YEAR to FRACTION(3),
    modification_user VARCHAR(64),
    PRIMARY KEY (spec_section_review_id),
    FOREIGN KEY(spec_review_id) REFERENCES spec_review(spec_review_id),
    FOREIGN KEY(review_status_type_id) REFERENCES spec_review_status_type_lu(review_status_type_id),
    FOREIGN KEY(review_section_type_id) REFERENCES spec_review_section_type_lu(review_section_type_id)
);

-- Version 1.0.1 Change Notes:
--      changed the name to spec_section_review_comment from spec_review_comment
--      made it to refer to spec_section_review_id rather than spec_review_id
--      review_section_type_id is not needed.
create table spec_section_review_comment (
    comment_id decimal(10,0) NOT NULL,
    spec_section_review_id decimal(10,0) NOT NULL,
    review_comment LVARCHAR(1000) NOT NULL,
    review_user_role_type_id decimal(3,0) NOT NULL,
    create_user varchar(64),
    create_time DATETIME YEAR to FRACTION(3) NOT NULL,
    PRIMARY KEY(comment_id),
    FOREIGN KEY(spec_section_review_id) REFERENCES spec_section_review(spec_section_review_id),
    FOREIGN KEY(review_user_role_type_id) REFERENCES spec_review_user_role_type_lu(review_user_role_type_id)
);

create table spec_review_comment_view (
    view_id decimal(10,0) NOT NULL,
    comment_id decimal(10,0) NOT NULL,
    view_user VARCHAR(64),
    view_time DATETIME YEAR to FRACTION(3) NOT NULL,
    PRIMARY KEY(view_id),
    FOREIGN KEY(comment_id) REFERENCES spec_section_review_comment(comment_id)
);

CREATE SEQUENCE SPEC_REVIEW_SEQ;
CREATE SEQUENCE SPEC_REVIEW_REVIEWER_SEQ;
CREATE SEQUENCE SPEC_SECTION_REVIEW_SEQ;
CREATE SEQUENCE SPEC_REVIEW_STATUS_TYPE_SEQ;
CREATE SEQUENCE SPEC_REVIEW_SECTION_TYPE_SEQ;
CREATE SEQUENCE SPEC_SECTION_REVIEW_COMMENT_SEQ;
CREATE SEQUENCE SPEC_REVIEW_USER_ROLE_TYPE_SEQ;
CREATE SEQUENCE SPEC_REVIEW_COMMENT_VIEW_SEQ;
CREATE SEQUENCE PERMISSION_SEQ;



database studio_oltp;

create synonym 'informix'.spec_review_status_type_lu
for corporate_oltp:'informix'.spec_review_status_type_lu;

create synonym 'informix'.spec_review_section_type_lu
for corporate_oltp:'informix'.spec_review_section_type_lu;

create synonym 'informix'.spec_review_user_role_type_lu
for corporate_oltp:'informix'.spec_review_user_role_type_lu;

create synonym 'informix'.spec_review
for corporate_oltp:'informix'.spec_review;

create synonym 'informix'.spec_review_reviewer_xref
for corporate_oltp:'informix'.spec_review_reviewer_xref;

create synonym 'informix'.spec_section_review
for corporate_oltp:'informix'.spec_section_review;

create synonym 'informix'.spec_section_review_comment
for corporate_oltp:'informix'.spec_section_review_comment;

create synonym 'informix'.spec_review_comment_view
for corporate_oltp:'informix'.spec_review_comment_view;

