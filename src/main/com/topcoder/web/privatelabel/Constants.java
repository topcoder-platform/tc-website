package com.topcoder.web.privatelabel;

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

    //pages
    public static String REGISTRATION_PAGE;
    public static String REGISTRATION_CONFIRM_PAGE;
    public static String REGISTRATION_SUCCESS_PAGE;
    public static String DEFAULT_PAGE;

    //parameter keys
    public static String HANDLE;
    public static String PASSWORD;
    public static String PASSWORD_CONFIRM;
    public static String EMAIL;
    public static String EMAIL_CONFIRM;
    public static String FIRST_NAME;
    public static String LAST_NAME;
    public static String ADDRESS1;
    public static String ADDRESS2;
    public static String COUNTRY_CODE;
    public static String STATE_CODE;
    public static String CITY;
    public static String ZIP;
    public static String MODULE_KEY;
    public static String STATIC_PREFIX;
    public static String COMPANY_ID;

    //rules
    public static int MAX_PASSWORD_LENGTH;
    public static int MIN_PASSWORD_LENGTH;
    public static int MAX_HANDLE_LENGTH;
    public static int MIN_HANDLE_LENGTH;
    public static String HANDLE_ALPHABET;
    public static int MAX_EMAIL_LENGTH;

    //processors
    public static String REGISTRATION_MAIN;
    public static String REGISTRATION_CONFIRM;
    public static String REGISTRATION_SUBMIT;


    //DB's
    public static String REGISTRATION_DB;

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
