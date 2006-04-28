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

    private static final TCResourceBundle bundle = new TCResourceBundle("Reg");
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

    public static final String FIELDS = "fields";

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
