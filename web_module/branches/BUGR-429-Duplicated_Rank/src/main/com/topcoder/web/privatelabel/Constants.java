package com.topcoder.web.privatelabel;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.WebConstants;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.MissingResourceException;

/**
 * Contains constants for the private label web application.
 *
 * @author gpaul 06.26.2003
 */
public class Constants implements WebConstants {

    private static final Logger log = Logger.getLogger(Constants.class);
    private static final TCResourceBundle bundle = new TCResourceBundle("PrivateLabel");

    //pages
    public static String SIMPLE_REG_PAGE;
    public static String SIMPLE_REG_CONFIRM_PAGE;
    public static String SIMPLE_REG_SUCCESS_PAGE;
    public static String VERIZON_REG_PAGE;
    public static String VERIZON_REG_DEMOG_PAGE;
    public static String VERIZON_REG_CONFIRM_PAGE;
    public static String VERIZON_REG_SUCCESS_PAGE;
    //    public static String VERIZON_INELIGIBLE_PAGE;
    public static String VERIZON_ACTIVATION_PAGE;
    public static String VERIZON_ACTIVATION_REG_FULL_PAGE;
    public static String VERIZON_ACTIVATION_INELIGIBLE_PAGE;

    public static String GOOGLE_REG_PAGE;
    public static String GOOGLE_REG_DEMOG_PAGE;
    public static String GOOGLE_REG_CONFIRM_PAGE;
    public static String GOOGLE_REG_SUCCESS_PAGE;
    public static String GOOGLE_ACTIVATION_PAGE;
    public static String GOOGLE_LOGIN_PAGE;
    public static String GOOGLE_REG_CLOSED_PAGE;

    public static String GOOGLE04_REG_PAGE;
    public static String GOOGLE04_REG_DEMOG_PAGE;
    public static String GOOGLE04_REG_CONFIRM_PAGE;
    public static String GOOGLE04_REG_SUCCESS_PAGE;
    public static String GOOGLE04_ACTIVATION_PAGE;
    public static String GOOGLE04_LOGIN_PAGE;
    public static String GOOGLE04_REG_CLOSED_PAGE;

    public static String GOOGLE05_REG_PAGE;
    public static String GOOGLE05_REG_DEMOG_PAGE;
    public static String GOOGLE05_REG_CONFIRM_PAGE;
    public static String GOOGLE05_REG_SUCCESS_PAGE;
    public static String GOOGLE05_ACTIVATION_PAGE;
    public static String GOOGLE05_LOGIN_PAGE;
    public static String GOOGLE05_REG_CLOSED_PAGE;
    public static String GOOGLE05_CREDENTIALS_PAGE;
    public static String GOOGLE05_CREDENTIALS_SENT_PAGE;

    public static String GOOGLE_INDIA_05_REG_PAGE;
    public static String GOOGLE_INDIA_05_REG_DEMOG_PAGE;
    public static String GOOGLE_INDIA_05_REG_CONFIRM_PAGE;
    public static String GOOGLE_INDIA_05_REG_SUCCESS_PAGE;
    public static String GOOGLE_INDIA_05_ACTIVATION_PAGE;
    public static String GOOGLE_INDIA_05_REG_CLOSED_PAGE;
    public static String GOOGLE_INDIA_05_CREDENTIALS_PAGE;
    public static String GOOGLE_INDIA_05_CREDENTIALS_SENT_PAGE;

    public static final String GOOGLE_EUROPE_06_LOGIN_PAGE = "/gecj06/login.jsp";
    public static final String GOOGLE_EUROPE_06_REG_PAGE = "/gecj06/reg.jsp";
    public static final String GOOGLE_EUROPE_06_REG_DEMOG_PAGE = "/gecj06/demog.jsp";
    public static final String GOOGLE_EUROPE_06_REG_CONFIRM_PAGE = "/gecj06/confirm.jsp";
    public static final String GOOGLE_EUROPE_06_REG_SUCCESS_PAGE = "&d1=gecj06&d2=regsuccess";
    public static final String GOOGLE_EUROPE_06_UPDATE_SUCCESS_PAGE = "&d1=gecj06&d2=updatesuccess";
    public static final String GOOGLE_EUROPE_06_ACTIVATION_PAGE = "/gecj06/activation.jsp";
    public static final String GOOGLE_EUROPE_06_REG_CLOSED_PAGE = "/gecj06/reg_closed.jsp";
    public static final String GOOGLE_EUROPE_06_CREDENTIALS_PAGE = "/gecj06/credentials.jsp";
    public static final String GOOGLE_EUROPE_06_CREDENTIALS_SENT_PAGE = "/gecj06/credentialsSent.jsp";

