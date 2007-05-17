/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review.document;

import com.topcoder.util.errorhandling.BaseException;

/**
 * Exception for the Document Already Submitted error.
 *
 * @author TCSDESIGNER
 * @version 1.0
 */
public class DocumentAlreadySubmittedException extends BaseException {
    /**
     * Creates a new DocumentAlreadySubmittedException object.
     */
    public DocumentAlreadySubmittedException() {
        super();
    }

    /**
     * Creates a new DocumentAlreadySubmittedException object.
     *
     * @param s DOCUMENT ME!
     */
    public DocumentAlreadySubmittedException(String s) {
        super(s);
    }
} // end DocumentAlreadySubmittedException



