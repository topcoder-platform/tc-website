package com.topcoder.web.common;

import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;
import java.util.Enumeration;

public interface TCRequest {
    String getParameter(String name);
    String getServletPath();
    String getContextPath();
    void setAttribute(String name, Object o);
    Object getAttribute(String name);
    String getMethod();
    Enumeration getParameterNames();
    String getQueryString();
    String[] getParameterValues(String name);
    HttpSession getSession();
    HttpSession getSession(boolean create);
    String getServerName();
    Cookie[] getCookies();
    String getProtocol();
}
