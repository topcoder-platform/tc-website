package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;
import com.topcoder.shared.util.logging.Logger;

import java.io.Serializable;

public final class CoderConfirmation implements Serializable, TagRenderer, Modifiable {

    private int coderId;
    private int contestId;
    private String code;
    private String modified;

    private static Logger log = Logger.getLogger(CoderConfirmation.class);

    public CoderConfirmation() {
        coderId = 0;
        contestId = 0;
        code = "";
        modified = "";
    }

    public void toggleModified() {
        if (getModified().equals("S")) setModified("U");
        if (getModified().equals("")) setModified("A");
    }

    public void setAllModifiedStable() throws Exception {
        setModified("S");
    }

    public void setCoderId(int coderId) {
        this.coderId = coderId;
    }

    public void setContestId(int contestId) {
        this.contestId = contestId;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }


    public int getCoderId() {
        return coderId;
    }

    public int getContestId() {
        return contestId;
    }

    public String getCode() {
        return code;
    }

    public String getModified() {
        return modified;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("CoderConfirmation");
            result.addTag(new ValueTag("CoderId", coderId));
            result.addTag(new ValueTag("ContestId", contestId));
            result.addTag(new ValueTag("Code", code));
            result.addTag(new ValueTag("Modified", modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.CoderConfirmation getXML ERROR: " + e);
        }
        return result;
    }

}

