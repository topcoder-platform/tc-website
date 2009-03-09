--==============================================================
-- Database name:  DDE
-- DBMS name:      INFORMIX SQL 9.x
-- Created on:     10/2/2002 12:09:19 PM
--==============================================================


drop table DDE.CATEGORIES;

drop table DDE.COMPANY_SIZE;

drop table DDE.COMP_CATALOG;

drop table DDE.COMP_CATEGORIES;

drop table DDE.COMP_DEPENDENCIES;

drop table DDE.COMP_DOCUMENTATION;

drop table DDE.COMP_DOWNLOAD;

drop table DDE.COMP_EXAMPLES;

drop table DDE.COMP_FORUM_XREF;

drop table DDE.COMP_KEYWORDS;

drop table DDE.COMP_REVIEWS;

drop table DDE.COMP_TECHNOLOGY;

drop table DDE.COMP_VERSIONS;

drop table DDE.CONTACT_TYPE;

drop table DDE.COUNTRY_CODES;

drop table DDE.DOC_FORUM_XREF;

drop table DDE.DOC_TYPES;

drop table DDE.DOWNLOAD_TRACKING;

drop table DDE.FORUM_ATTACHMENT;

drop table DDE.FORUM_MASTER;

drop table DDE.FORUM_POSTS;

drop table DDE.FORUM_STATUS;

drop table DDE.FORUM_TEMPLATE;

drop table DDE.FORUM_TEMPLATE_TPC;

drop table DDE.FORUM_THREADS;

drop table DDE.FORUM_TOPICS;

drop table DDE.GROUP_ROLE_XREF;

drop table DDE.KEY_GENERATION;

drop table DDE.LICENSE_LEVEL;

drop table DDE.PHASE;

drop table DDE.PRICE_TIERS;

drop table DDE.ROLES;

drop table DDE.SECURITY_GROUPS;

drop table DDE.SECURITY_PERMS;

drop table DDE.SECURITY_ROLES;

drop table DDE.SECURITY_USER;

drop table DDE.STATUS;

drop table DDE.TECHNOLOGY_TYPES;

drop table DDE.USER_CONTACT;

drop table DDE.USER_CUSTOMER;

drop table DDE.USER_GROUP_XREF;

drop table DDE.USER_MASTER;

drop table DDE.USER_MEMBER;

drop table DDE.USER_ROLE;

drop table DDE.USER_ROLE_XREF;

drop table DDE.USER_TECHNOLOGIES;

drop table DDE.WORD_SEARCH;

drop table DDE.WORD_SEARCH_CTGY;

drop table DDE.WORD_SEARCH_DOC;

drop table DDE.WORD_SEARCH_EXCL;

--==============================================================
-- Table: CATEGORIES
--==============================================================

create table DDE.CATEGORIES  (
  CATEGORY_ID          DEC(18)                         not null,
  PARENT_CATEGORY_ID   DEC(18),
  CATEGORY_NAME        VARCHAR(100)                    not null,
  DESCRIPTION          VARCHAR(254)                    not null,
  STATUS_ID            DEC(18)                         not null,
primary key (CATEGORY_ID)
      constraint PK_CATEGORIES
);

--==============================================================
-- Table: COMPANY_SIZE
--==============================================================

create table DDE.COMPANY_SIZE  (
  COMPANY_SIZE_ID      DEC(18)                         not null,
  DESCRIPTION          VARCHAR(25)                     not null,
primary key (COMPANY_SIZE_ID)
      constraint PK_COMPANY_SIZE
);

--==============================================================
-- Table: COMP_CATALOG
--==============================================================

create table DDE.COMP_CATALOG  (
  COMPONENT_ID         DEC(18)                         not null,
  CURRENT_VERSION      DEC(18)                         not null,
  SHORT_DESC           LVARCHAR                        not null,
  COMPONENT_NAME       VARCHAR(254)                    not null,
  DESCRIPTION          LVARCHAR                        not null,
  FUNCTION_DESC        LVARCHAR                        not null,
  CREATE_TIME          DATETIME YEAR TO FRACTION       not null,
  STATUS_ID            DEC(18)                         not null,
primary key (COMPONENT_ID)
      constraint PK_COMP_CATALOG
);

--==============================================================
-- Table: COMP_CATEGORIES
--==============================================================

create table DDE.COMP_CATEGORIES  (
  COMP_CATEGORIES_ID   DEC(18)                         not null,
  COMPONENT_ID         DEC(18),
  CATEGORY_ID          DEC(18),
primary key (COMP_CATEGORIES_ID)
      constraint PK_COMP_CATEGORIES
);

--==============================================================
-- Index: COMP_CTGY_I1
--==============================================================
create unique cluster index COMP_CTGY_I1 on DDE.COMP_CATEGORIES (
        COMPONENT_ID         ASC,
        CATEGORY_ID          ASC
);

--==============================================================
-- Table: COMP_DEPENDENCIES
--==============================================================

create table DDE.COMP_DEPENDENCIES  (
  COMP_DEPENDENCY_ID   DEC(18)                         not null,
  COMP_VERS_ID         DEC(18),
  CHILD_COMP_VERS_ID   DEC(18),
primary key (COMP_DEPENDENCY_ID)
      constraint PK_COMP_DEPENDENCI
);

