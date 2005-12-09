/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AggregationApproval;
import com.topcoder.apps.review.document.AggregationReview;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * Form bean for the aggregation review editing page.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */

public class AggregationReviewForm extends AggregationWorksheetForm {

    // --------------------------------------------------- Instance Variables

    /**
     * The aggregation review.
     */
    private AggregationReview aggregationReview = null;

    // ----------------------------------------------------------- Properties

    /**
     * Return the aggregation review text.
     *
     * @return the aggregation review text.
     */
    public String getAggregationReviewText() {
        if (aggregationReview != null) {
            return aggregationReview.getText();
        } else {
            return null;
        }
    }

    /**
     * Set the aggregation review text.
     *
     * @param text The aggregation review text.
     */
    public void setAggregationReviewText(String text) {
        if (aggregationReview != null) {
            aggregationReview.setText(text.trim());
        }
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
        if (Constants.ACTION_REJECT.equals(getAction())
                && aggregationReview != null) {
            String text = aggregationReview.getText();
            if (text == null || text.length() < 1) {
                setValid(false);

                errors.add("aggregationReviewText",
                        new ActionError("error.reason.required"));
            }
        }

        return errors;
    }

    // ------------------------------------------------------ Protected Methods

    /**
     * Creates the form bean from the aggregation review.
     *
     * @param aggregationReview The aggregation review for creating the
     * form bean.
     */
    protected void fromReview(AggregationReview aggregationReview) {
        super.fromWorksheet(aggregationReview.getAggregationWorksheet(), null);
        this.aggregationReview = aggregationReview;
    }

    /**
     * Creates the AggregationReviewData from this form bean.
     *
     * @param orpd The OnlineReviewProjectData to create the
     * AggregationReviewData.
     * @return the AggregationReviewData created from this form bean.
     */
    protected AggregationReviewData toReviewData(OnlineReviewProjectData orpd) {
        BusinessDelegate businessDelegate = new BusinessDelegate();
        AggregationApproval[] approvals =
                businessDelegate.getAggregationApprovals();

        if (Constants.ACTION_REJECT.equals(getAction())) {
            for (int i = 0; i < approvals.length; i++) {
                if (approvals[i].getId() == AggregationApproval.ID_REJECTED) {
                    aggregationReview.setStatus(approvals[i]);
                }
            }
        } else if (Constants.ACTION_ACCEPT.equals(getAction())) {
            for (int i = 0; i < approvals.length; i++) {
                if (approvals[i].getId() == AggregationApproval.ID_APPROVED) {
                    aggregationReview.setStatus(approvals[i]);
                }
            }
        } else if (Constants.ACTION_APPROVE.equals(getAction())) {
            aggregationReview.setPMReviewed(true);
        }

        aggregationReview.setCompleted(true);
        return new AggregationReviewData(orpd, aggregationReview);
    }
}
