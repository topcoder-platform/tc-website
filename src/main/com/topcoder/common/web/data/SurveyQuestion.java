package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;
import java.util.ArrayList;

public final class SurveyQuestion implements Serializable, TagRenderer {

    private int QuestionId;
    private String QuestionText;
    private String QuestionStatus;
    private String Keyword;
    private int SurveyId;
    private QuestionType questionType;
    private ArrayList SurveyAnswers; //ArrayList of SurveyAnswer
    private String Modified;

    public SurveyQuestion() {
        QuestionId = 0;
        QuestionText = "";
        QuestionStatus = "";
        Keyword = "";
        SurveyId = 0;
        questionType = new QuestionType();
        SurveyAnswers = new ArrayList();
        Modified = "";
    }


// set

    public void setQuestionId(int QuestionId) {
        this.QuestionId = QuestionId;
    }

    public void setQuestionText(String QuestionText) {
        this.QuestionText = QuestionText;
    }

    public void setQuestionStatus(String QuestionStatus) {
        this.QuestionStatus = QuestionStatus;
    }

    public void setKeyword(String Keyword) {
        this.Keyword = Keyword;
    }

    public void setSurveyId(int SurveyId) {
        this.SurveyId = SurveyId;
    }

    public void setQuestionType(QuestionType questionType) {
        this.questionType = questionType;
    }

    public void setSurveyAnswers(ArrayList SurveyAnswers) {
        this.SurveyAnswers = SurveyAnswers;
    }

    public void setModified(String Modified) {
        this.Modified = Modified;
    }


// get

    public int getQuestionId() {
        return this.QuestionId;
    }

    public String getQuestionText() {
        return this.QuestionText;
    }

    public String getQuestionStatus() {
        return this.QuestionStatus;
    }

    public String getKeyword() {
        return this.Keyword;
    }

    public int getSurveyId() {
        return this.SurveyId;
    }

    public QuestionType getQuestionType() {
        return this.questionType;
    }

    public ArrayList getSurveyAnswers() {
        return this.SurveyAnswers;
    }

    public String getModified() {
        return this.Modified;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        SurveyAnswer surveyAnswer = null;
        try {
            result = new RecordTag("SurveyQuestion");
            result.addTag(new ValueTag("QuestionId", QuestionId));
            result.addTag(new ValueTag("QuestionText", QuestionText));
            result.addTag(new ValueTag("QuestionStatus", QuestionStatus));
            result.addTag(new ValueTag("Keyword", Keyword));
            result.addTag(new ValueTag("SurveyId", SurveyId));
            result.addTag(questionType.getXML());
            for (int i = 0; i < this.SurveyAnswers.size(); i++) {
                surveyAnswer = (SurveyAnswer) this.SurveyAnswers.get(i);
                result.addTag(surveyAnswer.getXML());
            }
            result.addTag(new ValueTag("Modified", Modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.Survey getXML ERROR: " + e);
        }
        return result;
    }

}