    public static final String GOOGLE_06_LOGIN_PAGE = "/google06/login.jsp";
    public static final String GOOGLE_06_REG_PAGE = "/google06/reg.jsp";
    public static final String GOOGLE_06_REG_DEMOG_PAGE = "/google06/demog.jsp";
    public static final String GOOGLE_06_REG_CONFIRM_PAGE = "/google06/confirm.jsp";
    public static final String GOOGLE_06_REG_SUCCESS_PAGE = "&d1=google06&d2=regsuccess";
    public static final String GOOGLE_06_UPDATE_SUCCESS_PAGE = "&d1=google06&d2=updatesuccess";
    public static final String GOOGLE_06_ACTIVATION_PAGE = "/google06/activation.jsp";
    public static final String GOOGLE_06_REG_CLOSED_PAGE = "/google06/reg_closed.jsp";
    public static final String GOOGLE_06_CREDENTIALS_PAGE = "/google06/credentials.jsp";
    public static final String GOOGLE_06_CREDENTIALS_SENT_PAGE = "/google06/credentialsSent.jsp";

    public static final String GOOGLE_LATIN_AMERICA_07_LOGIN_PAGE = "/gcjsa07/login.jsp";
    public static final String GOOGLE_LATIN_AMERICA_07_REG_PAGE = "/gcjsa07/reg.jsp";
    public static final String GOOGLE_LATIN_AMERICA_07_REG_DEMOG_PAGE = "/gcjsa07/demog.jsp";
    public static final String GOOGLE_LATIN_AMERICA_07_REG_CONFIRM_PAGE = "/gcjsa07/confirm.jsp";
    public static final String GOOGLE_LATIN_AMERICA_07_REG_SUCCESS_PAGE = "&d1=gcjsa07&d2=regsuccess";
    public static final String GOOGLE_LATIN_AMERICA_07_UPDATE_SUCCESS_PAGE = "&d1=gcjsa07&d2=updatesuccess";
    public static final String GOOGLE_LATIN_AMERICA_07_ACTIVATION_PAGE = "/gcjsa07/activation.jsp";
    public static final String GOOGLE_LATIN_AMERICA_07_REG_CLOSED_PAGE = "/gcjsa07/reg_closed.jsp";
    public static final String GOOGLE_LATIN_AMERICA_07_CREDENTIALS_PAGE = "/gcjsa07/credentials.jsp";
    public static final String GOOGLE_LATIN_AMERICA_07_CREDENTIALS_SENT_PAGE = "/gcjsa07/credentialsSent.jsp";

    public static final String GOOGLE_INDIA_06_LOGIN_PAGE = "/gicj06/login.jsp";
    public static final String GOOGLE_INDIA_06_REG_PAGE = "/gicj06/reg.jsp";
    public static final String GOOGLE_INDIA_06_REG_DEMOG_PAGE = "/gicj06/demog.jsp";
    public static final String GOOGLE_INDIA_06_REG_CONFIRM_PAGE = "/gicj06/confirm.jsp";
    public static final String GOOGLE_INDIA_06_REG_SUCCESS_PAGE = "&d1=gicj06&d2=regsuccess";
    public static final String GOOGLE_INDIA_06_UPDATE_SUCCESS_PAGE = "&d1=gicj06&d2=updatesuccess";
    public static final String GOOGLE_INDIA_06_ACTIVATION_PAGE = "/gicj06/activation.jsp";
    public static final String GOOGLE_INDIA_06_REG_CLOSED_PAGE = "/gicj06/reg_closed.jsp";
    public static final String GOOGLE_INDIA_06_CREDENTIALS_PAGE = "/gicj06/credentials.jsp";
    public static final String GOOGLE_INDIA_06_CREDENTIALS_SENT_PAGE = "/gicj06/credentialsSent.jsp";

    public static final String VERISIGN_06_LOGIN_PAGE = "/verisign06/login.jsp";
    public static final String VERISIGN_06_REG_PAGE = "/verisign06/reg.jsp";
    public static final String VERISIGN_06_REG_CONFIRM_PAGE = "/verisign06/confirm.jsp";
    public static final String VERISIGN_06_REG_SUCCESS_PAGE = "&d1=verisign06&d2=regsuccess";
    public static final String VERISIGN_06_UPDATE_SUCCESS_PAGE = "&d1=verisign06&d2=updatesuccess";
    public static final String VERISIGN_06_ACTIVATION_PAGE = "/verisign06/activation.jsp";
    public static final String VERISIGN_06_CREDENTIALS_PAGE = "/verisign06/credentials.jsp";
    public static final String VERISIGN_06_CREDENTIALS_SENT_PAGE = "/verisign06/credentialsSent.jsp";

