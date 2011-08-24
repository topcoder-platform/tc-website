package com.topcoder.web.reg;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.WebConstants;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.List;
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
    public static final String COMPANY_NAME = "cpnm";
    public static final String GPA = "gpa";
    public static final String GPA_SCALE = "gpas";
    public static final String VISIBLE_SCHOOL = "vschl";
    public static final String USER = "regUser";
    public static final String REG_TYPES = "regTypes";
    public static final String SCHOOL_TYPE = "scht";
    public static final String SCHOOL_NAME = "schn";
    public static final String SECRET_QUESTION = "sq";
    public static final String SECRET_QUESTION_RESPONSE = "sqr";
    public static final String SECURITY_KEY = "sk";

    public static final String AGE = "age";
    public static final String AGE_END_SEASON = "agees";
    public static final String ATTENDING_HS = "aths";
    public static final String HS_REG_QUESTIONS = "hsrq";

    public static final String SCHOOL_CITY = "schc";
    public static final String SCHOOL_STATE = "schs";
    public static final String SCHOOL_COUNTRY = "schco";
    public static final String SCHOOL_PROVINCE = "schp";

    public static final String FILE_NAME = "filn";
    public static final String FILE_TYPE = "filt";
    public static final String FILE = "fil";

    public static final List GPA_SCALES = Arrays.asList(new String[]{"4.00", "5.00"});

    public static final String FIELDS = "fields";
    public static final String REQUIRED_FIELDS = "reqFields";

    public static final String NEW_REG = "nrg";

    public static final String PHOTO = "photo";

    public static final String REFERRAL = "refid";
    public static final String REFERRAL_CODER = "refidc";
    public static final String REFERRAL_OTHER = "refido";

    public static final String HOME_SCHOOLED = "Home School";
    public static final String MEMBER_CONTACT = "pref_24";
    public static final String SHOW_EARNINGS = "pref_100";

    public static final String INACTIVATE_HS = "inhs";
    public static final String HS_RESPONSES = "hsr";

    public static final String NEW_REG_FLAG = "isNewReg";

    public final static String PUNCTUATION = "-_.{}[]()";
	public final static String HANDLE_PUNCTUATION = "-_.{}[]";
    public final static String HANDLE_ALPHABET = StringUtils.ALPHABET_ALPHA_EN +
            StringUtils.ALPHABET_DIGITS_EN + HANDLE_PUNCTUATION;
    public final static String PASSWORD_ALPHABET = StringUtils.ALPHABET_ALPHA_EN +
            StringUtils.ALPHABET_DIGITS_EN + PUNCTUATION;

    public static int MIN_HANDLE_LENGTH;
    public static int MAX_HANDLE_LENGTH;
    public static int MIN_PASSWORD_LENGTH;
    public static int MAX_PASSWORD_LENGTH;
    public static int MIN_SECRET_QUESTION_LENGTH;
    public static int MAX_SECRET_QUESTION_LENGTH;
    public static int MIN_SECRET_QUESTION_RESPONSE_LENGTH;
    public static int MAX_SECRET_QUESTION_RESPONSE_LENGTH;
    public static int MAX_GIVEN_NAME_LENGTH;
    public static int MAX_SURNAME_LENGTH;
    public static int MAX_NAME_IN_ANOTHER_LANGUAGE_LENGTH;
    public static int MAX_MIDDLE_NAME_LENGTH;
    public static int MAX_ADDRESS_LENGTH;
    public static int MAX_CITY_LENGTH;
    public static int MAX_POSTAL_CODE_LENGTH;
    public static int MIN_POSTAL_CODE_LENGTH;
    public static int MAX_PROVINCE_LENGTH;
    public static int MAX_TITLE_LENGTH;
    public static int MAX_COMPANY_NAME_LENGTH;
    public static int MAX_EMAIL_LENGTH;
    public static int MAX_PHONE_LENGTH;
    public static int MAX_QUOTE_LENGTH;
    public static int MAX_SECURITY_KEY_LENGTH;
    public static int MAX_GPA_LENGTH;

    public static int MAX_DEMOG_RESPONSE_LENGTH;
    public static int MAX_SCHOOL_NAME_LENGTH;

    public static int MAX_SCHOOL_RESULTS;
    public static int MAX_FILE_NAME_LENGTH;

    public static int MAX_REFERRAL_OTHER_LENGTH;

    public static int REG_TERMS_ID;


    private Constants() {

    }

    static {
        initialize();
    }

    public static void initialize() {
        //log.debug("XXXXX initialize called");

        Field[] f = Constants.class.getFields();
        //log.debug(f.length + " fields found");
        for (int i = 0; i < f.length; i++) {
            //log.debug(f[i].getName());
            try {
                if (!Modifier.isFinal(f[i].getModifiers())) {
                    if (f[i].getType().getName().equals("int")) {
                        try {
                            //log.debug("set " + f[i] + " to " + bundle.getIntProperty(f[i].getName().toLowerCase()));
                            f[i].setInt(null, bundle.getIntProperty(f[i].getName().toLowerCase()));
                        } catch (MissingResourceException ignore) {
                        }
                    } else if (f[i].getType().getName().equals("java.lang.String")) {
                        try {
                            //log.debug("set " + f[i] + " to " + bundle.getProperty(f[i].getName().toLowerCase()));
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