package com.topcoder.web.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;
import java.util.Enumeration;

/**
 * this class could extend HttpServletRequestWrapper which would provide
 * the standard behavior without doing so explicitly.  HttpServletRequestWrapper
 * isn't available util servlet 1.3
 */
public class SimpleRequest implements TCRequest {

    private HttpServletRequest request = null;
    public SimpleRequest(HttpServletRequest request) {
        this.request = request;
    }

    public String getParameter(String name) {
        return request.getParameter(name);
    }

    public String getServletPath() {
        return getServletPath();
    }

    public String getContextPath() {
        return request.getContextPath();
    }

    public void setAttribute(String name, Object o) {
        request.setAttribute(name, o);
    }

    public Object getAttribute(String name) {
        return request.getAttribute(name);
    }

    public String getMethod() {
        return request.getMethod();
    }

    public Enumeration getParameterNames() {
        return request.getParameterNames();
    }

    public String getQueryString() {
        return request.getQueryString();
    }

    public String[] getParameterValues(String name) {
        return request.getParameterValues(name);
    }

    public HttpSession getSession() {
        return request.getSession();
    }

    public HttpSession getSession(boolean create) {
        return request.getSession(create);
    }

    public String getServerName() {
        return request.getServerName();
    }

    public Cookie[] getCookies() {
        return request.getCookies();
    }
}