--==============================================================
-- Index: COMP_DEPEND_I1
--==============================================================
create unique cluster index COMP_DEPEND_I1 on DDE.COMP_DEPENDENCIES (
        COMP_VERS_ID         ASC,
        CHILD_COMP_VERS_ID   ASC
);

--==============================================================
-- Table: COMP_DOCUMENTATION
--==============================================================

create table DDE.COMP_DOCUMENTATION  (
  DOCUMENT_ID          DEC(18)                         not null,
  COMP_VERS_ID         DEC(18),
  DOCUMENT_TYPE_ID     DEC(18),
  DOCUMENT_NAME        VARCHAR(254)                    not null,
  URL                  VARCHAR(254)                    not null,
primary key (DOCUMENT_ID)
      constraint PK_COMP_DOCUMENTAT
);

--==============================================================
-- Table: COMP_DOWNLOAD
--==============================================================

create table DDE.COMP_DOWNLOAD  (
  DOWNLOAD_ID          DEC(18)                         not null,
  COMP_VERS_ID         DEC(18),
  URL                  VARCHAR(254)                    not null,
  DESCRIPTION          VARCHAR(254)                    not null,
primary key (DOWNLOAD_ID)
      constraint PK_COMP_DOWNLOAD
);

--==============================================================
-- Table: COMP_EXAMPLES
--==============================================================

create table DDE.COMP_EXAMPLES  (
  EXAMPLE_ID           DEC(18)                         not null,
  COMP_VERS_ID         DEC(18),
  URL                  VARCHAR(254)                    not null,
  DESCRIPTION          LVARCHAR                        not null,
primary key (EXAMPLE_ID)
      constraint PK_COMP_EXAMPLES
);

--==============================================================
-- Table: COMP_FORUM_XREF
--==============================================================

create table DDE.COMP_FORUM_XREF  (
  COMP_FORUM_ID        DEC(18)                         not null,
  COMP_VERS_ID         DEC(18),
  FORUM_ID             DEC(18),
  FORUM_TYPE           DEC(5)                          not null,
primary key (COMP_FORUM_ID)
      constraint PK_COMP_FORUM_XREF
);

--==============================================================
-- Index: COMP_FORUM_XREF_I1
--==============================================================
create unique cluster index COMP_FORUM_XREF_I1 on DDE.COMP_FORUM_XREF (
        COMP_VERS_ID         ASC,
        FORUM_ID             ASC
);

--==============================================================
-- Table: COMP_KEYWORDS
--==============================================================

create table DDE.COMP_KEYWORDS  (
  COMP_KEYWORDS_ID     DEC(18)                         not null,
  COMPONENT_ID         DEC(18),
  KEYWORD              VARCHAR(50)                     not null,
primary key (COMP_KEYWORDS_ID)
      constraint PK_COMP_KEYWORDS
);

--==============================================================
-- Index: COMP_KEYWORDS_I1
--==============================================================
create unique cluster index COMP_KEYWORDS_I1 on DDE.COMP_KEYWORDS (
        COMPONENT_ID         ASC,
        KEYWORD              ASC
);

--==============================================================
-- Table: COMP_REVIEWS
--==============================================================

create table DDE.COMP_REVIEWS  (
  COMP_REVIEWS_ID      DEC(18)                         not null,
  COMP_VERS_ID         DEC(18),
  LOGIN_ID             DEC(18),
  REVIEW_TIME          DATETIME YEAR TO FRACTION       not null,
  RATING               DEC(5)                          not null,
  COMMENTS             LVARCHAR                        not null,
primary key (COMP_REVIEWS_ID)
      constraint PK_COMP_REVIEWS
);

--==============================================================
-- Table: COMP_TECHNOLOGY
--==============================================================

create table DDE.COMP_TECHNOLOGY  (
  COMP_TECH_ID         DEC(18)                         not null,
  COMP_VERS_ID         DEC(18),
  TECHNOLOGY_TYPE_ID   DEC(18),
primary key (COMP_TECH_ID)
      constraint PK_COMP_TECHNOLOGY
);

--==============================================================
-- Index: COMP_TECH_I1
--==============================================================
create unique cluster index COMP_TECH_I1 on DDE.COMP_TECHNOLOGY (
        COMP_VERS_ID         ASC,
        TECHNOLOGY_TYPE_ID   ASC
);

--==============================================================
-- Table: COMP_VERSIONS
--==============================================================

create table DDE.COMP_VERSIONS  (
  COMP_VERS_ID         DEC(18)                         not null,
  COMPONENT_ID         DEC(18),
  VERSION              DEC(18)                         not null,
  VERSION_TEXT         CHAR(20)                        not null,
  CREATE_TIME          DATETIME YEAR TO FRACTION       not null,
  PHASE_ID             DEC(18)                         not null,
  PHASE_TIME           DATETIME YEAR TO FRACTION       not null,
  PRICE                DEC(10,2)                       not null,
  COMMENTS             LVARCHAR                        not null,
primary key (COMP_VERS_ID)
      constraint PK_COMP_VERSIONS
);

