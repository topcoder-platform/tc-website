/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ReviewerResponsibility;
import com.topcoder.apps.review.projecttracker.User;

/**
 * <p>
 * Java bean for the Aggregation Response.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class AggregationResponseBean {

    // --------------------------------------------------- Instance Variables

    /**
     * The AggregationResponse.
     */
    private AggregationResponse response = null;

    /**
     * The possible statuses of aggregation response.
     */
    private AggregationResponseStatus[] statuses = null;

    /**
     * The possible status strings of aggregation response.
     */
    private String[] statusAnswers = null;

    /**
     * The possible response types.
     */
    private ResponseType[] responseTypes = null;

    /**
     * The possible response type strings.
     */
    private String[] responseAnswers = null;

    /**
     * The review scorecard of this response.
     */
    private ReviewScorecardBean scorecard = null;

    /**
     * Whether the input of this response is valid.
     */
    private boolean isValid = true;

    /**
     * Whether the response is first in section group.
     */
    private boolean firstInGroup;

    /**
     * Whether the response is last in section group.
     */
    private boolean lastInGroup;

    /**
     * Whether the response is first in section.
     */
    private boolean firstInSection;

    /**
     * Whether the response is last in section.
     */
    private boolean lastInSection;

    /**
     * Whether the response is first in question.
     */
    private boolean firstInQuestion;

    /**
     * Whether the response is last in question.
     */
    private boolean lastInQuestion;

    /**
     * The sequence location of the response.
     */
    private int location;

    /**
     * The reviewer responsibility.
     */
    private ReviewerResponsibility reviewerResponsibility = null;

    // --------------------------------------------------------- Constructors

    /**
     * Creates the <code>AggregationResponseBean</code> instance from the
     * AggregationResponse.
     *
     * @param response The AggregationResponse.
     * @param location The sequence location of the response.
     * @param firstInSection Whether the response is the first in the section.
     * @param lastInSection Whether the response is the last in the section.
     * @param firstInGroup Whether the response is the first in the section group.
     * @param lastInGroup Whether the response is the last in the section group.
     * @param firstInQuestion Whether the response is the first in the question.
     * @param lastInQuestion Whether the response is the last in the question.
     * @param winner The winner of this project.
     * @param projectId The project id.
     */
    public AggregationResponseBean(AggregationResponse response,
                                   int location,
                                   boolean firstInGroup,
                                   boolean lastInGroup,
                                   boolean firstInSection,
                                   boolean lastInSection,
                                   boolean firstInQuestion,
                                   boolean lastInQuestion,
                                   Project project) {
        BusinessDelegate businessDelegate = new BusinessDelegate();

        this.response = response;
        this.location = location;
        this.firstInGroup = firstInGroup;
        this.lastInGroup = lastInGroup;
        this.firstInSection = firstInSection;
        this.lastInSection = lastInSection;
        this.firstInQuestion = firstInQuestion;
        this.lastInQuestion = lastInQuestion;
        this.scorecard = new ReviewScorecardBean(response.getReviewer(),
                project.getWinner(),
                project.getId());

        statuses = businessDelegate.getAggregationResponseStatuses();
        statusAnswers = new String[statuses.length];
        for (int i = 0; i < statuses.length; i++) {
            statusAnswers[i] = statuses[i].getName();
        }

        responseTypes = businessDelegate.getResponseTypes();
        responseAnswers = new String[responseTypes.length];
        for (int i = 0; i < responseTypes.length; i++) {
            responseAnswers[i] = responseTypes[i].getName();
        }

        for (int i = 0; i < project.getParticipants().length; i++) {
            if (response.getReviewer().equals(project.getParticipants()[i].getUser())
                    && project.getParticipants()[i].getRole().getId() == Constants.ROLE_REVIEWER) {
                this.reviewerResponsibility = project.getParticipants()[i].getReviewerResponsibility();
            }
        }
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Return the sequence location of the response.
     *
     * @return the sequence location of the response.
     */
    public int getLocation() {
        return location;
    }

    /**
     * Return the question of the response.
     *
     * @return the question of the response.
     */
    public ScorecardQuestion getQuestion() {
        return response.getScorecardQuestion();
    }

    /**
     * Return the type of this question.
     *
     * @return the type of this question.
     */
    public String getQuestionType() {
        if (response.getScorecardQuestion() instanceof SubjectiveScorecardQuestion) {
            return ScorecardQuestionBean.SUBJECTIVE;
        } else if (response.getScorecardQuestion() instanceof TestCaseScorecardQuestion) {
            return ScorecardQuestionBean.TESTCASE;
        } else {
            return ScorecardQuestionBean.OBJECTIVE;
        }
    }

    /**
     * Return the question text of the response.
     *
     * @return the question text of the response.
     */
    public String getQuestionText() {
        String text = response.getScorecardQuestion().getQuestionText();
        return text;
    }

    /**
     * Return the text of the response.
     *
     * @return the text of the response.
     */
    public String getResponseText() {
        return response.getSubjectiveResponse().getResponseText();
    }

    /**
     * Set the text of the response.
     *
     * @param text The text of the response.
     */
    public void setResponseText(String text) {
        response.getSubjectiveResponse().setResponseText(text.trim());
    }

    /**
     * Return the type of the response.
     *
     * @return the type of the response.
     */
    public String getResponseType() {
        if (response.getSubjectiveResponse().getResponseType() != null) {
            return response.getSubjectiveResponse().getResponseType().getName();
        } else {
            return null;
        }
    }

    /**
     * Set the type of the response.
     *
     * @param type The type of the response.
     */
    public void setResponseType(String type) {
        for (int i = 0; i < responseTypes.length; i++) {
            if (responseTypes[i].getName().equals(type)) {
                response.getSubjectiveResponse().setResponseType(responseTypes[i]);
            }
        }
    }

    /**
     * Return the list of possible response type strings.
     *
     * @return the list of possible response type strings.
     */
    public String[] getResponseAnswers() {
        return responseAnswers;
    }

    /**
     * Set whether the input of this question is valid.
     *
     * @param isValid Whether the input of this question is valid.
     */
    protected void setValid(boolean isValid) {
        this.isValid = isValid;
    }

    /**
     * Return whether the input of this question is valid.
     *
     * @return whether the input of this question is valid.
     */
    public boolean getValid() {
        return isValid;
    }

    /**
     * Return the reviewer.
     *
     * @return the reviewer.
     */
    public User getReviewer() {
        return response.getReviewer();
    }

    /**
     * Return the response status.
     *
     * @return the response status.
     */
    public String getAggregationResponseStatus() {
        if (response.getAggregationResponseStatus() != null) {
            return response.getAggregationResponseStatus().getName();
        } else {
            return null;
        }
    }

    /**
     * Set the response status.
     *
     * @param status The response status.
     */
    public void setAggregationResponseStatus(String status) {
        for (int i = 0; i < statuses.length; i++) {
            if (statuses[i].getName().equals(status)) {
                response.setAggregationResponseStatus(statuses[i]);
            }
        }
    }

    /**
     * Return the list of possible response status strings.
     *
     * @return the list of possible response status strings.
     */
    public String[] getStatusAnswers() {
        return statusAnswers;
    }

    /**
     * Return whether the response is the first in the section group.
     *
     * @return whether the response is the first in the section group.
     */
    public boolean getFirstInGroup() {
        return firstInGroup;
    }

    /**
     * Return whether the response is the last in the section group.
     *
     * @return whether the response is the last in the section group.
     */
    public boolean getLastInGroup() {
        return lastInGroup;
    }

    /**
     * Return whether the response is the first in the section.
     *
     * @return whether the response is the first in the section.
     */
    public boolean getFirstInSection() {
        return firstInSection;
    }

    /**
     * Return whether the response is the last in the section.
     *
     * @return whether the response is the last in the section.
     */
    public boolean getLastInSection() {
        return lastInSection;
    }

    /**
     * Return whether the response is the first in the question.
     *
     * @return whether the response is the first in the question.
     */
    public boolean getFirstInQuestion() {
        return firstInQuestion;
    }

    /**
     * Return whether the response is the last in the question.
     *
     * @return whether the response is the last in the question.
     */
    public boolean getLastInQuestion() {
        return lastInQuestion;
    }

    /**
     * Return the related review scorecard.
     *
     * @return the related review scorecard.
     */
    public ReviewScorecardBean getReviewScorecard() {
        return scorecard;
    }

    /**
     * Return the reviewer responsibility.
     *
     * @return the reviewer responsibility.
     */
    public String getReviewerResponsibility() {
        if (reviewerResponsibility == null) {
            return null;
        } else {
            return reviewerResponsibility.getName();
        }
    }
}