/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.ReviewScorecard;

/**
 * <p>
 * Form bean for the screening scorecard editing page.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class ReviewScorecardForm extends AbstractScorecardForm {

    // ------------------------------------------------------ Protected Methods

    /**
     * Creates the ReviewData from this form bean.
     *
     * @param orpd The OnlineReviewProjectData to create the ReviewData.
     * @return the ReviewData created from this form bean.
     */
    protected ReviewData toReviewData(OnlineReviewProjectData orpd) {
        if (Constants.ACTION_FINISH.equals(action)) {
            scorecard.setCompleted(true);
        } else if (Constants.ACTION_APPROVE.equals(action)) {
            scorecard.setPMReviewed(true);
        }

        return new ReviewData(orpd,
                scorecard.getSubmission().getSubmitter().getId(),
                scorecard.getAuthor().getId(),
                (ReviewScorecard) scorecard);
    }

    /**
     * Retrieve the scorecard.
     */
    protected void retrieveScorecard() {
        ReviewData data = new ReviewData(new OnlineReviewProjectData(user, getInfoById(getId())), sid, rid, null);
        ResultData result = new BusinessDelegate().reviewScorecard(data);

        if (result instanceof ReviewScorecardRetrieval) {
            ReviewScorecardRetrieval rsr = (ReviewScorecardRetrieval) result;
            fromScorecard(rsr.getScoreCard());
        }
    }
}
