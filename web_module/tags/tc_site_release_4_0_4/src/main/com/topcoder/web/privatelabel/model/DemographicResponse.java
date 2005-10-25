package com.topcoder.web.privatelabel.model;

public class DemographicResponse extends Base implements Comparable {
    private long questionId;
    private long answerId;
    private String text;
    private int sort;

    public DemographicResponse() {
    }

    public Object clone() throws OutOfMemoryError {
        DemographicResponse ret = new DemographicResponse();
        ret.setQuestionId(questionId);
        ret.setText(text);
        ret.setAnswerId(answerId);
        ret.setSort(sort);
        return ret;
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

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public int compareTo(Object o) {
        DemographicResponse other = (DemographicResponse) o;
        return new Integer(getSort()).compareTo(new Integer(other.getSort()));
    }
}
