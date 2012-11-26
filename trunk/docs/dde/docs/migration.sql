create synonym sequence_object for common_oltp:sequence_object

alter table comp_version_dates add LEVEL_ID      DEC(18)
alter table comp_version_dates add SCREENING_COMPLETE_DATE      DATETIME YEAR TO DAY;
alter table comp_version_dates add REVIEW_COMPLETE_DATE      DATETIME YEAR TO DAY;
alter table comp_version_dates add AGGREGATION_COMPLETE_DATE      DATETIME YEAR TO DAY;
alter table comp_version_dates add PHASE_COMPLETE_DATE      DATETIME YEAR TO DAY;



insert into doc_types (document_type_id, description, status_id) 
values (22, 'Aggregated Scorecard', 1);

update doc_types 
   set description = 'Design Scorecard'
 where document_type_id = 22;

insert into doc_types (document_type_id, description, status_id) 
values (23, 'Aggregated Scorecard', 1);

create table COMP_LEVEL  (
  LEVEL_ID             DEC(18)                         not null,
  DESCRIPTION           VARCHAR(254)                     not null,
primary key (LEVEL_ID)
      constraint PK_COMP_LEVEL
);
insert into COMP_LEVEL values(0, "No Level Selected");
insert into COMP_LEVEL values(100, "Level 1");
insert into COMP_LEVEL values(200, "Level 2");
insert into COMP_LEVEL values(300, "Level 3");
insert into COMP_LEVEL values(400, "Level 4");
insert into COMP_LEVEL values(500, "Level 5");

update comp_version_dates set level_id = 0;

create table GROUP_ROLE_XREF_TMP  (
  GROUP_ROLE_ID        DEC(18)                         not null,
  GROUP_ID             DEC(18),
  ROLE_ID              DEC(18),
primary key (GROUP_ROLE_ID)
      constraint PK_GROUP_ROLE_XREF_TMP
);

insert into GROUP_ROLE_XREF_TMP  select * from GROUP_ROLE_XREF;



create table SECURITY_GROUPS_TMP  (
  GROUP_ID             DEC(18)                         not null,
  DESCRIPTION          VARCHAR(254)                    not null,
primary key (GROUP_ID)
      constraint PK_SECURITY_GROUPS_TMP
);

insert into SECURITY_GROUPS_TMP  select * from SECURITY_GROUPS;


--==============================================================
-- Table: SECURITY_PERMS
--==============================================================

create table SECURITY_PERMS_TMP  (
  ROLE_ID              DEC(18)                         not null,
  PERMISSION           VARCHAR(254)                    not null,
primary key (ROLE_ID, PERMISSION)
      constraint PK_SECURITY_PERMS_TMP
);
insert into SECURITY_PERMS_TMP  select * from SECURITY_PERMS;


--==============================================================
-- Table: SECURITY_ROLES
--==============================================================

create table SECURITY_ROLES_TMP  (
  ROLE_ID              DEC(18)                         not null,
  DESCRIPTION          VARCHAR(254)                    not null,
primary key (ROLE_ID)
      constraint PK_SECURITY_ROLES_TMP
);
insert into SECURITY_ROLES_TMP  select * from SECURITY_ROLES;

--==============================================================
-- Table: SECURITY_USER
--==============================================================

create table SECURITY_USER_TMP  (
  LOGIN_ID             DEC(18)                         not null,
  USER_ID              VARCHAR(50)                     not null,
  PASSWORD             VARCHAR(50)                     not null,
primary key (LOGIN_ID)
      constraint PK_SECURITY_USER_TMP
);

insert into security_user_tmp select * from security_user;


--==============================================================
-- Table: USER_GROUP_XREF
--==============================================================

create table USER_GROUP_XREF_TMP  (
  USER_GROUP_ID        DEC(18)                         not null,
  LOGIN_ID             DEC(18),
  GROUP_ID             DEC(18),
primary key (USER_GROUP_ID)
      constraint PK_USER_GROUP_XREF_TMP
);
insert into USER_GROUP_XREF_TMP select * from USER_GROUP_XREF;


--==============================================================
-- Table: USER_ROLE_XREF
--==============================================================

