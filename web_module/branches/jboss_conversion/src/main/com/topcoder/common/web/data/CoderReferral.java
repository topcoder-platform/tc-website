package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;


public class CoderReferral implements Serializable, TagRenderer, Modifiable {

    private long coderId;
    private Referral referral;
    private long referenceId;
    private String other;
    private String modified;

    public CoderReferral() {
        coderId = 0;
        referral = new Referral();
        referenceId = 0;
        other = "";
        modified = "";
    }

    public void toggleModified() {
        if (getModified().equals("S")) setModified("U");
        if (getModified().equals("")) setModified("A");
    }

// set
    public void setAllModifiedStable() throws Exception {
        setModified("S");
    }

    //Set
    public void setCoderId(long coderId) {
        this.coderId = coderId;
    }

    public void setReferral(Referral referral) {
        this.referral = referral;
    }

    public void setReferenceId(long referenceId) {
        this.referenceId = referenceId;
    }

    public void setOther(String other) {
        this.other = other;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }

    // Get
    public long getCoderId() {
        return coderId;
    }

    public Referral getReferral() {
        return referral;
    }

    public long getReferenceId() {
        return referenceId;
    }

    public String getOther() {
        return other;
    }

    public String getModified() {
        return modified;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("CoderReferral");
            result.addTag(new ValueTag("CoderId", coderId));
            result.addTag(referral.getXML());
            result.addTag(new ValueTag("ReferenceId", referenceId));
            result.addTag(new ValueTag("Other", other));
            result.addTag(new ValueTag("Modified", modified));
        } catch (Exception e) {
            throw new Exception("com.topcoder.common.data.CoderReferral.getXML:ERROR:\n" + e);
        }
        return result;
    }

}
