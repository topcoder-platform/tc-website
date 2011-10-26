package com.topcoder.web.winformula;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.MissingResourceException;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.CodingInterfaceConstants;

/**
 * @author dok
 * @version $Revision: 72735 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 22, 2006
 */
public class Constants implements CodingInterfaceConstants {
    private static final TCResourceBundle bundle = new TCResourceBundle("Winformula");
    private static final Logger log = Logger.getLogger(Constants.class);

    public static String DEFAULT_PAGE;

    public static final String SUBMISSION = "sbm";
    public static final String SUBMISSION_ID = "sbmid";
    public static final String REVIEW_STATUS_ID = "rstid";
    public static final String SUBMISSION_STATUS_ID = "sbstid";
    public static final String SUBMISSION_REVIEW_TEXT = "sbmrtx";
    public static final String CONTEST_PROPERTY = "ctprop";
    public static final String PRIZE_DESCRIPTION = "przdesc";
    public static final String PRIZE_PLACE = "prpl";
    public static final String PRIZE_VALUE = "prvl";
    public static final String PRIZE_TYPE_ID = "prtid";
    public static final String PRIZE_ID = "prid";
    public static final String DOCUMENT_ID = "docid";
    public static final String DOCUMENT_TYPE_ID = "doctid";
    public static final String DOCUMENT = "doc";
    public static final long CONTEST_ADMIN_ROLE_ID = 2076;
    public static final String FILE_TYPE = "ft_";
    public static final String SUBMISSION_RANK = "srank";
    public static final String REG_CONFIRM = "rconfirm";
    public static final String FILENAME = "file";

    public static final String RESULT_KEY = "result_key";
    
    public static final String WEEK_ID = "wid";
    public static final String GAME_ID = "gid";
    public static final String PERIOD_ID = "pid";
    public static final String MINI_SEASON_ID = "msi";

    public static final String WIDTH = "width";
    public static final String HEIGHT = "height";

    public static int MAX_CONTEST_NAME_LENGTH;
    public static String JS_DATE_FORMAT;
    public static String JAVA_DATE_FORMAT;
    public static int CONTEST_TERMS_OF_USE_ID;
    public static String ROOT_STORAGE_PATH;
    public static String SUBMISSIONS_DIRECTORY_NAME;
    public static String DOCUMENTS_DIRECTORY_NAME;
    public static int VIEW_SUBMISSIONS_SCROLL_SIZE;
    public static int ADMIN_VIEW_SUBMISSIONS_SCROLL_SIZE;
    public static int ADMIN_USER_ID;
    //The default contest id to use 
    public static int CONTEST_ID_DEFAULT;
    //Folder containing the static files to serve
    public static String FILES_FOLDER;
    
    public static String FORUM_RSS_URL;
    public static String ESPN_RSS_URL;
    public static String BLOG_RSS_URL;

    public static int TIMEOUT_MILLISECS = 10000;

    public static int WISDOM_ALL;
    public static int WISDOM_BEST;
    
    public static int FIRST_WEEK_ID;
    public static int FIRST_MINI_SEASON_ID;
    
    /*------------------------------------------------------------------------------
     * Coding Interface 
     *-----------------------------------------------------------------------------*/
    
    //The component ID default
    public static int COMPONENT_ID_DEFAULT;

    //Constants
    public static int SUBMISSION_RATE;
    
    //PAGES
    public static String PAGE_SUBMIT;
    public static String PAGE_SUBMIT_SUCCESS;
    public static String PAGE_QUEUE_STATUS;
    public static String PAGE_REG_NEEDED;
    public static String PAGE_MY_ALGOS;
    public static String PAGE_PROBLEM_STATEMENT_CONTENT;
    public static String PAGE_PROBLEM_STATEMENT;
    public static String PAGE_PROBLEM_SOLUTION;
    public static String PAGE_VIEW_EXAMPLE_RESULTS;
    public static String PAGE_LAST_PREDICTIONS;
    public static String PAGE_MY_PROFILE;
    public static String PAGE_STANDINGS;
    public static String PAGE_GAME_DETAILS;
    
    
        
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
