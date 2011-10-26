package com.topcoder.web.tc.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ComponentContestDetails implements Serializable {

    private int winnerId;
    private int componentId;
    private int componentVersion;

    private String component;
    private String catalog;
    private String phaseDescription;
    private String registrants;
    private String submissions;
    private String submissionPercentage;
    private String passedScreening;
    private String passedPercentage;
    private String avgInitialScore;
    private String avgFinalScore;

    private String reviewer1;
    private String reviewer2;
    private String reviewer3;

    private List competitorDetails;

    private String componentOverview;
    private String componentFunctionality;
    private String documentUrl;

    private int unitTestCount;
    private int unitTestPassed;
    private int reviewTestCount;
    private int reviewTestPassed;

    public ComponentContestDetails() {
        setWinnerId(0);
        setComponent("n/a");
        setCatalog("n/a");
        setPhaseDescription("n/a");
        setRegistrants("n/a");
        setSubmissions("n/a");
        setSubmissionPercentage("n/a");
        setPassedScreening("n/a");
        setPassedPercentage("n/a");
        setAvgInitialScore("n/a");
        setAvgFinalScore("n/a");

        setReviewer1("n/a");
        setReviewer2("n/a");
        setReviewer3("n/a");

        competitorDetails = new ArrayList();

        setComponentOverview("n/a");
        setComponentFunctionality("n/a");
        setDocumentUrl(null);
    }

    public String toString() {
        StringBuffer b = new StringBuffer();
        b.append("\n");
        b.append("winnerId=").append(winnerId).append("\n");
        b.append("component=").append(component).append("\n");
        b.append("catalog=").append(catalog).append("\n");
        b.append("phaseDescription=").append(phaseDescription).append("\n");
        b.append("registrants=").append(registrants).append("\n");
        b.append("submissions=").append(submissions).append("\n");
        b.append("submissionPercentage=").append(submissionPercentage).append("\n");
        b.append("passedScreening=").append(passedScreening).append("\n");
        b.append("passedPercentage=").append(passedPercentage).append("\n");
        b.append("avgInitialScore=").append(avgInitialScore).append("\n");
        b.append("avgFinalScore=").append(avgFinalScore).append("\n");
        b.append("reviewer1=").append(reviewer1).append("\n");
        b.append("reviewer2=").append(reviewer2).append("\n");
        b.append("reviewer3=").append(reviewer3).append("\n");
        b.append("documentUrl=").append(documentUrl).append("\n");
        return b.toString();
    }

    public void addCompetitorDetails(ComponentCompetitorDetails details) {
        if (details == null) return;
        competitorDetails.add(details);
    }

    public ComponentCompetitorDetails[] getCompetitorDetails() {
        ComponentCompetitorDetails[] result = new ComponentCompetitorDetails[competitorDetails.size()];
        competitorDetails.toArray(result);
        return result;
    }

    public void setWinnerId(int winnerId) {
        this.winnerId = winnerId;
    }

    public int getWinnerId() {
        return winnerId;
    }

    public void setComponentId(int componentId) {
        this.componentId = componentId;
    }

    public int getComponentId() {
        return componentId;
    }

    public void setComponentVersion(int componentVersion) {
        this.componentVersion = componentVersion;
    }

    public int getComponentVersion() {
        return componentVersion;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public String getComponent() {
        return component;
    }

    public void setCatalog(String catalog) {
        this.catalog = catalog;
    }

    public String getCatalog() {
        return catalog;
    }

    public void setPhaseDescription(String phaseDescription) {
        this.phaseDescription = phaseDescription;
    }

    public String getPhaseDescription() {
        return phaseDescription;
    }

    public void setRegistrants(String registrants) {
        this.registrants = registrants;
    }

    public String getRegistrants() {
        return registrants;
    }

    public void setSubmissions(String submissions) {
        this.submissions = submissions;
    }

    public String getSubmissions() {
        return submissions;
    }

    public void setSubmissionPercentage(String submissionPercentage) {
        this.submissionPercentage = submissionPercentage;
    }

    public String getSubmissionPercentage() {
        return submissionPercentage;
    }

    public void setPassedScreening(String passedScreening) {
        this.passedScreening = passedScreening;
    }

    public String getPassedScreening() {
        return passedScreening;
    }

    public void setPassedPercentage(String passedPercentage) {
        this.passedPercentage = passedPercentage;
    }

    public String getPassedPercentage() {
        return passedPercentage;
    }

    public void setAvgInitialScore(String avgInitialScore) {
        this.avgInitialScore = avgInitialScore;
    }

    public String getAvgInitialScore() {
        return avgInitialScore;
    }

    public void setAvgFinalScore(String avgFinalScore) {
        this.avgFinalScore = avgFinalScore;
    }

    public String getAvgFinalScore() {
        return avgFinalScore;
    }

    public void setReviewer1(String reviewer1) {
        this.reviewer1 = reviewer1;
    }

    public String getReviewer1() {
        return reviewer1;
    }

    public void setReviewer2(String reviewer2) {
        this.reviewer2 = reviewer2;
    }

    public String getReviewer2() {
        return reviewer2;
    }

    public void setReviewer3(String reviewer3) {
        this.reviewer3 = reviewer3;
    }

    public String getReviewer3() {
        return reviewer3;
    }

    public void setComponentOverview(String componentOverview) {
        this.componentOverview = componentOverview;
    }

    public String getComponentOverview() {
        return componentOverview;
    }

    public void setComponentFunctionality(String componentFunctionality) {
        this.componentFunctionality = componentFunctionality;
    }

    public String getComponentFunctionality() {
        return componentFunctionality;
    }

    public void setDocumentUrl(String documentUrl) {
        this.documentUrl = documentUrl;
    }

    public String getDocumentUrl() {
        return documentUrl;
    }

    public void setUnitTestCount(int unitTestCount) {
        this.unitTestCount = unitTestCount;
    }

    public int getUnitTestCount() {
        return unitTestCount;
    }

    public void setUnitTestPassed(int unitTestPassed) {
        this.unitTestPassed = unitTestPassed;
    }

    public int getUnitTestPassed() {
        return unitTestPassed;
    }

    public void setReviewTestCount(int reviewTestCount) {
        this.reviewTestCount = reviewTestCount;
    }

    public int getReviewTestCount() {
        return reviewTestCount;
    }

    public void setReviewTestPassed(int reviewTestPassed) {
        this.reviewTestPassed = reviewTestPassed;
    }

    public int getReviewTestPassed() {
        return reviewTestPassed;
    }

}
