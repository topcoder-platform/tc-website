/*
 * SubjectiveResponse.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.io.Serializable;


/**
 * SubjectiveResponses support the Evaluations assigned to a
 * SubjectiveScorecardQuestion.
 *
 * @author FatClimber
 * @version 1.0
 */
public class SubjectiveResponse implements Serializable {
    private long id;
    private String responseText;
    private ResponseType responseType;
    private boolean dirtyFlag = false;
    private long versionId;

    /**
     * Constructor
     *
     * @param id DOCUMENT ME!
     * @param responseText DOCUMENT ME!
     * @param responseType DOCUMENT ME!
     * @param versionId DOCUMENT ME!
     */
    public SubjectiveResponse(String responseText, ResponseType responseType) {
        this.id = -1;
        this.responseText = responseText;
        this.responseType = responseType;
        this.versionId = -1;
        this.dirtyFlag = true;
    }

    /**
     * Constructor
     *
     * @param id DOCUMENT ME!
     * @param responseText DOCUMENT ME!
     * @param responseType DOCUMENT ME!
     * @param versionId DOCUMENT ME!
     */
    public SubjectiveResponse(long id, String responseText, ResponseType responseType, long versionId) {
        this.id = id;
        this.responseText = responseText;
        this.responseType = responseType;
        this.versionId = versionId;
        if (id == -1) {
            this.dirtyFlag = true;
        }
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
     * @param dirtyFlag
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
     * Return the id of this subjective response.
     * </p>
     *
     * @return the id of this subjective response.
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
     * Return the text of response.
     * </p>
     *
     * @return a String with the text of response.
     */
    public String getResponseText() {
        return responseText;
    }

    /**
     * <p>
     * Set the text of response.
     * </p>
     *
     * @param text The text of response.
     */
    public void setResponseText(String text) {
        this.responseText = text;
        this.dirtyFlag = true;
    }

    /**
     * <p>
     * Return the type of response.
     * </p>
     *
     * @return the type of response.
     */
    public ResponseType getResponseType() {
        return responseType;
    }

    /**
     * <p>
     * Set the type of response.
     * </p>
     *
     * @param type The type of response.
     */
    public void setResponseType(ResponseType type) {
        this.responseType = type;
        this.dirtyFlag = true;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof SubjectiveResponse)) {
            return false;
        }

        SubjectiveResponse response = (SubjectiveResponse) o;

        return response.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
