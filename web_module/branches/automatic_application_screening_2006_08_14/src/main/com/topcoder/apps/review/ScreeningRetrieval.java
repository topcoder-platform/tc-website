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
     * The task id.
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
     * @param taskId the task id.
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

    /* (non-Javadoc)
     * @see com.topcoder.apps.review.IScreeningRetrieval#getTaskId()
     */
    public long getVersionId() {
        return this.versionId;
    }

    /* (non-Javadoc)
     * @see com.topcoder.apps.review.IScreeningRetrieval#isDone()
     */
    public boolean isDone() {
        return this.done;
    }

    /* (non-Javadoc)
     * @see com.topcoder.apps.review.IScreeningRetrieval#getWarnings()
     */
    public ScreeningResponse[] getWarnings() {
        return warnings;
    }

    /* (non-Javadoc)
     * @see com.topcoder.apps.review.IScreeningRetrieval#getFatalErrors()
     */
    public ScreeningResponse[] getFatalErrors() {
        return fatalErrors;
    }

}

