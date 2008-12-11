CREATE TABLE jiveForum (
  forumID              INTEGER NOT NULL,
  name                 VARCHAR(255) NOT NULL,
  nntpName             VARCHAR(255) NOT NULL,
  description          LVARCHAR,
  modDefaultThreadVal  INTEGER NOT NULL,
  modDefaultMsgVal     INTEGER NOT NULL,
  creationDate         decimal(14,0) NOT NULL,
  modificationDate     decimal(14,0) NOT NULL,
  categoryID           INTEGER NOT NULL,
  categoryIndex        INTEGER NOT NULL,
  forumIndexCounter    INTEGER NOT NULL
);
CREATE INDEX jiveForum_cat_idx ON jiveForum (categoryID);
CREATE INDEX jiveForum_forumIdxCtr_idx ON jiveForum (forumIndexCounter);
CREATE INDEX jiveFourm_cDate_idx ON jiveForum (creationDate);
CREATE INDEX jiveFourm_mDate_idx ON jiveForum (modificationDate);
alter table jiveForum add constraint primary key
	(forumID)
	constraint jiveForum_pk;
create unique index nntp_unique_idx on jiveForum(nntpName);

CREATE TABLE jiveForumProp (
  forumID     INTEGER NOT NULL,
  name        VARCHAR(100) NOT NULL,
  propValue   LVARCHAR NOT NULL
);
alter table jiveForumProp add constraint primary key
	(forumID,name)
	constraint jiveForumProp_pk;


CREATE TABLE jiveThread (
  threadID            INTEGER NOT NULL,
  forumID             INTEGER NOT NULL,
  rootMessageID       INTEGER NOT NULL,
  modValue            INTEGER NOT NULL,
  rewardPoints        INTEGER NOT NULL,
  creationDate        decimal(14,0) NOT NULL,
  modificationDate    decimal(14,0) NOT NULL
);
CREATE INDEX jiveThread_forumID_idx ON jiveThread (forumID ASC);
CREATE INDEX jiveThread_modValue_idx ON jiveThread (modValue ASC);
CREATE INDEX jiveThread_cDate_idx ON jiveThread (creationDate ASC);
CREATE INDEX jiveThread_mDate_idx ON jiveThread (modificationDate DESC);
CREATE INDEX jiveThread_fID_mV_idx ON jiveThread (forumID, modValue);
alter table jiveThread add constraint primary key
	(threadID)
	constraint jiveThread_pk;


CREATE TABLE jiveThreadProp (
  threadID      INTEGER NOT NULL,
  name          VARCHAR(100) NOT NULL,
  propValue     LVARCHAR NOT NULL
);
alter table jiveThreadProp add constraint primary key
	(threadID, name)
	constraint jiveThreadProp_pk;



CREATE TABLE jiveMessage (
  messageID         INTEGER NOT NULL,
  parentMessageID   INTEGER,
  threadID          INTEGER NOT NULL,
  forumID           INTEGER NOT NULL,
  forumIndex        INTEGER NOT NULL,
  userID            INTEGER,
  subject           VARCHAR(255),
  body              TEXT,
  modValue          INTEGER NOT NULL,
  rewardPoints      INTEGER NOT NULL,
  creationDate      decimal(14,0) NOT NULL,
  modificationDate  decimal(14,0) NOT NULL
);
CREATE INDEX jiveMessage_forumID_idx ON jiveMessage (forumID ASC, forumIndex);
CREATE INDEX jiveMessage_threadID_idx ON jiveMessage (threadID ASC);
CREATE INDEX jiveMessage_userID_idx ON jiveMessage (userID ASC);
CREATE INDEX jiveMessage_forumId_modVal_idx ON jiveMessage(forumID, modValue);
CREATE INDEX jiveMessage_cDate_idx ON jiveMessage (creationDate ASC);
CREATE INDEX jiveMessage_mDate_idx ON jiveMessage (modificationDate DESC);
alter table jiveMessage add constraint primary key
	(messageID)
	constraint jiveMessage_pk;


CREATE TABLE jiveMessageProp (
  messageID     INTEGER NOT NULL,
  name          VARCHAR(100) NOT NULL,
  propValue     LVARCHAR NOT NULL
);
alter table jiveMessageProp add constraint primary key
	(messageID, name)
	constraint jiveMessageProp_pk;

