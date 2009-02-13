/*
* Constants
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.WebConstants;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.MissingResourceException;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: Constants.java 66662 2007-10-25 12:59:15Z pulky $
 */
public class Constants implements WebConstants {

    public static final String USER = "activeUser";
    public static final String SCHOOL = "school";
    public static final String CLASSROOM = "classroom";
    public static final String CLASSROOMS = "classrooms";
    public static final String STUDENTS = "students";
    public static final String ASSIGNMENT = "assignment";
    public static final String ASSIGNMENT_STUDENTS = "assignment_students";
    public static final String COMPONENTS = "components";

    public static String SCHOOL_NAME;
    public static String COMPONENT_NAME;

    public static int MAX_SCHOOL_NAME_LENGTH;
    public static int MAX_SCHOOL_RESULTS;

    public static int MAX_COMPONENT_NAME_LENGTH;
    public static int MAX_COMPONENT_RESULTS;

    private static final TCResourceBundle bundle = new TCResourceBundle("EP");
    private static final Logger log = Logger.getLogger(Constants.class);

    public static final long STUDENT_ROLE_ID = 2060;
    public static final long PROFESSOR_ROLE_ID = 2061;

    public static final int TIME_BEFORE_EDIT = 1000;
    public static final String FRESH_ID = "fr";

    public static String JS_DATE_FORMAT;
    public static String JAVA_DATE_FORMAT;

    public static final String PROFESSOR_ID = "profId";

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