create table USER_ROLE_XREF_TMP  (
  USER_ROLE_ID         DEC(18)                         not null,
  LOGIN_ID             DEC(18),
  ROLE_ID              DEC(18),
primary key (USER_ROLE_ID)
      constraint PK_USER_ROLE_XREF_TMP
);
insert into USER_ROLE_XREF_TMP select * from USER_ROLE_XREF;

create table DDE.USER_MASTER_TMP  (
  LOGIN_ID             DEC(18)                         not null,
  LAST_LOGIN_TIME      DATETIME YEAR TO FRACTION       not null,
  NUM_LOGINS           DEC(7)                          not null,
  STATUS_ID            DEC(18)                         not null,
primary key (LOGIN_ID)
      constraint PK_USER_MASTER_TMP
);
insert into USER_MASTER_TMP select * from USER_MASTER;

create table DDE.DOWNLOAD_TRACKING_TMP  (
  DOWNLOAD_TRACK_ID    DEC(18)                         not null,
  COMP_VERS_ID         DEC(18),
  LOGIN_ID             DEC(18),
  LICENSE_LEVEL_ID     DEC(18),
  DOWNLOAD_ID          DEC(18),
  UNIT_COST            DEC(18)                         not null,
  PRICE                DEC(10,2)                       not null,
  CREATE_TIME          DATETIME YEAR TO SECOND         not null,
primary key (DOWNLOAD_TRACK_ID)
      constraint PK_DOWNLOAD_TRACKI_TMP
);
insert into DOWNLOAD_TRACKING_TMP select * from DOWNLOAD_TRACKING;

create table DDE.USER_ROLE_TMP  (
  USER_ROLE_ID         DEC(18)                         not null,
  COMP_VERS_ID         DEC(18),
  ROLE_ID              DEC(18),
  LOGIN_ID             DEC(18),
  TCS_RATING           DEC(5)                          not null,
primary key (USER_ROLE_ID)
      constraint PK_USER_ROLE_TMP
);
insert into USER_ROLE_TMP select * from USER_ROLE;

create table DDE.FORUM_POSTS_TMP  (
  POST_ID              DEC(18)                         not null,
  THREAD_ID            DEC(18),
  STATUS_ID            DEC(18)                         not null,
  LOGIN_ID             DEC(18),
  POST_TIME            DATETIME YEAR TO FRACTION       not null,
  POST_TEXT            TEXT                        not null,
primary key (POST_ID)
      constraint PK_FORUM_POSTS_TMP
);
insert into FORUM_POSTS_TMP select post_id,
thread_id, status_id, login_id, post_time, post_text from FORUM_POSTS;

create table DDE.USER_CUSTOMER_TMP  (
  USER_CUSTOMER_ID     DEC(18)                         not null,
  LOGIN_ID             DEC(18),
  FIRST_NAME           VARCHAR(100)                    not null,
  LAST_NAME            VARCHAR(100)                    not null,
  COMPANY              VARCHAR(200)                    not null,
  ADDRESS              LVARCHAR                        not null,
  CITY                 VARCHAR(100)                    not null,
  POSTAL_CODE          VARCHAR(100)                    not null,
  COUNTRY_CODE         DEC(18),
  TELEPHONE_COUNTRY    CHAR(5)                         not null,
  TELEPHONE_AREA       CHAR(5)                         not null,
  TELEPHONE_NBR        CHAR(10)                        not null,
  USE_COMPONENTS       DEC(1)                          not null,
  USE_CONSULTANTS      DEC(1)                          not null,
  RECEIVE_TCSNEWS      DEC(1)                          not null,
  RECEIVE_NEWSHTML     DEC(1)                          not null,
  COMPANY_SIZE_ID      DEC(18),
  TIER_ID              DEC(18),
  ACTIVATION_CODE      VARCHAR(32)                     not null,
  EMAIL_ADDRESS        VARCHAR(254)                    not null,
primary key (USER_CUSTOMER_ID)
      constraint PK_USER_CUSTOMER_TMP
);



insert into USER_CUSTOMER_TMP select * from user_customer;


create table DDE.USER_TMP  (
  TCS_LOGIN_ID             DEC(18),
  TC_LOGIN_ID             DEC(18)
  )


