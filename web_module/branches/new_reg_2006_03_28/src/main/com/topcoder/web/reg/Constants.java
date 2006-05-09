package com.topcoder.web.reg;

import com.topcoder.web.common.WebConstants;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.MissingResourceException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Constants implements WebConstants {

    private static final TCResourceBundle bundle = new TCResourceBundle("Registration");
    private static final Logger log = Logger.getLogger(Constants.class);


    public static final String REGISTRATION_TYPE = "rt";
    public static final String QUOTE = "qu";
    public static final String NOTIFICATION = "not_";
    public static final String COMP_COUNTRY_CODE = "ccc";
    public static final String COMPANY_NAME = "cpnm";
    public static final String TITLE = "ttl";
    public static final String GPA = "gpa";
    public static final String GPA_SCALE = "gpas";
    public static final String VISIBLE_SCHOOL = "vschl";
    public static final String USER = "regUser";

    public static final String FIELDS = "fields";

    public static final String NEW_REG = "nrg";


    private final static String PUNCTUATION = "-_.{}[]()";
    public final static String HANDLE_ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" +
            "abcdefghijklmnopqrstuvwxyz" +
            "0123456789" + PUNCTUATION;
    public final static String PASSWORD_ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" +
            "abcdefghijklmnopqrstuvwxyz" +
            "0123456789" + PUNCTUATION;

    public static int MIN_HANDLE_LENGTH;
    public static int MAX_HANDLE_LENGTH;
    public static int MIN_PASSWORD_LENGTH;
    public static int MAX_PASSWORD_LENGTH;
    public static int MAX_GIVEN_NAME_LENGTH;
    public static int MAX_SURNAME_LENGTH;
    public static int MAX_MIDDLE_NAME_LENGTH;
    public static int MAX_ADDRESS_LENGTH;
    public static int MAX_CITY_LENGTH;
    public static int MAX_POSTAL_CODE_LENGTH;
    public static int MAX_PROVINCE_LENGTH;
    public static int MAX_TITLE_LENGTH;
    public static int MAX_COMPANY_NAME_LENGTH;
    public static int MAX_EMAIL_LENGTH;
    public static int MAX_PHONE_LENGTH;
    public static int MAX_QUOTE_LENGTH;





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
