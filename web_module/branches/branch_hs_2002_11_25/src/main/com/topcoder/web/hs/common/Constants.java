package com.topcoder.web.hs.common;

import java.lang.reflect.*;
import javax.servlet.ServletConfig;

/**
 * Houses some constants cand convenience methods used by hs classes.
 * Constant strings are initialized en masse at runtime from ServletConfig using reflection.
 *
 * @author Ambrose Feinstein
 */
public class Constants {

   public static String security_component_remote_address;
   public static String public_home;
   public static String member_home;
   public static String login_form;

  /**
   * Initializes all public static Strings in this class which also appear as
   * init parameters in the given ServletConfig.
   */
    public static void init(ServletConfig sc) {
        System.out.println("dumping all servlet init parameters:\n");
        java.util.Enumeration en = sc.getInitParameterNames();
        while(en.hasMoreElements()) {
            String n = (String)en.nextElement();
            String s = sc.getInitParameter(n);
            System.out.println(n+" = "+s);
        }
        Field[] f = Constants.class.getFields();
        for(int i=0; i<f.length; i++)
            try {
                f[i].set(null, sc.getInitParameter(f[i].getName()));
            } catch(Exception e) { }
    }

    /** Replaces null strings with "", others are returned untouched. */
    public static String checkNull(String s) {
        return s==null?"":s;
    }

    /** Checks whether a string is an acceptable identifier for a class name, path component, etc. */
    public static boolean isLegal(String s) {
        if(s==null) return false;
        if(s.equals("")) return false;
        char[] c = s.toCharArray();
        for(int i=0; i<c.length; i++)
            if(0 > "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_".indexOf(c[i]))
                return false;
        return true;
    }
}
