package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;


public final class CoderSkill
        implements Serializable, Cloneable, Comparable, TagRenderer, Modifiable {

    private int CoderId;
    private Skill Skill;
    private int Ranking;
    private String Modified;

    public CoderSkill() {
        CoderId = 0;
        Skill = new Skill();
        Ranking = 0;
        Modified = "";
    }

    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        CoderSkill result = null;
        try {
            result = new CoderSkill();
            result.setCoderId(getCoderId());
            result.setSkill((Skill) getSkill().clone());
            result.setRanking(getRanking());
            result.setModified(getModified());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int compareTo(Object other) {
        CoderSkill otherSkill = (CoderSkill) other;
        String temp = new Integer(this.getSkill().getSkillType().getSkillTypeId()).toString();
        String thisComparator = temp;
        temp = "";
        temp = new Integer(otherSkill.getSkill().getSkillType().getSkillTypeId()).toString();
        String otherComparator = temp;
        return thisComparator.compareToIgnoreCase(otherComparator);
    }

    public void toggleModified() {
        if (getModified().equals("S")) setModified("U");
        if (getModified().equals("")) setModified("A");
    }


// set
    public void setAllModifiedStable() throws Exception {
        setModified("S");
    }

    public void setCoderId(int CoderId) {
        this.CoderId = CoderId;
    }

    public void setSkill(Skill Skill) {
        this.Skill = Skill;
    }

    public void setRanking(int Ranking) {
        this.Ranking = Ranking;
    }


    public void setModified(String modified) {
        this.Modified = modified;
    }

// get
    public int getCoderId() {
        return CoderId;
    }

    public Skill getSkill() {
        return Skill;
    }

    public int getRanking() {
        return Ranking;
    }


    public String getModified() {
        return Modified;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("CoderSkill");
            result.addTag(new ValueTag("CoderId", CoderId));
            result.addTag(Skill.getXML());
            result.addTag(new ValueTag("Ranking", Ranking));
            result.addTag(new ValueTag("Modified", Modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.CoderSkill getXML ERROR: " + e);
        }
        return result;
    }

}

