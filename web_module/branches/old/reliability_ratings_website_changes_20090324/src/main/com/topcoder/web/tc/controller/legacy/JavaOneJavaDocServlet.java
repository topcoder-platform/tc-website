/*
 * JavaOneJavaDocServlet.java
 *
 * Created on April 27, 2005, 2:58 PM
 */

package com.topcoder.web.tc.controller.legacy;

/**
 *
 * @author rfairfax
 */
public final class JavaOneJavaDocServlet extends JavaDocServlet {
    
    protected String getServletPath() {
        return "javaonedocs";
    }
    
    protected String getDB() {
        return "JAVAONE_OLTP";
    }
}
