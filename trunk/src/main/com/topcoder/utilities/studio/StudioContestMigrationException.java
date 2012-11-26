/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.studio;

import com.topcoder.util.errorhandling.BaseException;

/**
 * <p>A checked exception which is thrown by {@link StudioContestMigrationTool} in case there is unrecoverable error 
 * encountered which prevents the contests from successful migration.</p>
 * 
 * @author isv
 * @version 1.0 (Re-platforming Data Migration Release 1 assembly)
 */
public class StudioContestMigrationException extends BaseException {

    /**
     * <p>Constructs new <code>StudioContestMigrationException</code> instance with specified message providing the
     * details for the encountered error.</p>
     * 
     * @param message a <code>String</code> providing the details for the encountered error.
     */
    public StudioContestMigrationException(String message) {
        super(message);
    }
}
