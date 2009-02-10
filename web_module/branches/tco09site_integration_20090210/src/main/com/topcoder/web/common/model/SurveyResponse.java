package com.topcoder.web.common.model;

import java.io.Serializable;

public class SurveyResponse implements Serializable {
    private long userId;
    private long questionId;
    private long answerId;
    private String text;
    private boolean freeForm;

    public SurveyResponse() {
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }

    public long getAnswerId() {
        return answerId;
    }

    public void setAnswerId(long answerId) {
        this.answerId = answerId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public boolean isFreeForm() {
        return freeForm;
    }

    public void setFreeForm(boolean freeForm) {
        this.freeForm = freeForm;
    }
}
