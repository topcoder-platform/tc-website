package com.topcoder.utilities.eventmanager;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;

import java.lang.reflect.Field;
import java.util.MissingResourceException;

/**
 * @author dok
 * Date: Apr 2, 2004
 */
public class Constants {

    private static TCResourceBundle bundle = new TCResourceBundle("EventManager");
    private static boolean isInitialized = false;
    private static Logger log = Logger.getLogger(Constants.class);
    /**
     *  variables that shouldn't be initialized
     */
    private static String[] ignoreList = {"log", "isInitialized", "ignoreList", "bundle"};

    public static int READY_FOR_PROCESSING;
    public static int PROCESSING_FAILED;
    public static int PROCESSING_COMPLETE;
    public static String ERROR_EMAIL;


    static {
        initialize();
    }

    private Constants() {
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
