package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;

public final class QuestionType implements Serializable, TagRenderer {

    private int QuestionTypeId;
    private String QuestionTypeDesc;
    private String QuestionTypeStatus;
    private String Modified;

    public QuestionType() {
        QuestionTypeId = 0;
        QuestionTypeDesc = "";
        QuestionTypeStatus = "";
        Modified = "";
    }


// set

    public void setQuestionTypeId(int QuestionTypeId) {
        this.QuestionTypeId = QuestionTypeId;
    }

    public void setQuestionTypeDesc(String QuestionTypeDesc) {
        this.QuestionTypeDesc = QuestionTypeDesc;
    }

    public void setQuestionTypeStatus(String QuestionTypeStatus) {
        this.QuestionTypeStatus = QuestionTypeStatus;
    }

    public void setModified(String Modified) {
        this.Modified = Modified;
    }


// get

    public int getQuestionTypeId() {
        return this.QuestionTypeId;
    }

    public String getQuestionTypeDesc() {
        return this.QuestionTypeDesc;
    }

    public String getQuestionTypeStatus() {
        return this.QuestionTypeStatus;
    }

    public String getModified() {
        return this.Modified;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        SurveyAnswer surveyAnswer = null;
        try {
            result = new RecordTag("QuestionType");
            result.addTag(new ValueTag("QuestionTypeId", QuestionTypeId));
            result.addTag(new ValueTag("QuestionTypeDesc", QuestionTypeDesc));
            result.addTag(new ValueTag("QuestionTypeStatus", QuestionTypeStatus));
            result.addTag(new ValueTag("Modified", Modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.Survey getXML ERROR: " + e);
        }
        return result;
    }

}

