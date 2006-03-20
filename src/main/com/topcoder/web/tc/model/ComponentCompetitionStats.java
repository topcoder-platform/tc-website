package com.topcoder.web.tc.model;

public class ComponentCompetitionStats {

    private GeneralStats general;
    private SubmissionDetails java;
    private SubmissionDetails dotNet;
    private SubmissionDetails total;

    public ComponentCompetitionStats() {
    }

    public void setGeneral(GeneralStats design) {
        this.general = design;
    }

    public GeneralStats getGeneral() {
        return general;
    }

    public void setJava(SubmissionDetails designJava) {
        this.java = designJava;
    }

    public SubmissionDetails getJava() {
        return java;
    }

    public void setDotNet(SubmissionDetails designDotNet) {
        this.dotNet = designDotNet;
    }

    public SubmissionDetails getDotNet() {
        return dotNet;
    }

    public void setTotal(SubmissionDetails designTotal) {
        this.total = designTotal;
    }

    public SubmissionDetails getTotal() {
        return total;
    }

}