delete from user_customer where login_id in (Select login_Id from 
user_master
where NUM_LOGINS = 0 
and STATUS_ID = 1
and LOGIN_ID in (select USER_ID from TC_USER_XREF));

delete from USER_MASTER
where NUM_LOGINS = 0 
and STATUS_ID = 1
and LOGIN_ID in (select USER_ID from TC_USER_XREF);

delete from USER_CUSTOMER 
where login_id not in (select LOGIN_ID from USER_MASTER)
and LOGIN_ID in (select USER_ID from TC_USER_XREF);

delete from USER_GROUP_XREF 
where LOGIN_ID not in (select LOGIN_ID from USER_MASTER)
and LOGIN_ID in (select USER_ID from TC_USER_XREF);

delete from USER_ROLE_XREF 
where LOGIN_ID not in (select LOGIN_ID from USER_MASTER)
and LOGIN_ID in (select USER_ID from TC_USER_XREF);

delete from SECURITY_USER
where LOGIN_ID not in (select LOGIN_ID from USER_MASTER)
and LOGIN_ID in (select USER_ID from TC_USER_XREF);



-----------------------------------------------------------------------------------------

login into common_oltp
alter table common_oltp:user add ACTIVATION_CODE      VARCHAR(32)
grant all on sequence_object to coder

---------------------------------------------
DONE
------------------------------------------


drop table USER_CUSTOMER;
create view user_customer (
USER_CUSTOMER_ID,
LOGIN_ID,
FIRST_NAME,
LAST_NAME,
COMPANY,
ADDRESS,
city,
POSTAL_CODE,
COUNTRY_CODE,
TELEPHONE_COUNTRY,
  TELEPHONE_AREA,
  TELEPHONE_NBR,
use_components,
use_consultants,
receive_tcsnews ,
receive_newshtml,
COMPANY_SIZE_ID,
TIER_ID,
ACTIVATION_CODE,
EMAIL_ADDRESS) as
select u.user_id as USER_CUSTOMER_ID,
       u.user_id as LOGIN_ID,
       u.first_name as FIRST_NAME,
       u.last_name as LAST_NAME,
       company_name as COMPANY,
       a.address1 || ' ' || address2 as ADDRESS,
       a.city,
       a.zip as POSTAL_CODE,
       a.country_code as COUNTRY_CODE,
       '' as TELEPHONE_COUNTRY,
       '' as  TELEPHONE_AREA,
       p.phone_number,
       0 as use_components,
       0 as use_consultants,
       0 as receive_tcsnews ,
       0 as receive_newshtml,
       1 as COMPANY_SIZE_ID,
       0 as TIER_ID,
       u.ACTIVATION_CODE as ACTIVATION_CODE,
       address as EMAIL_ADDRESS
 from  common_oltp:USER u,
       common_oltp:ADDRESS a,
       common_oltp:USER_ADDRESS_XREF uax,
       common_oltp:EMAIL e,
       OUTER (common_oltp:phone p, common_oltp:company c)
 where u.user_id = uax.user_id
   and a.address_id = uax.address_id
   and e.primary = 1
   and e.user_id = u.user_id
   and p.user_id = u.user_id
   and c.primary_contact_id = u.user_id;

grant all on user_customer to coder;

drop table GROUP_ROLE_XREF;
create synonym GROUP_ROLE_XREF for common_oltp:GROUP_ROLE_XREF;

drop table SECURITY_GROUPS;
create synonym SECURITY_GROUPS for common_oltp:SECURITY_GROUPS;

drop table SECURITY_PERMS;
create synonym SECURITY_PERMS for common_oltp:SECURITY_PERMS;

drop table SECURITY_ROLES;
create synonym SECURITY_ROLES for common_oltp:SECURITY_ROLES;

drop table SECURITY_USER;
create synonym SECURITY_USER for common_oltp:SECURITY_USER;


drop table USER_GROUP_XREF;
create synonym USER_GROUP_XREF for common_oltp:USER_GROUP_XREF;


drop table USER_ROLE_XREF;
create synonym USER_ROLE_XREF for common_oltp:USER_ROLE_XREF;

