package com.topcoder.web.csf;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.WebConstants;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.MissingResourceException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 22, 2006
 */
public class Constants implements WebConstants {
    private static final TCResourceBundle bundle = new TCResourceBundle("CSF");
    private static final Logger log = Logger.getLogger(Constants.class);


    public static String DEFAULT_PAGE;

    public static final String START_TIME = "sttm";
    public static final String END_TIME = "etm";
    public static final String SUBMISSION = "sbm";
    public static final String SUBMISSION_ID = "sbmid";
    public static final String REVIEW_STATUS_ID = "rstid";
    public static final String SUBMISSION_REVIEW_TEXT = "sbmrtx";
    public static final String CONTEST_PROPERTY = "ctprop";
    public static final String PRIZE_DESCRIPTION = "przdesc";
    public static final String PRIZE_PLACE = "prpl";
    public static final String PRIZE_VALUE = "prvl";
    public static final String PRIZE_ID = "prid";
    public static final String DOCUMENT_ID = "docid";
    public static final String DOCUMENT_TYPE_ID = "doctid";
    public static final String DOCUMENT = "doc";
    public static final long CONTEST_ADMIN_ROLE_ID = 2043;
    public static final String FILE_TYPE = "ft_";
    public static final String SUBMISSION_RANK = "srank";
    public static final String SUBMISSION_IDS = "sids";
    public static final String ELECTION_ID = "elid";
    public static final Integer SUBMISSION_DESCRIPTION_PROPERTY = new Integer(1);
    public static final Integer SUBMISSION_ID_PROPERTY = new Integer(2);

    public static int MAX_CONTEST_NAME_LENGTH;
    public static String JS_DATE_FORMAT;
    public static String JAVA_DATE_FORMAT;
    public static int CONTEST_TERMS_OF_USE_ID;
    public static String ROOT_STORAGE_PATH;
    public static String SUBMISSIONS_DIRECTORY_NAME;
    public static String DOCUMENTS_DIRECTORY_NAME;
    public static int VIEW_SUBMISSIONS_SCROLL_SIZE;
    public static int ADMIN_VIEW_SUBMISSIONS_SCROLL_SIZE;

    public static String ASSEMBLY_COMPETITION_EMAIL;

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
