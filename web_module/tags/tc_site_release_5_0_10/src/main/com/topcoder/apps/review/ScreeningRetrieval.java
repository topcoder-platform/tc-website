/**
 * Copyright � 2005, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.screening.ScreeningResponse;

/**
 * Retrieval class used by the Model classes to return screening responses.
 *
 * @author WishingBone
 * @version 1.0
 */
public class ScreeningRetrieval extends SuccessResult {

    /**
     * Whether the screening is done.
     */
    private boolean done = true;

    /**
     * The submission version id.
     */
    private long versionId = -1;

    /**
     * The warning responses.
     */
    private ScreeningResponse[] warnings = new ScreeningResponse[0];

    /**
     * The fatal error responses.
     */
    private ScreeningResponse[] fatalErrors = new ScreeningResponse[0];

    /**
     * Constructor.
     *
     * @param versionId the version id.
     */
    ScreeningRetrieval(long versionId) {
        this.versionId = versionId;
        this.done = false;
    }

    /**
     * Constructor.
     *
     * @param warnings the warning responses
     * @param fatalErrors the fatalErrors responses
     */
    ScreeningRetrieval(ScreeningResponse[] warnings, ScreeningResponse[] fatalErrors) {
        this.warnings = warnings;
        this.fatalErrors = fatalErrors;
    }

    /**
     * Get the version id.
     *
     * @return the version id.
     */
    public long getVersionId() {
        return this.versionId;
    }

    /**
     * Whether the screening is done.
     *
     * @return whether the screening is done.
     */
    public boolean isDone() {
        return this.done;
    }

    /**
     * Get the warning responses.
     *
     * @return the warning responses
     */
    public ScreeningResponse[] getWarnings() {
        return warnings;
    }

    /**
     * Get the fatal error responses.
     *
     * @return the fatal error responses
     */
    public ScreeningResponse[] getFatalErrors() {
        return fatalErrors;
    }

}

