package com.topcoder.web.security;

import javax.servlet.ServletConfig;
import java.lang.reflect.Field;

public class Constants {

    public static String menu_page = null;
    public static String jsp_root = null;

    /**
     * Initializes all public static Strings in this class which also appear as
     * init parameters in the given ServletConfig.
     */
    public static void init(ServletConfig sc) {
        Field[] f = Constants.class.getFields();
        for (int i = 0; i < f.length; i++)
            try {
                f[i].set(null, sc.getInitParameter(f[i].getName()));
            } catch (Exception e) {
                /* probably harmless, could just be a type or modifier mismatch */
                e.printStackTrace();
            }
    }
}