------------------------------------------------------------------------------------
drop table USER_MASTER;
create table USER_MASTER  (
  LOGIN_ID             DEC(18)                         not null,
  LAST_LOGIN_TIME      DATETIME YEAR TO FRACTION       not null,
  NUM_LOGINS           DEC(7)                          not null,
  STATUS_ID            DEC(18)                         ,
primary key (LOGIN_ID)
      constraint PK_USER_MASTER
);


insert into user_master(login_id,last_login_time, num_logins, status_id)
  select u.user_id, m.last_login_time, m.num_logins, m.status_id
   from tcs_catalog2:user_master_tmp m, tcs_catalog2:security_user_tmp su
        , common_oltp:user u
  where u.handle = su.user_id
    and m.login_id = su.login_id;

update DOWNLOAD_TRACKING
   set LOGIN_ID = (select u.login_id
                     from security_user_tmp ut, security_user u
                   where u.user_id = ut.user_id
                     and ut.login_id = DOWNLOAD_TRACKING.LOGIN_ID);
select * from forum_posts where login_id is null                     
update FORUM_POSTS
   set LOGIN_ID = (select u.login_id
                     from security_user_tmp ut, security_user u
                   where u.user_id = ut.user_id
                     and ut.login_id = FORUM_POSTS.LOGIN_ID)

update USER_ROLE
   set LOGIN_ID = (select u.login_id
                     from security_user_tmp ut, security_user u
                   where u.user_id = ut.user_id
                     and ut.login_id = USER_ROLE.LOGIN_ID)


---------------------------------------------------------------------
--SECURITY_ROLES insert without the overlapped rows
---------------------------------------------------------------------
insert into COMMON_OLTP:SECURITY_ROLES  (
  ROLE_ID,
  DESCRIPTION
)
select
  ROLE_ID,
  DESCRIPTION
from SECURITY_ROLES_TMP
where ROLE_ID not in (
  select ROLE_ID
  from COMMON_OLTP:SECURITY_ROLES
)
and ROLE_ID != 2;



---------------------------------------------------------------------
--Check SECURITY_PERMS table for overlaps between 2 dbs
---------------------------------------------------------------------
--select
--  ROLE_ID,
--  PERMISSION
--from SECURITY_PERMS
--where ROLE_ID in (
--  select ROLE_ID
--  from COMMON_OLTP:SECURITY_PERMS
--);

---------------------------------------------------------------------
--SECURITY_PERMS insert without the overlapped rows
---------------------------------------------------------------------

insert into COMMON_OLTP:SECURITY_PERMS  (
  ROLE_ID,
  PERMISSION
) 
select
  ROLE_ID,
  PERMISSION
from SECURITY_PERMS_TMP
where ROLE_ID not in (
  select ROLE_ID
  from COMMON_OLTP:SECURITY_PERMS
);

---------------------------------------------------------------------
--Check SECURITY_GROUPS table for overlaps between 2 dbs
---------------------------------------------------------------------
--select
--  GROUP_ID,
--  DESCRIPTION
--from SECURITY_GROUPS
--where GROUP_ID in (
--  select GROUP_ID
--  from COMMON_OLTP:SECURITY_GROUPS
--)
--and GROUP_ID != 2;

---------------------------------------------------------------------
--SECURITY_GROUPS insert without the overlapped rows
---------------------------------------------------------------------

insert into COMMON_OLTP:SECURITY_GROUPS  (
  GROUP_ID,
  DESCRIPTION
)
select
  GROUP_ID,
  DESCRIPTION
from SECURITY_GROUPS_TMP
where GROUP_ID not in (
  select GROUP_ID
  from COMMON_OLTP:SECURITY_GROUPS
)
and GROUP_ID != 2;

---------------------------------------------------------------------
--Insert role for component subscription
---------------------------------------------------------------------
insert into COMMON_OLTP:SECURITY_ROLES (
ROLE_ID,
DESCRIPTION)   
values (
20, 
'Component Subscription');


---------------------------------------------------------------------
--GROUP_ROLE_XREF inserts to common db
---------------------------------------------------------------------
insert into COMMON_OLTP:GROUP_ROLE_XREF (
  GROUP_ROLE_ID,
  GROUP_ID,
  ROLE_ID
)
select GROUP_ROLE_ID, GROUP_ID, ROLE_ID
from GROUP_ROLE_XREF_TMP;


