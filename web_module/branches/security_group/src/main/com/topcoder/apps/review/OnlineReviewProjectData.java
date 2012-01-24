/**
 * Copyright ? 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;

/**
 * <p>
 * Wrapping class for the user and project data.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class OnlineReviewProjectData extends OnlineReviewData {

    // --------------------------------------------------- Instance Variables

    /**
     * The project info.
     */
    private UserProjectInfo info = null;

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>OnlineReviewProjectData</code> class.
     * </p>
     *
     * @param orpd The OnlineReviewProjectData to be set.
     */
    public OnlineReviewProjectData(OnlineReviewProjectData orpd) {
        super(orpd.getUser());
        this.info = orpd.getProject();
    }

    /**
     * <p>
     * Creates the instance of <code>OnlineReviewProjectData</code> class.
     * </p>
     *
     * @param user The user to be set.
     * @param info The project info to be set.
     */
    public OnlineReviewProjectData(SecurityEnabledUser user, UserProjectInfo info) {
        super(user);

        if (info == null) {
            throw new NullPointerException();
        }

        this.info = info;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the project info.
     * </p>
     *
     * @return the project info.
     */
    public UserProjectInfo getProject() {
        return info;
    } // end getProject

} // end OnlineReviewProjectData