    public static final String VICC_LOGIN_PAGE = "/vicc/login.jsp";
    public static final String VICC_REG_PAGE = "/vicc/reg.jsp";
    public static final String VICC_REG_CONFIRM_PAGE = "/vicc/confirm.jsp";
    public static final String VICC_REG_SUCCESS_PAGE = "&d1=vicc&d2=regsuccess";
    public static final String VICC_UPDATE_SUCCESS_PAGE = "&d1=vicc&d2=updatesuccess";
    public static final String VICC_ACTIVATION_PAGE = "/vicc/activation.jsp";
    public static final String VICC_CREDENTIALS_PAGE = "/vicc/credentials.jsp";
    public static final String VICC_CREDENTIALS_SENT_PAGE = "/vicc/credentialsSent.jsp";

    public static String DEFAULT_PAGE;

    public static String DC_REG_PAGE;
    public static String DC_REG_DEMOG_PAGE;
    public static String DC_REG_CONFIRM_PAGE;
    public static String DC_REG_STUDENT_SUCCESS_PAGE;
    public static String DC_REG_PRO_SUCCESS_PAGE;
    public static String DC_ACTIVATION_PAGE;

    public static String DC05_REG_PAGE;
    public static String DC05_REG_CONFIRM_PAGE;
    public static String DC05_REG_SUCCESS_PAGE;
    public static String DC05_REG_CLOSED_PAGE;

    public static String BROOKS_REG_PAGE;
    public static String BROOKS_REG_DEMOG_PAGE;
    public static String BROOKS_REG_CONFIRM_PAGE;
    public static String BROOKS_REG_SUCCESS_PAGE;
    public static String BROOKS_ACTIVATION_PAGE;

    public static String DEMO_REG_PAGE;
    public static String DEMO_REG_DEMOG_PAGE;
    public static String DEMO_REG_CONFIRM_PAGE;
    public static String DEMO_REG_SUCCESS_PAGE;
    public static String DEMO_ACTIVATION_PAGE;

    public static String AMAZON_REG_PAGE;
    public static String AMAZON_REG_DEMOG_PAGE;
    public static String AMAZON_REG_CONFIRM_PAGE;
    public static String AMAZON_REG_SUCCESS_PAGE;

    public static int QUESTION_AREAS_OF_INTEREST;

    //other parameters
    public static String STATIC_PREFIX;
    public static String REGISTRATION_INFO;
    public static String FILE;
    public static String LOCALE;


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
    public static String GOOGLE04_REG_MAIN;
    public static String GOOGLE04_REG_DEMOG;
    public static String GOOGLE04_REG_CONFIRM;
    public static String GOOGLE04_REG_SUBMIT;
    public static String GOOGLE04_ACTIVATION;
    public static String GOOGLE04_LOGIN;
    public static String GOOGLE05_REG_MAIN;
    public static String GOOGLE05_REG_DEMOG;
    public static String GOOGLE05_REG_CONFIRM;
    public static String GOOGLE05_REG_SUBMIT;
    public static String GOOGLE05_ACTIVATION;
    public static String GOOGLE05_LOGIN;
    public static String GOOGLE05_CREDENTIALS;
    public static String GOOGLE_CHINA_05_REG_MAIN;
    public static String GOOGLE_CHINA_05_REG_DEMOG;
    public static String GOOGLE_CHINA_05_REG_CONFIRM;
    public static String GOOGLE_CHINA_05_REG_SUBMIT;
    public static String GOOGLE_CHINA_05_ACTIVATION;
    public static String GOOGLE_CHINA_05_LOGIN;
    public static String GOOGLE_CHINA_05_CREDENTIALS;
    public static String GOOGLE_INDIA_05_REG_MAIN;
    public static String GOOGLE_INDIA_05_REG_DEMOG;
    public static String GOOGLE_INDIA_05_REG_CONFIRM;
    public static String GOOGLE_INDIA_05_REG_SUBMIT;
    public static String GOOGLE_INDIA_05_ACTIVATION;
    public static String GOOGLE_INDIA_05_CREDENTIALS;
    public static final String GOOGLE_INDIA_06_REG_MAIN = "GoogleIndia06Reg";
    public static final String GOOGLE_INDIA_06_REG_DEMOG = "GoogleIndia06Demog";
    public static final String GOOGLE_INDIA_06_REG_CONFIRM = "GoogleIndia06Confirm";
    public static final String GOOGLE_INDIA_06_REG_SUBMIT = "GoogleIndia06Submit";
    public static final String GOOGLE_INDIA_06_ACTIVATION = "GoogleIndia06Activate";
    public static final String GOOGLE_INDIA_06_CREDENTIALS = "GoogleIndia06Credentials";
    public static final String GOOGLE_INDIA_06_LOGIN = "GoogleIndia06Login";

