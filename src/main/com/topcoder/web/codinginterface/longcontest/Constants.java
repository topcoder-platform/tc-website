package com.topcoder.web.codinginterface.longcontest;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.CodingInterfaceConstants;

import java.lang.reflect.Field;
import java.util.MissingResourceException;

/**
 * User: dok
 * Date: Dec 6, 2004
 */
public class Constants implements CodingInterfaceConstants {

    private static TCResourceBundle bundle = new TCResourceBundle("LongContest");
    private static boolean isInitialized = false;
    private static Logger log = Logger.getLogger(Constants.class);
    /**
     * variables that shouldn't be initialized
     */
    private static String[] ignoreList = {"log", "isInitialized", "ignoreList", "bundle", "SHORT_CONTENT"};

    public static String ROUND_ID;
    public static String ROUND_TYPE_ID;
    public static String CONTEST_ID;
    public static String CODER_ID;
    public static String TEST_CASE_ID;
    public static String PROBLEM_ID;
    public static String SUBMISSION_NUMBER;
    public static String START_COL;
    public static String COL_COUNT;
    public static String ROW_COUNT;
    public static String KEY_USER_HANDLE;
    public static String KEY_USER_PASS;
    public static String ACTION_KEY;
    public static String QUEUE_LENGTH;

    public static String LONG_CONTEST_INDEX_KEY;
    public static String PROBLEM_STATEMENT_KEY;
    public static String LANGUAGES;
    public static String CLASS_NAME;
    public static String METHOD_NAME;
    public static String RETURN_TYPE;
    public static String ARG_TYPES;

    public static String CONTEST_LIST_KEY;
    public static String ROUND_STANDINGS_LIST_KEY;
    public static String NUM_REGISTRANTS_KEY;
    public static String CONTEST_NAME_KEY;
    public static String PREV_IDX_KEY;
    public static String NEXT_IDX_KEY;
    public static String ROUND_TERMS_KEY;

    public static int PROBLEM_REFRESH;
    public static String DEFAULT_COL_COUNT;
    public static String DEFAULT_ROW_COUNT;
    public static String DEFAULT_SYSTEM_TEST_RESULTS_ROW_COUNT;
    public static int LONG_PRACTICE_ROUND_TYPE_ID;
    public static int LONG_ROUND_TYPE_ID;
    public static int INTEL_LONG_PRACTICE_ROUND_TYPE_ID;
    public static int INTEL_LONG_ROUND_TYPE_ID;

    public static String LOGIN_JSP;
    public static String PAGE_VIEW_REG;
    public static String RP_SUBMIT;
    public static String SUBMISSION_JSP;
    public static String RP_ACTIVE_CONTESTS;
    public static String PAGE_ACTIVE_CONTESTS;
    public static String RP_VIEW_REGISTRANTS;
    public static String PAGE_VIEW_REGISTRANTS;
    public static String RP_PROBLEM_STATEMENT;
    public static String PAGE_PROBLEM_STATEMENT;
    public static String PAGE_PROBLEM_STATEMENT_CONTENT;
    public static String RP_VIEW_STANDINGS;
    public static String PAGE_STANDINGS;
    public static String RP_SUBMISSION_HISTORY;
    public static String PAGE_SUBMISSION_HISTORY;
    public static String RP_PROBLEM_SOLUTION;
    public static String PAGE_PROBLEM_SOLUTION;
    public static String RP_VIEW_OVERVIEW;
    public static String PAGE_VIEW_OVERVIEW;
    public static String RP_VIEW_SYSTEM_TEST;
    public static String PAGE_VIEW_SYSTEM_TEST;
    public static String RP_VIEW_SYSTEM_TEST_RESULTS;
    public static String PAGE_VIEW_SYSTEM_TEST_RESULTS;
    public static String RP_VIEW_PRACTICE;
    public static String PAGE_VIEW_PRACTICE;
    public static String PAGE_SUBMIT_SUCCESS;
    public static int SUBMISSION_RATE;

    static {
        initialize();
    }

    public static void initialize() {

        Field[] f = Constants.class.getFields();
        for (int i = 0; i < f.length; i++) {
            try {
                if (!ignore(f[i].getName())) {
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
                if (f[i].get(null) == null) {
                    if (f[i].getType().getName().equals("java.lang.String")) {
                        log.debug("DID NOT LOAD " + f[i].getName() + " constant.  Setting to default");
                        f[i].set(null, f[i].getName());
                    } else {
                        log.error("**DID NOT LOAD** " + f[i].getName() + " constant");
                    }
                } else
                    log.debug(f[i].getName() + " <== " + f[i].get(null));

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
        for (int i = 0; i < ignoreList.length && !found; i++) {
            found |= ignoreList[i].equals(name);
        }
        return found;
    }


}
