package com.topcoder.web.codinginterface.techassess;

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

    private static TCResourceBundle bundle = new TCResourceBundle("TechAssess");
    private static boolean isInitialized = false;
    private static Logger log = Logger.getLogger(Constants.class);
    /**
     *  variables that shouldn't be initialized
     */
    private static String[] ignoreList = {"log", "isInitialized", "ignoreList", "bundle", "SHORT_CONTENT"};

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
    public static String PAGE_SUBMIT_CONFIRM;
    public static String PAGE_TEST;
    public static String PAGE_TEST_RESULT;

    //parameters
    public static String COMPANY_ID;
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
    public static String RP_SUBMIT_RESPONSE;
    public static String RP_TEST;
    public static String RP_TEST_RESPONSE;
    public static String RP_TEST_WINDOW;
    public static String RP_TEST_WINDOW_RESPONSE;
    public static String RP_STATIC;

    //session keys
    public static String TEST_SET_A;
    public static String TEST_SET_B;
    public static String EXAMPLES;
    public static String LANGUAGES;
    public static String PROBLEM_SETS;
    public static String PROBLEMS;
    public static String PROBLEM;
    public static String CONTINUE_LINK;
    public static String CONTINUE_DESC;
    public static String CURRENT_TIME;

    //other
    public static int TEST_SET_A_ID;
    public static int TEST_SET_B_ID;
    public static int EXAMPLE_ID;
    public static int TEST_IMAGE_TYPE;

    public static final String SHORT_CONTENT =
            "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">" +
            "<html>" +
            "<head>" +
            "<title>Technical Assessment</title>" +
            "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" >" +
            "<link type=\"text/css\" rel=\"stylesheet\" href=\"/css/screening.css\" >" +
            "</head>" +
            "<body>" +
            "<table class=bodyCenter100 cellspacing=0 cellpadding=0>" +
            "<tr>" +
            " <td align=center>" +
            " <table cellspacing=0 cellpadding=0 class=bodyTable>" +
            " <tr>" +
            " <td><img src=\"/i/corp/screening/bodyTL.gif\" alt=\"\"/></td>" +
            " <td class=bodyT>&#160;</td>" +
            " <td><img src=\"/i/corp/screening/bodyTR.gif\" alt=\"\"/></td>" +
            " </tr>" +
            " <tr>" +
            " <td class=bodyL>&#160;</td>" +
            " <td class=bodyContent>" +
            " <br /><br />" +
            " <table cellspacing=0 cellpadding=5 border=0 class=processingTable>" +
            " <tr>" +
            " <td><p class=pC><span class=bodySmallTitle>Processing...</span></p></td>" +
            " <td><img src=\"/i/corp/screening/processing.gif\" alt=\"\"/></td>" +
            " </tr>" +
            " </table>" +
            " <br /><br />" +
            " </td>" +
            " <td class=bodyR>&#160;</td>" +
            " </tr>" +
            " <tr>" +
            " <td><img src=\"/i/corp/screening/bodyBL.gif\" alt=\"\"/></td>" +
            " <td class=bodyB>&#160;</td>" +
            " <td><img src=\"/i/corp/screening/bodyBR.gif\" alt=\"\"/></td>" +
            " </tr>" +
            " </table>" +
            " </td>" +
            " </tr>" +
            "</table>" +
            "</body>" +
            "</html>";

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
                if (f[i].get(null) == null)
                    log.error("**DID NOT LOAD** " + f[i].getName() + " constant");
                else
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
