package com.topcoder.security;

import com.topcoder.util.TCException;

import java.io.PrintStream;
import java.io.PrintWriter;

/**
 * A general exception for the security manager. All security related
 * exceptions should subclass from this exception.
 *
 * @author Heather Van Aelst
 * @version 0.1
 */
public class GeneralSecurityException extends TCException {

    /**
     * Line separator for the local OS
     */
    private static final String SEPARATOR =
            System.getProperty("line.separator");

    /**
     * String constant for delimiting this exception and its nested one.
     */
    private static final String NESTED_STRING =
            SEPARATOR + SEPARATOR + " NESTED WITHIN: ";

    /**
     * The nested exception.  The exception that this class is wrapped around.
     */
    private Throwable nestedException;

    /**
     * Default Constructor
     */
    public GeneralSecurityException() {
        super();
    }

    /**
     * <p>
     * Constructor taking a string message
     * </p>
     *
     * @param message - the message of the exception
     */
    public GeneralSecurityException(String message) {
        super(message);
    }

    /**
     * <p>
     * Constructor taking a nested exception
     * </p>
     *
     * @param nestedException the nested exception
     */
    public GeneralSecurityException(Throwable nestedException) {
        super();
        this.nestedException = nestedException;
    }

    /**
     * <p>
     * Constructor taking a nested exception and a string
     * </p>
     *
     * @param message the message of this exception
     * @param nestedException the nested exception
     */
    public GeneralSecurityException(String message, Throwable nestedException) {
        super(message);
        this.nestedException = nestedException;
    }

    /**
     *  Set to an exception that should be nested
     *
     * @param val The throwable to be nested
     */
    protected void setNestedException(Throwable val) {
        nestedException = val;
    }

    /**
     * <p>
     * Gets the nested exception
     * </p>
     *
     * @return Throwable the nested exception
     */
    public Throwable getNestedException() {
        return nestedException;
    }

    /**
     * <p>
     * Prints the message for this exception including any nested exceptions.
     * Nested Exception messages are printed at the top to show the deepest
     * error first.
     * </p>
     *
     * @return The string holding the messages of all nested exceptions and
     *         this one.
     */
    public String getNestedMessage() {
        String output = null;
        String msg = null;
        String msg2 = super.getMessage();

        if (nestedException != null) {
            msg = nestedException.getMessage();
        }

        if (msg != null) {
            if (msg2 != null) {
                output = msg + NESTED_STRING + msg2;
            } else {
                output = msg;
            }
        } else {
            if (msg2 != null) {
                output = msg2;
            } else {
                output = null;
            }
        }

        return output;
    }

    /**
     * Prints the stack trace to standard error
     */
    public void printStackTrace() {
        printStackTrace(System.err);
    }

    /**
     * Prints the given stack trace to a given PrintWriter object.
     * Nested Exception's stack trace is printed first so that the
     * deepest exception (i.e. the actual error), is shown first.
     *
     * @param writer PrintWriter containing stack trace
     */
    public void printStackTrace(PrintWriter writer) {
        if (nestedException != null) {
            nestedException.printStackTrace(writer);
            writer.println(NESTED_STRING);
        }
        super.printStackTrace(writer);
    }

    /**
     * Prints the given stack trace to a PrintStream object.
     * Nested Exception's stack trace is printed first so that the
     * deepest exception (i.e. the actual error), is shown first.
     *
     * @param stream PrintStream containing stack trace
     */
    public void printStackTrace(PrintStream stream) {
        if (nestedException != null) {
            nestedException.printStackTrace(stream);
            stream.println(NESTED_STRING);
        }
        super.printStackTrace(stream);
    }


}
