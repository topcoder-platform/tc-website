/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.mock;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;

/**
 * <p>A mock implementation of {@link HttpServletRequest} class to be used for testing. Overrides the protected methods
 * declared by a super-class. The overridden methods are declared with package private access so only the test cases
 * could invoke them. The overridden methods simply call the corresponding method of a super-class.
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly
 */
public class MockHttpServletRequest implements HttpServletRequest {

    /**
     * <p>A <code>Map</code> mapping the <code>String</code> method signatures to <code>Map</code>s mapping the <code>
     * String</code> names of the arguments to <code>Object</code>s representing the values of  arguments which have
     * been provided by the caller of the method.</p>
     */
    private static Map methodArguments = new HashMap();

    /**
     * <p>A <code>Map</code> mapping the <code>String</code> method signatures to <code>Exception</code>s to be thrown
     * by methods.</p>
     */
    private static Map throwExceptions = new HashMap();

    /**
     * <p>A <code>Map</code> mapping the <code>String</code> method signatures to <code>Object</code>s to be returned by
     * methods.</p>
     */
    private static Map methodResults = new HashMap();

    /**
     * <p>A <code>Map</code> mapping the <code>String</code> method signatures to <code>Object</code>s to be returned by
     * methods.</p>
     */
    private static Map<String, Map> methodArgumentResults = new HashMap();

