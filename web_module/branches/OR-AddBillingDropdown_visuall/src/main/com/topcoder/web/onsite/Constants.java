/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.onsite;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.WebConstants;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.MissingResourceException;

/**
 * <strong>Purpose</strong>:
 * Helper class to load all related constants.
 * 
 * @author pulky
 * @version 1.0
 */
public class Constants implements WebConstants {
    /**
     * The bundle to TC resources.
     */
     private static final TCResourceBundle bundle = new TCResourceBundle("onsite");

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(Constants.class);

    /* pages */
    public static String LOGIN;
    public static String DEFAULT_PAGE;
    public static String WAGER_RESULT_PAGE;
    public static String VIEW_COMPETITIONS_PAGE;

    /* request parameters */
    public static String CURRENT_COMPETITION_RESULT_KEY;
    public static String WAGER_HISTORY_KEY;
    public static String WAGER_AMOUNT_KEY;
    public static String MIN_WAGER_AMOUNT_KEY;
    public static String MAX_WAGER_AMOUNT_KEY;
    
    /* misc constants */
    public static int MIN_WAGER_AMOUNT;
    public static int MAX_WAGER_AMOUNT;
    public static int TOTAL_WAGER_POINTS;
    
    /* commands */
    public static String VIEW_WAGER_COMPETITIONS_COMMAND;
    public static String WAGER_SUBMITION_VALIDATION_COMMAND;
    public static String COMPONENT_ROUND_INFO_COMMAND;
    public static String COMPONENT_UPDATE_COMMAND;
    public static String ACTUAL_CONTESTS_COMMAND;

    /* queries */
    public static String ACTUAL_TCO_CONTESTS_QUERY;
    public static String REMAINING_TCO_CONTESTS_QUERY;
    public static String USED_WAGER_POINTS_QUERY;
    public static String WAGER_HISTORY_QUERY;
    public static String COMPONENT_DATA_QUERY;
    public static String COMPONENT_CODER_QUERY;
    public static String REVIEWER_DATA_QUERY;
    public static String COMPONENT_SCORE_QUERY;
    public static String COMPONENT_APPEAL_QUERY;
    public static String COMPONENT_TIME_QUERY;

    static {
        initialize();
    }

    private Constants() {
    }

    /**
     * Initializes the constants.
     */
    public static void initialize() {

        Field[] f = Constants.class.getFields();
        for (int i = 0; i < f.length; i++) {
            try {
                if (!Modifier.isFinal(f[i].getModifiers())) {
                    if (f[i].getType().getName().equals("int")) {
                        try {
                            f[i].setInt(null, bundle.getIntProperty(f[i].getName().toLowerCase()));
                        } catch (MissingResourceException ignore) {
                        }
                    } else if (f[i].getType().getName().equals("java.lang.String")) {
                        try {
                            f[i].set(null, bundle.getProperty(f[i].getName().toLowerCase()));
                        } catch (MissingResourceException ignore) {
                        }
                    } else {
                        throw new Exception("Unrecognized type: " + f[i].getType().getName());
                    }
                }
                if (f[i].get(null) == null)
                    log.error("**DID NOT LOAD** " + f[i].getName() + " constant");
                else
                    log.debug(f[i].getName() + " <== " + f[i].get(null));

            } catch (Exception e) {
                /* probably harmless, could just be a type or modifier mismatch */
                e.printStackTrace();
            }
        }
    }

}
