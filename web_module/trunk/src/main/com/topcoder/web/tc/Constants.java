package com.topcoder.web.tc;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.ServletConfig;
import java.lang.reflect.Field;

public class Constants {

    private static Logger log = Logger.getLogger(Constants.class);
    private static boolean isInitialized = false;

    /**
     *  variables that shouldn't be initialized
     */
    private static String[] ignoreList = {"log", "isInitialized", "ignoreList"};

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

    /* misc constants */
    public static int SRM_SURVEY_QUESTION;


    private Constants() {
    }

    public static void initialize(ServletConfig config) {

        Field[] f = Constants.class.getFields();
        for (int i = 0; i < f.length; i++) {
            try {
                if (!ignore(f[i].getName())) {
                    if (f[i].getType().getName().equals("int")) {
                        f[i].setInt(null, Integer.parseInt(config.getInitParameter(f[i].getName().toLowerCase())));
                    } else if (f[i].getType().getName().equals("java.lang.String")) {
                        f[i].set(null, config.getInitParameter(f[i].getName().toLowerCase()));
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
