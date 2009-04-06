package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;


public final class Skill
        implements Serializable, Cloneable, Comparable, TagRenderer {

    private int SkillId;
    private SkillType SkillType;
    private String SkillDesc;
    private int SkillOrder;
    private String ActiveInd;

    public Skill() {
        SkillId = 0;
        SkillType = new SkillType();
        SkillDesc = "";
        SkillOrder = 0;
        ActiveInd = "";
    }

    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        Skill result = null;
        try {
            result = new Skill();
            result.setSkillId(getSkillId());
            result.setSkillType((SkillType) getSkillType().clone());
            result.setSkillDesc(getSkillDesc());
            result.setSkillOrder(getSkillOrder());
            result.setActiveInd(getActiveInd());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int compareTo(Object other) {
        Skill otherSkill = (Skill) other;
        String temp = new Integer(this.getSkillType().getSkillTypeId()).toString();
        String thisComparator = temp;
        temp = "";
        temp = new Integer(otherSkill.getSkillType().getSkillTypeId()).toString();
        String otherComparator = temp;
        return thisComparator.compareToIgnoreCase(otherComparator);
    }

// set
    public void setSkillId(int SkillId) {
        this.SkillId = SkillId;
    }

    public void setSkillType(SkillType SkillType) {
        this.SkillType = SkillType;
    }

    public void setSkillDesc(String SkillDesc) {
        this.SkillDesc = SkillDesc;
    }

    public void setSkillOrder(int SkillOrder) {
        this.SkillOrder = SkillOrder;
    }

    public void setActiveInd(String ActiveInd) {
        this.ActiveInd = ActiveInd;
    }

// get
    public int getSkillId() {
        return SkillId;
    }

    public SkillType getSkillType() {
        return SkillType;
    }

    public String getSkillDesc() {
        return SkillDesc;
    }

    public int getSkillOrder() {
        return SkillOrder;
    }

    public String getActiveInd() {
        return ActiveInd;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Skill");
            result.addTag(new ValueTag("SkillId", SkillId));
            result.addTag(SkillType.getXML());
            result.addTag(new ValueTag("SkillDesc", SkillDesc));
            result.addTag(new ValueTag("SkillOrder", SkillOrder));
            result.addTag(new ValueTag("ActiveInd", ActiveInd));
        } catch (Exception e) {
            throw new Exception("common.Skill getXML ERROR: " + e);
        }
        return result;
    }
}

