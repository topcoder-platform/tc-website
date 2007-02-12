package com.topcoder.web.common.model;

import java.io.Serializable;

public class Answer implements Serializable, Cloneable, Comparable {
    private long id;
    private long questionId;
    private Question question;
    private String text;
    private int sort;
    private boolean correct;

    public Answer() {
    }

    public Object clone() throws OutOfMemoryError {
        Answer ret = new Answer();
        ret.setId(id);
        ret.setQuestionId(questionId);
        ret.setText(text);
        ret.setSort(sort);
        return ret;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }


    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public boolean isCorrect() {
        return correct;
    }

    public void setCorrect(boolean correct) {
        this.correct = correct;
    }

    public int compareTo(Object o) {
        Answer other = (Answer) o;
        return new Integer(getSort()).compareTo(new Integer(other.getSort()));
    }
}
