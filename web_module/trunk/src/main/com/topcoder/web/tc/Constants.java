package com.topcoder.web.tc;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCResourceBundle;

import java.lang.reflect.Field;
import java.util.MissingResourceException;

public class Constants {


    private static final String INT_NOT_FOUND = "******NOT FOUND******";
    private static TCResourceBundle bundle = new TCResourceBundle("TC");
    private static boolean isInitialized = false;
    private static Logger log = Logger.getLogger(Constants.class);
    /**
     *  variables that shouldn't be initialized
     */
    private static String[] ignoreList = {"log", "isInitialized", "ignoreList", "INT_NOT_FOUND", "bundle"};

    public static String STATIC_PREFIX;
    public static String DEFAULT_PAGE;

    /* request parameters */
    public static String PROBLEM_ID;
    public static String SURVEY_ID;
    public static String MODULE_KEY;
    public static String FIRST_NAME;
    public static String LAST_NAME;
    public static String EMAIL;
    public static String ACTIVATION_CODE;

    public static String HANDLE;
    public static String STATE_CODE;
    public static String MIN_RATING;
    public static String MAX_RATING;
    public static String MIN_NUM_RATINGS;
    public static String MAX_NUM_RATINGS;

    /* pages */
    public static String SURVEY_RESULTS;
    public static String SURVEY_VIEW;
    public static String SURVEY_LIST;
    public static String SURVEY_THANKS;

    public static String CRPF_REPORT;

    public static String PROBLEM_RATING_RESULTS;
    public static String PROBLEM_RATING_QUESTIONS;
    public static String PROBLEM_RATING_QUESTION_INFO;

    public static String HIGHEST_RATING;

    public static String LOGIN;
    public static String ACTIVATE;
    public static String UNACTIVE;
    public static String RECOVER_PASSWORD;
    public static String EMAIL_SENT;

    public static String SIMPLE_SEARCH_RESULTS;
    public static String ADVANCED_SEARCH_RESULTS;

    /* misc constants */
    public static int SRM_SURVEY_QUESTION;
    public static int SEARCH_SCROLL_SIZE;


    private Constants() {
    }

    public static void initialize() {

        Field[] f = Constants.class.getFields();
        String value = null;
        for (int i = 0; i < f.length; i++) {
            try {
                if (!ignore(f[i].getName())) {
                    if (f[i].getType().getName().equals("int")) {
                        try {
                            value = bundle.getProperty(f[i].getName().toLowerCase(), INT_NOT_FOUND);
                        } catch (MissingResourceException ignore) { }
                        if (!value.equals(INT_NOT_FOUND)) {
                            f[i].setInt(null, Integer.parseInt(value));
                        }
                    } else if (f[i].getType().getName().equals("java.lang.String")) {
                        try {
                            f[i].set(null, bundle.getProperty(f[i].getName().toLowerCase(), null));
                        } catch (MissingResourceException ignore) { }
                    } else {
                        throw new Exception("Unrecognized type: " + f[i].getType().getName());
                    }
                }
                if (f[i].get(null)==null)
                    log.error("**DID NOT LOAD** " + f[i].getName() + " constant");
                else log.debug(f[i].getName() + " <== " + f[i].get(null));

            } catch (Exception e) {
                /* probably harmless, could just be a type or modifier mismatch */
                e.printStackTrace();
            }
        }
        isInitialized = true;
    }

    public static boolean isInitialized() {
        return isInitialized;
    }

    private static boolean ignore(String name) {
        boolean found = false;
        for (int i=0; i<ignoreList.length&&!found; i++) {
            found |= ignoreList[i].equals(name);
        }
        return found;
    }
}
