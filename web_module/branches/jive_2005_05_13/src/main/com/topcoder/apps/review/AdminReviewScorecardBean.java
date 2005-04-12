/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AbstractScorecard;
import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.document.TestCaseScorecardQuestion;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.util.format.PrimitiveFormatter;
import com.topcoder.util.format.PrimitiveFormatterFactory;
import org.apache.struts.util.MessageResources;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * Java bean for admin the review scorecards.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class AdminReviewScorecardBean {

    // ------------------------------------------------ Instance Variables

    /**
     * The review scorecards.
     */
    private AbstractScorecard[] scorecards = null;

    /**
     * The submission.
     */
    private AbstractSubmission submission = null;

    /**
     * The review scorecard form for the scorecard.
     */
    private ReviewScorecardForm form = null;

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
     * The average score.
     */
    private double avgScore = 0.0;

    /**
     * Whether the average score is ready.
     */
    private boolean avgScoreReady = true;

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>AdminReviewScorecardBean</code> class.
     * </p>
     *
     * @param project The related project.
     * @param submission The submission to be set.
     * @param scorecards The scorecards to be set.
     */
    public AdminReviewScorecardBean(Project project,
                                    AbstractSubmission submission,
                                    AbstractScorecard[] scorecards) {
        List list = new ArrayList();

        this.submission = submission;
        for (int j = 0; j < project.getParticipants().length; j++) {
            if (project.getParticipants()[j].getRole().getId()
                    == Constants.ROLE_REVIEWER) {
                boolean found = false;
                if (scorecards != null) {
                    for (int i = 0; i < scorecards.length; i++) {
                        if (scorecards[i] instanceof ReviewScorecard
                                && scorecards[i].getSubmission().getSubmitter().getId()
                                == submission.getSubmitter().getId()
                                && scorecards[i].getAuthor().getId()
                                == project.getParticipants()[j].getUser().getId()) {
                            list.add(scorecards[i]);
                            found = true;
                        }
                    }
                }
                if (!found) {
                    list.add(null);
                }
            }
        }
        this.scorecards = new AbstractScorecard[list.size()];
        list.toArray(this.scorecards);

        if (this.scorecards.length == 0) {
            avgScoreReady = false;
        }
        for (int i = 0; i < this.scorecards.length; i++) {
            if (this.scorecards[i] == null || !this.scorecards[i].isCompleted()) {
                avgScoreReady = false;
            } else {
                avgScore += this.scorecards[i].getScore();
            }
        }
        if (avgScoreReady) {
            avgScore /= this.scorecards.length;
            form = new ReviewScorecardForm();
            form.fromScorecard(this.scorecards[0]);
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
     * Return the project related to this scorecard.
     *
     * @return the project related to this scorecard.
     */
    public Project getProject() {
        return submission.getProject();
    }

    /**
     * <p>
     * Return whether the scorecard exists.
     * </p>
     *
     * @param index The index of scorecard.
     * @return whether the scorecard exists.
     */
    public boolean getScorecardExists(int index) {
        return (scorecards[index] != null);
    }

    /**
     * <p>
     * Return the scorecards.
     * </p>
     *
     * @return the scorecards.
     */
    public AbstractScorecard[] getScorecards() {
        return scorecards;
    }

    /**
     * Return the questions in this scorecard.
     *
     * @return the questions in this scorecard.
     */
    public ScorecardQuestionBean[] getQuestions() {
        return form.getQuestions();
    }

    /**
     * <p>
     * Return the score.
     * </p>
     *
     * @param index The index of scorecard.
     * @return the score.
     */
    public String getScore(int index) {
        if (scorecards[index] != null) {
            return scoreFormatter.format(scorecards[index].getScore());
        } else {
            return messages.getMessage("prompt.nonAvailable");
        }
    }

    /**
     * <p>
     * Return the average score.
     * </p>
     *
     * @return the average score.
     */
    public String getAvgScore() {
        if (avgScoreReady) {
            return scoreFormatter.format(avgScore);
        } else {
            return messages.getMessage("prompt.nonAvailable");
        }
    }

    /**
     * <p>
     * Return whether the average score is ready.
     * </p>
     *
     * @return whether the average score is ready.
     */
    public boolean getAvgScoreReady() {
        return avgScoreReady;
    }

    /**
     * <p>
     * Return whether the PM has reviewed.
     * </p>
     *
     * @return whether the PM has reviewed.
     */
    public boolean getIsPMReviewed() {
        if (avgScoreReady && scorecards[0].isPMReviewed()) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * <p>
     * Return the average score for each question.
     * </p>
     *
     * @param index The index of question.
     * @return the average score for each question.
     */
    public String getQuestionAvgScore(int index) {
        if (avgScoreReady) {
            double avg = 0.0;
            int totalPass = 0;
            int totalTests = 0;
            for (int i = 0; i < scorecards.length; i++) {
                if (scorecards[i].getQuestions()[index] instanceof TestCaseScorecardQuestion) {
                    totalPass += ((TestCaseScorecardQuestion) scorecards[i].getQuestions()[index]).getTotalPass();
                    totalTests += ((TestCaseScorecardQuestion) scorecards[i].getQuestions()[index]).getTotalTests();
                } else {
                    if (scorecards[i].getQuestions()[index].getEvaluation() == null) {
                        return messages.getMessage("prompt.nonAvailable");
                    } else {
                        avg += scorecards[i].getQuestions()[index].getEvaluation().getValue();
                    }
                }
            }
            if (totalTests > 0) {
                return "" + totalPass + " / " + totalTests;
            } else {
                return scoreFormatter.format(avg / scorecards.length);
            }
        } else {
            return messages.getMessage("prompt.nonAvailable");
        }
    }

    /**
     * <p>
     * Return whether the specified question is test case scorecard question.
     * </p>
     *
     * @param index The index of question.
     * @return whether the specified question is test case scorecard question.
     */
    public boolean getTestCaseSQ(int index) {
        if (scorecards.length > 0) {
            return (scorecards[0].getQuestions()[index] instanceof TestCaseScorecardQuestion);
        } else {
            return false;
        }
    }
}