    public static final String GOOGLE_EUROPE_06_REG_MAIN = "GoogleEurope06Reg";
    public static final String GOOGLE_EUROPE_06_REG_DEMOG = "GoogleEurope06Demog";
    public static final String GOOGLE_EUROPE_06_REG_CONFIRM = "GoogleEurope06Confirm";
    public static final String GOOGLE_EUROPE_06_REG_SUBMIT = "GoogleEurope06Submit";
    public static final String GOOGLE_EUROPE_06_ACTIVATION = "GoogleEurope06Activate";
    public static final String GOOGLE_EUROPE_06_CREDENTIALS = "GoogleEurope06Credentials";
    public static final String GOOGLE_EUROPE_06_LOGIN = "GoogleEurope06Login";

    public static final String GOOGLE_06_REG_MAIN = "Google06Reg";
    public static final String GOOGLE_06_REG_DEMOG = "Google06Demog";
    public static final String GOOGLE_06_REG_CONFIRM = "Google06Confirm";
    public static final String GOOGLE_06_REG_SUBMIT = "Google06Submit";
    public static final String GOOGLE_06_ACTIVATION = "Google06Activate";
    public static final String GOOGLE_06_CREDENTIALS = "Google06Credentials";
    public static final String GOOGLE_06_LOGIN = "Google06Login";

    public static final String GOOGLE_LATIN_AMERICA_07_REG_MAIN = "GoogleLatinAmerica07Reg";
    public static final String GOOGLE_LATIN_AMERICA_07_REG_DEMOG = "GoogleLatinAmerica07Demog";
    public static final String GOOGLE_LATIN_AMERICA_07_REG_CONFIRM = "GoogleLatinAmerica07Confirm";
    public static final String GOOGLE_LATIN_AMERICA_07_REG_SUBMIT = "GoogleLatinAmerica07Submit";
    public static final String GOOGLE_LATIN_AMERICA_07_ACTIVATION = "GoogleLatinAmerica07Activate";
    public static final String GOOGLE_LATIN_AMERICA_07_CREDENTIALS = "GoogleLatinAmerica07Credentials";
    public static final String GOOGLE_LATIN_AMERICA_07_LOGIN = "GoogleLatinAmerica07Login";

    public static final String VERISIGN_06_REG_MAIN = "VeriSign06Reg";
    public static final String VERISIGN_06_REG_CONFIRM = "VeriSign06Confirm";
    public static final String VERISIGN_06_REG_SUBMIT = "VeriSign06Submit";
    public static final String VERISIGN_06_ACTIVATION = "VeriSign06Activate";
    public static final String VERISIGN_06_CREDENTIALS = "VeriSign06Credentials";
    public static final String VERISIGN_06_LOGIN = "VeriSign06Login";

    public static final String VICC_REG_MAIN = "VICCReg";
    public static final String VICC_REG_CONFIRM = "VICCConfirm";
    public static final String VICC_REG_SUBMIT = "VICCSubmit";
    public static final String VICC_ACTIVATION = "VICCActivate";
    public static final String VICC_CREDENTIALS = "VICCCredentials";
    public static final String VICC_LOGIN = "VICCLogin";


    public static String VERIZON_REG_MAIN;
    public static String VERIZON_REG_DEMOG;
    public static String VERIZON_REG_CONFIRM;
    public static String VERIZON_REG_SUBMIT;
    public static String VERIZON_ACTIVATION;
    public static String STATIC;
    public static String DC_REG_MAIN;
    public static String DC_REG_DEMOG;
    public static String DC_REG_CONFIRM;
    public static String DC_REG_SUBMIT;
    public static String DC_ACTIVATION;
    public static String BROOKS_REG_MAIN;
    public static String BROOKS_REG_DEMOG;
    public static String BROOKS_REG_CONFIRM;
    public static String BROOKS_REG_SUBMIT;
    public static String BROOKS_ACTIVATION;
    public static String DEMO_REG_MAIN;
    public static String DEMO_REG_DEMOG;
    public static String DEMO_REG_CONFIRM;
    public static String DEMO_REG_SUBMIT;
    public static String DEMO_ACTIVATION;
    public static String AMAZON_REG_MAIN;
    public static String AMAZON_REG_DEMOG;
    public static String AMAZON_REG_CONFIRM;
    public static String AMAZON_REG_SUBMIT;
    public static String DC05_REG_MAIN;
    public static String DC05_REG_CONFIRM;
    public static String DC05_REG_SUBMIT;


    //various constants
    public static int STUDENT;
    public static int PROFESSIONAL;
    public static int JTS_TRANSACTIONAL;
    public static int TRANSACTIONAL;

    public static String BROOKS_REFERRAL_QUESTION_ID;
    public static int SCHOOL_QUESTION;
    public static int NO_DEGREE_ANSWER;
    public static int TOO_YOUNG_ANSWER;
    public static int NON_TECHNICAL_ANSWER;
    public static int MAX_VERIZON_REGISTRATIONS;

    public static String VALID_PASS_CHAR_LIST;


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
