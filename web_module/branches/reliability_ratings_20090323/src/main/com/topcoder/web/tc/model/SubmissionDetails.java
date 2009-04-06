package com.topcoder.web.tc.model;

import java.io.Serializable;

/**
 * Container for component competition-related statistics
 * Data common among design and development competitions
 * Stored as Strings, as they are for presentation only
 *
 * @author mfogleman
 */
public class SubmissionDetails implements Serializable {

    private String inquiries;
    private String submissions;
    private String submissionRate;
    private String passedScreening;
    private String screeningSuccessRate;
    private String passedReview;
    private String reviewSuccessRate;
    private String maximumScore;
    private String minimumScore;
    private String averageScore;
    private String averagePlacement;
    private String wins;
    private String winPercentage;

    public SubmissionDetails() {
        setInquiries("n/a");
        setSubmissions("n/a");
        setSubmissionRate("n/a");
        setPassedScreening("n/a");
        setScreeningSuccessRate("n/a");
        setPassedReview("n/a");
        setReviewSuccessRate("n/a");
        setMaximumScore("n/a");
        setMinimumScore("n/a");
        setAverageScore("n/a");
        setAveragePlacement("n/a");
        setWins("n/a");
        setWinPercentage("n/a");
    }

    public void setInquiries(String inquiries) {
        this.inquiries = inquiries;
    }

    public String getInquiries() {
        return inquiries;
    }

    public void setSubmissions(String submissions) {
        this.submissions = submissions;
    }

    public String getSubmissions() {
        return submissions;
    }

    public void setSubmissionRate(String submissionRate) {
        this.submissionRate = submissionRate;
    }

    public String getSubmissionRate() {
        return submissionRate;
    }

    public void setPassedScreening(String passedScreening) {
        this.passedScreening = passedScreening;
    }

    public String getPassedScreening() {
        return passedScreening;
    }

    public void setScreeningSuccessRate(String screeningSuccessRate) {
        this.screeningSuccessRate = screeningSuccessRate;
    }

    public String getScreeningSuccessRate() {
        return screeningSuccessRate;
    }

    public void setPassedReview(String passedReview) {
        this.passedReview = passedReview;
    }

    public String getPassedReview() {
        return passedReview;
    }

    public void setReviewSuccessRate(String reviewSuccessRate) {
        this.reviewSuccessRate = reviewSuccessRate;
    }

    public String getReviewSuccessRate() {
        return reviewSuccessRate;
    }

    public void setMaximumScore(String maximumScore) {
        this.maximumScore = maximumScore;
    }

    public String getMaximumScore() {
        return maximumScore;
    }

    public void setMinimumScore(String minimumScore) {
        this.minimumScore = minimumScore;
    }

    public String getMinimumScore() {
        return minimumScore;
    }

    public void setAverageScore(String averageScore) {
        this.averageScore = averageScore;
    }

    public String getAverageScore() {
        return averageScore;
    }

    public void setAveragePlacement(String averagePlacement) {
        this.averagePlacement = averagePlacement;
    }

    public String getAveragePlacement() {
        return averagePlacement;
    }

    public void setWins(String wins) {
        this.wins = wins;
    }

    public String getWins() {
        return wins;
    }

    public void setWinPercentage(String winPercentage) {
        this.winPercentage = winPercentage;
    }

    public String getWinPercentage() {
        return winPercentage;
    }

}
