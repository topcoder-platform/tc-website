/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

/**
 * <strong>Purpose</strong>:
 * Default implementation of ScreeningResult.
 *
 * @author WishingBone
 * @version 1.0
 */
public class SimpleScreeningResult implements ScreeningResult {

    /**
     * <strong>Purpose</strong>:
     * Whether the screening is successful.
     */
    private boolean res;

    /**
     * <strong>Purpose</strong>:
     * Creates a SimpleScreeningResult.
     *
     * @param res The status of the screening operation.
     */
    public SimpleScreeningResult(boolean res) {
        this.setSuccess(res);
    }

    /**
     * <strong>Purpose</strong>:
     * Sets the status of the Screening that is being logged.
     *
     * <strong>Valid Args</strong>:
     * A boolean.
     *
     * @param res The status of the screening operation.
     */
    public void setSuccess(boolean res) {
        this.res = res;
    }

    /**
     * <strong>Purpose</strong>:
     * Obtains the status that will be logged when this object is passed to the ScreeningLogger.
     *
     * <strong>Valid Return Values</strong>:
     * A boolean.
     *
     * @return Status of the screening operation.
     */
    public boolean isSuccess() {
        return this.res;
    }

}