--==============================================================
-- Index: COMP_VERSIONS_I2
--==============================================================
create unique cluster index COMP_VERSIONS_I2 on DDE.COMP_VERSIONS (
        COMPONENT_ID         ASC,
        VERSION              ASC
);

--==============================================================
-- Table: CONTACT_TYPE
--==============================================================

create table DDE.CONTACT_TYPE  (
  CONTACT_TYPE_ID      DEC(18)                         not null,
  DESCRIPTION          VARCHAR(254)                    not null,
  STATUS_ID            DEC(18)                         not null,
primary key (CONTACT_TYPE_ID)
      constraint PK_CONTACT_TYPE
);

--==============================================================
-- Table: COUNTRY_CODES
--==============================================================

create table DDE.COUNTRY_CODES  (
  COUNTRY_CODE         DEC(18)                         not null,
  DESCRIPTION          VARCHAR(100)                    not null,
primary key (COUNTRY_CODE)
      constraint PK_COUNTRY_CODES
);

--==============================================================
-- Table: DOC_FORUM_XREF
--==============================================================

create table DDE.DOC_FORUM_XREF  (
  DOC_FORUM_ID         DEC(18)                         not null,
  DOCUMENT_ID          DEC(18),
  TOPIC_ID             DEC(18),
primary key (DOC_FORUM_ID)
      constraint PK_DOC_FORUM_XREF
);

--==============================================================
-- Index: DOC_FORUM_XREF
--==============================================================
create unique cluster index DOC_FORUM_XREF on DDE.DOC_FORUM_XREF (
        DOCUMENT_ID          ASC,
        TOPIC_ID             ASC
);

--==============================================================
-- Table: DOC_TYPES
--==============================================================

create table DDE.DOC_TYPES  (
  DOCUMENT_TYPE_ID     DEC(18)                         not null,
  DESCRIPTION          VARCHAR(254)                    not null,
  STATUS_ID            DEC(18)                         not null,
primary key (DOCUMENT_TYPE_ID)
      constraint PK_DOC_TYPES
);

--==============================================================
-- Table: DOWNLOAD_TRACKING
--==============================================================

create table DDE.DOWNLOAD_TRACKING  (
  DOWNLOAD_TRACK_ID    DEC(18)                         not null,
  COMP_VERS_ID         DEC(18),
  LOGIN_ID             DEC(18),
  LICENSE_LEVEL_ID     DEC(18),
  DOWNLOAD_ID          DEC(18),
  UNIT_COST            DEC(18)                         not null,
  PRICE                DEC(10,2)                       not null,
  CREATE_TIME          DATETIME YEAR TO SECOND         not null,
primary key (DOWNLOAD_TRACK_ID)
      constraint PK_DOWNLOAD_TRACKI
);

--==============================================================
-- Index: DOWNLOAD_TRACK_I2
--==============================================================
create  cluster index DOWNLOAD_TRACK_I2 on DDE.DOWNLOAD_TRACKING (
        COMP_VERS_ID         ASC,
        LOGIN_ID             ASC
);

--==============================================================
-- Table: FORUM_ATTACHMENT
--==============================================================

create table DDE.FORUM_ATTACHMENT  (
  FORUM_ATTACH_ID      DEC(18)                         not null,
  POST_ID              DEC(18),
  ATTACHMENT_NAME      VARCHAR(254)                    not null,
  URL                  VARCHAR(254)                    not null,
primary key (FORUM_ATTACH_ID)
      constraint PK_FORUM_ATTACHMEN
);

--==============================================================
-- Table: FORUM_MASTER
--==============================================================

create table DDE.FORUM_MASTER  (
  FORUM_ID             DEC(18)                         not null,
  STATUS_ID            DEC(18)                         not null,
  CREATE_TIME          DATETIME YEAR TO FRACTION       not null,
  CLOSED_TIME          DATETIME YEAR TO FRACTION,
primary key (FORUM_ID)
      constraint PK_FORUM_MASTER
);

--==============================================================
-- Table: FORUM_POSTS
--==============================================================

create table DDE.FORUM_POSTS  (
  POST_ID              DEC(18)                         not null,
  THREAD_ID            DEC(18),
  STATUS_ID            DEC(18)                         not null,
  LOGIN_ID             DEC(18),
  POST_TIME            DATETIME YEAR TO FRACTION       not null,
  POST_TEXT            LVARCHAR                        not null,
primary key (POST_ID)
      constraint PK_FORUM_POSTS
);

--==============================================================
-- Table: FORUM_STATUS
--==============================================================

create table DDE.FORUM_STATUS  (
  STATUS_ID            DEC(18)                         not null,
  DESCRIPTION          VARCHAR(254)                    not null,
primary key (STATUS_ID)
      constraint PK_FORUM_STATUS
);

--==============================================================
-- Table: FORUM_TEMPLATE
--==============================================================

create table DDE.FORUM_TEMPLATE  (
  TEMPLATE_ID          DEC(18)                         not null,
  TEMPLATE_TYPE        DEC(18)                         not null,
  DESCRIPTION          VARCHAR(254)                    not null,
primary key (TEMPLATE_ID)
      constraint PK_FORUM_TEMPLATE
);

