package com.topcoder.web.test;

import javax.servlet.*;
import javax.servlet.http.*;
import junit.framework.Assert;
import java.util.*;
import java.net.URL;
import java.io.InputStream;
import com.topcoder.web.test.RequestDispatcherHelper;

/**
 * Helper class implementing ServletContext interface
 * functionality - allows setting and later retrieving parameters 
 * 	   and attributes, simulates getRequestDispatcher(String path)
 * 
 * @author mishagam
 */
public class ServletContextHelper implements ServletContext {
    public Map attributes = new HashMap();
    public Map initParameters = new HashMap();
    String myServerInfo = "Mock helper server classes";
    public RequestDispatcherHelper myRequestDispatcher = new RequestDispatcherHelper();
   
    public Object getAttribute(String name) {
        return attributes.get(name);
    }
    /**
     * Returns an Enumeration containing the attribute names available within this servlet context.
     */
    public Enumeration getAttributeNames() {
        Vector v = new Vector(attributes.keySet());
        return v.elements();
    }
    /**
     * Returns a ServletContext object that corresponds to a specified URL on the server.
     */
    public ServletContext getContext(String uripath) {
        return null;
    }
    /**
     * Returns a String containing the value of the named context-wide initialization 
     * parameter, or null if the parameter does not exist.
     */
    public String getInitParameter(String name) {
        return (String)initParameters.get(name);
    }
    /**
     * Returns the names of the context's initialization parameters as an Enumeration of 
     * String objects, or an empty Enumeration if the context has no initialization parameters.
     */
    public Enumeration getInitParameterNames() {
        Vector v = new Vector(initParameters.keySet());
        return v.elements();
    }
    /**
     * Returns the major version of the Java Servlet API that this servlet container supports.
     */
    public int getMajorVersion() {
        return 4; // ????? version 1.4 ??
    }
    /**
     * Returns the MIME type of the specified file, or null if the MIME type is not known.
     */
    public String getMimeType(String file) {
        return null;
    }
    /**
     * Returns the minor version of the Servlet API that this servlet container supports.
     */
    public int getMinorVersion() {
        return 1;   // java version 1.4.1 ???
    }
    /**
     * Returns a RequestDispatcher object that acts as a wrapper for the named servlet.
     */
    public RequestDispatcher getNamedDispatcher(String name) {
        return null;
    }
    /**
     * Returns a String containing the real path for a given virtual path.
     */
    public String getRealPath(String path) {
        return path;
    }
    /**
     * Returns a RequestDispatcher object that acts as a wrapper for the 
     * resource located at the given path.
     * !!!! Used in doPost - need to implement
     */
    public RequestDispatcher getRequestDispatcher(String path) {
        myRequestDispatcher.resource = path;
        return myRequestDispatcher;
    }
    
    /**
     * Returns a URL to the resource that is mapped to a specified path.
     */
    public URL getResource(String path) {
        return null;
    }
    
    /**
     * Returns the resource located at the named path as an InputStream object.
     */           
    public InputStream getResourceAsStream(String path) {
        return null;
    }
    
    /**
     * Returns a directory-like listing of all the paths to resources 
     * within the web application whose longest sub-path matches the supplied 
     * path argument.
     */            
    public Set getResourcePaths(String path) {
        return null;
    }
    
    /**
     * Returns the name and version of the servlet container on which the servlet is running.
     */            
    public String getServerInfo() {
        return myServerInfo;
    }
    
    /**
     * Deprecated. 
     */            
    public Servlet getServlet(String name) {
        return null;
    }
    public String getServletContextName() {
        return null;
    }
    /**
     * depreciated
     */
    public Enumeration getServletNames() {
        return null;
    }
    public Enumeration getServlets() {
        return null;
    }
    /**
     * Deprecated. As of Java Servlet API 2.1, use log(String message, Throwable throwable) instead.
     * This method was originally defined to write an exception's stack trace 
     * and an explanatory error message to the servlet log file.
     */
    public void log(Exception exception, String msg) {
    }
    /**
     * Writes the specified message to a servlet log file, usually an event log.
     */
    public void log(String msg) {
    }
    /**
     * Writes an explanatory message and a stack trace for a given 
     * Throwable exception to the servlet log file.
     */        
    public void log(String message, Throwable throwable) {
    }
    /**
     * Removes the attribute with the given name from the servlet context.
     */
    public void removeAttribute(String name) {
        attributes.remove(name);
    }
    /**
     * Binds an object to a given attribute name in this servlet context.  
     */
    public void setAttribute(String name, Object object) {
        attributes.put(name, object);
    }            
}