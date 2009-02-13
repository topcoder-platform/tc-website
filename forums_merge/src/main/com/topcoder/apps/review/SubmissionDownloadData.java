/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

/**
 * Wrapping class for the submission download data.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class SubmissionDownloadData extends OnlineReviewProjectData {

    // --------------------------------------------------- Instance Variables

    /**
     * The id of submission.
     */
    private long submissionId = 0;

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>SubmissionDownloadData</code> class.
     * </p>
     *
     * @param sdd The SubmissionDownloadData to be set.
     */
    SubmissionDownloadData(SubmissionDownloadData sdd) {
        super(sdd.getUser(), sdd.getProject());
        this.submissionId = sdd.getSubmissionId();
    }

    /**
     * <p>
     * Creates the instance of <code>SubmissionDownloadData</code> class.
     * </p>
     *
     * @param orpd The OnlineReviewProjectData to be set.
     * @param submissionId The id of submission to be set.
     */
    SubmissionDownloadData(OnlineReviewProjectData orpd, long submissionId) {
        super(orpd);
        this.submissionId = submissionId;
    }

    /**
     * <p>
     * Creates the instance of <code>SubmissionDownloadData</code> class.
     * </p>
     *
     * @param user The SecurityEnabledUser to be set.
     * @param info The UserProjectInfo to be set.
     * @param submissionId The id of submission to be set.
     */
    SubmissionDownloadData(SecurityEnabledUser user, UserProjectInfo info, long submissionId) {
        super(user, info);
        this.submissionId = submissionId;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the id of submission.
     * </p>
     *
     * @return the id of submission.
     */
    public long getSubmissionId() {
        return submissionId;
    }

}

