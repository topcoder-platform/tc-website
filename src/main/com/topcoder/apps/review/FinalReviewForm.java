/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AggregationResponse;
import com.topcoder.apps.review.document.FinalFixStatus;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.document.FixItem;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * Form bean for the final review editing page.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */

public class FinalReviewForm extends AggregationWorksheetForm {

    // --------------------------------------------------- Instance Variables

    /**
     * The final review.
     */
    private FinalReview finalReview = null;

    /**
     * The possible final fix statuses.
     */
    private FinalFixStatus[] statuses = null;

    // ----------------------------------------------------------- Properties

    /**
     * Return the specified final fix status.
     *
     * @param idx The index of the final fix status.
     * @return the specified final fix status.
     */
    public String getFixItem(int idx) {
        if (finalReview != null) {
            FinalFixStatus status =
                    finalReview.getFixCheckList()[idx].getFinalFixStatus();
            if (status != null) {
                return status.getName();
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    /**
     * Set the specified final fix status.
     *
     * @param idx The index of the final fix status.
     * @param status The new final fix status.
     */
    public void setFixItem(int idx, String status) {
        if (finalReview != null && idx >= 0
                && idx < finalReview.getFixCheckList().length) {
            for (int i = 0; i < statuses.length; i++) {
                if (statuses[i].getName().equals(status)) {
                    FixItem item = finalReview.getFixCheckList()[idx];
                    item.setFinalFixStatus(statuses[i]);
                }
            }
        }
    }

    /**
     * Return all the possible final fix statuses.
     *
     * @return all the possible final fix statuses.
     */
    public FinalFixStatus[] getFinalFixStatuses() {
        return statuses;
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

        if (getResponses() != null) {
            for (int i = 0; i < getResponses().length; i++) {
                String status = getFixItem(i);
                getResponses()[i].setValid(true);

                if (status == null || status.length() < 1) {
                    setValid(false);
                    getResponses()[i].setValid(false);
                    errors.add("responses[" + i + "]",
                            new ActionError("error.status.required"));
                }
            }
        }

        return errors;
    }

    // ------------------------------------------------------ Protected Methods

    /**
     * Creates the form bean from the final review.
     *
     * @param finalReview The final review for creating the
     * form bean.
     */
    protected void fromReview(FinalReview finalReview) {
        AggregationResponse[] responses =
                new AggregationResponse[finalReview.getFixCheckList().length];
        BusinessDelegate businessDelegate = new BusinessDelegate();

        this.finalReview = finalReview;
        for (int i = 0; i < responses.length; i++) {
            responses[i] =
                    finalReview.getFixCheckList()[i].getAggregationResponse();
        }
        super.fromWorksheet(finalReview.getAggregationWorkSheet(),
                responses);

        statuses = businessDelegate.getFinalFixStatuses();
    }

    /**
     * Creates the FinalReviewData from this form bean.
     *
     * @param orpd The OnlineReviewProjectData to create the
     * FinalReviewData.
     * @return the FinalReviewData created from this form bean.
     */
    protected FinalReviewData toReviewData(OnlineReviewProjectData orpd) {
        finalReview.setCompleted(true);
        return new FinalReviewData(orpd, finalReview);
    }
}
