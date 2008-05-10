/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

/**
 * <strong>Purpose</strong>:
 * The interface that defines the contract to be met by classes used to log the final result of the auto-screening
 * process. This class will be used to set whether the process succeeded or failed.
 *
 * @author TheCois
 * @author WishingBone
 * @version 1.0
 */
public interface ScreeningResult {

    /**
     * <strong>Purpose</strong>:
     * Sets the status of the Screening that is being logged.
     *
     * <strong>Valid Args</strong>:
     * A boolean.
     *
     * @param res The status of the screening operation.
     */
    void setSuccess(boolean res);

    /**
     * <strong>Purpose</strong>:
     * Obtains the status that will be logged when this object is passed to the ScreeningLogger.
     *
     * <strong>Valid Return Values</strong>:
     * A boolean.
     *
     * @return Status of the screening operation.
     */
    boolean isSuccess();

}