CREATE TABLE jiveAnnounce (
  announcementID   INTEGER NOT NULL,
  objectType       INTEGER NOT NULL,
  objectID         INTEGER,
  userID           INTEGER NOT NULL,
  subject          VARCHAR(255),
  body             TEXT,
  startDate        decimal(14,0) NOT NULL,
  endDate          decimal(14,0)
);
CREATE INDEX jiveAnnounce_sDate_idx ON jiveAnnounce(startDate);
CREATE INDEX jiveAnnounce_eDate_idx ON jiveAnnounce(endDate);
CREATE INDEX jiveAnnounce_container_idx ON jiveAnnounce(objectType, objectID);
CREATE INDEX jiveAnnounce_user_idx ON jiveAnnounce(userID);
alter table jiveAnnounce add constraint primary key
	(announcementID)
	constraint jiveAnnounce_pk;


CREATE TABLE jiveAnnounceProp (
  announcementID   INTEGER NOT NULL,
  name             VARCHAR(100) NOT NULL,
  propValue        LVARCHAR NOT NULL
);
alter table jiveAnnounceProp add constraint primary key
	(announcementID, name)
	constraint jiveAnnounceProp_pk;


CREATE TABLE jivePMessage (
  pMessageID            INTEGER NOT NULL,
  ownerID               INTEGER NOT NULL,
  senderID              INTEGER,
  recipientID           INTEGER,
  subject               VARCHAR(255),
  body                  TEXT,
  readStatus            INTEGER NOT NULL,
  folderID              INTEGER NOT NULL,
  pMessageDate          decimal(14,0) NOT NULL
);
CREATE INDEX jivePMessage_rID_idx ON jivePMessage (recipientID);
alter table jivePMessage add constraint primary key
	(pMessageID)
	constraint jivePMessage_pmID_pk;


CREATE TABLE jivePMessageProp (
  pMessageID   INTEGER NOT NULL,
  name         VARCHAR(100) NOT NULL,
  propValue    LVARCHAR NOT NULL
);
alter table jivePMessageProp add constraint primary key
	(pMessageID,name)
	constraint jivePMP_pmID_name_idx;


CREATE TABLE jivePMessageFldr (
  folderID        INTEGER NOT NULL,
  userID          INTEGER NOT NULL,
  name            VARCHAR(255) NOT NULL
);
alter table jivePMessageFldr add constraint primary key
	(folderID,userID)
	constraint jivePF_pk;


CREATE TABLE jiveUser (
  userID            INTEGER NOT NULL,
  username          VARCHAR(30) NOT NULL,
  passwordHash      VARCHAR(32) NOT NULL,
  name              VARCHAR(100),
  nameVisible       INTEGER NOT NULL,
  email             VARCHAR(100) NOT NULL,
  emailVisible      INTEGER NOT NULL,
  creationDate      decimal(14,0) NOT NULL,
  modificationDate  decimal(14,0) NOT NULL
);
CREATE INDEX jiveUser_cDate_idx on jiveUser (creationDate ASC);
alter table jiveUser add constraint primary key
	(userID)
	constraint jiveUser_pk;
create unique index username_unique_idx on jiveUser(username);

CREATE TABLE jiveUserPerm (
  objectType       INTEGER NOT NULL,
  objectID         INTEGER NOT NULL,
  userID           INTEGER NOT NULL,
  permissionType   INTEGER NOT NULL,
  permission       INTEGER NOT NULL
);
CREATE INDEX jiveUserPerm_object_idx ON jiveUserPerm (objectType, objectID);
CREATE INDEX jiveUserPerm_userID_idx ON jiveUserPerm (userID ASC);


CREATE TABLE jiveUserProp (
  userID      INTEGER NOT NULL,
  name        VARCHAR(100) NOT NULL,
  propValue   LVARCHAR NOT NULL
);
alter table jiveUserProp add constraint primary key
	(userID, name)
	constraint jiveUserProp_pk;



CREATE TABLE jiveGroup (
  groupID           INTEGER NOT NULL,
  name              VARCHAR(100) NOT NULL,
  description       VARCHAR(255),
  creationDate      decimal(14,0) NOT NULL,
  modificationDate  decimal(14,0) NOT NULL
);
CREATE INDEX jiveGroup_cDate_idx on jiveGroup (creationDate ASC);
alter table jiveGroup add constraint primary key
	(groupID)
	constraint jiveGroup_pk;
