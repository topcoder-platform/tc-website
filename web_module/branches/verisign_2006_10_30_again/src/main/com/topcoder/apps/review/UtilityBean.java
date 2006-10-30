/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;

/**
 * The bean object to store the user's extra information.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class UtilityBean {

    // --------------------------------------------------- Instance Variables

    /**
     * The login user.
     */
    private SecurityEnabledUser user = null;

    /**
     * Whether to view all the projects.
     */
    private boolean viewAllProjects = false;

    /**
     * The notice
     */
    private String notice = null;

    /**
     * Whether the user has submitted the solution.
     */
    private boolean isSubmitted = false;

    /**
     * Whether the user is one of the review board.
     */
    private boolean isBoard = false;

    // --------------------------------------------------------- Constructor

    /**
     * <p>
     * Creates the instance.
     * </p>
     *
     * @param user The login user.
     */
    public UtilityBean(SecurityEnabledUser user) {
        this.user = user;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Return whether the user is admin.
     * </p>
     *
     * @return whether the user is admin.
     */
    public boolean getAdmin() {
        return new BusinessDelegate().getAdmin(user);
    } // end getAdmin

    /**
     * <p>
     * Return whether to view all the projects.
     * </p>
     *
     * @return whether to view all the projects.
     */
    public boolean getViewAllProjects() {
        return viewAllProjects;
    }

    /**
     * <p>
     * Set whether to view all the projects.
     * </p>
     *
     * @param viewAllProjects Whether to view all the projects.
     */
    public void setViewAllProjects(boolean viewAllProjects) {
        this.viewAllProjects = viewAllProjects;
    }

    /**
     * <p>
     * Return the notic message.
     * </p>
     *
     * @return the notice message.
     */
    public String getNotice() {
        return notice;
    }

    /**
     * <p>
     * Return whether the notic message is empty.
     * </p>
     *
     * @return whether the notice message is empty.
     */
    public boolean getEmptyNotice() {
        if (notice == null || notice.equals("")) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * <p>
     * Set the notic message.
     * </p>
     *
     * @param notice The new notice message.
     */
    public void setNotice(String notice) {
        this.notice = notice;
    }

    /**
     * <p>
     * Set the submitted flag.
     * </p>
     *
     * @param isSubmitted Whether the user has submitted the solution.
     */
    public void setSubmitted(boolean isSubmitted) {
        this.isSubmitted = isSubmitted;
    }

    /**
     * <p>
     * Get the submitted flag.
     * </p>
     *
     * @return whether the user has submitted the solution.
     */
    public boolean getSubmitted() {
        return isSubmitted;
    }

    /**
     * <p>
     * Set whether the user is one of the review board.
     * </p>
     *
     * @param isBoard Whether the user is one of the review board.
     */
    public void setBoard(boolean isBoard) {
        this.isBoard = isBoard;
    }

    /**
     * <p>
     * Get whether the user is one of the review board.
     * </p>
     *
     * @return whether the user is one of the review board.
     */
    public boolean getBoard() {
        return isBoard;
    }
} // end UtilityBean



