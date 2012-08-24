/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.mock;

import javax.servlet.ServletOutputStream;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * <p>A mock implementation of {@link HttpServletResponse} class to be used for testing. Overrides the protected methods
 * declared by a super-class. The overridden methods are declared with package private access so only the test cases
 * could invoke them. The overridden methods simply call the corresponding method of a super-class.
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly
 */
public class MockHttpServletResponse implements HttpServletResponse {

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
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @throws IOException
     * @see HttpServletResponse#sendError(int)
     */
    public void sendError(int int0) throws IOException {

        String methodName = "sendError_int";
        HashMap arguments = new HashMap();
        arguments.put("1", new Integer(int0));
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
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletResponse#setStatus(int)
     */
    public void setStatus(int int0) {

        String methodName = "setStatus_int";
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
     * @throws IOException
     * @see HttpServletResponse#sendError(int,String)
     */
    public void sendError(int int0, String string0) throws IOException {

        String methodName = "sendError_int_String";
        HashMap arguments = new HashMap();
        arguments.put("1", new Integer(int0));
        arguments.put("2", string0);
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
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletResponse#setStatus(int,String)
     */
    public void setStatus(int int0, String string0) {

        String methodName = "setStatus_int_String";
        HashMap arguments = new HashMap();
        arguments.put("1", new Integer(int0));
        arguments.put("2", string0);
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
     * @throws IOException
     * @see HttpServletResponse#sendRedirect(String)
     */
    public void sendRedirect(String string0) throws IOException {

        String methodName = "sendRedirect_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
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
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see HttpServletResponse#containsHeader(String)
     */
    public boolean containsHeader(String string0) {

        String methodName = "containsHeader_String";
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
     * @see HttpServletResponse#addIntHeader(String,int)
     */
    public void addIntHeader(String string0, int int0) {

        String methodName = "addIntHeader_String_int";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        arguments.put("2", new Integer(int0));
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
     * @see HttpServletResponse#setIntHeader(String,int)
     */
    public void setIntHeader(String string0, int int0) {

        String methodName = "setIntHeader_String_int";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        arguments.put("2", new Integer(int0));
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
     * @see HttpServletResponse#addDateHeader(String,long)
     */
    public void addDateHeader(String string0, long long0) {

        String methodName = "addDateHeader_String_long";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        arguments.put("2", new Long(long0));
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
     * @see HttpServletResponse#setDateHeader(String,long)
     */
    public void setDateHeader(String string0, long long0) {

        String methodName = "setDateHeader_String_long";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        arguments.put("2", new Long(long0));
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
     * @see HttpServletResponse#addCookie(Cookie)
     */
    public void addCookie(Cookie cookie0) {

        String methodName = "addCookie_Cookie";
        HashMap arguments = new HashMap();
        arguments.put("1", cookie0);
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
     * @see HttpServletResponse#encodeRedirectURL(String)
     */
    public String encodeRedirectURL(String string0) {

        String methodName = "encodeRedirectURL_String";
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
     * @see HttpServletResponse#encodeRedirectUrl(String)
     */
    public String encodeRedirectUrl(String string0) {

        String methodName = "encodeRedirectUrl_String";
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
     * @see HttpServletResponse#encodeURL(String)
     */
    public String encodeURL(String string0) {

        String methodName = "encodeURL_String";
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
     * @see HttpServletResponse#encodeUrl(String)
     */
    public String encodeUrl(String string0) {

        String methodName = "encodeUrl_String";
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
     * @see HttpServletResponse#addHeader(String,String)
     */
    public void addHeader(String string0, String string1) {

        String methodName = "addHeader_String_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        arguments.put("2", string1);
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
     * @see HttpServletResponse#setHeader(String,String)
     */
    public void setHeader(String string0, String string1) {

        String methodName = "setHeader_String_String";
        HashMap arguments = new HashMap();
        arguments.put("1", string0);
        arguments.put("2", string1);
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
     * @see ServletResponse#getBufferSize()
     */
    public int getBufferSize() {

        String methodName = "getBufferSize";
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
     * @throws IOException
     * @see ServletResponse#flushBuffer()
     */
    public void flushBuffer() throws IOException {

        String methodName = "flushBuffer";
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
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletResponse#reset()
     */
    public void reset() {

        String methodName = "reset";
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
     * @see ServletResponse#resetBuffer()
     */
    public void resetBuffer() {

        String methodName = "resetBuffer";
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
     * @see ServletResponse#isCommitted()
     */
    public boolean isCommitted() {

        String methodName = "isCommitted";
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
     * @see ServletResponse#setBufferSize(int)
     */
    public void setBufferSize(int int0) {

        String methodName = "setBufferSize_int";
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
     * @see ServletResponse#setContentLength(int)
     */
    public void setContentLength(int int0) {

        String methodName = "setContentLength_int";
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
     * @throws IOException
     * @see ServletResponse#getWriter()
     */
    public PrintWriter getWriter() throws IOException {

        String methodName = "getWriter";
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

                return (PrintWriter) methodResults.get(methodName);
            }
        }
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String,Throwable)} method or return a result specified through {@link
     * #setMethodResult(String,Object)} method.</p>
     *
     * @see ServletResponse#getCharacterEncoding()
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
     * @see ServletResponse#getContentType()
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
     * @see ServletResponse#setCharacterEncoding(String)
     */
    public void setCharacterEncoding(String string0) {

        String methodName = "setCharacterEncoding_String";
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
     * @see ServletResponse#setContentType(String)
     */
    public void setContentType(String string0) {

        String methodName = "setContentType_String";
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
     * @see ServletResponse#getLocale()
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
     * @see ServletResponse#setLocale(Locale)
     */
    public void setLocale(Locale locale0) {

        String methodName = "setLocale_Locale";
        HashMap arguments = new HashMap();
        arguments.put("1", locale0);
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
     * @throws IOException
     * @see ServletResponse#getOutputStream()
     */
    public ServletOutputStream getOutputStream() throws IOException {

        String methodName = "getOutputStream";
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

                return (ServletOutputStream) methodResults.get(methodName);
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
        MockHttpServletResponse.methodResults.put(methodSignature, result);
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
        Map arguments = (Map) MockHttpServletResponse.methodArguments.get(methodSignature);
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
        return (List) MockHttpServletResponse.methodArguments.get(methodSignature);
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
            MockHttpServletResponse.throwExceptions.put(methodSignature, exception);
        } else {
            MockHttpServletResponse.throwExceptions.remove(methodSignature);
        }
    }

    /**
     * <p>Sets the exception to be thrown when the specified method is called.</p>
     *
     * @param exception a <code>Throwable</code> representing the exception to be thrown whenever any method is called.
     * If this argument is <code>null</code> then no exception will be thrown.
     */
    public static void throwGlobalException(Throwable exception) {
        MockHttpServletResponse.globalException = exception;
    }

    /**
     * <p>Releases the state of <code>MockHttpServletResponse</code> so all collected method arguments, configured
     * method results and exceptions are lost.</p>
     */
    public static void releaseState() {
        MockHttpServletResponse.methodArguments.clear();
        MockHttpServletResponse.methodResults.clear();
        MockHttpServletResponse.throwExceptions.clear();
        MockHttpServletResponse.globalException = null;
    }

    /**
     * <p>Initializes the initial state for all created instances of <code>MockHttpServletResponse</code> class.</p>
     */
    public static void init() {
    }

    /**
     * <p>Initializes the initial state for all created instances of <code>MockHttpServletResponse</code> class.</p>
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
