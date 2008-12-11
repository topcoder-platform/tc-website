/*
 * Copyright (C) 2005 TopCoder Inc., All Rights Reserved.
 */

package com.topcoder.web.studio.mock;

import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.ErrorData;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.el.ExpressionEvaluator;
import javax.servlet.jsp.el.VariableResolver;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.ServletException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.Servlet;
import javax.servlet.http.HttpSession;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Enumeration;
import java.io.IOException;

/**
 * <p>A mock implementation of {@link PageContext} class to be used for testing.
 * Overrides the protected methods declared by a super-class. The overridden methods are declared with package private access
 * so only the test cases could invoke them. The overridden methods simply call the corresponding method of a super-class.
 *
 * @author  isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2
 */
public class MockPageContext extends PageContext {

    /**
     * <p>A <code>Map</code> mapping the <code>String</code> method signatures to <code>Map</code>s mapping the <code>
     * String</code> names of the arguments to <code>Object</code>s representing the values of  arguments which have been 
     * provided by the caller of the method.</p>
     */
    private static Map methodArguments = new HashMap();

    /**
     * <p>A <code>Map</code> mapping the <code>String</code> method signatures to <code>Exception</code>s to be thrown by
     * methods.</p>
     */
    private static Map throwExceptions = new HashMap();

    /**
     * <p>A <code>Map</code> mapping the <code>String</code> method signatures to <code>Object</code>s to be
     * returned by methods.</p>
     */
    private static Map methodResults = new HashMap();

    /**
     * <p>A <code>Throwable</code> representing the exception to be thrown from any method of the mock class.</p>
     */
    private static Throwable globalException = null;

