/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.shared.util.logging.Logger;

/**
 * This class is returned to indicate that a called business logic method executed without error but no data was
 * returned.
 *
 * @author adic
 * @version 1.0
 */
public class SuccessResult implements ResultData {
    
    private static Logger log = Logger.getLogger(SuccessResult.class);

    /**
     * Constructor.
     */
    SuccessResult() {
        // log the name of the class that is being instantiated
        String s = this.getClass().getName();
        int k = s.lastIndexOf('.');
        if (k >= 0) {
            s = s.substring(k + 1);
        }
        log.debug("SuccessResult: returning an instance of " + s);
    }

}

