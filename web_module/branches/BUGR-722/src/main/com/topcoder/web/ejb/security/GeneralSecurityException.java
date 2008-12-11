package com.topcoder.web.ejb.security;

/**
 * For wrapping exceptions, generally we don't really know what happened.  Most likely
 * this is a configuration or run time system failure, so we should be extending EJBException.
 * However, the webservice stack can't figure out how to marshal it, so I'm going to use
 * RuntimeException to get things moving.  However, this is a violation of JAX-RPC 1.1, section 5.2.2
 * <p/>
 * Caused by: com.sun.xml.bind.v2.runtime.IllegalAnnotationsException: 1 counts of IllegalAnnotationExceptions
 * java.lang.StackTraceElement does not have a no-arg default constructor.
 * this problem is related to the following location:
 * at java.lang.StackTraceElement
 * at public java.lang.StackTraceElement[] java.lang.Throwable.getStackTrace()
 * at java.lang.Throwable
 * at java.lang.Exception
 * at private java.lang.Exception com.topcoder.web.ejb.security.jaxws.GeneralSecurityExceptionBean.causedByException
 * at com.topcoder.web.ejb.security.jaxws.GeneralSecurityExceptionBean
 *
 * @author dok
 * @version $Id: GeneralSecurityException.java 69178 2008-03-14 16:24:11Z gpaul $
 *          Create Date: Feb 21, 2008
 */

public class GeneralSecurityException extends RuntimeException {
//    public class GeneralSecurityException extends EJBException {


    public GeneralSecurityException() {
        super();
    }

    public GeneralSecurityException(String message) {
        super(message);
    }

    public GeneralSecurityException(Exception nestedException) {
        super(nestedException);
    }

    public GeneralSecurityException(String message, Exception nestedException) {
        super(message, nestedException);
    }
}


