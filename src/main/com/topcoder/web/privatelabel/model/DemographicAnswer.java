package com.topcoder.web.privatelabel.model;

public class DemographicAnswer implements Comparable {
    private long demographicQuestionId;
    private long demographicAnswerId;
    private String demographicAnswerText;
    private int sort;

    public DemographicAnswer() {}

    public Object clone() throws OutOfMemoryError {
        DemographicAnswer ret = new DemographicAnswer();
        ret.setDemographicAnswerId(demographicAnswerId);
        ret.setDemographicQuestionId(demographicQuestionId);
        ret.setDemographicAnswerText(demographicAnswerText);
        ret.setSort(sort);
        return ret;
    }

    public long getDemographicQuestionId() {
        return demographicQuestionId;
    }

    public void setDemographicQuestionId(long demographicQuestionId) {
        this.demographicQuestionId = demographicQuestionId;
    }

    public long getDemographicAnswerId() {
        return demographicAnswerId;
    }

    public void setDemographicAnswerId(long demographicAnswerId) {
        this.demographicAnswerId = demographicAnswerId;
    }

    public String getDemographicAnswerText() {
        return demographicAnswerText;
    }

    public void setDemographicAnswerText(String demographicAnswerText) {
        this.demographicAnswerText = demographicAnswerText;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public int compareTo(Object o) {
        DemographicAnswer other = (DemographicAnswer)o;
        return new Integer(getSort()).compareTo(new Integer(other.getSort()));
    }


}