---------------------------------------------------------------------
--Insert permissions
---------------------------------------------------------------------
insert into COMMON_OLTP:SECURITY_PERMS (
ROLE_ID,
PERMISSION)
select 20,
PERMISSION
from COMMON_OLTP:SECURITY_PERMS
where ROLE_ID = 1
and PERMISSION like '%DownloadPermission%'
and PERMISSION not like '%600191';


----------------------------------
DONE ABOVE RUN BELOW
----------------------------------


---------------------------------------------------------------------
--USER_ROLE_XREF has no overlaps
--But beware of user_ids changing
---------------------------------------------------------------------
--select 
--  USER_ROLE_ID,
--  LOGIN_ID,
--  ROLE_ID
--from  USER_ROLE_XREF
--where USER_ROLE_ID in (
--  select USER_ROLE_ID
--  from COMMON_OLTP:USER_ROLE_XREF
--);


---------------------------------------------------------------------
--USER_ROLE_XREF inserts to common db
---------------------------------------------------------------------
insert into COMMON_OLTP:USER_ROLE_XREF (
  USER_ROLE_ID,
  LOGIN_ID,
  ROLE_ID
)
select ur.USER_ROLE_ID, su2.LOGIN_ID, ur.ROLE_ID
from USER_ROLE_XREF_TMP ur, 
  SECURITY_USER_TMP su, 
  COMMON_OLTP:SECURITY_USER su2
where su.USER_ID = su2.USER_ID
  AND su.LOGIN_ID = ur.LOGIN_ID
  AND ur.USER_ROLE_ID not in (
  select USER_ROLE_ID
  from COMMON_OLTP:USER_ROLE_XREF
  );
  
  
   


---------------------------------------------------------------------
--USER_GROUP_XREF has no overlaps
--But beware of user_ids changing
---------------------------------------------------------------------
--select 
--  USER_GROUP_ID,
--  LOGIN_ID,
--  GROUP_ID
--from  USER_GROUP_XREF 
--where USER_GROUP_ID in (
--  select USER_GROUP_ID
--  from COMMON_OLTP:USER_GROUP_XREF
--);

--   user_group_id         login_id         group_id

--1800001.00000000 1800000.00000000 2.00000000000000
--2000002.00000000 2000001.00000000 2.00000000000000
--2000020.00000000 2000019.00000000 2.00000000000000

---------------------------------------------------------------------
--USER_GROUP_XREF inserts to common db
--Remeber to add in permissions for ThinMan and Timurz
---------------------------------------------------------------------
insert into COMMON_OLTP:USER_GROUP_XREF (
  USER_GROUP_ID,
  LOGIN_ID,
  GROUP_ID
)
select ug.USER_GROUP_ID, su2.LOGIN_ID, ug.GROUP_ID
from USER_GROUP_XREF_TMP ug, 
  SECURITY_USER_TMP su, 
  COMMON_OLTP:SECURITY_USER su2
where su.USER_ID = su2.USER_ID
  and su.LOGIN_ID = ug.LOGIN_ID
  and ug.USER_GROUP_ID not in (1800001,2000002,2000020,2000616)
  and ug.GROUP_ID != 2;
   
--Add ThinMan and Timurz groups back in
--Make sure that every user is in group User

---------------------------------------------------------------------
--GROUP_ROLE_XREF has no overlaps
--But beware of user_ids changing
---------------------------------------------------------------------
--select 
--  GROUP_ROLE_ID,
--  GROUP_ID,
--  ROLE_ID
--from  GROUP_ROLE_XREF
--where GROUP_ROLE_ID in (
--  select GROUP_ROLE_ID
--  from COMMON_OLTP:GROUP_ROLE_XREF
--);




---------------------------------------------------------------------
--Update KEY_GENERATION
---------------------------------------------------------------------

--update COMMON_OLTP:KEY_GENERATION
--set HIGH_VALUE = 66 where USER_DEF = 'main_sequence';

update sequence_object
   set current_value =  7210000 
 where lower(name) like '%main%';



