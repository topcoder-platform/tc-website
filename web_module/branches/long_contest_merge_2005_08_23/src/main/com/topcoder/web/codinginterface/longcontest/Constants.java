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
     *  variables that shouldn't be initialized
     */
    private static String[] ignoreList = {"log", "isInitialized", "ignoreList", "bundle", "SHORT_CONTENT"};

    public static String ROUND_ID;
    public static String CONTEST_ID;
    public static String CODER_ID;
    public static String TEST_CASE_ID;
    public static String LONG_CONTEST_INDEX_KEY;
    public static String LONG_CODE_KEY;
    public static String LONG_TEST_KEY;
    public static String LONG_CONTEST_CODER_SUBMISSIONS_KEY;
    public static String JSP_ADDR;
    public static String INDEX_JSP;
    public static String SUBMISSION_JSP;
    public static String CODER_SUBMISSIONS_JSP;
    public static String LONG_CODE_JSP;
    public static String LONG_TEST_JSP;
    public static String COMPILE_MESSAGE;
    public static String COMPILE_STATUS;
    public static String LANGUAGES;
    public static String SELECTED_LANGUAGE;
    public static String SUBMISSION_NUMBER;
    public static int RESULTS_REFRESH;
    public static String SORT_ORDER;
    public static String RESULTS_TABLE_JSP;
    public static String RESULTS;
    public static String START_ROW;
    public static String START_COL;
    public static String COL_COUNT;
    public static String ROW_COUNT;
    public static String DEFAULT_COL_COUNT;
    public static String DEFAULT_ROW_COUNT;
    public static String PRIMARY_COLUMN;
    public static String PROBLEM_STATEMENT_KEY;
    public static String PROBLEM_STATEMENT_JSP;
    public static int PROBLEM_REFRESH;
    public static String CLASS_NAME;
    public static String CONTEST_OVER;

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
                if (f[i].get(null) == null){
                    log.error("**DID NOT LOAD** " + f[i].getName() + " constant");
                    if (f[i].getType().getName().equals("java.lang.String")) {
                        f[i].set(null, f[i].getName());
                    }
                }else
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
