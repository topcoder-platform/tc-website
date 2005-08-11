package com.topcoder.web.forums.model;

import java.util.Date;

public class Revision {
    private int ID;
    private int messageID;
    private String subject;
    private String body;
    private Date modificationDate;
    
    public int ID() {
        return ID;
    }
    public int getMessageID() {
        return messageID;
    }
    public String getSubject() {
        return subject;
    }
    public String getBody() {
        return body;
    }
    public Date getModificationDate() {
        return modificationDate;
    }
    
    public Revision(int ID, int messageID, String subject, String body, Date modificationDate) {
        this.ID = ID;
        this.messageID = messageID;
        this.subject = subject;
        this.body = body;
        this.modificationDate = modificationDate;
    }
}