--==============================================================
-- Table: FORUM_TEMPLATE_TPC
--==============================================================

create table DDE.FORUM_TEMPLATE_TPC  (
  TOPIC_ID             DEC(18)                         not null,
  PARENT_TOPIC_ID      DEC(18),
  TEMPLATE_ID          DEC(18),
  TOPIC_NAME           VARCHAR(254)                    not null,
  TOPIC_TEXT           VARCHAR(254)                    not null,
primary key (TOPIC_ID)
      constraint PK_FORUM_TMPL_TPC
);

--==============================================================
-- Table: FORUM_THREADS
--==============================================================

create table DDE.FORUM_THREADS  (
  THREAD_ID            DEC(18)                         not null,
  TOPIC_ID             DEC(18),
  STATUS_ID            DEC(18)                         not null,
  SUBJECT              VARCHAR(254)                    not null,
primary key (THREAD_ID)
      constraint PK_FORUM_THREADS
);

--==============================================================
-- Table: FORUM_TOPICS
--==============================================================

create table DDE.FORUM_TOPICS  (
  TOPIC_ID             DEC(18)                         not null,
  FORUM_ID             DEC(18),
  PARENT_TOPIC_ID      DEC(18),
  STATUS_ID            DEC(18)                         not null,
  TOPIC_NAME           VARCHAR(254)                    not null,
  TOPIC_TEXT           VARCHAR(254)                    not null,
primary key (TOPIC_ID)
      constraint PK_FORUM_TOPICS
);

--==============================================================
-- Table: GROUP_ROLE_XREF
--==============================================================

create table DDE.GROUP_ROLE_XREF  (
  GROUP_ROLE_ID        DEC(18)                         not null,
  GROUP_ID             DEC(18),
  ROLE_ID              DEC(18),
primary key (GROUP_ROLE_ID)
      constraint PK_GROUP_ROLE_XREF
);

--==============================================================
-- Index: GROUP_ROLE_XREF_I2
--==============================================================
create unique cluster index GROUP_ROLE_XREF_I2 on DDE.GROUP_ROLE_XREF (
        GROUP_ID             ASC,
        ROLE_ID              ASC
);

--==============================================================
-- Table: KEY_GENERATION
--==============================================================

create table DDE.KEY_GENERATION  (
  USER_DEF             CHAR(18)                        not null,
  HIGH_VALUE           DEC(13)                         not null,
primary key (USER_DEF)
      constraint PK_KEY_GENERATION
);

--==============================================================
-- Table: LICENSE_LEVEL
--==============================================================

create table DDE.LICENSE_LEVEL  (
  LICENSE_LEVEL_ID     DEC(18)                         not null,
  PRICE_MULTIPLIER     DEC(10,3)                       not null,
  DESCRIPTION          VARCHAR(254)                    not null,
  STATUS_ID            DEC(18),
primary key (LICENSE_LEVEL_ID)
      constraint PK_LICENSE_LEVEL
);

--==============================================================
-- Table: PHASE
--==============================================================

create table DDE.PHASE  (
  PHASE_ID             DEC(18)                         not null,
  DESCRIPTION          VARCHAR(254)                    not null,
primary key (PHASE_ID)
      constraint PK_PHASE
);

--==============================================================
-- Table: PRICE_TIERS
--==============================================================

create table DDE.PRICE_TIERS  (
  TIER_ID              DEC(18)                         not null,
  DISCOUNT_PERCENT     DEC(5,2)                        not null,
primary key (TIER_ID)
      constraint PK_PRICE_TIERS
);

--==============================================================
-- Table: ROLES
--==============================================================

create table DDE.ROLES  (
  ROLE_ID              DEC(18)                         not null,
  ROLE_NAME            VARCHAR(100)                    not null,
  DESCRIPTION          VARCHAR(254)                    not null,
  STATUS_ID            DEC(18)                         not null,
primary key (ROLE_ID)
      constraint PK_ROLES
);

--==============================================================
-- Table: SECURITY_GROUPS
--==============================================================

create table DDE.SECURITY_GROUPS  (
  GROUP_ID             DEC(18)                         not null,
  DESCRIPTION          VARCHAR(254)                    not null,
primary key (GROUP_ID)
      constraint PK_SECURITY_GROUPS
);

--==============================================================
-- Table: SECURITY_PERMS
--==============================================================

create table DDE.SECURITY_PERMS  (
  ROLE_ID              DEC(18)                         not null,
  PERMISSION           VARCHAR(254)                    not null,
primary key (ROLE_ID, PERMISSION)
      constraint PK_SECURITY_PERMS
);

--==============================================================
-- Table: SECURITY_ROLES
--==============================================================

create table DDE.SECURITY_ROLES  (
  ROLE_ID              DEC(18)                         not null,
  DESCRIPTION          VARCHAR(254)                    not null,
primary key (ROLE_ID)
      constraint PK_SECURITY_ROLES
);

--==============================================================
-- Table: SECURITY_USER
--==============================================================

create table DDE.SECURITY_USER  (
  LOGIN_ID             DEC(18)                         not null,
  USER_ID              VARCHAR(50)                     not null,
  PASSWORD             VARCHAR(50)                     not null,
primary key (LOGIN_ID)
      constraint PK_SECURITY_USER
);

