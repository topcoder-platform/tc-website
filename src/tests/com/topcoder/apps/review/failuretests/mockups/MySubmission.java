/*
 * MySubmission.java 1.0 7/2/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.document.AbstractSubmission;

import java.io.*;
import java.net.URL;

/**
 * <p>An implementation of AbstractSubmission used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MySubmission extends AbstractSubmission {
    /**
     * <p>The User making this submission.</p>
     */
    private User submitter;

    /**
     * <p>The project this submission belongs to.</p>
     */
    private Project project;

    /**
     * <p>Constructs a new instance of MySubmission with the
     * given submitter and project.</p>
     *
     * @param submitter the User making this submission
     * @param project the project this submission belongs to
     */
    public MySubmission(User submitter, Project project) {
        super(0, null, "", "", submitter, project, false, 0, 0);
        this.submitter = submitter;
        this.project = project;
    }

    //AbstractSubmission methods

    public URL getURL() {
        try {
            File file = new File("test_files/failure", "TestSubmission.txt");
            return (file.toURL());
        } catch (Exception e) {
            return (null);
        }
    }

    public void setURL(URL url) {
    }

    public String getPMReviewMessage() {
        return (null);
    }

    public void setPMReviewMessage(String message) {
    }

    public String getPMScreeningMessage() {
        return (null);
    }

    public void setPMScreeningMessage(String message) {
    }

    public User getSubmitter() {
        return (submitter);
    }

    public Project getProject() {
        return (project);
    }
}