    /**
     * <p>A <code>Throwable</code> representing the exception to be thrown from any method of the mock class.</p>
     */
    private static Throwable globalException = null;

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#isRequestedSessionIdFromCookie()
     */
    public boolean isRequestedSessionIdFromCookie() {

        String methodName = "isRequestedSessionIdFromCookie";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return ((Boolean) methodResults.get(methodName)).booleanValue();
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#isRequestedSessionIdFromURL()
     */
    public boolean isRequestedSessionIdFromURL() {

        String methodName = "isRequestedSessionIdFromURL";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return ((Boolean) methodResults.get(methodName)).booleanValue();
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#isRequestedSessionIdFromUrl()
     */
    public boolean isRequestedSessionIdFromUrl() {

        String methodName = "isRequestedSessionIdFromUrl";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return ((Boolean) methodResults.get(methodName)).booleanValue();
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#isRequestedSessionIdValid()
     */
    public boolean isRequestedSessionIdValid() {

        String methodName = "isRequestedSessionIdValid";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return ((Boolean) methodResults.get(methodName)).booleanValue();
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getAuthType()
     */
    public String getAuthType() {

        String methodName = "getAuthType";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getContextPath()
     */
    public String getContextPath() {

        String methodName = "getContextPath";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getMethod()
     */
    public String getMethod() {

        String methodName = "getMethod";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getPathInfo()
     */
    public String getPathInfo() {

        String methodName = "getPathInfo";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getPathTranslated()
     */
    public String getPathTranslated() {

        String methodName = "getPathTranslated";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getQueryString()
     */
    public String getQueryString() {

        String methodName = "getQueryString";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getRemoteUser()
     */
    public String getRemoteUser() {

        String methodName = "getRemoteUser";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getRequestURI()
     */
    public String getRequestURI() {

        String methodName = "getRequestURI";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getRequestedSessionId()
     */
    public String getRequestedSessionId() {

        String methodName = "getRequestedSessionId";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getServletPath()
     */
    public String getServletPath() {

        String methodName = "getServletPath";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getIntHeader(String)
     */
    public int getIntHeader(String string0) {

        String methodName = "getIntHeader_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return ((Integer) methodResults.get(methodName)).intValue();
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getDateHeader(String)
     */
    public long getDateHeader(String string0) {

        String methodName = "getDateHeader_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return ((Long) methodResults.get(methodName)).longValue();
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#isUserInRole(String)
     */
    public boolean isUserInRole(String string0) {

        String methodName = "isUserInRole_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return ((Boolean) methodResults.get(methodName)).booleanValue();
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getRequestURL()
     */
    public StringBuffer getRequestURL() {

        String methodName = "getRequestURL";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (StringBuffer) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getUserPrincipal()
     */
    public Principal getUserPrincipal() {

        String methodName = "getUserPrincipal";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (Principal) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getHeaderNames()
     */
    public Enumeration getHeaderNames() {

        String methodName = "getHeaderNames";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (Enumeration) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getCookies()
     */
    public Cookie[] getCookies() {

        String methodName = "getCookies";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (Cookie[]) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getSession()
     */
    public HttpSession getSession() {

        String methodName = "getSession";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (HttpSession) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getSession(boolean)
     */
    public HttpSession getSession(boolean boolean0) {

        String methodName = "getSession_boolean";
        HashMap arguments = new HashMap();
        arguments.put("1", Boolean.valueOf(boolean0));
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (HttpSession) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getHeader(String)
     */
    public String getHeader(String string0) {

        String methodName = "getHeader_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletRequest#getHeaders(String)
     */
    public Enumeration getHeaders(String string0) {

        String methodName = "getHeaders_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (Enumeration) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getContentLength()
     */
    public int getContentLength() {

        String methodName = "getContentLength";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return ((Integer) methodResults.get(methodName)).intValue();
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getLocalPort()
     */
    public int getLocalPort() {

        String methodName = "getLocalPort";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return ((Integer) methodResults.get(methodName)).intValue();
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getRemotePort()
     */
    public int getRemotePort() {

        String methodName = "getRemotePort";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return ((Integer) methodResults.get(methodName)).intValue();
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getServerPort()
     */
    public int getServerPort() {

        String methodName = "getServerPort";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return ((Integer) methodResults.get(methodName)).intValue();
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#isSecure()
     */
    public boolean isSecure() {

        String methodName = "isSecure";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return ((Boolean) methodResults.get(methodName)).booleanValue();
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @throws IOException
     * @see ServletRequest#getReader()
     */
    public BufferedReader getReader() throws IOException {

        String methodName = "getReader";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            if (globalException instanceof IOException) {
                throw (IOException) globalException;
            } else {
                throw new RuntimeException("The test may not be configured properly", globalException);
            }
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                if (exception instanceof IOException) {
                    throw (IOException) exception;
                } else {
                    throw new RuntimeException("The test may not be configured properly", exception);
                }
            } else {

                return (BufferedReader) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getCharacterEncoding()
     */
    public String getCharacterEncoding() {

        String methodName = "getCharacterEncoding";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getContentType()
     */
    public String getContentType() {

        String methodName = "getContentType";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getLocalAddr()
     */
    public String getLocalAddr() {

        String methodName = "getLocalAddr";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getLocalName()
     */
    public String getLocalName() {

        String methodName = "getLocalName";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getProtocol()
     */
    public String getProtocol() {

        String methodName = "getProtocol";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getRemoteAddr()
     */
    public String getRemoteAddr() {

        String methodName = "getRemoteAddr";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getRemoteHost()
     */
    public String getRemoteHost() {

        String methodName = "getRemoteHost";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getScheme()
     */
    public String getScheme() {

        String methodName = "getScheme";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getServerName()
     */
    public String getServerName() {

        String methodName = "getServerName";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#removeAttribute(String)
     */
    public void removeAttribute(String string0) {

        String methodName = "removeAttribute_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @throws UnsupportedEncodingException
     * @see ServletRequest#setCharacterEncoding(String)
     */
    public void setCharacterEncoding(String string0) throws UnsupportedEncodingException {

        String methodName = "setCharacterEncoding_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            if (globalException instanceof UnsupportedEncodingException) {
                throw (UnsupportedEncodingException) globalException;
            } else {
                throw new RuntimeException("The test may not be configured properly", globalException);
            }
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                if (exception instanceof UnsupportedEncodingException) {
                    throw (UnsupportedEncodingException) exception;
                } else {
                    throw new RuntimeException("The test may not be configured properly", exception);
                }
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getAttributeNames()
     */
    public Enumeration getAttributeNames() {

        String methodName = "getAttributeNames";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (Enumeration) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getLocales()
     */
    public Enumeration getLocales() {

        String methodName = "getLocales";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (Enumeration) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getParameterNames()
     */
    public Enumeration getParameterNames() {

        String methodName = "getParameterNames";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {
                String names = (String) methodResults.get(methodName);
                return new StringTokenizer(names);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getLocale()
     */
    public Locale getLocale() {

        String methodName = "getLocale";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (Locale) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getParameterMap()
     */
    public Map getParameterMap() {

        String methodName = "getParameterMap";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (Map) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @throws IOException
     * @see ServletRequest#getInputStream()
     */
    public ServletInputStream getInputStream() throws IOException {

        String methodName = "getInputStream";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            if (globalException instanceof IOException) {
                throw (IOException) globalException;
            } else {
                throw new RuntimeException("The test may not be configured properly", globalException);
            }
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                if (exception instanceof IOException) {
                    throw (IOException) exception;
                } else {
                    throw new RuntimeException("The test may not be configured properly", exception);
                }
            } else {

                return (ServletInputStream) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getAttribute(String)
     */
    public Object getAttribute(String string0) {

        String methodName = "getAttribute_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {
                Map argsResults = methodArgumentResults.get(methodName);
                if (argsResults != null) {
                    return (Object) argsResults.get(string0);
                } else {
                    return (Object) methodResults.get(methodName);
                }
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#setAttribute(String,Object)
     */
    public void setAttribute(String string0, Object object0) {

        String methodName = "setAttribute_String_Object";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        arguments.put("2", object0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getParameter(String)
     */
    public String getParameter(String string0) {
        String methodName = "getParameter_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {
                if (methodResults.containsKey(methodName)) {
                    return (String) methodResults.get(methodName);
                } else {
                    Map argsResults = methodArgumentResults.get(methodName);
                    if (argsResults != null) {
                        return (String) argsResults.get(string0);
                    } else {
                        return null;
                    }
                }
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getRealPath(String)
     */
    public String getRealPath(String string0) {

        String methodName = "getRealPath_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getParameterValues(String)
     */
    public String[] getParameterValues(String string0) {

        String methodName = "getParameterValues_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {
                if (methodResults.containsKey(methodName)) {
                    return (String[]) methodResults.get(methodName);
                } else {
                    Map argsResults = methodArgumentResults.get(methodName);
                    if (argsResults != null) {
                        return (String[]) argsResults.get(string0);
                    } else {
                        return null;
                    }
                }
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletRequest#getRequestDispatcher(String)
     */
    public RequestDispatcher getRequestDispatcher(String string0) {

        String methodName = "getRequestDispatcher_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (RequestDispatcher) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>Sets the result to be returned by the specified method.</p>
     *
     * @param methodSignature a <code>String</code> uniquelly distinguishing the target method among other methods
     * declared by the implemented interface/class.
     * @param result an <code>Object</code> representing the result to be returned by specified method.
     */
    public static void setMethodResult(String methodSignature, Object result) {
        MockHttpServletRequest.methodResults.put(methodSignature, result);
    }

    /**
     * <p>Sets the result to be returned by the specified method.</p>
     *
     * @param methodSignature a <code>String</code> uniquelly distinguishing the target method among other methods
     *        declared by the implemented interface/class.
     * @param args a <code>String</code> provding the concatenated values of method arguments.
     * @param result an <code>Object</code> representing the result to be returned by specified method.
     */
    public static void setMethodResultPerArgs(String methodSignature, String args, Object result) {
        Map map = MockHttpServletRequest.methodArgumentResults.get(methodSignature);
        if (map == null) {
            map = new HashMap();
            MockHttpServletRequest.methodArgumentResults.put(methodSignature, map);
        }
        map.put(args, result);
    }

    /**
     * <p>Gets the value of the specified argument which has been passed to the specified method by the caller.</p>
     *
     * @param methodSignature a <code>String</code> uniquelly distinguishing the target method among other methods
     * @param argumentName a <code>String</code> providing the name of the argument to get the value for.
     * @return an <code>Object</code> (including <code>null</code>) providing the value of the specified argument which
     *         has been supplied by the caller of the specified method.
     * @throws IllegalArgumentException if the specified argument does not exist.
     */
    public static Object getMethodArgument(String methodSignature, String argumentName) {
        Map arguments = (Map) MockHttpServletRequest.methodArguments.get(methodSignature);
        if (!arguments.containsKey(argumentName)) {
            throw new IllegalArgumentException("The argument name " + argumentName + " is unknown.");
        }
        return arguments.get(argumentName);
    }

    /**
     * <pChecks if the specified method has been called during the test by the caller.</p>
     *
     * @param methodSignature a <code>String</code> uniquelly distinguishing the target method among other methods
     * @return <code>true</code> if specified method was called; <code>false</code> otherwise.
     */
    public static boolean wasMethodCalled(String methodSignature) {
        return methodArguments.containsKey(methodSignature);
    }

    /**
     * <p>Gets the values of the argumenta which have been passed to the specified method by the caller.</p>
     *
     * @param methodSignature a <code>String</code> uniquelly distinguishing the target method among other methods
     * @return a <code>List</code> of <code>Map</code> providing the values of the arguments on each call. which has
     *         been supplied by the caller of the specified method.
     */
    public static List getMethodArguments(String methodSignature) {
        return (List) MockHttpServletRequest.methodArguments.get(methodSignature);
    }

    /**
     * <p>Sets the exception to be thrown when the specified method is called.</p>
     *
     * @param methodSignature a <code>String</code> uniquelly distinguishing the target method among other methods
     * @param exception a <code>Throwable</code> representing the exception to be thrown when the specified method is
     * called. If this argument is <code>null</code> then no exception will be thrown.
     */
    public static void throwException(String methodSignature, Throwable exception) {
        if (exception != null) {
            MockHttpServletRequest.throwExceptions.put(methodSignature, exception);
        } else {
            MockHttpServletRequest.throwExceptions.remove(methodSignature);
        }
    }

    /**
     * <p>Sets the exception to be thrown when the specified method is called.</p>
     *
     * @param exception a <code>Throwable</code> representing the exception to be thrown whenever any method is called.
     * If this argument is <code>null</code> then no exception will be thrown.
     */
    public static void throwGlobalException(Throwable exception) {
        MockHttpServletRequest.globalException = exception;
    }

    /**
     * <p>Releases the state of <code>MockHttpServletRequest</code> so all collected method arguments, configured method
     * results and exceptions are lost.</p>
     */
    public static void releaseState() {
        MockHttpServletRequest.methodArguments.clear();
        MockHttpServletRequest.methodResults.clear();
        MockHttpServletRequest.methodArgumentResults.clear();
        MockHttpServletRequest.throwExceptions.clear();
        MockHttpServletRequest.globalException = null;
    }

    /**
     * <p>Initializes the initial state for all created instances of <code>MockHttpServletRequest</code> class.</p>
     */
    public static void init() {
    }

    /**
     * <p>Initializes the initial state for all created instances of <code>MockHttpServletRequest</code> class.</p>
     */
    private void saveArguments(String methodName, Map arguments) {
        List args = (List) methodArguments.get(methodName);
        if (args == null) {
            args = new ArrayList();
            methodArguments.put(methodName, args);
        }
        args.add(arguments);
    }
}