--==============================================================
-- Index: SECURITY_USER_I2
--==============================================================
create unique  index SECURITY_USER_I2 on DDE.SECURITY_USER (
        USER_ID              ASC
);

--==============================================================
-- Table: STATUS
--==============================================================

create table DDE.STATUS  (
  STATUS_ID            DEC(18)                         not null,
  DESCRIPTION          VARCHAR(254)                    not null,
primary key (STATUS_ID)
      constraint PK_STATUS
);

--==============================================================
-- Table: TECHNOLOGY_TYPES
--==============================================================

create table DDE.TECHNOLOGY_TYPES  (
  TECHNOLOGY_TYPE_ID   DEC(18)                         not null,
  TECHNOLOGY_NAME      VARCHAR(100)                    not null,
  DESCRIPTION          VARCHAR(254)                    not null,
  STATUS_ID            DEC(18)                         not null,
primary key (TECHNOLOGY_TYPE_ID)
      constraint PK_TECHNOLOGY_TYPE
);

--==============================================================
-- Table: USER_CONTACT
--==============================================================

create table DDE.USER_CONTACT  (
  USER_CONTACT_ID      DEC(18)                         not null,
  CONTACT_TYPE_ID      DEC(18),
  LOGIN_ID             DEC(18),
  CONTACT_INFO         VARCHAR(254)                    not null,
primary key (USER_CONTACT_ID)
      constraint PK_USER_CONTACT
);

--==============================================================
-- Table: USER_CUSTOMER
--==============================================================

create table DDE.USER_CUSTOMER  (
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
      constraint PK_USER_CUSTOMER
);

--==============================================================
-- Table: USER_GROUP_XREF
--==============================================================

create table DDE.USER_GROUP_XREF  (
  USER_GROUP_ID        DEC(18)                         not null,
  LOGIN_ID             DEC(18),
  GROUP_ID             DEC(18),
primary key (USER_GROUP_ID)
      constraint PK_USER_GROUP_XREF
);

--==============================================================
-- Index: USER_GRP_XREF_I2
--==============================================================
create unique cluster index USER_GRP_XREF_I2 on DDE.USER_GROUP_XREF (
        LOGIN_ID             ASC,
        GROUP_ID             ASC
);

--==============================================================
-- Table: USER_MASTER
--==============================================================

create table DDE.USER_MASTER  (
  LOGIN_ID             DEC(18)                         not null,
  LAST_LOGIN_TIME      DATETIME YEAR TO FRACTION       not null,
  NUM_LOGINS           DEC(7)                          not null,
  STATUS_ID            DEC(18)                         not null,
primary key (LOGIN_ID)
      constraint PK_USER_MASTER
);

--==============================================================
-- Table: USER_MEMBER
--==============================================================

create table DDE.USER_MEMBER  (
  USER_MEMBER_ID       DEC(18)                         not null,
  LOGIN_ID             DEC(18),
  TC_RATING            DEC(5)                          not null,
  TCS_RATING           DEC(5)                          not null,
primary key (USER_MEMBER_ID)
      constraint PK_USER_MEMBER
);

--==============================================================
-- Table: USER_ROLE
--==============================================================

create table DDE.USER_ROLE  (
  USER_ROLE_ID         DEC(18)                         not null,
  COMP_VERS_ID         DEC(18),
  ROLE_ID              DEC(18),
  LOGIN_ID             DEC(18),
  TCS_RATING           DEC(5)                          not null,
primary key (USER_ROLE_ID)
      constraint PK_USER_ROLE
);

--==============================================================
-- Table: USER_ROLE_XREF
--==============================================================

create table DDE.USER_ROLE_XREF  (
  USER_ROLE_ID         DEC(18)                         not null,
  LOGIN_ID             DEC(18),
  ROLE_ID              DEC(18),
primary key (USER_ROLE_ID)
      constraint PK_USER_ROLE_XREF
);

--==============================================================
-- Index: USER_ROLE_XREF_I2
--==============================================================
create unique cluster index USER_ROLE_XREF_I2 on DDE.USER_ROLE_XREF (
        LOGIN_ID             ASC,
        ROLE_ID              ASC
);

--==============================================================
-- Table: USER_TECHNOLOGIES
--==============================================================

create table DDE.USER_TECHNOLOGIES  (
  USER_TECH_ID         DEC(18)                         not null,
  TECHNOLOGY_TYPE_ID   DEC(18),
  LOGIN_ID             DEC(18),
  RATING               DEC(5)                          not null,
  MONTHS               DEC(5)                          not null,
primary key (USER_TECH_ID)
      constraint PK_USER_TECHNOLOGI
);

--==============================================================
-- Index: USER_TECHOLOGY_I2
--==============================================================
create unique cluster index USER_TECHOLOGY_I2 on DDE.USER_TECHNOLOGIES (
        TECHNOLOGY_TYPE_ID   ASC,
        LOGIN_ID             ASC
);

--==============================================================
-- Table: WORD_SEARCH
--==============================================================