create unique index name_unique_idx on jiveGroup(name);

CREATE TABLE jiveGroupPerm (
  objectType      INTEGER NOT NULL,
  objectID        INTEGER NOT NULL,
  groupID         INTEGER NOT NULL,
  permissionType  INTEGER NOT NULL,
  permission      INTEGER NOT NULL
);
CREATE INDEX jiveGroupPerm_object_idx ON jiveGroupPerm (objectType, objectID);
CREATE INDEX jiveGroupPerm_groupID_idx ON jiveGroupPerm (groupID ASC);


CREATE TABLE jiveGroupProp (
  groupID     INTEGER NOT NULL,
  name        VARCHAR(100) NOT NULL,
  propValue   LVARCHAR NOT NULL
);
alter table jiveGroupProp add constraint primary key
	(groupID, name)
	constraint jiveGroupProp_pk;



CREATE TABLE jiveGroupUser (
  groupID          INTEGER NOT NULL,
  userID           INTEGER NOT NULL,
  administrator    INTEGER NOT NULL
);
CREATE INDEX jiveGroupUser_userID_idx ON jiveGroupUser (userID ASC);
alter table jiveGroupUser add constraint primary key
	(groupID, userID, administrator)
	constraint jiveGroupUser_pk;



CREATE TABLE jiveID (
  idType INTEGER NOT NULL,
  id     INTEGER NOT NULL
);
alter table jiveID add constraint primary key
	(idType)
	constraint jiveID_pk;



CREATE TABLE jiveProperty (
  name        VARCHAR(100) NOT NULL,
  propValue   LVARCHAR NOT NULL
);
alter table jiveProperty add constraint primary key
	(name)
	constraint jiveProperty_pk;


CREATE TABLE jiveModeration (
  objectID    INTEGER NOT NULL,
  objectType  INTEGER NOT NULL,
  userID      INTEGER,
  modDate     decimal(14,0) NOT NULL,
  modValue    INTEGER NOT NULL
);
CREATE INDEX jiveModeration_objectID_idx ON jiveModeration (objectID ASC);
CREATE INDEX jiveModeration_objectType_idx ON jiveModeration (objectType ASC);
CREATE INDEX jiveModeration_userID_idx ON jiveModeration (userID ASC);


CREATE TABLE jiveWatch (
  userID          INTEGER NOT NULL,
  objectID        INTEGER NOT NULL,
  objectType      INTEGER NOT NULL,
  watchType       INTEGER NOT NULL,
  expirable       INTEGER NOT NULL
);
CREATE INDEX jiveWatch_userID_idx ON jiveWatch (userID);
CREATE INDEX jiveWatch_objectID_idx ON jiveWatch (objectID);
CREATE INDEX jiveWatch_objectType_idx ON jiveWatch (objectType);
CREATE INDEX jiveWatch_combo_idx ON jiveWatch (objectType, objectID, watchType);
alter table jiveWatch add constraint primary key
	(userID, objectID, objectType, watchType)
	constraint jiveWatch_pk;



CREATE TABLE jiveBatchWatch (
  userID                INTEGER        NOT NULL,
  frequency             VARCHAR(50)  NOT NULL,
  prevEmailDate         decimal(14,0)
);
alter table jiveBatchWatch add constraint primary key
	(userID)
	constraint jiveBatchWatch_pk;


CREATE TABLE jiveReward (
  userID          INTEGER NOT NULL,
  creationDate    decimal(14,0) NOT NULL,
  rewardPoints    INTEGER NOT NULL,
  messageID       INTEGER,
  threadID        INTEGER
);
CREATE INDEX jiveReward_userID_idx ON jiveReward (userID ASC);
CREATE INDEX jiveReward_creationDate_idx ON jiveReward (creationDate ASC);
CREATE INDEX jiveReward_messageID_idx ON jiveReward (messageID ASC);
CREATE INDEX jiveReward_threadID_idx ON jiveReward (threadID ASC);


CREATE TABLE jiveUserReward (
  userID        INTEGER NOT NULL,
  rewardPoints  INTEGER NOT NULL
);
alter table jiveUserReward add constraint primary key
	(userID)
	constraint jiveUserReward_pk;


