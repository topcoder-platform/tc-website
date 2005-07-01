/**
 * Copyright � 2005, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.app.screening.ScreeningResponse;

/**
 * Retrieval class used by the Model classes to return screening responses.
 *
 * @author WishingBone
 * @version 1.0
 */
public class ScreeningRetrieval extends SuccessResult {

    /**
     * The warning responses.
     */
    private ScreeningResponse[] warnings = null;

    /**
     * The fatal error responses.
     */
    private ScreeningResponse[] fatalErrors = null;

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

