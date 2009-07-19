--
-- Note: first drop existing tables if any
--


create table spec_review_status_type_lu (
    review_status_type_id decimal(3) NOT NULL,
    name varchar(254),
    PRIMARY KEY (review_status_type_id)
);

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

create table spec_review_section_type_lu (
    review_section_type_id decimal(3) NOT NULL,
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
    review_user_role_type_id decimal(3) NOT NULL,
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
    spec_review_id decimal(10) NOT NULL,
    contest_id decimal(10) NOT NULL ,
    is_studio SMALLINT NOT NULL,
    review_status_type_id decimal(3) NOT NULL, -- READY, ASSIGNED
    creation_time DATETIME YEAR to FRACTION(3),
    creation_user VARCHAR(64),
    modification_time DATETIME YEAR to FRACTION(3),
    modification_user VARCHAR(64),
    PRIMARY KEY (spec_review_id),
    FOREIGN KEY(review_status_type_id) REFERENCES spec_review_status_type_lu(review_status_type_id)
);

create table spec_review_reviewer_xref (
    spec_review_reviewer_id decimal(10) NOT NULL,
    spec_review_id decimal(10) NOT NULL,
    review_user_id decimal(10),
    review_start_time DATETIME YEAR to FRACTION(3) NOT NULL,
    is_active SMALLINT, -- Would be true only for the last active reviewer.
    creation_user VARCHAR(64),
    creation_time DATETIME YEAR to FRACTION(3),
    PRIMARY KEY(spec_review_reviewer_id),
    FOREIGN KEY(spec_review_id) REFERENCES spec_review(spec_review_id)
);

create table spec_review_status (
    spec_review_status_id decimal(10) NOT NULL,
    spec_review_id decimal(10) NOT NULL,
    review_status_type_id decimal(3) NOT NULL,
    review_section_type_id decimal(3) NOT NULL,
    review_user_role_type_id decimal(3) NOT NULL,
    create_time DATETIME YEAR to FRACTION(3),
    create_user VARCHAR(64),
    PRIMARY KEY (spec_review_status_id),
    FOREIGN KEY(spec_review_id) REFERENCES spec_review(spec_review_id),
    FOREIGN KEY(review_status_type_id) REFERENCES spec_review_status_type_lu(review_status_type_id),
    FOREIGN KEY(review_section_type_id) REFERENCES spec_review_section_type_lu(review_section_type_id),
    FOREIGN KEY(review_user_role_type_id) REFERENCES spec_review_user_role_type_lu(review_user_role_type_id)
);

create table spec_review_comment (
    comment_id decimal(10) NOT NULL,
    spec_review_id decimal(10) NOT NULL,
    review_section_type_id decimal(3) NOT NULL,
    review_comment LVARCHAR(1000) NOT NULL,
    review_user_role_type_id decimal(3) NOT NULL,
    create_user varchar(64),
    create_time DATETIME YEAR to FRACTION(3) NOT NULL,
    PRIMARY KEY(comment_id),
    FOREIGN KEY(spec_review_id) REFERENCES spec_review(spec_review_id),
    FOREIGN KEY(review_section_type_id) REFERENCES spec_review_section_type_lu(review_section_type_id),
    FOREIGN KEY(review_user_role_type_id) REFERENCES spec_review_user_role_type_lu(review_user_role_type_id)
);

create table spec_review_comment_view (
    view_id decimal(10) NOT NULL,
    comment_id decimal(10) NOT NULL,
    view_user VARCHAR(64),
    view_time DATETIME YEAR to FRACTION(3) NOT NULL,
    PRIMARY KEY(view_id),
    FOREIGN KEY(comment_id) REFERENCES spec_review_comment(comment_id)
);

CREATE SEQUENCE SPEC_REVIEW_SEQ;
CREATE SEQUENCE SPEC_REVIEW_REVIEWER_SEQ;
CREATE SEQUENCE SPEC_REVIEW_STATUS_SEQ;
CREATE SEQUENCE SPEC_REVIEW_STATUS_TYPE_SEQ;
CREATE SEQUENCE SPEC_REVIEW_SECTION_TYPE_SEQ;
CREATE SEQUENCE SPEC_REVIEW_COMMENT_SEQ;
CREATE SEQUENCE SPEC_REVIEW_USER_ROLE_TYPE_SEQ;
CREATE SEQUENCE SPEC_REVIEW_COMMENT_VIEW_SEQ;

