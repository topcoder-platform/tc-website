package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;
import java.util.ArrayList;

public final class Survey implements Serializable, TagRenderer {

    private int SurveyId;
    private String SurveyName;
    private java.sql.Timestamp SurveyStart;
    private java.sql.Timestamp SurveyEnd;
    private String SurveyStatus;
    private String SurveyText;
    private ArrayList SurveyQuestions; // ArrayList of SurveyQuestions
    private String Modified;

    public Survey() {
        SurveyId = 0;
        SurveyName = "";
        SurveyStart = null;
        SurveyEnd = null;
        SurveyStatus = "";
        SurveyText = "";
        SurveyQuestions = new ArrayList();
        Modified = "";
    }


// set

    public void setSurveyId(int SurveyId) {
        this.SurveyId = SurveyId;
    }

    public void setSurveyName(String SurveyName) {
        this.SurveyName = SurveyName;
    }

    public void setSurveyStart(java.sql.Timestamp SurveyStart) {
        this.SurveyStart = SurveyStart;
    }

    public void setSurveyEnd(java.sql.Timestamp SurveyEnd) {
        this.SurveyEnd = SurveyEnd;
    }

    public void setSurveyStatus(String SurveyStatus) {
        this.SurveyStatus = SurveyStatus;
    }

    public void setSurveyText(String SurveyText) {
        this.SurveyText = SurveyText;
    }

    public void setSurveyQuestions(ArrayList SurveyQuestions) {
        this.SurveyQuestions = SurveyQuestions;
    }

    public void setModified(String Modified) {
        this.Modified = Modified;
    }


// get

    public int getSurveyId() {
        return this.SurveyId;
    }

    public String getSurveyName() {
        return this.SurveyName;
    }

    public java.sql.Timestamp getSurveyStart() {
        return this.SurveyStart;
    }

    public java.sql.Timestamp getSurveyEnd() {
        return this.SurveyEnd;
    }

    public String getSurveyStatus() {
        return this.SurveyStatus;
    }

    public String getSurveyText() {
        return this.SurveyText;
    }

    public ArrayList getSurveyQuestions() {
        return this.SurveyQuestions;
    }

    public String getModified() {
        return this.Modified;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        SurveyQuestion surveyQuestion = null;
        try {
            result = new RecordTag("Survey");
            result.addTag(new ValueTag("SurveyId", SurveyId));
            result.addTag(new ValueTag("SurveyName", SurveyName));
            result.addTag(new ValueTag("SurveyStart", SurveyStart));
            result.addTag(new ValueTag("SurveyEnd", SurveyEnd));
            result.addTag(new ValueTag("SurveyStatus", SurveyStatus));
            result.addTag(new ValueTag("SurveyText", SurveyText));
            for (int i = 0; i < this.SurveyQuestions.size(); i++) {
                surveyQuestion = (SurveyQuestion) this.SurveyQuestions.get(i);
                result.addTag(surveyQuestion.getXML());
            }
            result.addTag(new ValueTag("Modified", Modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.Survey getXML ERROR: " + e);
        }
        return result;
    }

}

