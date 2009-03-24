/*
 * ConcurrentModificationException.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review;

import com.topcoder.util.errorhandling.BaseException;

/**
 * This exception is cast when there is a Concurrency-error.
 * It means that someone has saved the object you are trying
 * to save AFTER you checked it out using a get-method.
 *
 * @author FatClimber
 */
public class ConcurrentModificationException extends BaseException {
    /**
     * Creates a new ConcurrentModificationException object.
     */
    public ConcurrentModificationException() {
        super();
    }

    /**
     * Creates a new ConcurrentModificationException object.
     *
     * @param s DOCUMENT ME!
     */
    public ConcurrentModificationException(String s) {
        super(s);
    }
}
