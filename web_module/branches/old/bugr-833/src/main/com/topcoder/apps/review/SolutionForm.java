/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import javax.servlet.http.HttpServletRequest;

/**
 * Form bean for the submission.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class SolutionForm extends ReviewForm {

    // --------------------------------------------------- Instance Variables

    /**
     * The file that the user has uploaded
     */
    protected FormFile submission;

    // ----------------------------------------------------------- Properties

    /**
     * Retrieve a representation of the file the user has uploaded
     */
    public FormFile getSubmission() {
        return submission;
    }

    /**
     * Set a representation of the file the user has uploaded
     */
    public void setSubmission(FormFile submission) {
        this.submission = submission;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Reset all properties to their default values.
     *
     * @param mapping The mapping used to select this instance
     * @param request The servlet request we are processing
     */
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        this.submission = null;
    }

}
