package com.topcoder.web.codinginterface.techassess;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;

import java.lang.reflect.Field;
import java.util.MissingResourceException;

/**
 * User: dok
 * Date: Dec 6, 2004
 */
public class Constants {

    private static TCResourceBundle bundle = new TCResourceBundle("TechAssess");
    private static boolean isInitialized = false;
    private static Logger log = Logger.getLogger(Constants.class);
    /**
     *  variables that shouldn't be initialized
     */
    private static String[] ignoreList = {"log", "isInitialized", "ignoreList", "bundle"};

    //pages
    public static String PAGE_INDEX;
    public static String PAGE_LOGIN;
    public static String PAGE_CURRENT_TIME;
    public static String PAGE_INDEX_INNER;
    public static String PAGE_VIEW_PROBLEM;
    public static String PAGE_VIEW_PROBLEM_INNER;
    public static String PAGE_VIEW_PROBLEM_SET;
    public static String PAGE_VIEW_PROBLEM_SET_INNER;
    public static String PAGE_PROBLEM_STATEMENT;

    //parameters
    public static String HANDLE;
    public static String PASSWORD;
    public static String COMPANY_ID;
    public static String COMPONENT_ID;
    public static String PROBLEM_TYPE_ID;
    public static String LANGUAGE_ID;
    public static String CODE;
    public static String MODULE;
    public static String STATIC_PREFIX;
    public static String MESSAGE_ID;
    public static String SESSION_ID;

    //request processors
    public static String RP_CURRENT_TIME;
    public static String RP_LOGOUT;
    public static String RP_LOGIN;
    public static String RP_LOGIN_RESPONSE;
    public static String RP_INDEX;
    public static String RP_INDEX_RESPONSE;
    public static String RP_INDEX_INNER;
    public static String RP_VIEW_PROBLEM;
    public static String RP_VIEW_PROBLEM_RESPONSE;
    public static String RP_VIEW_PROBLEM_INNER;
    public static String RP_VIEW_PROBLEM_SET;
    public static String RP_VIEW_PROBLEM_SET_RESPONSE;
    public static String RP_VIEW_PROBLEM_SET_INNER;
    public static String RP_PROBLEM_STATEMENT;
    public static String RP_SAVE;
    public static String RP_COMPILE;
    public static String RP_TIMEOUT;
    public static String RP_SUBMIT;

    //session keys
    public static String TEST_SET_A;
    public static String TEST_SET_B;
    public static String EXAMPLES;
    public static String LANGUAGES;
    public static String PROBLEM_SETS;
    public static String PROBLEMS;
    public static String PROBLEM;

    //other
    public static int TEST_SET_A_ID;
    public static int TEST_SET_B_ID;
    public static int EXAMPLE_ID;



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
                        } catch (MissingResourceException ignore) { }
                    } else if (f[i].getType().getName().equals("java.lang.String")) {
                        try {
                            f[i].set(null, bundle.getProperty(f[i].getName().toLowerCase()));
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
