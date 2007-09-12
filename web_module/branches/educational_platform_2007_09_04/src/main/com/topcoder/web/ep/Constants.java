/*
* Constants
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.MissingResourceException;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.WebConstants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Constants implements WebConstants {

    public static final String USER = "activeUser";
    public static final String SCHOOL = "school";
    public static final String SCHOOL_ID = "schid";
    public static String SCHOOL_NAME;

    public static int MAX_SCHOOL_NAME_LENGTH;
    public static int MAX_SCHOOL_RESULTS;

    private static final TCResourceBundle bundle = new TCResourceBundle("EP");
    private static final Logger log = Logger.getLogger(Constants.class);


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