/*
 * TestCase.java
 *
 * Copyright � 2004, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.ReviewerResponsibility;
import com.topcoder.apps.review.projecttracker.User;

import java.io.Serializable;
import java.net.URL;


/**
 * This class represent an uploaded testcase.
 *
 * @author FatClimber
 * @version 1.0
 */
public class TestCase implements Serializable {
    private long id;
    private URL url;
    private Project project;
    private User reviewer;
    private ReviewerResponsibility type;

    /** dirtyFlag */
    protected boolean dirtyFlag = false;
    private long versionId;

    /**
     * Creates a new TestCase object.
     *
     * @param id DOCUMENT ME!
     * @param url DOCUMENT ME!
     * @param reviewer DOCUMENT ME!
     * @param project DOCUMENT ME!
     * @param requestorId DOCUMENT ME!
     * @param versionId DOCUMENT ME!
     */
    public TestCase(long id, URL url, User reviewer, Project project,
                    ReviewerResponsibility type, long versionId) {
        this.id = id;
        this.url = url;
        this.reviewer = reviewer;
        this.project = project;
        this.versionId = versionId;
        this.type = type;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected boolean getDirty() {
        return dirtyFlag;
    }

    /**
     * @param id
     */
    protected void setDirty(boolean dirtyFlag) {
        this.dirtyFlag = dirtyFlag;
    }

    /**
     * DOCUMENT ME!
     *
     * @return DOCUMENT ME!
     */
    protected long getVersionId() {
        return versionId;
    }

    /**
     * @param vid
     */
    protected void setVersionId(long vid) {
        this.versionId = vid;
    }

    /**
     * <p>
     * Return the id for this testcase.
     * </p>
     *
     * @return id of this testcase.
     */
    public long getId() {
        return id;
    }

    /**
     * @param id
     */
    protected void setId(long id) {
        this.id = id;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the URL of this testcase.
     * </p>
     *
     * @return a String with the URL of this testcase.
     */
    public URL getURL() {
        return url;
    }

    /**
     * <p>
     * Set the URL of this testcase.
     * </p>
     *
     * @param url The URL of this testcase.
     */
    public void setURL(URL url) {
        this.url = url;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the reviewer.
     * </p>
     *
     * @return the reviewer.
     */
    public User getReviewer() {
        return reviewer;
    }

    /**
     * @return Returns the type.
     */
    public ReviewerResponsibility getType() {
        return type;
    }

    /**
     * @param type The type to set.
     */
    public void setType(ReviewerResponsibility type) {
        this.type = type;
    }

    /**
     * <p>
     * Return the project related to this testcase.
     * </p>
     *
     * @return Project the related project.
     */
    public Project getProject() {
        return project;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof TestCase)) {
            return false;
        }

        TestCase testcase = (TestCase) o;

        return testcase.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }

}
