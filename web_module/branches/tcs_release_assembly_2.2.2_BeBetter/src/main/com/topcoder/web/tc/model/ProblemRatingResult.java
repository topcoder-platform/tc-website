package com.topcoder.web.tc.model;

public class ProblemRatingResult {
    private String question;
    private int overallCount;
    private int div1Count;
    private int div2Count;
    private float overallAverage;
    private float div1Average;
    private float div2Average;

    public ProblemRatingResult() {

    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public Integer getOverallCount() {
        return new Integer(overallCount);
    }

    public void setOverallCount(int overallCount) {
        this.overallCount = overallCount;
    }

    public Integer getDiv1Count() {
        return new Integer(div1Count);
    }

    public void setDiv1Count(int div1Count) {
        this.div1Count = div1Count;
    }

    public Integer getDiv2Count() {
        return new Integer(div2Count);
    }

    public void setDiv2Count(int div2Count) {
        this.div2Count = div2Count;
    }

    public Float getOverallAverage() {
        return new Float(overallAverage);
    }

    public void setOverallAverage(float overallAverage) {
        this.overallAverage = overallAverage;
    }

    public Float getDiv1Average() {
        return new Float(div1Average);
    }

    public void setDiv1Average(float div1Average) {
        this.div1Average = div1Average;
    }

    public Float getDiv2Average() {
        return new Float(div2Average);
    }

    public void setDiv2Average(float div2Average) {
        this.div2Average = div2Average;
    }
}
