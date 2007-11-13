package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;

public class DemographicAssignment implements Cloneable, Serializable, TagRenderer {


    private DemographicQuestion demographicQuestion;
    private CoderType coderType;
    private int sort;
    private String status;


    public DemographicAssignment() {
        demographicQuestion = new DemographicQuestion();
        coderType = new CoderType();
        sort = 0;
        status = "";
    }

    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        DemographicAssignment result = null;
        try {
            result = new DemographicAssignment();
            result.setDemographicQuestion((DemographicQuestion) getDemographicQuestion().clone());
            result.setCoderType((CoderType) getCoderType().clone());
            result.setSort(getSort());
            result.setStatus(getStatus());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    //Set
    public void setDemographicQuestion(DemographicQuestion demographicQuestion) {
        this.demographicQuestion = demographicQuestion;
    }

    public void setCoderType(CoderType coderType) {
        this.coderType = coderType;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    // Get
    public DemographicQuestion getDemographicQuestion() {
        return demographicQuestion;
    }

    public CoderType getCoderType() {
        return coderType;
    }

    public int getSort() {
        return sort;
    }

    public String getStatus() {
        return status;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("DemographicAssignment");
            result.addTag(demographicQuestion.getXML());
            result.addTag(coderType.getXML());
            result.addTag(new ValueTag("Sort", sort));
            result.addTag(new ValueTag("Status", status));
        } catch (Exception e) {
            throw new Exception("common.web.data.DemographicAssignment:getXML:ERROR:\n" + e);
        }
        return result;
    }


}
