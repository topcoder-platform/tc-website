package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;

public final class SurveyAnswer implements Serializable, TagRenderer {

    private int AnswerId;
    private int QuestionId;
    private String AnswerText;
    private int SortOrder;
    private String Modified;

    public SurveyAnswer() {
        AnswerId = 0;
        QuestionId = 0;
        AnswerText = "";
        SortOrder = 0;
        Modified = "";
    }


// set

    public void setAnswerId(int AnswerId) {
        this.AnswerId = AnswerId;
    }

    public void setQuestionId(int QuestionId) {
        this.QuestionId = QuestionId;
    }

    public void setAnswerText(String AnswerText) {
        this.AnswerText = AnswerText;
    }

    public void setSortOrder(int SortOrder) {
        this.SortOrder = SortOrder;
    }

    public void setModified(String Modified) {
        this.Modified = Modified;
    }


// get

    public int getAnswerId() {
        return this.AnswerId;
    }

    public int getQuestionId() {
        return this.QuestionId;
    }

    public String getAnswerText() {
        return this.AnswerText;
    }

    public int getSortOrder() {
        return this.SortOrder;
    }

    public String getModified() {
        return this.Modified;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        SurveyAnswer surveyAnswer = null;
        try {
            result = new RecordTag("SurveyAnswer");
            result.addTag(new ValueTag("AnswerId", AnswerId));
            result.addTag(new ValueTag("QuestionId", QuestionId));
            result.addTag(new ValueTag("AnswerText", AnswerText));
            result.addTag(new ValueTag("SortOrder", SortOrder));
            result.addTag(new ValueTag("Modified", Modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.Survey getXML ERROR: " + e);
        }
        return result;
    }

}