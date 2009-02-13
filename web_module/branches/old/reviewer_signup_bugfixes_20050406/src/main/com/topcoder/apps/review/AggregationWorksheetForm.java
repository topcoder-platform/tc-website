/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AggregationResponse;
import com.topcoder.apps.review.document.AggregationWorksheet;
import com.topcoder.apps.review.document.ScorecardQuestion;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.UserRole;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * Form bean for the aggregation worksheet editing page.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */

public class AggregationWorksheetForm extends ReviewForm {

    // --------------------------------------------------- Instance Variables

    /**
     * The aggregation worksheet.
     */
    private AggregationWorksheet worksheet = null;

    /**
     * The aggregation response list.
     */
    private AggregationResponseBean[] responses = null;

    /**
     * The user action.
     */
    private String action = null;

    /**
     * The related scorecards.
     */
    private ReviewScorecardBean[] scorecards = null;

    // ----------------------------------------------------------- Properties

    /**
     * Return the project related to this worksheet.
     *
     * @return the project related to this worksheet.
     */
    public Project getProject() {
        return worksheet.getProject();
    }

    /**
     * Return the scorecards related to this worksheet.
     *
     * @return the scorecards related to this worksheet.
     */
    public ReviewScorecardBean[] getReviewScorecards() {
        return scorecards;
    }

    /**
     * Return the aggregator of this worksheet.
     *
     * @return the aggregator of this worksheet.
     */
    public User getAggregator() {
        return worksheet.getAggregator();
    }

    /**
     * Return the responses in this worksheet.
     *
     * @return the responses in this worksheet.
     */
    public AggregationResponseBean[] getResponses() {
        return responses;
    }

    /**
     * Return the user action.
     *
     * @return the user action.
     */
    public String getAction() {
        return action;
    }

    /**
     * Set the user action.
     *
     * @param action The new user action.
     */
    public void setAction(String action) {
        this.action = action;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Validate the properties that have been set from this HTTP request,
     * and return an <code>ActionErrors</code> object that encapsulates any
     * validation errors that have been found.  If no errors are found, return
     * <code>null</code> or an <code>ActionErrors</code> object with no
     * recorded error messages.
     *
     * @param mapping The mapping used to select this instance
     * @param request The servlet request we are processing
     *
     * @return an <code>ActionErrors</code> object that encapsulates any
     * validation errors that have been found.
     */
    public ActionErrors validate(ActionMapping mapping,
                                 HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        setValid(true);

        if (Constants.ACTION_FINISH.equals(action)
                && responses != null) {
            for (int i = 0; i < responses.length; i++) {
                String status = responses[i].getAggregationResponseStatus();
                String text = responses[i].getResponseText();
                String type = responses[i].getResponseType();
                responses[i].setValid(true);

                if (status == null || status.length() < 1) {
                    setValid(false);
                    responses[i].setValid(false);
                    errors.add("responses[" + i + "]",
                            new ActionError("error.status.required"));
                }
                if (text == null || text.length() < 1) {
                    setValid(false);
                    responses[i].setValid(false);
                    errors.add("responses[" + i + "]",
                            new ActionError("error.responseText.required"));
                }
                if (type == null || type.length() < 1) {
                    setValid(false);
                    responses[i].setValid(false);
                    errors.add("responses[" + i + "]",
                            new ActionError("error.responseType.required"));
                }
            }
        }

        return errors;
    }

    // ------------------------------------------------------ Protected Methods

    /**
     * Creates the form bean from the worksheet.
     *
     * @param worksheet The worksheet for creating the form bean.
     * @param aggregationResponses The aggregation responses for creating
     * the form bean. If null, the aggregation responses in worksheet will
     * be used.
     */
    protected void fromWorksheet(AggregationWorksheet worksheet,
                                 AggregationResponse[] aggregationResponses) {
        List list = new ArrayList();
        long preSectionId = -1;
        long preGroupId = -1;
        int preLocation = -1;
        int sequenceLocation = 1;
        int len;
        int i;

        if (aggregationResponses == null) {
            aggregationResponses = worksheet.getAggregationResponses();
        }
        len = aggregationResponses.length;

        this.worksheet = worksheet;
        this.responses = new AggregationResponseBean[len];

        for (i = 0; i < len; i++) {
            AggregationResponse response = aggregationResponses[i];
            ScorecardQuestion curQuestion =
                    response.getScorecardQuestion();
            long curSectionId = curQuestion.getScorecardSection().getId();
            long curGroupId = curQuestion.getScorecardSection().getSectionGroup().getId();
            int curLocation = curQuestion.getSequenceLocation();

            AggregationResponse next =
                    (i < len - 1) ? aggregationResponses[i + 1] : null;
            ScorecardQuestion nextQuestion =
                    (next == null) ? null : next.getScorecardQuestion();
            long nextSectionId = (nextQuestion == null)
                    ? -1
                    : nextQuestion.getScorecardSection().getId();
            long nextGroupId = (nextQuestion == null)
                    ? -1
                    : nextQuestion.getScorecardSection().getSectionGroup().getId();
            int nextLocation = (nextQuestion == null)
                    ? -1
                    : nextQuestion.getSequenceLocation();

            boolean firstInSection = (curSectionId != preSectionId);
            boolean firstInQuestion = (curSectionId != preSectionId
                    || curLocation != preLocation);
            boolean firstInGroup = (curGroupId != preGroupId);
            boolean lastInSection = (curSectionId != nextSectionId);
            boolean lastInQuestion = (curSectionId != nextSectionId
                    || curLocation != nextLocation);
            boolean lastInGroup = (curGroupId != nextGroupId);

            this.responses[i] =
                    new AggregationResponseBean(response, sequenceLocation,
                            firstInGroup, lastInGroup,
                            firstInSection, lastInSection,
                            firstInQuestion, lastInQuestion,
                            worksheet.getProject());

            preSectionId = curSectionId;
            preGroupId = curGroupId;
            preLocation = curLocation;
            if (next != null && !lastInQuestion
                    && next.getReviewer().getId() == response.getReviewer().getId()) {
                sequenceLocation++;
            } else {
                sequenceLocation = 1;
            }
        }

        for (i = 0; i < worksheet.getProject().getParticipants().length; i++) {
            UserRole userRole = worksheet.getProject().getParticipants()[i];
            if (userRole.getRole().getId() == Constants.ROLE_REVIEWER) {
                list.add(new ReviewScorecardBean(userRole.getUser(),
                        worksheet.getProject().getWinner(),
                        worksheet.getProject().getId()));
            }
        }
        scorecards = new ReviewScorecardBean[list.size()];
        list.toArray(scorecards);

        setId(worksheet.getProject().getId());
    }

    /**
     * Creates the AggregationData from this form bean.
     *
     * @param orpd The OnlineReviewProjectData to create the AggregationData.
     * @return the AggregationData created from this form bean.
     */
    protected AggregationData toAggregationData(OnlineReviewProjectData orpd) {
        if (Constants.ACTION_FINISH.equals(action)) {
            worksheet.setCompleted(true);
        } else if (Constants.ACTION_APPROVE.equals(action)) {
            worksheet.setPMReviewed(true);
        }

        return new AggregationData(orpd, worksheet);
    }
}
