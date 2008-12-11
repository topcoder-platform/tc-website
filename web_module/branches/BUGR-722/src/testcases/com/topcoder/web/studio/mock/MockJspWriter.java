/*
 * Copyright (C) 2005 TopCoder Inc., All Rights Reserved.
 */

package com.topcoder.web.studio.mock;

import javax.servlet.jsp.JspWriter;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.io.IOException;

/**
 * <p>A mock implementation of {@link JspWriter} class to be used for testing.
 * Overrides the protected methods declared by a super-class. The overridden methods are declared with package private access
 * so only the test cases could invoke them. The overridden methods simply call the corresponding method of a super-class.
 *
 * @author  isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2
 */
public class MockJspWriter extends JspWriter {

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
     * <p>Constructs new <code>MockJspWriter</code> instance. Nothing special occurs here.</p>
     */
    public MockJspWriter(int int0, boolean boolean0) {
        super(int0, boolean0);
        MockJspWriter.init();
    }

    /**
     * <p>A mock implementation of the method. The method either throws an exception which might have been specified
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#getBufferSize()
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#getRemaining()
     */
    public int getRemaining() {

        String methodName = "getRemaining";
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#clear()
     * @throws IOException
     */
    public void clear() throws IOException {

        String methodName = "clear";
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#clearBuffer()
     * @throws IOException
     */
    public void clearBuffer() throws IOException {

        String methodName = "clearBuffer";
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#close()
     * @throws IOException
     */
    public void close() throws IOException {

        String methodName = "close";
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#flush()
     * @throws IOException
     */
    public void flush() throws IOException {

        String methodName = "flush";
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#newLine()
     * @throws IOException
     */
    public void newLine() throws IOException {

        String methodName = "newLine";
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#println()
     * @throws IOException
     */
    public void println() throws IOException {

        String methodName = "println";
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#isAutoFlush()
     */
    public boolean isAutoFlush() {

        String methodName = "isAutoFlush";
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#print(char)
     * @throws IOException
     */
    public void print(char char0) throws IOException {

        String methodName = "print_char";
        HashMap arguments = new HashMap();
        arguments.put("1", new Character(char0));
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#println(char)
     * @throws IOException
     */
    public void println(char char0) throws IOException {

        String methodName = "println_char";
        HashMap arguments = new HashMap();
        arguments.put("1", new Character(char0));
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#print(double)
     * @throws IOException
     */
    public void print(double double0) throws IOException {

        String methodName = "print_double";
        HashMap arguments = new HashMap();
        arguments.put("1", new Double(double0));
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#println(double)
     * @throws IOException
     */
    public void println(double double0) throws IOException {

        String methodName = "println_double";
        HashMap arguments = new HashMap();
        arguments.put("1", new Double(double0));
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#print(float)
     * @throws IOException
     */
    public void print(float float0) throws IOException {

        String methodName = "print_float";
        HashMap arguments = new HashMap();
        arguments.put("1", new Float(float0));
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#println(float)
     * @throws IOException
     */
    public void println(float float0) throws IOException {

        String methodName = "println_float";
        HashMap arguments = new HashMap();
        arguments.put("1", new Float(float0));
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#print(int)
     * @throws IOException
     */
    public void print(int int0) throws IOException {

        String methodName = "print_int";
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#println(int)
     * @throws IOException
     */
    public void println(int int0) throws IOException {

        String methodName = "println_int";
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#print(long)
     * @throws IOException
     */
    public void print(long long0) throws IOException {

        String methodName = "print_long";
        HashMap arguments = new HashMap();
        arguments.put("1", new Long(long0));
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#println(long)
     * @throws IOException
     */
    public void println(long long0) throws IOException {

        String methodName = "println_long";
        HashMap arguments = new HashMap();
        arguments.put("1", new Long(long0));
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#print(boolean)
     * @throws IOException
     */
    public void print(boolean boolean0) throws IOException {

        String methodName = "print_boolean";
        HashMap arguments = new HashMap();
        arguments.put("1", Boolean.valueOf(boolean0));
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#println(boolean)
     * @throws IOException
     */
    public void println(boolean boolean0) throws IOException {

        String methodName = "println_boolean";
        HashMap arguments = new HashMap();
        arguments.put("1", Boolean.valueOf(boolean0));
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#print(char[])
     * @throws IOException
     */
    public void print(char[] charA0) throws IOException {

        String methodName = "print_char[]";
        HashMap arguments = new HashMap();
        arguments.put("1", charA0);
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#println(char[])
     * @throws IOException
     */
    public void println(char[] charA0) throws IOException {

        String methodName = "println_char[]";
        HashMap arguments = new HashMap();
        arguments.put("1", charA0);
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#print(Object)
     * @throws IOException
     */
    public void print(Object object0) throws IOException {

        String methodName = "print_Object";
        HashMap arguments = new HashMap();
        arguments.put("1", object0);
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#println(Object)
     * @throws IOException
     */
    public void println(Object object0) throws IOException {

        String methodName = "println_Object";
        HashMap arguments = new HashMap();
        arguments.put("1", object0);
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#print(String)
     * @throws IOException
     */
    public void print(String string0) throws IOException {

        String methodName = "print_String";
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
     * through {@link #throwException(String, Throwable)} method or return a result specified through
     * {@link #setMethodResult(String, Object)} method.</p>
     *
     * @see JspWriter#println(String)
     * @throws IOException
     */
    public void println(String string0) throws IOException {

        String methodName = "println_String";
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
     * Write a portion of an array of characters.
     *
     * @param cbuf Array of characters
     * @param off Offset from which to start writing characters
     * @param len Number of characters to write
     * @throws IOException If an I/O error occurs
     */
    public void write(char cbuf[], int off, int len) throws IOException {
    }

    /**
     * <p>Sets the result to be returned by the specified method.</p>
     *
     * @param methodSignature a <code>String</code> uniquelly distinguishing the target method among other methods
     *        declared by the implemented interface/class.
     * @param result an <code>Object</code> representing the result to be returned by specified method.
     */
    public static void setMethodResult(String methodSignature, Object result) {
        MockJspWriter.methodResults.put(methodSignature, result);
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
        Map arguments = (Map) MockJspWriter.methodArguments.get(methodSignature);
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
        return (List) MockJspWriter.methodArguments.get(methodSignature);
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
            MockJspWriter.throwExceptions.put(methodSignature, exception);
        } else {
            MockJspWriter.throwExceptions.remove(methodSignature);
        }
    }

    /**
     * <p>Sets the exception to be thrown when the specified method is called.</p>
     *
     * @param exception a <code>Throwable</code> representing the exception to be thrown whenever any method is
     *        called. If this argument is <code>null</code> then no exception will be thrown.
     */
    public static void throwGlobalException(Throwable exception) {
        MockJspWriter.globalException = exception;
    }

    /**
     * <p>Releases the state of <code>MockJspWriter</code> so all collected method arguments,
     * configured method results and exceptions are lost.</p>
     */
    public static void releaseState() {
        MockJspWriter.methodArguments.clear();
        MockJspWriter.methodResults.clear();
        MockJspWriter.throwExceptions.clear();
        MockJspWriter.globalException = null;
    }

    /**
     * <p>Initializes the initial state for all created instances of <code>MockJspWriter</code> class.</p>
     */
    public static void init() {
    }

    /**
     * <p>Initializes the initial state for all created instances of <code>MockJspWriter</code> class.</p>
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