create table DDE.WORD_SEARCH  (
  WORD_SEARCH_ID       dec(18)                         not null,
  DOCUMENT_ID          DEC(18)                         not null,
  INDEX_WORD           char(100)                       not null,
  NBR_OCCURRENCES      DEC(18)                         not null,
primary key (WORD_SEARCH_ID)
      constraint PK_WORD_SEARCH
);

--==============================================================
-- Index: WORD_SEARCH_I2
--==============================================================
create  cluster index WORD_SEARCH_I2 on DDE.WORD_SEARCH (
        INDEX_WORD           ASC
);

--==============================================================
-- Index: WORD_SEARCH_I3
--==============================================================
create unique  index WORD_SEARCH_I3 on DDE.WORD_SEARCH (
        DOCUMENT_ID          ASC,
        INDEX_WORD           ASC
);

--==============================================================
-- Table: WORD_SEARCH_CTGY
--==============================================================

create table DDE.WORD_SEARCH_CTGY  (
  WORD_SRCH_CTGY_ID    DEC(18)                         not null,
  CATEGORY_ID          CHAR(50)                        not null,
  DOCUMENT_ID          DEC(18)                         not null,
primary key (WORD_SRCH_CTGY_ID)
      constraint PK_WORD_SEARCH_CTG
);

--==============================================================
-- Index: WORD_SRCH_CTGY_I2
--==============================================================
create unique cluster index WORD_SRCH_CTGY_I2 on DDE.WORD_SEARCH_CTGY (
        CATEGORY_ID          ASC,
        DOCUMENT_ID          ASC
);

--==============================================================
-- Index: WORD_SRCH_CTGY_I3
--==============================================================
create   index WORD_SRCH_CTGY_I3 on DDE.WORD_SEARCH_CTGY (
        DOCUMENT_ID          ASC
);

--==============================================================
-- Table: WORD_SEARCH_DOC
--==============================================================

create table DDE.WORD_SEARCH_DOC  (
  DOCUMENT_ID          DEC(18)                         not null,
primary key (DOCUMENT_ID)
      constraint PK_WORD_SEARCH_DOC
);

--==============================================================
-- Table: WORD_SEARCH_EXCL
--==============================================================

create table DDE.WORD_SEARCH_EXCL  (
  WORD_SRCH_EXL_ID     DEC(18)                         not null,
  EXCLUDE_WORD         VARCHAR(100)                    not null,
primary key (WORD_SRCH_EXL_ID)
      constraint PK_WORD_SEARCH_EXC
);

alter table DDE.CATEGORIES
   add constraint foreign key (STATUS_ID)
      references DDE.STATUS (STATUS_ID)
      constraint FK_CTGY_STATUS;

alter table DDE.COMP_CATALOG
   add constraint foreign key (STATUS_ID)
      references DDE.STATUS (STATUS_ID)
      constraint FK_COMP_STATUS;

alter table DDE.COMP_CATEGORIES
   add constraint foreign key (CATEGORY_ID)
      references DDE.CATEGORIES (CATEGORY_ID)
      constraint FK_COMP_CTGY1;

alter table DDE.COMP_CATEGORIES
   add constraint foreign key (COMPONENT_ID)
      references DDE.COMP_CATALOG (COMPONENT_ID)
      constraint FK_COMP_CTGY2;

alter table DDE.COMP_DEPENDENCIES
   add constraint foreign key (COMP_VERS_ID)
      references DDE.COMP_VERSIONS (COMP_VERS_ID)
      constraint FK_COMP_DEPEND1;

alter table DDE.COMP_DEPENDENCIES
   add constraint foreign key (CHILD_COMP_VERS_ID)
      references DDE.COMP_VERSIONS (COMP_VERS_ID)
      constraint FK_COMP_DEPEND2;

alter table DDE.COMP_DOCUMENTATION
   add constraint foreign key (COMP_VERS_ID)
      references DDE.COMP_VERSIONS (COMP_VERS_ID)
      constraint FK_COMP_DOC1;

alter table DDE.COMP_DOCUMENTATION
   add constraint foreign key (DOCUMENT_TYPE_ID)
      references DDE.DOC_TYPES (DOCUMENT_TYPE_ID)
      constraint FK_COMP_DOC_REF2;

alter table DDE.COMP_DOWNLOAD
   add constraint foreign key (COMP_VERS_ID)
      references DDE.COMP_VERSIONS (COMP_VERS_ID)
      constraint COMP_DOWNLOAD_FK1;

alter table DDE.COMP_EXAMPLES
   add constraint foreign key (COMP_VERS_ID)
      references DDE.COMP_VERSIONS (COMP_VERS_ID)
      constraint FK_COMP_EXAMPLE;

alter table DDE.COMP_FORUM_XREF
   add constraint foreign key (FORUM_ID)
      references DDE.FORUM_MASTER (FORUM_ID)
      constraint FK_COMP_FORUM1;

alter table DDE.COMP_FORUM_XREF
   add constraint foreign key (COMP_VERS_ID)
      references DDE.COMP_VERSIONS (COMP_VERS_ID)
      constraint FK_COMP_FORUM2;

alter table DDE.COMP_KEYWORDS
   add constraint foreign key (COMPONENT_ID)
      references DDE.COMP_CATALOG (COMPONENT_ID)
      constraint FK_COMP_KEYWORD;

