/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.projecttracker.Project;

/**
 * <p>
 * Wrapping class for the project data.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ProjectData extends OnlineReviewData {

    // --------------------------------------------------- Instance Variables

    /**
     * The project.
     */
    private Project project = null;

    /**
     * The reason of project termination.
     */
    private String reason = null;

    /**
     * The submissions of this project.
     */
    private AbstractSubmission[] submissions = null;

    /**
     * If mail notification should be sent.
     */
    private boolean sendMail = false;

    /**
     * If a submitter role can be removed.
     * Used if admin assigns a submitter a review role.
     */
    private boolean submitterRemoval = false;

    /**
     * @param ord
     * @param project
     * @param reason
     * @param submissions
     */
    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>ProjectData</code> class.
     * </p>
     *
     * @param ord The OnlineReviewData to be set.
     * @param project The project.
     * @param reason The reason of project termination.
     */
    public ProjectData(OnlineReviewData ord, Project project,
                       String reason, AbstractSubmission[] submissions) {
        super(ord);
        this.project = project;
        this.reason = reason;
        this.submissions = submissions;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the wrapped project information.
     * </p>
     *
     * @return the wrapped project information.
     */
    public Project getProject() {
        return project;
    } // end getProject

    /**
     * <p>
     * Return the reason of project termination.
     * </p>
     *
     * @return the reason of project termination.
     */
    public String getReason() {
        return reason;
    } // end getReason

    /**
     * <p>
     * Return the submissions of this project.
     * </p>
     *
     * @return the submissions of this project.
     */
    public AbstractSubmission[] getSubmissions() {
        return submissions;
    } // end getSubmissions

    /**
     * @return Returns the sendMail.
     */
    public boolean getSendMail() {
        return sendMail;
    }

    /**
     * @param sendMail The sendMail to set.
     */
    public void setSendMail(boolean sendMail) {
        this.sendMail = sendMail;
    }

    /**
     * @return Returns the submitterRemoval.
     */
    public boolean getSubmitterRemoval() {
        return submitterRemoval;
    }

    /**
     * @param submitterRemoval The submitterRemoval to set.
     */
    public void setSubmitterRemoval(boolean submitterRemoval) {
        this.submitterRemoval = submitterRemoval;
    }

} // end ProjectData