CREATE TABLE jiveAttachment (
  attachmentID      INTEGER NOT NULL,
  objectType        INTEGER NOT NULL,
  objectID          INTEGER,
  fileName          VARCHAR(255) NOT NULL,
  fileSize          INTEGER NOT NULL,
  contentType       VARCHAR(50) NOT NULL,
  creationDate      decimal(14,0) NOT NULL,
  modificationDate  decimal(14,0) NOT NULL
);
CREATE INDEX jiveAttachment_object_idx ON jiveAttachment (objectType, objectID);
alter table jiveAttachment add constraint primary key
	(attachmentID)
	constraint jiveAttachment_pk;



CREATE TABLE jiveAttachData (
  attachmentID       INTEGER  NOT NULL,
  attachmentData     BYTE     NOT NULL
);
alter table jiveAttachData add constraint primary key
	(attachmentID)
	constraint jiveAttachData_pk;



CREATE TABLE jiveAttachmentProp (
  attachmentID  INTEGER NOT NULL,
  name          VARCHAR(100) NOT NULL,
  propValue     LVARCHAR NOT NULL
);
alter table jiveAttachmentProp add constraint primary key
	(attachmentID, name)
	constraint jiveAttachmentProp_pk;


CREATE TABLE jiveCategory (
  categoryID        INTEGER NOT NULL,
  name              VARCHAR(255) NOT NULL,
  description       LVARCHAR,
  creationDate      decimal(14,0) NOT NULL,
  modificationDate  decimal(14,0) NOT NULL,
  lft               INTEGER NOT NULL,
  rgt               INTEGER NOT NULL
);
CREATE INDEX jiveCategory_lft_idx ON jiveCategory (lft);
CREATE INDEX jiveCategory_rgt_idx ON jiveCategory (rgt);
alter table jiveCategory add constraint primary key
	(categoryID)
	constraint jiveCategory_pk;


CREATE TABLE jiveCategoryProp (
  categoryID        INTEGER NOT NULL,
  name              VARCHAR(100) NOT NULL,
  propValue         LVARCHAR NOT NULL
);
alter table jiveCategoryProp add constraint primary key
	(categoryID,name)
	constraint jiveCategoryProp_pk;



CREATE TABLE jiveUserRoster (
  userID        INTEGER NOT NULL,
  subUserID     INTEGER NOT NULL
);
alter table jiveUserRoster add constraint primary key
	(userID, subUserID)
	constraint jiveUserRoster_pk;


CREATE TABLE jiveReadTracker (
  userID            INTEGER NOT NULL,
  objectType        INTEGER NOT NULL,
  objectID          INTEGER NOT NULL,
  readDate          decimal(14,0) NOT NULL
);
alter table jiveReadTracker add constraint primary key
	(userID, objectType, objectID)
	constraint jiveReadTracker_pk;


CREATE TABLE jiveRatingType (
  score                 INTEGER         NOT NULL,
  description           VARCHAR(255)   NOT NULL
);
alter table jiveRatingType add constraint primary key
	(score)
	constraint jiveRatingType_pk;


CREATE TABLE jiveRating (
  objectID              INTEGER         NOT NULL,
  objectType            INTEGER         NOT NULL,
  userID                INTEGER         ,
  score                 INTEGER         NOT NULL
);
CREATE INDEX jiveRating_userID_idx ON jiveRating (userID);
CREATE INDEX jiveRating_oID_oType_idx ON jiveRating (objectID, objectType);


CREATE TABLE jivePoll (
  pollID                INTEGER         NOT NULL,
  objectType            INTEGER         NOT NULL,
  objectID              INTEGER         NOT NULL,
  userID                INTEGER         ,
  name                  VARCHAR(255)   NOT NULL,
  description           LVARCHAR  ,
  pollMode              INTEGER         NOT NULL,
  creationDate          decimal(14,0)         NOT NULL,
  modificationDate      decimal(14,0)         NOT NULL,
  startDate             decimal(14,0)         NOT NULL,
  endDate               decimal(14,0)         NOT NULL,
  expireDate            decimal(14,0)         NOT NULL
);
CREATE INDEX jivePoll_oID_oType_idx ON jivePoll (objectID, objectType);
CREATE INDEX jivePoll_cDate_idx ON jivePoll (creationDate ASC);
CREATE INDEX jivePoll_mDate_idx ON jivePoll (modificationDate DESC);
CREATE INDEX jivePoll_sDate_idx ON jivePoll (startDate DESC);
CREATE INDEX jivePoll_eDate_idx ON jivePoll (endDate DESC);
alter table jivePoll add constraint primary key
	(pollID)
	constraint jivePoll_pk;


