package com.topcoder.web.test;

import javax.servlet.*;
import javax.servlet.http.*;
import junit.framework.Assert;
import java.util.*;

public class ServletConfigHelper implements ServletConfig {
    public HashMap parameterMap;
    public ServletContext myContext;
    String myName = "ServletConfigHelper";

    public ServletConfigHelper() {
        parameterMap = new HashMap();
        // myContext = 
        parameterMap.put("error_page","/errorPage.jsp");
        parameterMap.put("request_processor_parameter","rp");
        parameterMap.put("valid_char_list","abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_");
        parameterMap.put("processors_package","com.topcoder.web.screening.request");
    }
     /**
     * Returns a String containing the value of the named initialization 
     * parameter, or null if the parameter does not exist.  
     */
    public String getInitParameter(String name) {
        return (String)parameterMap.get(name);
    }
    /**
     * Returns the names of the servlet's initialization parameters as 
     * an Enumeration of String objects, or an empty Enumeration if 
     * the servlet has no initialization parameters.
     */
    public Enumeration getInitParameterNames() {
        Vector v = new Vector(parameterMap.keySet());
        return v.elements();
    }
    
    /**
     * Returns a reference to the ServletContext in which the caller is executing.
     */
    public ServletContext getServletContext() {
        return myContext;
    }
    
    /**
     * Returns the name of this servlet instance.
     */    
    public String getServletName() {
        return myName;        
    }
}