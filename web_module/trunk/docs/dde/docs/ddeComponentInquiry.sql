create table COMPONENT_INQUIRY
(
  COMPONENT_INQUIRY_ID DEC(18)                         not null,
  COMPONENT_ID         DEC(18)                         not null,
  USER_ID              DEC(18)                         not null,
  COMMENT              VARCHAR(254),
  AGREED_TO_TERMS      DEC(1)                          not null,
  RATING               DEC(5)                          not null,
  PHASE                DEC(18)                         not null,
  TC_USER_ID           DEC(18)                         not null,
  VERSION              DEC(18)                         not null,
  CREATE_TIME          DATETIME YEAR TO FRACTION     DEFAULT CURRENT not null,  
primary key (COMPONENT_INQUIRY_ID)
      constraint PK_COMPONENT_INQUIRY_ID
);

insert into status(status_id, description)
values(301, "NEW POST");

insert into status(status_id, description)
values(302, "REPOST")

create table COMP_VERSION_DATES
(
  COMP_VERSION_DATES_ID DEC(18)                    not null,
  COMP_VERS_ID           DEC(18)                    not null,
  PHASE_ID               DEC(18)                    not null,
  POSTING_DATE           DATETIME YEAR TO DAY       not null,
  INITIAL_SUBMISSION_DATE DATETIME YEAR TO DAY      not null,
  WINNER_ANNOUNCED_DATE  DATETIME YEAR TO DAY       not null,
  FINAL_SUBMISSION_DATE  DATETIME YEAR TO DAY       not null,
  ESTIMATED_DEV_DATE     DATETIME YEAR TO DAY       ,
  PRICE                  DEC(10,2)                  not null,
  TOTAL_SUBMISSIONS      DEC(18)                    DEFAULT 0 not null,  
  STATUS_ID              DEC(18)                    DEFAULT 301 not null,  
  CREATE_TIME            DATETIME YEAR TO FRACTION  DEFAULT CURRENT not null,  
primary key (COMP_VERSION_DATES_ID)
      constraint PK_COMP_VERSION_DATES_ID
);



create view v_latest_version
       (version,
        component_name,
        component_id,
        comp_vers_id,
        phase_id
        )
as
  select max(cv.version),
         cc.component_name,
         cc.component_id,
         cv.comp_vers_id,
         cv.phase_id
    from comp_versions cv,
         comp_catalog cc
   where cv.phase_id in (112,113)
     and cc.component_id = cv.component_id
     and cc.status_id = 102
group by cc.component_name,
         cc.component_id,
         cv.comp_vers_id,
         cv.phase_id



  select cc.component_name,
       cvd.INITIAL_SUBMISSION_DATE,
        cvd.REVIEW_COMPLETE_DATE,
       cvd.FINAL_SUBMISSION_DATE,
       cvd.PHASE_COMPLETE_DATE
  from comp_version_dates cvd,
       comp_versions cv,
       comp_catalog cc
 where cc.component_id = cv.component_id
   and cvd.comp_vers_id = cv.comp_vers_id
   and cvd.phase_complete_date >= CURRENT