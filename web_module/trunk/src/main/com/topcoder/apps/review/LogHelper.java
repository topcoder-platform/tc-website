/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.util.log.Level;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogException;
import com.topcoder.util.log.LogFactory;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

/**
 * Helper class for logging using the Logging Wrapper component.
 *
 * @author adic
 * @version 1.0
 */
class LogHelper {

    /**
     * The Log instance.
     */
    private static Log log = null;

    /**
     * Get one Log instance at first usage.
     */
    static {
        try {
            log = LogFactory.getInstance().getLog(LogHelper.class.getName());
            log("BL starts logging ...");
        } catch (LogException e) {
            System.err.println("Exception " + e.toString() + ": " + e.getMessage() + " while logging. "
                    + "Please check the Logging Wrapper configuration");
        }
    }

    /**
     * Constructor (inhibits outside instantiation).
     */
    private LogHelper() {
    }

    /**
     * Log a string message.
     *
     * @param msg the message to log
     */
    static void log(String msg) {
        log(Level.INFO, msg);
    }

    /**
     * Log a string message.
     *
     * @param msg the message to log
     */
    static void log(Level level, String msg) {
        try {
            if (log == null) {
                throw new LogException(null);
            }
            log.log(level, /*"[BL: " + new Date().toString() + "] "*/ "BL." + msg);
        } catch (LogException e) {
            // nowhere to report a logging error except stderr
            System.err.println("Exception " + e.toString() + ": " + e.getMessage() + " while logging: " + msg);
        }
    }

    /**
     * Log an exception with a message).
     *
     * @param msg the message to log
     * @param e the exception to log
     */
    static void log(String msg, Throwable e) {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        e.printStackTrace(pw);
        pw.close();
        try {
            sw.close();
        } catch (IOException ee) {
            System.out.println("this shouldn't happen");
        }
        log(Level.WARN, msg + "exception " + e.toString() + "\n" + sw.toString());
    }

    /**
     * Log the entry into the start method of a Model object.
     *
     * @param model the model object
     * @param data the ActionData passed to the start method
     */
    static void logModel(Model model, ActionData data) {
        String s = model.getClass().getName();
        int k = s.lastIndexOf('.');
        if (k >= 0) {
            s = s.substring(k + 1);
        }
        log("Starting request to model class " + s + " ...");
    }

}

