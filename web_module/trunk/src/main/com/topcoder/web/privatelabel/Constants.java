package com.topcoder.web.privatelabel;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCResourceBundle;

import java.lang.reflect.Field;

/**
 * Contains constants for the private label web application.
 * Classes outside this web application should not use constants
 * in this class that are initialized in the initialize
 * method becuase one can not be sure it has already been
 * initialized.
 * @author gpaul 06.26.2003
 */
public class Constants {

    private static Logger log = Logger.getLogger(Constants.class);
    private static TCResourceBundle bundle = new TCResourceBundle("PrivateLabel");
    private static final String INT_NOT_FOUND = "******NOT FOUND******";
    private static boolean isInitialized = false;

    /**
     *  variables that shouldn't be initialized
     */
    private static String[] ignoreList = {"log", "isInitialized", "ignoreList", "bundle", "INT_NOT_FOUND"};

    //pages
    public static String SIMPLE_REG_PAGE;
    public static String SIMPLE_REG_CONFIRM_PAGE;
    public static String SIMPLE_REG_SUCCESS_PAGE;
    public static String VERIZON_REG_PAGE;
    public static String VERIZON_REG_DEMOG_PAGE;
    public static String VERIZON_REG_CONFIRM_PAGE;
    public static String VERIZON_REG_SUCCESS_PAGE;
    public static String VERIZON_INELIGIBLE_PAGE;
    public static String VERIZON_ACTIVATION_PAGE;
    public static String GOOGLE_REG_PAGE;
    public static String GOOGLE_REG_DEMOG_PAGE;
    public static String GOOGLE_REG_CONFIRM_PAGE;
    public static String GOOGLE_REG_SUCCESS_PAGE;
    public static String GOOGLE_ACTIVATION_PAGE;
    public static String GOOGLE_LOGIN_PAGE;
    public static String DEFAULT_PAGE;
    public static String RESUME_PAGE;
    public static String RESUME_THANK_YOU_PAGE;

    //main reg parameters
    public static String HANDLE;
    public static String PASSWORD;
    public static String PASSWORD_CONFIRM;
    public static String EMAIL;
    public static String EMAIL_CONFIRM;
    public static String FIRST_NAME;
    public static String MIDDLE_NAME;
    public static String LAST_NAME;
    public static String ADDRESS1;
    public static String ADDRESS2;
    public static String ADDRESS3;
    public static String COUNTRY_CODE;
    public static String STATE_CODE;
    public static String PROVINCE;
    public static String CITY;
    public static String ZIP;

    //secondary reg parameters
    public static String CODER_TYPE;
    public static String DEMOG_PREFIX;

    //other parameters
    public static String MODULE_KEY;
    public static String STATIC_PREFIX;
    public static String COMPANY_ID;
    public static String EVENT_ID;
    public static String REGISTRATION_INFO;
    public static String USER_ID;
    public static String FILE;


    //rules
    public static int MAX_PASSWORD_LENGTH;
    public static int MIN_PASSWORD_LENGTH;
    public static int MAX_HANDLE_LENGTH;
    public static int MIN_HANDLE_LENGTH;
    public static String HANDLE_ALPHABET;
    public static int MAX_EMAIL_LENGTH;

    //processors
    public static String SIMPLE_REG_MAIN;
    public static String SIMPLE_REG_CONFIRM;
    public static String SIMPLE_REG_SUBMIT;
    public static String GOOGLE_REG_MAIN;
    public static String GOOGLE_REG_DEMOG;
    public static String GOOGLE_REG_CONFIRM;
    public static String GOOGLE_REG_SUBMIT;
    public static String GOOGLE_ACTIVATION;
    public static String GOOGLE_LOGIN;
    public static String VERIZON_REG_MAIN;
    public static String VERIZON_REG_DEMOG;
    public static String VERIZON_REG_CONFIRM;
    public static String VERIZON_REG_SUBMIT;
    public static String VERIZON_ACTIVATION;
    public static String STATIC;

    //various constants
    public static int STUDENT;
    public static int PROFESSIONAL;
    public static int JTS_TRANSACTIONAL;
    public static int TRANSACTIONAL;

    public static int SCHOOL_QUESTION;
    public static int NO_DEGREE_ANSWER;


    private Constants() {
    }

    public static void initialize() {

        Field[] f = Constants.class.getFields();
        String value;
        for (int i = 0; i < f.length; i++) {
            try {
                if (!ignore(f[i].getName())) {
                    if (f[i].getType().getName().equals("int")) {
                        value = bundle.getProperty(f[i].getName().toLowerCase(), INT_NOT_FOUND);
                        if (!value.equals(INT_NOT_FOUND)) {
                            f[i].setInt(null, Integer.parseInt(value));
                        }
                    } else if (f[i].getType().getName().equals("java.lang.String")) {
                        f[i].set(null, bundle.getProperty(f[i].getName().toLowerCase(), null));
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
