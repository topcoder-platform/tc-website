package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;

public final class Language implements Serializable, TagRenderer, Cloneable {

    private int languageId;
    private String name;
    private String status;


    public Object clone() throws CloneNotSupportedException, OutOfMemoryError {
        Language result = null;
        try {
            result = new Language();
            result.setLanguageId(getLanguageId());
            result.setName(getName());
            result.setStatus(getStatus());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    public Language() {
        languageId = 0;
        name = "";
        status = "";
    }

// set
    public void setLanguageId(int languageId) {
        this.languageId = languageId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setStatus(String status) {
        this.status = status;
    }

// get
    public int getLanguageId() {
        return languageId;
    }

    public String getName() {
        return name;
    }

    public String getStatus() {
        return status;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Language");
            result.addTag(new ValueTag("LanguageId", languageId));
            result.addTag(new ValueTag("Name", name));
            result.addTag(new ValueTag("Status", status));
        } catch (Exception e) {
            throw new Exception("common.web.data.Language getXML ERROR: " + e);
        }
        return result;
    }

}

