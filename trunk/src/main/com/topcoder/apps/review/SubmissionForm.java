/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AbstractScorecard;
import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.projecttracker.Project;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Form bean for the submission.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class SubmissionForm extends ReviewForm {

    // --------------------------------------------------- Instance Variables

    /**
     * The submission
     */
    private AbstractSubmission submission = null;

    /**
     * The submission list of this project
     */
    private AbstractSubmission[] submissions = null;

    /**
     * The scorecard list of this project
     */
    private AbstractScorecard[] scorecards = null;

    private boolean advanced = false;

    // ----------------------------------------------------------- Properties

    public boolean getAdvanced() {
        return advanced;
    }

    public void setAdvanced(boolean b) {
        advanced = b;
    }

    /**
     * Return the submission.
     *
     * @return the submission.
     */
    public AbstractSubmission getSubmission() {
        return submission;
    }

    /**
     * Return the project.
     *
     * @return the project.
     */
    public Project getProject() {
        return submission.getProject();
    }

    /**
     * Return the scorecards.
     *
     * @return the scorecards.
     */
    public AbstractScorecard[] getScorecards() {
        return scorecards;
    }

    /**
     * Return the screening message.
     *
     * @return the screening message.
     */
    public String getScreeningMessage() {
        return submission.getPMScreeningMessage();
    }

    /**
     * Set the screening message.
     *
     * @param message The new screening message.
     */
    public void setScreeningMessage(String message) {
        submission.setPMScreeningMessage(message.trim());
    }

    /**
     * Return the review message.
     *
     * @return the review message.
     */
    public String getReviewMessage() {
        return submission.getPMReviewMessage();
    }

    /**
     * Set the review message.
     *
     * @param message The new review message.
     */
    public void setReviewMessage(String message) {
        submission.setPMReviewMessage(message.trim());
    }

    /**
     * Return whether is the screening phase.
     *
     * @return whether is the screening phase.
     */
    public boolean getIsScreening() {
        if (submission.getProject().getCurrentPhase().getId() == Phase.ID_SCREENING) {
            return true;
        } else {
            return false;
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

        return errors;
    }

    // ------------------------------------------------------ Protected Methods

    /**
     * Creates the form bean from the submission.
     *
     * @param submission The submission for creating the form bean.
     * @param submissions The submission list of this project..
     */
    protected void fromSubmission(AbstractSubmission submission,
                                  AbstractSubmission[] submissions,
                                  AbstractScorecard[] scorecards) {
        this.submission = submission;
        this.submissions = submissions;
        this.scorecards = scorecards;
        setId(submission.getProject().getId());
    }

    /**
     * Creates the ProjectData from this form bean.
     *
     * @param orpd The OnlineReviewProjectData to create the ProjectData.
     * @return the ProjectData created from this form bean.
     */
    protected ProjectData toProjectData(OnlineReviewProjectData orpd) {
        return new ProjectData(orpd, submission.getProject(),
                "PM Review", submissions);
    }
}
