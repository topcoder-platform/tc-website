package com.topcoder.shared.util;

import java.util.MissingResourceException;
import java.util.ResourceBundle;
import com.topcoder.shared.util.logging.Logger;

public final class TCResourceBundle {
    
    private static Logger log = Logger.getLogger(TCResourceBundle.class);
    
    private ResourceBundle bundle;

    public TCResourceBundle(String baseName) {
        try {
            bundle=ResourceBundle.getBundle(baseName);
        } catch (MissingResourceException e) {
            error("",e);
        }
    }

    public String getProperty(String key, String defaultValue) {
        try {
            if (bundle!=null) {
                return bundle.getString(key);
            }
        } catch (MissingResourceException e) {
            error("",e);
        }
        return defaultValue;
    }
    
    public int getIntProperty(String key, int defaultValue) {
        String str=getProperty(key,Integer.toString(defaultValue));
        return Integer.parseInt(str.trim());
    }

    private static void error(Object message, Throwable t) {
        log.error(message, t);
    }

}
