/**
 *  Parameter.java
 */

package com.coolservlets.forum.util;

import javax.servlet.http.HttpServletRequest;

public class ParamUtils {

    public static String getParameter(HttpServletRequest request, String paramName) {
        String temp = request.getParameter(paramName);
        if (temp != null && !temp.equals("")) {
            return temp;
        } else {
            return null;
        }
    }

    public static String getParameter(HttpServletRequest request, String paramName, boolean emptyStringsOK) {
        String temp = request.getParameter(paramName);
        if (emptyStringsOK) {
            if (temp != null) {
                return temp;
            } else {
                return null;
            }
        } else {
            return getParameter(request, paramName);
        }
    }

    public static boolean getBooleanParameter(HttpServletRequest request, String paramName) {
        String temp = request.getParameter(paramName);
        if (temp != null && temp.equals("true")) {
            return true;
        } else {
            return false;
        }
    }

    public static int getIntParameter(HttpServletRequest request, String paramName, int defaultNum) {
        String temp = request.getParameter(paramName);
        if (temp != null && !temp.equals("")) {
            int num = defaultNum;
            try {
                num = Integer.parseInt(temp);
            } catch (Exception ignored) {
            }
            return num;
        } else {
            return defaultNum;
        }
    }

    public static boolean getCheckboxParameter(HttpServletRequest request, String paramName) {
        String temp = request.getParameter(paramName);
        if (temp != null && temp.equals("on")) {
            return true;
        } else {
            return false;
        }
    }

    public static String getAttribute(HttpServletRequest request, String attribName) {
        String temp = (String) request.getAttribute(attribName);
        if (temp != null && !temp.equals("")) {
            return temp;
        } else {
            return null;
        }
    }

    public static boolean getBooleanAttribute(HttpServletRequest request, String attribName) {
        String temp = (String) request.getAttribute(attribName);
        if (temp != null && temp.equals("true")) {
            return true;
        } else {
            return false;
        }
    }

    public static int getIntAttribute(HttpServletRequest request, String attribName, int defaultNum) {
        String temp = (String) request.getAttribute(attribName);
        if (temp != null && !temp.equals("")) {
            int num = defaultNum;
            try {
                num = Integer.parseInt(temp);
            } catch (Exception ignored) {
            }
            return num;
        } else {
            return defaultNum;
        }
    }

}
