package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;
import java.util.ArrayList;

public final class ContactSubject
        implements Serializable, TagRenderer, QueryCriteria {

    private int ContactSubjectId;
    private String SubjectDesc;
    private String ActiveInd;

    public ContactSubject() {
        ContactSubjectId = 0;
        SubjectDesc = "";
        ActiveInd = "";
    }


    public ArrayList getCriteria(Object obj) {
        ArrayList result = new ArrayList(3);
        ContactSubject other = (ContactSubject) obj;
        if (this.getContactSubjectId() != other.getContactSubjectId()) {
            String[] criteria = {"int", "contact_subjects", "contact_subject_id", Integer.toString(this.getContactSubjectId())};
            result.add(criteria);
        }
        if (!this.getSubjectDesc().equals(other.getSubjectDesc())) {
            String[] criteria = {"String", "contact_subjects", "subject_desc", this.getSubjectDesc()};
            result.add(criteria);
        }
        if (!this.getActiveInd().equals(other.getActiveInd())) {
            String[] criteria = {"String", "contact_subjects", "active_ind", this.getActiveInd()};
            result.add(criteria);
        }
        result.trimToSize();
        return result;
    }


// set

    public void setContactSubjectId(int ContactSubjectId) {
        this.ContactSubjectId = ContactSubjectId;
    }

    public void setSubjectDesc(String SubjectDesc) {
        this.SubjectDesc = SubjectDesc;
    }

    public void setActiveInd(String ActiveInd) {
        this.ActiveInd = ActiveInd;
    }

// get
    public int getContactSubjectId() {
        return ContactSubjectId;
    }

    public String getSubjectDesc() {
        return SubjectDesc;
    }

    public String getActiveInd() {
        return ActiveInd;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("ContactSubjects");
            result.addTag(new ValueTag("ContactSubjectId", ContactSubjectId));
            result.addTag(new ValueTag("SubjectDesc", SubjectDesc));
            result.addTag(new ValueTag("ActiveInd", ActiveInd));
        } catch (Exception e) {
            throw new Exception("common.web.data.ContactSubject getXML ERROR: " + e);
        }
        return result;
    }

}

