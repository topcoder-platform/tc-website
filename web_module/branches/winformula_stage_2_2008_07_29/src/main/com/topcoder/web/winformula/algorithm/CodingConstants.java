package com.topcoder.web.winformula.algorithm;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.MissingResourceException;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.CodingInterfaceConstants;

/**
 * User: dok
 * Date: Dec 6, 2004
 */
public class CodingConstants implements CodingInterfaceConstants {

    private static final TCResourceBundle bundle = new TCResourceBundle("LongContest");
    private static final Logger log = Logger.getLogger(CodingConstants.class);

    
    public static final String CLASS_NAME = "cname";
    public static final String METHOD_NAME = "methname";
    public static final String RETURN_TYPE = "rettype";
    public static final String ARG_TYPES = "argtypes";
    public static final String ACTION_KEY= "action";
    public static final String LANGUAGES = "languages";
    public static final String QUEUE_LENGTH = "queuelen";


    //Constants
    public static int SUBMISSION_RATE;
    
    //PAGES
    public static String PAGE_SUBMIT;
    public static String PAGE_SUBMIT_SUCCESS;
    public static String PAGE_QUEUE_STATUS;
    public static String PAGE_REG_NEEDED;
    public static String PAGE_MY_ALGOS;

    static {
        initialize();
    }

    public static void initialize() {

        Field[] f = CodingConstants.class.getFields();
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
