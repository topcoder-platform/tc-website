package com.topcoder.web.tc.model;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

public class Question {
    private long id;
    private int typeId;
    private int styleId;
    private String text;
    private ResultSetContainer answerInfo;

    public Question() {}

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public int getStyleId() {
        return styleId;
    }

    public void setStyleId(int styleId) {
        this.styleId = styleId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public ResultSetContainer getAnswerInfo() {
        return answerInfo;
    }

    public void setAnswerInfo(ResultSetContainer answerInfo) {
        this.answerInfo = answerInfo;
    }

}
