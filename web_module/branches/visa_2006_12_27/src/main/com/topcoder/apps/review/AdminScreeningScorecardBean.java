/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AbstractScorecard;
import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.util.format.PrimitiveFormatter;
import com.topcoder.util.format.PrimitiveFormatterFactory;
import org.apache.struts.util.MessageResources;

/**
 * <p>
 * Java bean for admin the screening scorecards.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class AdminScreeningScorecardBean {

    // ------------------------------------------------ Instance Variables

    /**
     * The screening scorecards.
     */
    private AbstractScorecard scorecard = null;

    /**
     * The submission.
     */
    private AbstractSubmission submission = null;

    /**
     * The formatter for the score.
     */
    PrimitiveFormatter scoreFormatter =
            PrimitiveFormatterFactory.getFormatter(Constants.SCORE_FORMAT);

    /**
     * The message resource..
     */
    MessageResources messages =
            MessageResources.getMessageResources(Constants.MESSAGE_RESOURCE_KEY);

    /**
     * Whether the score is ready.
     */
    private boolean scoreReady = true;

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>AdminScreeningScorecardBean</code> class.
     * </p>
     *
     * @param submission The submission to be set.
     * @param scorecards The scorecards to be set.
     */
    public AdminScreeningScorecardBean(AbstractSubmission submission,
                                       AbstractScorecard[] scorecards) {
        this.submission = submission;

        if (scorecards != null) {
            for (int i = 0; i < scorecards.length; i++) {
                if (scorecards[i] instanceof ScreeningScorecard
                        && scorecards[i].getSubmission().getSubmitter().getId()
                        == submission.getSubmitter().getId()) {
                    this.scorecard = scorecards[i];
                }
            }
        }

        if (this.scorecard == null || !this.scorecard.isCompleted()) {
            scoreReady = false;
        }
    }

    // ----------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the submission.
     * </p>
     *
     * @return the submission.
     */
    public AbstractSubmission getSubmission() {
        return submission;
    }

    /**
     * <p>
     * Return whether the scorecard exists.
     * </p>
     *
     * @param index The index of scorecard.
     * @return whether the scorecard exists.
     */
    public boolean getScorecardExists() {
        return (scorecard != null);
    }

    /**
     * <p>
     * Return the scorecard.
     * </p>
     *
     * @return the scorecard.
     */
    public AbstractScorecard getScorecard() {
        return scorecard;
    }

    /**
     * <p>
     * Return whether the submission passed the screening.
     * </p>
     *
     * @return whether the submission passed the screening.
     */
    public boolean getPassed() {
        if (scoreReady) {
            try {
                return ((ScreeningScorecard) scorecard).getPassed() && scorecard.getScore() >= ConfigHelper.getMinimumScore();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
//            for (int i = 0; i < scorecard.getQuestions().length; i++) {
//                if (scorecard.getQuestions()[i].SCORECARD_TYPE == ScorecardQuestion.SCORECARD_TYPE
//                        && scorecard.getQuestions()[i].getEvaluation().getId() == Evaluation.ID_NO) {
//                    return false;
//                }
//            }
//            return true;
        } else {
            return false;
        }
    }

    /**
     * <p>
     * Return the score.
     * </p>
     *
     * @return the score.
     */
    public String getScore() {
        if (scoreReady) {
            return scoreFormatter.format(scorecard.getScore());
        } else {
            return messages.getMessage("prompt.nonAvailable");
        }
    }

    public String getAdvancedToReview() {
        if (scoreReady && scorecard.isPMReviewed()) {
            if (((InitialSubmission) submission).isAdvancedToReview()) {
                return "Yes";
            } else {
                return "No";
            }
        } else {
            if (((InitialSubmission) submission).isAdvancedToReview()) {
                return "Yes (Pending)";
            } else {
                return "No (Pending)";
            }
        }
    }

    /**
     * <p>
     * Return whether the score is ready.
     * </p>
     *
     * @return whether the score is ready.
     */
    public boolean getScoreReady() {
        return scoreReady;
    }

    /**
     * <p>
     * Return whether the PM has reviewed.
     * </p>
     *
     * @return whether the PM has reviewed.
     */
    public boolean getIsPMReviewed() {
        if (scoreReady && scorecard.isPMReviewed()) {
            return true;
        } else {
            return false;
        }
    }
}