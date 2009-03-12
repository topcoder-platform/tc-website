/*
 * Copyright (C) 2005 TopCoder Inc., All Rights Reserved.
 */

package com.topcoder.web.studio.mock;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>A mock implementation of {@link HttpSession} class to be used for testing. Overrides the protected methods
 * declared by a super-class. The overridden methods are declared with package private access so only the test cases
 * could invoke them. The overridden methods simply call the corresponding method of a super-class.
 *
 * @author isv
 * @version 1.0
 */
public class MockHttpSession implements HttpSession {

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
     * <p>A <code>Throwable</code> representing the exception to be thrown from any method of the mock class.</p>
     */
    private static Throwable globalException = null;

    /**
     * <p>A <code>Map</code> mapping the <code>String</code> method signatures to <code>Object</code>s to be returned by
     * methods.</p>
     */
    private static Map<String, Map> methodArgumentResults = new HashMap();

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpSession#getMaxInactiveInterval()
     */
    public int getMaxInactiveInterval() {

        String methodName = "getMaxInactiveInterval";
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
     * @see HttpSession#getCreationTime()
     */
    public long getCreationTime() {

        String methodName = "getCreationTime";
        HashMap arguments = new HashMap();
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
     * @see HttpSession#getLastAccessedTime()
     */
    public long getLastAccessedTime() {

        String methodName = "getLastAccessedTime";
        HashMap arguments = new HashMap();
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
     * @see HttpSession#invalidate()
     */
    public void invalidate() {

        String methodName = "invalidate";
        HashMap arguments = new HashMap();
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
     * @see HttpSession#isNew()
     */
    public boolean isNew() {

        String methodName = "isNew";
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
     * @see HttpSession#setMaxInactiveInterval(int)
     */
    public void setMaxInactiveInterval(int int0) {

        String methodName = "setMaxInactiveInterval_int";
        HashMap arguments = new HashMap();
        arguments.put("1", new Integer(int0));
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
     * @see HttpSession#getId()
     */
    public String getId() {

        String methodName = "getId";
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
     * @see HttpSession#getValueNames()
     */
    public String[] getValueNames() {

        String methodName = "getValueNames";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (String[]) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpSession#removeAttribute(String)
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
     * @see HttpSession#removeValue(String)
     */
    public void removeValue(String string0) {

        String methodName = "removeValue_String";
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
     * @see HttpSession#getAttributeNames()
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
     * @see HttpSession#getServletContext()
     */
    public ServletContext getServletContext() {

        String methodName = "getServletContext";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (ServletContext) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpSession#getSessionContext()
     */
    public HttpSessionContext getSessionContext() {

        String methodName = "getSessionContext";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (HttpSessionContext) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpSession#getAttribute(String)
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

                return (Object) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpSession#getValue(String)
     */
    public Object getValue(String string0) {

        String methodName = "getValue_String";
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

                return (Object) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpSession#putValue(String,Object)
     */
    public void putValue(String string0, Object object0) {

        String methodName = "putValue_String_Object";
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
     * @see HttpSession#setAttribute(String,Object)
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
//            setMethodResultPerArgs("getAttribute_String", string0, object0);
        }
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
        Map map = MockHttpSession.methodArgumentResults.get(methodSignature);
        if (map == null) {
            map = new HashMap();
            MockHttpSession.methodArgumentResults.put(methodSignature, map);
        }
        map.put(args, result);
    }

    /**
     * <p>Sets the result to be returned by the specified method.</p>
     *
     * @param methodSignature a <code>String</code> uniquelly distinguishing the target method among other methods
     * declared by the implemented interface/class.
     * @param result an <code>Object</code> representing the result to be returned by specified method.
     */
    public static void setMethodResult(String methodSignature, Object result) {
        MockHttpSession.methodResults.put(methodSignature, result);
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
        Map arguments = (Map) MockHttpSession.methodArguments.get(methodSignature);
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
        return (List) MockHttpSession.methodArguments.get(methodSignature);
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
            MockHttpSession.throwExceptions.put(methodSignature, exception);
        } else {
            MockHttpSession.throwExceptions.remove(methodSignature);
        }
    }

    /**
     * <p>Sets the exception to be thrown when the specified method is called.</p>
     *
     * @param exception a <code>Throwable</code> representing the exception to be thrown whenever any method is called.
     * If this argument is <code>null</code> then no exception will be thrown.
     */
    public static void throwGlobalException(Throwable exception) {
        MockHttpSession.globalException = exception;
    }

    /**
     * <p>Releases the state of <code>MockHttpSession</code> so all collected method arguments, configured method
     * results and exceptions are lost.</p>
     */
    public static void releaseState() {
        MockHttpSession.methodArguments.clear();
        MockHttpSession.methodResults.clear();
        MockHttpSession.throwExceptions.clear();
        MockHttpSession.globalException = null;
        MockHttpSession.methodArgumentResults.clear();
    }

    /**
     * <p>Initializes the initial state for all created instances of <code>MockHttpSession</code> class.</p>
     */
    public static void init() {
    }

    /**
     * <p>Initializes the initial state for all created instances of <code>MockHttpSession</code> class.</p>
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
