package com.topcoder.web.test;

import javax.servlet.*;
import javax.servlet.http.*;
import junit.framework.Assert;
import java.util.*;

/**
 * Helper class implementing RequestDispatcher interface
 * fuctionality - saves forwardString for testing purposes
 * 
 * @author - mishagam
 * */
public class RequestDispatcherHelper implements RequestDispatcher {
    public String forwardString = "";
    public String resource = "";
    
    /**
     * Forwards a request from a servlet to another resource 
     * (servlet, JSP file, or HTML file) on the server.
     */    
    public void forward(ServletRequest request, ServletResponse response) {
        forwardString = resource;
    }
    /**
     * Includes the content of a resource (servlet, JSP page, HTML file) in the response.
     */
    public void include(ServletRequest request, ServletResponse response) {
    }          
}