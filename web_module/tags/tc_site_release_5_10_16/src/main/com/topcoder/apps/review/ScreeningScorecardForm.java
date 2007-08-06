/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.ScreeningScorecard;

/**
 * <p>
 * Form bean for the screening scorecard editing page.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class ScreeningScorecardForm extends AbstractScorecardForm {

    // ------------------------------------------------------ Protected Methods

    /**
     * Creates the ScreeningData from this form bean.
     *
     * @param orpd The OnlineReviewProjectData to create the ScreeningData.
     * @return the ScreeningData created from this form bean.
     */
    protected ScreeningData toScreeningData(OnlineReviewProjectData orpd) {
        if (Constants.ACTION_FINISH.equals(action)) {
            scorecard.setCompleted(true);
        } else if (Constants.ACTION_APPROVE.equals(action)) {
            scorecard.setPMReviewed(true);
        }

        return new ScreeningData(orpd,
                scorecard.getSubmission().getSubmitter().getId(),
                (ScreeningScorecard) scorecard);
    }

    /**
     * Retrieve the scorecard.
     */
    protected void retrieveScorecard() {
        ScreeningData data = new ScreeningData(new OnlineReviewProjectData(user, getInfoById(getId())), sid, null);
        ResultData result = new BusinessDelegate().screeningScorecard(data);

        if (result instanceof SuccessResult) {
            ScreeningScorecardRetrieval ssr = (ScreeningScorecardRetrieval) result;

            fromScorecard(ssr.getScoreCard());
        }
    }
}
