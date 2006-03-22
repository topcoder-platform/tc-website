package com.topcoder.web.onsite;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.WebConstants;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.MissingResourceException;

public class Constants implements WebConstants {


    private static final TCResourceBundle bundle = new TCResourceBundle("onsite");
    private static final Logger log = Logger.getLogger(Constants.class);

    /* pages */
    public static String LOGIN;
    public static String DEFAULT_PAGE;
    public static String WAGER_RESULT_PAGE;
    public static String VIEW_COMPETITIONS_PAGE;

    /* request parameters */
    public static String MODULE_KEY;
    public static String PROJECT_ID_KEY;
    public static String CURRENT_COMPETITION_RESULT_KEY;
    public static String WAGER_HISTORY_KEY;

    /* misc constants */
    public static String WAGER_AMOUNT;
    public static int MIN_WAGER_AMOUNT;
    public static int MAX_WAGER_AMOUNT;
    public static String MIN_WAGER_AMOUNT_MESSAGE;
    public static String MAX_WAGER_AMOUNT_MESSAGE;
    public static String INVALID_WAGER_FORMAT_MESSAGE;
    public static String SUCCESSFULL_WAGER_MESSAGE;
    public static String INVALID_PROJECT_MESSAGE;
    
    public static String VIEW_WAGER_COMPETITIONS_COMMAND;
    public static String WAGER_SUBMITION_VALIDATION_COMMAND;

    public static String ACTUAL_TCO_CONTESTS_QUERY;
    public static String REMAINING_TCO_CONTESTS_QUERY;
    public static String USED_WAGER_POINTS_QUERY;
    public static String WAGER_HISTORY_QUERY;

    public static int TOTAL_WAGER_POINTS;
    
    /* columns */
    public static String CONTEST_NAME_COL;
    public static String PROJECT_ID_COL;
    public static String REMAINING_CONTESTS_COL;
    public static String USED_POINTS_COL;
    public static String CREATE_DATE_COL;
    public static String WAGER_AMOUNT_COL;


    static {
        initialize();
    }

    private Constants() {
    }

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
