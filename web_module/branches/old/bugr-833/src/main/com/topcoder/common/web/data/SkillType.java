package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;


public final class SkillType
        implements Serializable, Cloneable, TagRenderer {

    private int SkillTypeId;
    private String SkillTypeDesc;
    private int SkillTypeOrder;
    private String ActiveInd;

    public SkillType() {
        SkillTypeId = 0;
        SkillTypeDesc = "";
        SkillTypeOrder = 0;
        ActiveInd = "";
    }

    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        SkillType result = null;
        try {
            result = new SkillType();
            result.setSkillTypeId(getSkillTypeId());
            result.setSkillTypeDesc(getSkillTypeDesc());
            result.setSkillTypeOrder(getSkillTypeOrder());
            result.setActiveInd(getActiveInd());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


//set
    public void setSkillTypeId(int SkillTypeId) {
        this.SkillTypeId = SkillTypeId;
    }

    public void setSkillTypeDesc(String SkillTypeDesc) {
        this.SkillTypeDesc = SkillTypeDesc;
    }

    public void setSkillTypeOrder(int SkillTypeOrder) {
        this.SkillTypeOrder = SkillTypeOrder;
    }

    public void setActiveInd(String ActiveInd) {
        this.ActiveInd = ActiveInd;
    }

// get
    public int getSkillTypeId() {
        return SkillTypeId;
    }

    public String getSkillTypeDesc() {
        return SkillTypeDesc;
    }

    public int getSkillTypeOrder() {
        return SkillTypeOrder;
    }

    public String getActiveInd() {
        return ActiveInd;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("SkillType");
            result.addTag(new ValueTag("SkillTypeId", SkillTypeId));
            result.addTag(new ValueTag("SkillTypeDesc", SkillTypeDesc));
            result.addTag(new ValueTag("SkillTypeOrder", SkillTypeOrder));
            result.addTag(new ValueTag("ActiveInd", ActiveInd));
        } catch (Exception e) {
            throw new Exception("common.web.data.SkillType getXML ERROR: " + e);
        }
        return result;
    }

}

