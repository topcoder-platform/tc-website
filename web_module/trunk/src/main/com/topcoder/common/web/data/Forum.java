package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;
import com.topcoder.shared.util.logging.Logger;

import java.io.Serializable;

public final class Forum implements Serializable, TagRenderer {

    private int ForumId;
    private String ForumName;
    private String ForumDescription;
    private int ForumThreads;
    private int ForumMessages;
    private java.sql.Date ForumUpdated;
    private static Logger log = Logger.getLogger(Forum.class);

    public Forum() {
        ForumId = 0;
        ForumName = "";
        ForumDescription = "";
        ForumThreads = 0;
        ForumMessages = 0;
        ForumUpdated = null;
    }

/*
  public Object clone()
    throws CloneNotSupportedException, OutOfMemoryError {
    Forum result = null;
    try {
      result = new Forum();
      result.setForumId( getForumId() );
      result.setForumName( getForumName() );
      result.setForumDescription( getForumDescription() );
      result.setForumThreads( getForumThreads() );
      result.setForumMessages( getForumMessages() );
      result.setForumUpdated( getForumUpdated() );
    } catch (Exception e) {
      log.debug("common.attr.Forum:clone:ERROR:\n"+e);
    }
    return result;
  }
*/


    public void setForumId(int ForumId) {
        this.ForumId = ForumId;
    }

    public void setForumName(String ForumName) {
        this.ForumName = ForumName;
    }

    public void setForumDescription(String ForumDescription) {
        this.ForumDescription = ForumDescription;
    }

    public void setForumThreads(int ForumThreads) {
        this.ForumThreads = ForumThreads;
    }

    public void setForumMessages(int ForumMessages) {
        this.ForumMessages = ForumMessages;
    }

    public void setForumUpdated(java.sql.Date ForumUpdated) {
        this.ForumUpdated = ForumUpdated;
    }

    public int getForumId() {
        return ForumId;
    }

    public String getForumName() {
        return ForumName;
    }

    public String getForumDescription() {
        return ForumDescription;
    }

    public int getForumThreads() {
        return ForumThreads;
    }

    public int getForumMessages() {
        return ForumMessages;
    }

    public java.sql.Date getForumUpdated() {
        return ForumUpdated;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Forum");
            result.addTag(new ValueTag("ForumId", ForumId));
            result.addTag(new ValueTag("ForumName", ForumName));
            result.addTag(new ValueTag("ForumDescription", ForumDescription));
            result.addTag(new ValueTag("ForumThreads", ForumThreads));
            result.addTag(new ValueTag("ForumMessages", ForumMessages));
            result.addTag(new ValueTag("ForumUpdated", ForumUpdated));
        } catch (Exception e) {
            throw new Exception("common.web.data.Forum getXML ERROR: " + e);
        }
        return result;
    }

}

