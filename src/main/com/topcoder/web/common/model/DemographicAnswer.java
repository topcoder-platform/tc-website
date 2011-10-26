package com.topcoder.web.common.model;

public class DemographicAnswer extends Base implements Comparable {
    public static final String DECLINE = "Decline to Answer";
    public static final String FREE_FORM = "Free Form";
    private Long id;

    private DemographicQuestion question;
    private String text;
    private Integer sort;
    private String status;


    public DemographicAnswer() {
    }

    public Long getId() {
        return id;
    }

    public DemographicQuestion getQuestion() {
        return question;
    }

    public String getText() {
        return text;
    }

    public Integer getSort() {
        return sort;
    }

    public String getStatus() {
        return status;
    }


    public void setId(Long id) {
        this.id = id;
    }

    public void setQuestion(DemographicQuestion question) {
        this.question = question;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public int compareTo(Object o) {
        DemographicAnswer other = (DemographicAnswer) o;
        return sort.compareTo(other.getSort());
    }
}
