/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.util.log.Level;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogException;
import com.topcoder.util.log.LogFactory;
import org.apache.struts.action.Action;
import org.apache.struts.util.MessageResources;

/**
 * Implementation of <strong>Action</strong> that provides customized logging
 * mechanics using logging_wrapper package.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */

public abstract class BaseAction extends Action {
    /**
     * The logging wrapper instance.
     */
    private Log log = null;

    /**
     * The log name.
     */
    private final static String logName = "com.topcoder.apps.review";

    /**
     * The message resources for this package.
     */
    protected static MessageResources messages =
            MessageResources.getMessageResources(Constants.MESSAGE_RESOURCE_KEY);

    /**
     * Logging information using the logging_wrapper
     *
     * @param level The logging level.
     * @param message The logging message.
     */
    protected void log(Level level, java.lang.Object message) {
        try {
            if (log == null) {
                log = LogFactory.getInstance().getLog(logName);
            }
            log.log(level, message);
        } catch (LogException e) {
        }
    }
}