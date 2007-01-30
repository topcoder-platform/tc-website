package com.topcoder.web.common.model;

import java.io.Serializable;
import java.util.*;

public class Question implements Serializable {
    public static final int SINGLE_CHOICE = 1;
    public static final int MULTIPLE_CHOICE = 2;
    public static final int LONG_ANSWER = 3;
    public static final int SHORT_ANSWER = 4;

    public static final int GENERAL_DO_NOT_SHOW_RESULTS_TYPE = 6;
    public static final int SCHULZE_ELECTION_TYPE = 7;

    private long id;
    private int typeId;
    private int styleId;
    private String text;
    private boolean required;
    private List answerInfo;
    private String imagePath;
    private String link;
    private int statusId;
    private String keyword;
    private QuestionType type;
    private QuestionStyle style;
    private Set answers;
    private Set surveys;
    private Set events;

    public Question() {
        answers = new TreeSet();
        surveys = new HashSet();
        events = new HashSet();

    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public QuestionType getType() {
        return type;
    }

    public void setType(QuestionType type) {
        this.type = type;
    }

    public QuestionStyle getStyle() {
        return style;
    }

    public void setStyle(QuestionStyle style) {
        this.style = style;
    }

    public Set getAnswers() {
        return Collections.unmodifiableSet(answers);
    }

    public void setAnswers(Set answers) {
        this.answers = answers;
    }

    public Set getSurveys() {
        return Collections.unmodifiableSet(surveys);
    }

    public void setSurveys(Set surveys) {
        this.surveys = surveys;
    }

    public Set getEvents() {
        return Collections.unmodifiableSet(events);
    }

    public void setEvents(Set events) {
        this.events = events;
    }


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
        return required;
    }

    public void setRequired(boolean required) {
        this.required = required;
    }

    public List getAnswerInfo() {
        return new ArrayList(answers);
    }

    public void setAnswerInfo(List answerInfo) {
        this.answerInfo = answerInfo;
    }

    public boolean isFreeForm() {
        return isFreeForm(styleId);
    }

    public static boolean isFreeForm(int styleId) {
        return (styleId == Question.LONG_ANSWER || styleId == Question.SHORT_ANSWER);
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

}
