package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;

public class DemographicAnswer implements Cloneable, Serializable, TagRenderer {


    private int demographicQuestionId;
    private int demographicAnswerId;
    private String demographicAnswerText;
    private String status;


    public DemographicAnswer() {
        demographicQuestionId = 0;
        demographicAnswerId = 0;
        demographicAnswerText = "";
        status = "";
    }

    public DemographicAnswer(
            int demographicQuestionId
            , int demographicAnswerId
            , String demographicAnswerText
            , String status
            ) {
        this.demographicQuestionId = demographicQuestionId;
        this.demographicAnswerId = demographicAnswerId;
        this.demographicAnswerText = demographicAnswerText;
        this.status = status;
    }

    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        DemographicAnswer result = null;
        try {
            result = new DemographicAnswer();
            result.setDemographicQuestionId(getDemographicQuestionId());
            result.setDemographicAnswerId(getDemographicAnswerId());
            result.setDemographicAnswerText(getDemographicAnswerText());
            result.setStatus(getStatus());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    //Set
    public void setDemographicQuestionId(int demographicQuestionId) {
        this.demographicQuestionId = demographicQuestionId;
    }

    public void setDemographicAnswerId(int demographicAnswerId) {
        this.demographicAnswerId = demographicAnswerId;
    }

    public void setDemographicAnswerText(String demographicAnswerText) {
        this.demographicAnswerText = demographicAnswerText;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    // Get
    public int getDemographicQuestionId() {
        return demographicQuestionId;
    }

    public int getDemographicAnswerId() {
        return demographicAnswerId;
    }

    public String getDemographicAnswerText() {
        return demographicAnswerText;
    }

    public String getStatus() {
        return status;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("DemographicAnswer");
            result.addTag(new ValueTag("DemographicQuestionId", demographicQuestionId));
            result.addTag(new ValueTag("DemographicAnswerId", demographicAnswerId));
            result.addTag(new ValueTag("DemographicAnswerText", demographicAnswerText));
            result.addTag(new ValueTag("Status", status));
        } catch (Exception e) {
            throw new Exception("common.web.data.DemographicAnswer:getXML:ERROR:\n" + e);
        }
        return result;
    }


}