alter table DDE.COMP_REVIEWS
   add constraint foreign key (COMP_VERS_ID)
      references DDE.COMP_VERSIONS (COMP_VERS_ID)
      constraint FK_COM_REVIEW1;

alter table DDE.COMP_REVIEWS
   add constraint foreign key (LOGIN_ID)
      references DDE.USER_MASTER (LOGIN_ID)
      constraint FK_COMP_REVIEWS;

alter table DDE.COMP_TECHNOLOGY
   add constraint foreign key (COMP_VERS_ID)
      references DDE.COMP_VERSIONS (COMP_VERS_ID)
      constraint FK_COMP_TECH1;

alter table DDE.COMP_TECHNOLOGY
   add constraint foreign key (TECHNOLOGY_TYPE_ID)
      references DDE.TECHNOLOGY_TYPES (TECHNOLOGY_TYPE_ID)
      constraint FK_COMP_TECH2;

alter table DDE.COMP_VERSIONS
   add constraint foreign key (COMPONENT_ID)
      references DDE.COMP_CATALOG (COMPONENT_ID)
      constraint FK_COMP_VERSIONS;

alter table DDE.COMP_VERSIONS
   add constraint foreign key (PHASE_ID)
      references DDE.PHASE (PHASE_ID)
      constraint FK_COMP_PHASE;

alter table DDE.CONTACT_TYPE
   add constraint foreign key (STATUS_ID)
      references DDE.STATUS (STATUS_ID)
      constraint FK_CONTACT_STATUS;

alter table DDE.DOC_FORUM_XREF
   add constraint foreign key (DOCUMENT_ID)
      references DDE.COMP_DOCUMENTATION (DOCUMENT_ID)
      constraint FK_DOC_FORUM_XREF1;

alter table DDE.DOC_FORUM_XREF
   add constraint foreign key (TOPIC_ID)
      references DDE.FORUM_TOPICS (TOPIC_ID)
      constraint FK_DOC_FORUM_XREF2;

alter table DDE.DOC_TYPES
   add constraint foreign key (STATUS_ID)
      references DDE.STATUS (STATUS_ID)
      constraint FK_DOC_STATUS;

alter table DDE.DOWNLOAD_TRACKING
   add constraint foreign key (COMP_VERS_ID)
      references DDE.COMP_VERSIONS (COMP_VERS_ID)
      constraint DOWNLOAD_TRACK_FK1;

alter table DDE.DOWNLOAD_TRACKING
   add constraint foreign key (LOGIN_ID)
      references DDE.USER_MASTER (LOGIN_ID)
      constraint DOWNLOAD_TRACK_FK2;

alter table DDE.DOWNLOAD_TRACKING
   add constraint foreign key (LICENSE_LEVEL_ID)
      references DDE.LICENSE_LEVEL (LICENSE_LEVEL_ID)
      constraint DOWNLOAD_TRACK_FK3;

alter table DDE.DOWNLOAD_TRACKING
   add constraint foreign key (DOWNLOAD_ID)
      references DDE.COMP_DOWNLOAD (DOWNLOAD_ID)
      constraint DOWNLOAD_TRACK_FK4;

alter table DDE.FORUM_ATTACHMENT
   add constraint foreign key (POST_ID)
      references DDE.FORUM_POSTS (POST_ID)
      constraint FK_FORUM_ATTACH1;

alter table DDE.FORUM_MASTER
   add constraint foreign key (STATUS_ID)
      references DDE.FORUM_STATUS (STATUS_ID)
      constraint FORUM_MASTER_FK1;

alter table DDE.FORUM_POSTS
   add constraint foreign key (THREAD_ID)
      references DDE.FORUM_THREADS (THREAD_ID)
      constraint FK_FORUM_POSTS1;

alter table DDE.FORUM_POSTS
   add constraint foreign key (STATUS_ID)
      references DDE.FORUM_STATUS (STATUS_ID)
      constraint FORUM_POSTS_FK3;

alter table DDE.FORUM_TEMPLATE_TPC
   add constraint foreign key (TEMPLATE_ID)
      references DDE.FORUM_TEMPLATE (TEMPLATE_ID)
      constraint FORUM_TMPL_TPC_FK;

alter table DDE.FORUM_THREADS
   add constraint foreign key (TOPIC_ID)
      references DDE.FORUM_TOPICS (TOPIC_ID)
      constraint FK_FORUM_THREADS;

alter table DDE.FORUM_THREADS
   add constraint foreign key (STATUS_ID)
      references DDE.FORUM_STATUS (STATUS_ID)
      constraint FORUM_THREADS_FK2;

alter table DDE.FORUM_TOPICS
   add constraint foreign key (STATUS_ID)
      references DDE.FORUM_STATUS (STATUS_ID)
      constraint FORUM_TOPICS_FK2;

alter table DDE.FORUM_TOPICS
   add constraint foreign key (FORUM_ID)
      references DDE.FORUM_MASTER (FORUM_ID)
      constraint FK_FORUM_TOPICS;

alter table DDE.GROUP_ROLE_XREF
   add constraint foreign key (GROUP_ID)
      references DDE.SECURITY_GROUPS (GROUP_ID) on delete cascade
      constraint FK_GRP_ROLE_XREF1;

