package com.topcoder.web.test;

import java.io.BufferedReader;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import java.io.*;

/** 
 * <p>
 * Simple Helper to pass classes that require ServletRequest.  Doesn't do
 * too much but mainly concerns itself with attribute and parameter maps.
 * </p>
 *
 * @author Dan Tomalesky
 * @version 1.0
 */
public class ServletRequestHelper implements ServletRequest {
    private HashMap attributeMap;
    private HashMap parameterMap;
    public PrintWriter log = null;

    public ServletRequestHelper() {
        attributeMap = new HashMap();
        parameterMap = new HashMap();
    }

    public Object getAttribute(String name) {
        return attributeMap.get(name);
    }

    public Enumeration getAttributeNames() {
        Vector v = new Vector(attributeMap.keySet());
        return v.elements();
    }

    public String getCharacterEncoding() {
        return null;
    }
    public int getContentLength() {
        return -1;
    }
    public String getContentType() {
        return null;
    }

    public ServletInputStream getInputStream() {
        return null;
    }
    
    public Locale getLocale() {
        return null;
    }

    public Enumeration getLocales() {
        return null;
    }

    public String getParameter(String name) {
        return (String)parameterMap.get(name);
    }
    
    public Enumeration getParameterNames() {
        Vector v = new Vector(parameterMap.keySet());
        return v.elements();
    }

    public String[] getParameterValues(String name) {
        return (String [])parameterMap.get(name);
    }

    public String getProtocol() {
        return "HTTP/1.1";
    }

    public BufferedReader getReader() {
        return null;
    }

    public String getRealPath(String path) {
        return null;    
    }

    public String getRemoteAddr() {
        return null;
    }

    public String getRemoteHost() {
        return null;
    }

    public RequestDispatcher getRequestDispatcher(String path) {
        return null;
    }

    public String getScheme() {
        return "http";
    }

    public String getServerName() {
        return null;
    }

    public int getServerPort() {
        return -1;
    }

    public boolean isSecure() {
        return false;
    }

    public void removeAttribute(String name) {
        attributeMap.remove(name);
    }

    public void setAttribute(String name, Object o) {
        attributeMap.put(name, o);
        if (log != null) {
            log.println("ServletRequestHelper.setAttribute name, o = " 
                        + name + " " + o);
        }
    }

    public void setParameter(String name, Object o) {
        parameterMap.put(name, o);
    }
}
