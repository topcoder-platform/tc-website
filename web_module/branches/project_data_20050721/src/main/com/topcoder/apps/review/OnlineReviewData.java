/**
 * Copyright ? 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;

/**
 * <p>
 * Wrapping class for the user data.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class OnlineReviewData implements ActionData {

    // --------------------------------------------------- Instance Variables

    /**
     * The user.
     */
    private SecurityEnabledUser user = null;

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>OnlineReviewData</code> class.
     * </p>
     *
     * @param ord The OnlineReviewData to be set.
     */
    protected OnlineReviewData(OnlineReviewData ord) {
        this.user = ord.getUser();
    }

    /**
     * <p>
     * Creates the instance of <code>OnlineReviewData</code> class.
     * </p>
     *
     * @param user The user to be set.
     */
    public OnlineReviewData(SecurityEnabledUser user) {
        if (user == null) {
            throw new NullPointerException();
        }

        this.user = user;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the user.
     * </p>
     *
     * @return the user.
     */
    public SecurityEnabledUser getUser() {
        return user;
    } // end getUser

} // end OnlineReviewData



