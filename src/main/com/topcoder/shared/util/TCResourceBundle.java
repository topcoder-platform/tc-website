package com.topcoder.shared.util;

import com.topcoder.shared.util.logging.Logger;

import java.util.MissingResourceException;
import java.util.ResourceBundle;

/**
 * @author unknown
 * @version  $Revision$
 */
public final class TCResourceBundle {

    private static Logger log = Logger.getLogger(TCResourceBundle.class);

    private ResourceBundle bundle;

    /**
     *
     * @param baseName
     */
    public TCResourceBundle(String baseName) {
        try {
            bundle = ResourceBundle.getBundle(baseName);
        } catch (MissingResourceException e) {
            error("", e);
        }
    }

    /**
     *
     * @param key
     * @param defaultValue
     * @return
     */
    public String getProperty(String key, String defaultValue) {
        try {
            if (bundle != null) {
                return bundle.getString(key);
            }
        } catch (MissingResourceException e) {
            error("", e);
        }
        return defaultValue;
    }

    /**
     *
     * @param key
     * @param defaultValue
     * @return
     */
    public int getIntProperty(String key, int defaultValue) {
        String str = getProperty(key, Integer.toString(defaultValue));
        return Integer.parseInt(str.trim());
    }

    /**
     *
     * @param message
     * @param t
     */
    private static void error(Object message, Throwable t) {
        log.error(message, t);
    }

}
