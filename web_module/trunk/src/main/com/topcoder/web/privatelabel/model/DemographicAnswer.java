package com.topcoder.web.privatelabel.model;

public class DemographicAnswer extends Base implements Comparable {
    private long questionId;
    private long answerId;
    private String text;
    private int sort;

    public static final DemographicAnswer DELINE = new DemographicAnswer(-1, "Decline to Answer");

    public DemographicAnswer() {
    }

    private DemographicAnswer(long id, String text) {
        setAnswerId(id);
        setText(text);
    }

    public Object clone() throws OutOfMemoryError {
        DemographicAnswer ret = new DemographicAnswer();
        ret.setAnswerId(answerId);
        ret.setQuestionId(questionId);
        ret.setText(text);
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
        DemographicAnswer other = (DemographicAnswer) o;
        return new Integer(getSort()).compareTo(new Integer(other.getSort()));
    }


}
