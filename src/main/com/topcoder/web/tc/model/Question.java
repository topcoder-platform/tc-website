package com.topcoder.web.tc.model;

import java.util.List;
import java.io.Serializable;

public class Question implements Serializable {
    public static final int SINGLE_CHOICE = 1;
    public static final int MULTIPLE_CHOICE = 2;
    public static final int LONG_ANSWER = 3;
    public static final int SHORT_ANSWER = 4;

    private long id;
    private int typeId;
    private int styleId;
    private String text;
    private boolean isRequired;
    private List answerInfo;
    private String imagePath;

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

    public boolean isRequired() {
        return isRequired;
    }

    public void setRequired(boolean required) {
        isRequired = required;
    }

    public List getAnswerInfo() {
        return answerInfo;
    }

    public void setAnswerInfo(List answerInfo) {
        this.answerInfo = answerInfo;
    }

    public boolean isFreeForm() {
         return isFreeForm(styleId);
    }

    public static boolean isFreeForm(int styleId) {
        return (styleId==Question.LONG_ANSWER||styleId==Question.SHORT_ANSWER);
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

}
