package com.topcoder.common.web.data;


import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;

public final class ExperienceType
        implements
        Serializable
        , Cloneable
        , TagRenderer {

    private int ExperienceTypeId;
    private String ExperienceTypeDesc;

    public ExperienceType() {
        ExperienceTypeId = 0;
        ExperienceTypeDesc = "";
    }

    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        ExperienceType result = null;
        try {
            result = new ExperienceType();
            result.setExperienceTypeId(getExperienceTypeId());
            result.setExperienceTypeDesc(getExperienceTypeDesc());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    // set methods
    public void setExperienceTypeId(int ExperienceTypeId) {
        this.ExperienceTypeId = ExperienceTypeId;
    }

    public void setExperienceTypeDesc(String ExperienceTypeDesc) {
        this.ExperienceTypeDesc = ExperienceTypeDesc;
    }

    // get methods
    public int getExperienceTypeId() {
        return ExperienceTypeId;
    }

    public String getExperienceTypeDesc() {
        return ExperienceTypeDesc;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = getXML("ExperienceType");
        } catch (Exception e) {
            throw new Exception("common.ExperienceType getXML ERROR: " + e);
        }
        return result;
    }

    public RecordTag getXML(String name) throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag(name);
            result.addTag(new ValueTag("ExperienceTypeId", ExperienceTypeId));
            result.addTag(new ValueTag("ExperienceTypeDesc", ExperienceTypeDesc));
        } catch (Exception e) {
            throw new Exception("common.web.data.ExperienceType getXML ERROR: " + e);
        }
        return result;
    }

}

