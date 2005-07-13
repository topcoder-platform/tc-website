package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.util.ArrayList;

public class CorporateContact
        implements Serializable, TagRenderer, QueryCriteria {

    private int CorporateContactId;
    private ContactSubject ContactSubject;
    private String CompanyName;
    private int CompanySize;
    private String FirstName;
    private String MiddleName;
    private String LastName;
    private String Title;
    private String Phone;
    private String Email;
    private String Comment;
    private String ResponseSent;
    private java.sql.Timestamp Timestamp;
    private int ResponderId;
    private String StateCode;
    private String Modified;

    public CorporateContact() {
        CorporateContactId = 0;
        ContactSubject = new ContactSubject();
        CompanyName = "";
        CompanySize = 0;
        FirstName = "";
        MiddleName = "";
        LastName = "";
        Title = "";
        Phone = "";
        Email = "";
        Comment = "";
        ResponseSent = "";
        Timestamp = null;
        ResponderId = 0;
        StateCode = "";
        Modified = "";
    }

    public boolean equals(Object obj) {
        boolean result = false;
        CorporateContact other = (CorporateContact) obj;
        if (
                this.getCorporateContactId() == other.getCorporateContactId()
                && this.getContactSubject().equals(other.getContactSubject())
                && this.getCompanyName().equals(other.getCompanyName())
                && this.getCompanySize() == other.getCompanySize()
                && this.getFirstName().equals(other.getFirstName())
                && this.getMiddleName().equals(other.getMiddleName())
                && this.getLastName().equals(other.getLastName())
                && this.getTitle().equals(other.getTitle())
                && this.getPhone().equals(other.getPhone())
                && this.getEmail().equals(other.getEmail())
                && this.getComment().equals(other.getComment())
                && this.getResponseSent().equals(other.getResponseSent())
                && this.getTimestamp().equals(other.getTimestamp())
                && this.getResponderId() == other.getResponderId()
                && this.getStateCode().equals(other.getStateCode())
        ) {
            result = true;
        }
        return result;
    }


    public ArrayList getCriteria(Object obj) {
        ArrayList result = new ArrayList(23);
        CorporateContact other = (CorporateContact) obj;
        if (this.getCorporateContactId() != other.getCorporateContactId()) {
            String[] criteria = {"int", "subscriber_request", "mail_id", Integer.toString(this.getCorporateContactId())};
            result.add(criteria);
        }
        result.addAll(this.getContactSubject().getCriteria(other.getContactSubject()));
        if (!this.getCompanyName().equals(other.getCompanyName())) {
            String[] criteria = {"String", "subscriber_request", "company_name", this.getCompanyName()};
            result.add(criteria);
        }
        if (this.getCompanySize() != other.getCompanySize()) {
            String[] criteria = {"int", "subscriber_request", "company_size", Integer.toString(this.getCompanySize())};
            result.add(criteria);
        }
        if (!this.getFirstName().equals(other.getFirstName())) {
            String[] criteria = {"String", "subscriber_request", "first_name", this.getFirstName()};
            result.add(criteria);
        }
        if (!this.getMiddleName().equals(other.getMiddleName())) {
            String[] criteria = {"String", "subscriber_request", "middle_name", this.getMiddleName()};
            result.add(criteria);
        }
        if (!this.getLastName().equals(other.getLastName())) {
            String[] criteria = {"String", "subscriber_request", "last_name", this.getLastName()};
            result.add(criteria);
        }
        if (!this.getTitle().equals(other.getTitle())) {
            String[] criteria = {"String", "subscriber_request", "title", this.getTitle()};
            result.add(criteria);
        }
        if (!this.getPhone().equals(other.getPhone())) {
            String[] criteria = {"String", "subscriber_request", "phone", this.getPhone()};
            result.add(criteria);
        }
        if (!this.getEmail().equals(other.getEmail())) {
            String[] criteria = {"String", "contact", "email", this.getEmail()};
            result.add(criteria);
        }
        if (!this.getComment().equals(other.getComment())) {
            String[] criteria = {"String", "subscriber_request", "comment", this.getComment()};
            result.add(criteria);
        }
        if (!this.getResponseSent().equals(other.getResponseSent())) {
            String[] criteria = {"String", "subscriber_request", "response_sent", this.getResponseSent()};
            result.add(criteria);
        }
        if (this.getTimestamp() != null) {
            String[] criteria = {"java.sql.Timestamp", "subscriber_request", "timestamp", this.getTimestamp().toString()};
            result.add(criteria);
        }
        if (this.getResponderId() != other.getResponderId()) {
            String[] criteria = {"int", "subscriber_request", "responder_id", Integer.toString(this.getResponderId())};
            result.add(criteria);
        }
        if (!this.getStateCode().equals(other.getStateCode())) {
            String[] criteria = {"String", "subscriber_request", "state_code", this.getStateCode()};
            result.add(criteria);
        }
        result.trimToSize();
        return result;
    }


// set
    public void setCorporateContactId(int CorporateContactId) {
        this.CorporateContactId = CorporateContactId;
    }

    public void setContactSubject(ContactSubject ContactSubject) {
        this.ContactSubject = ContactSubject;
    }

    public void setCompanyName(String CompanyName) {
        this.CompanyName = CompanyName;
    }

    public void setCompanySize(int CompanySize) {
        this.CompanySize = CompanySize;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public void setMiddleName(String MiddleName) {
        this.MiddleName = MiddleName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setComment(String Comment) {
        this.Comment = Comment;
    }

    public void setResponseSent(String ResponseSent) {
        this.ResponseSent = ResponseSent;
    }

    public void setTimestamp(java.sql.Timestamp Timestamp) {
        this.Timestamp = Timestamp;
    }

    public void setResponderId(int ResponderId) {
        this.ResponderId = ResponderId;
    }

    public void setStateCode(String StateCode) {
        this.StateCode = StateCode;
    }

    public void setModified(String Modified) {
        this.Modified = Modified;
    }


// get
    public int getCorporateContactId() {
        return CorporateContactId;
    }

    public ContactSubject getContactSubject() {
        return ContactSubject;
    }

    public String getCompanyName() {
        return CompanyName;
    }

    public int getCompanySize() {
        return CompanySize;
    }

    public String getFirstName() {
        return FirstName;
    }

    public String getMiddleName() {
        return MiddleName;
    }

    public String getLastName() {
        return LastName;
    }

    public String getTitle() {
        return Title;
    }

    public String getPhone() {
        return Phone;
    }

    public String getEmail() {
        return Email;
    }

    public String getComment() {
        return Comment;
    }

    public String getResponseSent() {
        return ResponseSent;
    }

    public java.sql.Timestamp getTimestamp() {
        return Timestamp;
    }

    public int getResponderId() {
        return ResponderId;
    }

    public String getStateCode() {
        return StateCode;
    }

    public String getModified() {
        return Modified;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("CorporateContact");
            result.addTag(new ValueTag("CorporateContactId", CorporateContactId));
            result.addTag(ContactSubject.getXML());
            result.addTag(new ValueTag("CompanyName", CompanyName));
            result.addTag(new ValueTag("CompanySize", CompanySize));
            result.addTag(new ValueTag("FirstName", FirstName));
            result.addTag(new ValueTag("MiddleName", MiddleName));
            result.addTag(new ValueTag("LastName", LastName));
            result.addTag(new ValueTag("Title", Title));
            result.addTag(new ValueTag("Phone", Phone));
            result.addTag(new ValueTag("Email", Email));
            result.addTag(new ValueTag("Comment", Comment));
            result.addTag(new ValueTag("ResponseSent", ResponseSent));
            result.addTag(new ValueTag("Timestamp", Timestamp));
            result.addTag(new ValueTag("ResponderId", ResponderId));
            result.addTag(new ValueTag("StateCode", StateCode));
            result.addTag(new ValueTag("Modified", Modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.CorporateContact getXML ERROR: " + e);
        }
        return result;
    }

}

