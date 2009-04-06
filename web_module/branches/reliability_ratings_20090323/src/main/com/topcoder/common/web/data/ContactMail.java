package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;


public class ContactMail implements Serializable, TagRenderer {

    private int MailId;
    private ContactSubject ContactSubject;
    private String FromAddress;
    private String CommentQuestion;
    private int CoderId;
    private String ResponseSent;
    private String Handle;
    private int ResponderId;
    private java.sql.Timestamp Timestamp;
    private boolean Submitted = false;

    public ContactMail() {
        MailId = 0;
        ContactSubject = new ContactSubject();
        Timestamp = null;
        FromAddress = "";
        CommentQuestion = "";
        CoderId = 0;
        ResponseSent = "";
        ResponderId = 0;
        Handle = "";
        Submitted = false;
    }

// set
    public void setMailId(int MailId) {
        this.MailId = MailId;
    }

    public void setContactSubject(ContactSubject ContactSubject) {
        this.ContactSubject = ContactSubject;
    }

    public void setFromAddress(String FromAddress) {
        this.FromAddress = FromAddress;
    }

    public void setCommentQuestion(String CommentQuestion) {
        this.CommentQuestion = CommentQuestion;
    }

    public void setCoderId(int CoderId) {
        this.CoderId = CoderId;
    }

    public void setResponseSent(String ResponseSent) {
        this.ResponseSent = ResponseSent;
    }

    public void setHandle(String Handle) {
        this.Handle = Handle;
    }

    public void setResponderId(int ResponderId) {
        this.ResponderId = ResponderId;
    }

    public void setTimestamp(java.sql.Timestamp Timestamp) {
        this.Timestamp = Timestamp;
    }

    public void setSubmitted(boolean Submitted) {
        this.Submitted = Submitted;
    }


// get
    public int getMailId() {
        return MailId;
    }

    public ContactSubject getContactSubject() {
        return ContactSubject;
    }

    public String getFromAddress() {
        return FromAddress;
    }

    public String getCommentQuestion() {
        return CommentQuestion;
    }

    public int getCoderId() {
        return CoderId;
    }

    public String getResponseSent() {
        return ResponseSent;
    }

    public String getHandle() {
        return Handle;
    }

    public int getResponderId() {
        return ResponderId;
    }

    public java.sql.Timestamp getTimestamp() {
        return Timestamp;
    }

    public boolean getSubmitted() {
        return Submitted;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("ContactMail");
            result.addTag(new ValueTag("MailId", MailId));
            result.addTag(ContactSubject.getXML());
            result.addTag(new ValueTag("FromAddress", FromAddress));
            result.addTag(new ValueTag("CommentQuestion", CommentQuestion));
            result.addTag(new ValueTag("CoderId", CoderId));
            result.addTag(new ValueTag("Handle", Handle));
            result.addTag(new ValueTag("ResponseSent", ResponseSent));
            result.addTag(new ValueTag("Timestamp", Timestamp));
            result.addTag(new ValueTag("ResponderId", ResponderId));
            result.addTag(new ValueTag("Submitted", Submitted));
        } catch (Exception e) {
            throw new Exception("common.web.dataContactMail getXML ERROR: " + e);
        }
        return result;
    }

}