alter table DDE.GROUP_ROLE_XREF
   add constraint foreign key (ROLE_ID)
      references DDE.SECURITY_ROLES (ROLE_ID) on delete cascade
      constraint FK_GRP_ROLE_XREF2;

alter table DDE.LICENSE_LEVEL
   add constraint foreign key (STATUS_ID)
      references DDE.STATUS (STATUS_ID)
      constraint LICENSE_LEVEL_FK1;

alter table DDE.ROLES
   add constraint foreign key (STATUS_ID)
      references DDE.STATUS (STATUS_ID)
      constraint FK_ROLE_STATUS;

alter table DDE.SECURITY_PERMS
   add constraint foreign key (ROLE_ID)
      references DDE.SECURITY_ROLES (ROLE_ID) on delete cascade
      constraint FK_SECURITY_PERM;

alter table DDE.TECHNOLOGY_TYPES
   add constraint foreign key (STATUS_ID)
      references DDE.STATUS (STATUS_ID)
      constraint FK_TECH_STATUS;

alter table DDE.USER_CONTACT
   add constraint foreign key (LOGIN_ID)
      references DDE.USER_MASTER (LOGIN_ID)
      constraint FK_USER_CONT_INFO1;

alter table DDE.USER_CONTACT
   add constraint foreign key (CONTACT_TYPE_ID)
      references DDE.CONTACT_TYPE (CONTACT_TYPE_ID)
      constraint FK_USER_CONT_INFO2;

alter table DDE.USER_CUSTOMER
   add constraint foreign key (LOGIN_ID)
      references DDE.USER_MASTER (LOGIN_ID)
      constraint USER_CUSTOMER_FK1;

alter table DDE.USER_CUSTOMER
   add constraint foreign key (TIER_ID)
      references DDE.PRICE_TIERS (TIER_ID)
      constraint FK_USER_CUST2;

alter table DDE.USER_CUSTOMER
   add constraint foreign key (COMPANY_SIZE_ID)
      references DDE.COMPANY_SIZE (COMPANY_SIZE_ID)
      constraint FK_USER_CUST3;

alter table DDE.USER_CUSTOMER
   add constraint foreign key (COUNTRY_CODE)
      references DDE.COUNTRY_CODES (COUNTRY_CODE)
      constraint FK_USER_CUST_4;

alter table DDE.USER_GROUP_XREF
   add constraint foreign key (LOGIN_ID)
      references DDE.SECURITY_USER (LOGIN_ID) on delete cascade
      constraint FK_USER_GRP_XREF1;

alter table DDE.USER_GROUP_XREF
   add constraint foreign key (GROUP_ID)
      references DDE.SECURITY_GROUPS (GROUP_ID) on delete cascade
      constraint FK_USER_GRP_XREF2;

alter table DDE.USER_MASTER
   add constraint foreign key (STATUS_ID)
      references DDE.STATUS (STATUS_ID)
      constraint FK_USER_MASTER;

alter table DDE.USER_MEMBER
   add constraint foreign key (LOGIN_ID)
      references DDE.USER_MASTER (LOGIN_ID)
      constraint USER_MEMBER_FK1;

alter table DDE.USER_ROLE
   add constraint foreign key (LOGIN_ID)
      references DDE.USER_MASTER (LOGIN_ID)
      constraint FK_USER_ROLE1;

alter table DDE.USER_ROLE
   add constraint foreign key (COMP_VERS_ID)
      references DDE.COMP_VERSIONS (COMP_VERS_ID)
      constraint FK_USER_ROLE2;

alter table DDE.USER_ROLE
   add constraint foreign key (ROLE_ID)
      references DDE.ROLES (ROLE_ID)
      constraint FK_USER_ROLE3;

alter table DDE.USER_ROLE_XREF
   add constraint foreign key (LOGIN_ID)
      references DDE.SECURITY_USER (LOGIN_ID) on delete cascade
      constraint FK_USER_ROLE_XREF1;

alter table DDE.USER_ROLE_XREF
   add constraint foreign key (ROLE_ID)
      references DDE.SECURITY_ROLES (ROLE_ID) on delete cascade
      constraint FK_USER_ROLE_XREF2;

alter table DDE.USER_TECHNOLOGIES
   add constraint foreign key (TECHNOLOGY_TYPE_ID)
      references DDE.TECHNOLOGY_TYPES (TECHNOLOGY_TYPE_ID)
      constraint FK_USER_TECH1;

alter table DDE.USER_TECHNOLOGIES
   add constraint foreign key (LOGIN_ID)
      references DDE.USER_MASTER (LOGIN_ID)
      constraint FK_USER_TECH2;

alter table DDE.WORD_SEARCH
   add constraint foreign key (DOCUMENT_ID)
      references DDE.WORD_SEARCH_DOC (DOCUMENT_ID) on delete cascade
      constraint WORD_SEARCH_FK1;

alter table DDE.WORD_SEARCH_CTGY
   add constraint foreign key (DOCUMENT_ID)
      references DDE.WORD_SEARCH_DOC (DOCUMENT_ID) on delete cascade
      constraint WORD_SRCH_CTGY_FK1;