CREATE TABLE jivePollOption (
  pollID                INTEGER         NOT NULL,
  optionIndex           INTEGER         NOT NULL,
  optionText            VARCHAR(255)   NOT NULL
);
alter table jivePollOption add constraint primary key
	(pollID, optionIndex)
	constraint jivePollOption_pk;


CREATE TABLE jivePollVote (
  pollID                INTEGER         NOT NULL,
  userID                INTEGER        ,
  guestID               VARCHAR(255),
  optionIndex           INTEGER         NOT NULL,
  voteDate              decimal(14,0)         NOT NULL
);
CREATE INDEX jivePollVote_pollID_idx ON jivePollVote (pollID);


CREATE TABLE jiveSearch (
  searchID              INTEGER         NOT NULL,
  searchType            INTEGER         NOT NULL,
  userID                INTEGER         ,
  query                 LVARCHAR  NOT NULL,
  searchDuration        INTEGER         NOT NULL,
  numResults            INTEGER         NOT NULL,
  searchDate            decimal(14,0)         NOT NULL
);
CREATE INDEX jiveSearch_userID_idx ON jiveSearch (userID);
CREATE INDEX jiveSearch_type_idx ON jiveSearch (searchType);
alter table jiveSearch add constraint primary key
	(searchID)
	constraint jiveSearch_pk;


CREATE TABLE jiveSearchCriteria (
  searchID              INTEGER         NOT NULL,
  criteriaName          VARCHAR(100)   NOT NULL,
  criteriaValue         LVARCHAR  NOT NULL
);
CREATE INDEX jiveSearchCrit_sID_idx ON jiveSearchCriteria (searchID);


CREATE TABLE jiveSearchClick (
  searchID              INTEGER         NOT NULL,
  messageID             INTEGER         NOT NULL,
  clickDate             decimal(14,0)         NOT NULL
);
alter table jiveSearchClick add constraint primary key
	(searchID, messageID, clickDate)
	constraint jiveSearchClick_pk;


CREATE TABLE jiveViewCount (
    objectType      INTEGER    NOT NULL,
    objectID        INTEGER    NOT NULL,
    parentObjectID  INTEGER    ,
    viewCount       INTEGER    DEFAULT 0
);
CREATE INDEX jiveViewCount_vc_idx ON jiveViewCount (viewCount);
CREATE INDEX jiveViewCount_po_idx ON jiveViewCount (parentObjectID);
alter table jiveViewCount add constraint primary key
	(objectType, objectID)
	constraint jiveViewCount_pk;


CREATE TABLE jiveReadStat (
    readStatID      INTEGER NOT NULL,
    userID          INTEGER,
    objectType      INTEGER NOT NULL,
    objectID        INTEGER NOT NULL,
    creationDate    decimal(14,0) NOT NULL,
    sessionID       INTEGER NOT NULL
);
CREATE INDEX jiveReadStat_cd_idx ON jiveReadStat (creationDate);
alter table jiveReadStat add constraint primary key
	(readStatID)
	constraint jiveReadStat_pk;


CREATE TABLE jiveReadStatSession (
    sessionID       INTEGER NOT NULL,
    visitorID       VARCHAR(32) ,
    creationDate    decimal(14,0) NOT NULL
);
CREATE INDEX jiveRSS_cd_idx ON jiveReadStatSession (creationDate);
alter table jiveReadStatSession add constraint primary key
	(sessionID)
	constraint jiveRSS_pk;



CREATE TABLE jiveHTTPReadStatSession (
    referrer        VARCHAR(255),
    userAgent       VARCHAR(255),
    IP              VARCHAR(16) ,
    country         VARCHAR(4) ,
    bytesSent       INTEGER DEFAULT 0,
    sessionID       INTEGER NOT NULL
);
CREATE INDEX jiveHRSS_sID_idx ON jiveHTTPReadStatSession (sessionID);
CREATE INDEX jiveHRSS_bs_idx ON jiveHTTPReadStatSession (bytesSent);


