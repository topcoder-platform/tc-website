package com.topcoder.shared.util;

import java.util.MissingResourceException;
import java.util.ResourceBundle;

import org.apache.log4j.Category;

public final class TCResourceBundle {
    
    private static final Category LOG=Category.getInstance(TCResourceBundle.class);
    
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
        return Integer.parseInt(str);
    }

    private static void error(Object message, Throwable t) {
        LOG.error(message, t);
    }

}