    /**
     * <p>Constructs new <code>MockPageContext</code> instance. Nothing special occurs here.</p>
     */
    public MockPageContext() {
        super();
        MockPageContext.init();
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#release()
     */
    public void release() {

        String methodName = "release";
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#getException()
     */
    public Exception getException() {

        String methodName = "getException";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (Exception) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#handlePageException(Exception)
     * @throws ServletException
     * @throws IOException
     */
    public void handlePageException(Exception exception0) throws ServletException, IOException {

        String methodName = "handlePageException_Exception";
        HashMap arguments = new HashMap();
        arguments.put("1", exception0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            if (globalException instanceof ServletException) {
                throw (ServletException) globalException;
            } else if (globalException instanceof IOException) {
                throw (IOException) globalException;
            } else {
                throw new RuntimeException("The test may not be configured properly", globalException);
            }
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                if (exception instanceof ServletException) {
                    throw (ServletException) exception;
                } else if (exception instanceof IOException) {
                    throw (IOException) exception;
                } else {
                    throw new RuntimeException("The test may not be configured properly", exception);
                }
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#getPage()
     */
    public Object getPage() {

        String methodName = "getPage";
        HashMap arguments = new HashMap();
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#forward(String)
     * @throws ServletException
     * @throws IOException
     */
    public void forward(String string0) throws ServletException, IOException {

        String methodName = "forward_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            if (globalException instanceof ServletException) {
                throw (ServletException) globalException;
            } else if (globalException instanceof IOException) {
                throw (IOException) globalException;
            } else {
                throw new RuntimeException("The test may not be configured properly", globalException);
            }
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                if (exception instanceof ServletException) {
                    throw (ServletException) exception;
                } else if (exception instanceof IOException) {
                    throw (IOException) exception;
                } else {
                    throw new RuntimeException("The test may not be configured properly", exception);
                }
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#include(String)
     * @throws ServletException
     * @throws IOException
     */
    public void include(String string0) throws ServletException, IOException {

        String methodName = "include_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            if (globalException instanceof ServletException) {
                throw (ServletException) globalException;
            } else if (globalException instanceof IOException) {
                throw (IOException) globalException;
            } else {
                throw new RuntimeException("The test may not be configured properly", globalException);
            }
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                if (exception instanceof ServletException) {
                    throw (ServletException) exception;
                } else if (exception instanceof IOException) {
                    throw (IOException) exception;
                } else {
                    throw new RuntimeException("The test may not be configured properly", exception);
                }
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#include(String, boolean)
     * @throws ServletException
     * @throws IOException
     */
    public void include(String string0, boolean boolean0) throws ServletException, IOException {

        String methodName = "include_String_boolean";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        arguments.put("2", Boolean.valueOf(boolean0));
        saveArguments(methodName, arguments);

        if (globalException != null) {
            if (globalException instanceof ServletException) {
                throw (ServletException) globalException;
            } else if (globalException instanceof IOException) {
                throw (IOException) globalException;
            } else {
                throw new RuntimeException("The test may not be configured properly", globalException);
            }
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                if (exception instanceof ServletException) {
                    throw (ServletException) exception;
                } else if (exception instanceof IOException) {
                    throw (IOException) exception;
                } else {
                    throw new RuntimeException("The test may not be configured properly", exception);
                }
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#handlePageException(Throwable)
     * @throws ServletException
     * @throws IOException
     */
    public void handlePageException(Throwable throwable0) throws ServletException, IOException {

        String methodName = "handlePageException_Throwable";
        HashMap arguments = new HashMap();
        arguments.put("1", throwable0);
        saveArguments(methodName, arguments);

        if (globalException != null) {
            if (globalException instanceof ServletException) {
                throw (ServletException) globalException;
            } else if (globalException instanceof IOException) {
                throw (IOException) globalException;
            } else {
                throw new RuntimeException("The test may not be configured properly", globalException);
            }
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                if (exception instanceof ServletException) {
                    throw (ServletException) exception;
                } else if (exception instanceof IOException) {
                    throw (IOException) exception;
                } else {
                    throw new RuntimeException("The test may not be configured properly", exception);
                }
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#getServletConfig()
     */
    public ServletConfig getServletConfig() {

        String methodName = "getServletConfig";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (ServletConfig) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#getServletContext()
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#getRequest()
     */
    public ServletRequest getRequest() {

        String methodName = "getRequest";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (ServletRequest) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#getResponse()
     */
    public ServletResponse getResponse() {

        String methodName = "getResponse";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (ServletResponse) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#getSession()
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#getErrorData()
     */
    public ErrorData getErrorData() {

        String methodName = "getErrorData";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (ErrorData) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#pushBody()
     */
    public BodyContent pushBody() {

        String methodName = "pushBody";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (BodyContent) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see PageContext#initialize(Servlet, ServletRequest, ServletResponse, String, boolean, int, boolean)
     * @throws IOException
     * @throws IllegalStateException
     * @throws IllegalArgumentException
     */
    public void initialize(Servlet servlet0, ServletRequest servletRequest0, ServletResponse servletResponse0, String string0, boolean boolean0, int int0, boolean boolean1) throws IOException {

        String methodName = "initialize_Servlet_ServletRequest_ServletResponse_String_boolean_int_boolean";
        HashMap arguments = new HashMap();
        arguments.put("1", servlet0);
        arguments.put("2", servletRequest0);
        arguments.put("3", servletResponse0);
        arguments.put("4", string0);
        arguments.put("5", Boolean.valueOf(boolean0));
        arguments.put("6", new Integer(int0));
        arguments.put("7", Boolean.valueOf(boolean1));
        saveArguments(methodName, arguments);

        if (globalException != null) {
            if (globalException instanceof IOException) {
                throw (IOException) globalException;
            } else if (globalException instanceof IllegalStateException) {
                throw (IllegalStateException) globalException;
            } else if (globalException instanceof IllegalArgumentException) {
                throw (IllegalArgumentException) globalException;
            } else {
                throw new RuntimeException("The test may not be configured properly", globalException);
            }
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                if (exception instanceof IOException) {
                    throw (IOException) exception;
                } else if (exception instanceof IllegalStateException) {
                    throw (IllegalStateException) exception;
                } else if (exception instanceof IllegalArgumentException) {
                    throw (IllegalArgumentException) exception;
                } else {
                    throw new RuntimeException("The test may not be configured properly", exception);
                }
            }
        }
    }

    public void setAttribute(String string, Object object) {
    }

    public void setAttribute(String string, Object object, int i) {
    }

    public Object getAttribute(String string) {
        return null;
    }

    public Object getAttribute(String string, int i) {
        return null;
    }

    public Object findAttribute(String string) {
        return null;
    }

    public void removeAttribute(String string) {
    }

    public void removeAttribute(String string, int i) {
    }

    public int getAttributesScope(String string) {
        return 0;
    }

    public Enumeration getAttributeNamesInScope(int i) {
        return null;
    }

    public JspWriter getOut() {
        String methodName = "getOut";
        HashMap arguments = new HashMap();
        saveArguments(methodName, arguments);

        if (globalException != null) {
            throw new RuntimeException("The test may not be configured properly", globalException);
        } else {
            Throwable exception = (Throwable) throwExceptions.get(methodName);
            if (exception != null) {
                throw new RuntimeException("The test may not be configured properly", exception);
            } else {

                return (JspWriter) methodResults.get(methodName);
            }
        }
    }

    public ExpressionEvaluator getExpressionEvaluator() {
        return null;
    }

    public VariableResolver getVariableResolver() {
        return null;
    }

    /**
     * <p>Sets the result to be returned by the specified method.</p>
     *
     * @param methodSignature a <code>String</code> uniquelly distinguishing the target method among other methods
     *        declared by the implemented interface/class.
     * @param result an <code>Object</code> representing the result to be returned by specified method.
     */
    public static void setMethodResult(String methodSignature, Object result) {
        MockPageContext.methodResults.put(methodSignature, result);
    }

    /**
     * <p>Gets the value of the specified argument which has been passed to the specified method by the caller.</p>
     *
     * @param  methodSignature a <code>String</code> uniquelly distinguishing the target method among other methods
     * @param  argumentName a <code>String</code> providing the name of the argument to get the value for.
     * @return an <code>Object</code> (including <code>null</code>) providing the value of the specified argument
     *         which has been supplied by the caller of the specified method.
     * @throws IllegalArgumentException if the specified argument does not exist.
     */
    public static Object getMethodArgument(String methodSignature, String argumentName) {
        Map arguments = (Map) MockPageContext.methodArguments.get(methodSignature);
        if (!arguments.containsKey(argumentName)) {
            throw new IllegalArgumentException("The argument name " + argumentName + " is unknown.");
        }
        return arguments.get(argumentName);
    }

    /**
     * <pChecks if the specified method has been called during the test by the caller.</p>
     *
     * @param  methodSignature a <code>String</code> uniquelly distinguishing the target method among other methods
     * @return <code>true</code> if specified method was called; <code>false</code> otherwise.
     */
    public static boolean wasMethodCalled(String methodSignature) {
        return methodArguments.containsKey(methodSignature);
    }

    /**
     * <p>Gets the values of the argumenta which have been passed to the specified method by the caller.</p>
     *
     * @param  methodSignature a <code>String</code> uniquelly distinguishing the target method among other methods
     * @return a <code>List</code> of <code>Map</code> providing the values of the arguments on each call.
     *         which has been supplied by the caller of the specified method.
     */
    public static List getMethodArguments(String methodSignature) {
        return (List) MockPageContext.methodArguments.get(methodSignature);
    }

    /**
     * <p>Sets the exception to be thrown when the specified method is called.</p>
     *
     * @param methodSignature a <code>String</code> uniquelly distinguishing the target method among other methods
     * @param exception a <code>Throwable</code> representing the exception to be thrown when the specified method is
     *        called. If this argument is <code>null</code> then no exception will be thrown.
     */
    public static void throwException(String methodSignature, Throwable exception) {
        if (exception != null) {
            MockPageContext.throwExceptions.put(methodSignature, exception);
        } else {
            MockPageContext.throwExceptions.remove(methodSignature);
        }
    }

    /**
     * <p>Sets the exception to be thrown when the specified method is called.</p>
     *
     * @param exception a <code>Throwable</code> representing the exception to be thrown whenever any method is
     *        called. If this argument is <code>null</code> then no exception will be thrown.
     */
    public static void throwGlobalException(Throwable exception) {
        MockPageContext.globalException = exception;
    }

    /**
     * <p>Releases the state of <code>MockPageContext</code> so all collected method arguments,
     * configured method results and exceptions are lost.</p>
     */
    public static void releaseState() {
        MockPageContext.methodArguments.clear();
        MockPageContext.methodResults.clear();
        MockPageContext.throwExceptions.clear();
        MockPageContext.globalException = null;
    }

    /**
     * <p>Initializes the initial state for all created instances of <code>MockPageContext</code> class.</p>
     */
    public static void init() {
    }

    /**
     * <p>Initializes the initial state for all created instances of <code>MockPageContext</code> class.</p>
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
