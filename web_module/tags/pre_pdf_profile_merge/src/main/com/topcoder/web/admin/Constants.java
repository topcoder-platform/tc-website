package com.topcoder.web.admin;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.ServletConfig;
import java.lang.reflect.Field;

public class Constants {

    public static String index_page = null;
    public static String jsp_root = null;
    public static String login_page = null;
    private static Logger log = Logger.getLogger(Constants.class);

    /**
     * Initializes all public static Strings in this class which also appear as
     * init parameters in the given ServletConfig.
     */
    public static void init(ServletConfig sc) {
        Field[] f = Constants.class.getFields();
        for (int i = 0; i < f.length; i++)
            try {
                f[i].set(null, sc.getInitParameter(f[i].getName()));
                if (f[i].get(null) == null)
                    log.debug("did not load " + f[i].getName() + " constant");
                else
                    log.debug("loaded " + f[i].getName() + " constant with value " + f[i].get(null));
            } catch (Exception e) {
                /* probably harmless, could just be a type or modifier mismatch */
                e.printStackTrace();
            }
    }
}
