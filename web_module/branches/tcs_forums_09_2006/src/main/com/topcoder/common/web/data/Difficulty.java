package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;


public final class Difficulty implements Serializable, TagRenderer, Cloneable {

    private int DifficultyId;
    private String DifficultyLevel;
    private String DifficultyDesc;


    public Object clone() throws CloneNotSupportedException, OutOfMemoryError {
        Difficulty result = null;
        try {
            result = new Difficulty();
            result.setDifficultyId(getDifficultyId());
            result.setDifficultyLevel(getDifficultyLevel());
            result.setDifficultyDesc(getDifficultyDesc());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    public Difficulty() {
        DifficultyId = 0;
        DifficultyLevel = "";
        DifficultyDesc = "";
    }

// set
    public void setDifficultyId(int DifficultyId) {
        this.DifficultyId = DifficultyId;
    }

    public void setDifficultyLevel(String DifficultyLevel) {
        this.DifficultyLevel = DifficultyLevel;
    }

    public void setDifficultyDesc(String DifficultyDesc) {
        if (DifficultyDesc != null) this.DifficultyDesc = DifficultyDesc;
    }


// get
    public int getDifficultyId() {
        return DifficultyId;
    }

    public String getDifficultyLevel() {
        return DifficultyLevel;
    }

    public String getDifficultyDesc() {
        return DifficultyDesc;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Difficulty");
            result.addTag(new ValueTag("DifficultyId", DifficultyId));
            result.addTag(new ValueTag("DifficultyLevel", DifficultyLevel));
            result.addTag(new ValueTag("DifficultyDesc", DifficultyDesc));
        } catch (Exception e) {
            throw new Exception("common.web.data.Difficulty getXML ERROR: " + e);
        }
        return result;
    }

}