CREATE TABLE jiveNNTPReadStatSession (
    creationDate    decimal(14,0) NOT NULL,
    endDate         decimal(14,0) ,
    bytesReceived   INTEGER DEFAULT 0,
    bytesSent       INTEGER DEFAULT 0,
    IP              VARCHAR(16) ,
    country         VARCHAR(4) ,
    sessionID       INTEGER NOT NULL
);
CREATE INDEX jiveNRSS_cd_idx ON jiveNNTPReadStatSession (creationDate);
CREATE INDEX jiveNRSS_ed_idx ON jiveNNTPReadStatSession (endDate);




ALTER TABLE jiveForumProp ADD CONSTRAINT FOREIGN KEY (forumID) REFERENCES jiveForum constraint jiveForumProp_forumID_fk;
ALTER TABLE jiveThread ADD CONSTRAINT FOREIGN KEY (forumID) REFERENCES jiveForum constraint jiveThread_forumID_fk;
ALTER TABLE jiveThreadProp ADD CONSTRAINT FOREIGN KEY (threadID) REFERENCES jiveThread constraint jiveThreadProp_threadID_fk;
ALTER TABLE jiveMessage ADD CONSTRAINT FOREIGN KEY (threadID) REFERENCES jiveThread constraint jiveMessage_threadID_fk;
ALTER TABLE jiveMessage ADD CONSTRAINT FOREIGN KEY (forumID) REFERENCES jiveForum constraint jiveMessage_forumID_fk;
ALTER TABLE jiveMessageProp ADD CONSTRAINT FOREIGN KEY (messageID) REFERENCES jiveMessage constraint jiveMessageProp_msgID_fk;
ALTER TABLE jiveRating ADD CONSTRAINT FOREIGN KEY (score) REFERENCES jiveRatingType constraint jiveRating_score_fk;
ALTER TABLE jivePollOption ADD CONSTRAINT FOREIGN KEY (pollID) REFERENCES jivePoll constraint jivePollOption_pollID_fk;
ALTER TABLE jivePollVote ADD CONSTRAINT FOREIGN KEY (pollID) REFERENCES jivePoll constraint jivePollVote_pollID_fk;
ALTER TABLE jiveSearchCriteria ADD CONSTRAINT FOREIGN KEY (searchID) REFERENCES jiveSearch constraint jiveSearchCriteria_sID_fk;
ALTER TABLE jiveSearchClick ADD CONSTRAINT FOREIGN KEY (searchID) REFERENCES jiveSearch constraint jiveSearchClick_searchID_fk;
ALTER TABLE jiveNNTPReadStatSession ADD CONSTRAINT FOREIGN KEY (sessionID) REFERENCES jiveReadStatSession constraint jiveNNTPReadStatSession_sID_fk;
ALTER TABLE jiveHTTPReadStatSession ADD CONSTRAINT FOREIGN KEY (sessionID) REFERENCES jiveReadStatSession constraint jiveHTTPReadStatSession_sID_fk;


insert into jiveID values (0, 1);
insert into jiveID values (1, 1);
insert into jiveID values (2, 1);
insert into jiveID values (3, 2);
insert into jiveID values (4, 1);
insert into jiveID values (13, 1);
insert into jiveID values (14, 2);
insert into jiveID values (18, 1);
insert into jiveID values (19, 1);
insert into jiveID values (20, 1);
insert into jiveID values (22, 1);
insert into jiveID values (23, 1);
insert into jiveID values (24, 1);
insert into jiveID values (201, 1);
insert into jiveID values (202, 1);

insert into jiveUser (userID,name,username,passwordHash,email,emailVisible,nameVisible,creationDate,modificationDate)
    values (1,'Administrator','admin','21232f297a57a5a743894a0e4a801fc3','admin@example.com',1,1,'0','0');

insert into jiveUserPerm(objectType, objectID, userID, permissionType, permission) values (17, -1, 1, 1, 59);
insert into jiveUserPerm(objectType, objectID, userID, permissionType, permission) values (17, -1, -1, 1, 0);
insert into jiveUserPerm(objectType, objectID, userID, permissionType, permission) values (17, -1, 0, 1, 1);
insert into jiveUserPerm(objectType, objectID, userID, permissionType, permission) values (17, -1, 0, 1, 2);
insert into jiveUserPerm(objectType, objectID, userID, permissionType, permission) values (17, -1, 0, 1, 5);
insert into jiveUserPerm(objectType, objectID, userID, permissionType, permission) values (17, -1, 0, 1, 10);

insert into jiveCategory values (1, 'root', ' ', '0', '0', 1, 2);

