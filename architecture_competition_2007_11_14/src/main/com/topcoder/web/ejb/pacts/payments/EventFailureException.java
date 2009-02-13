/*
* EventFailureException
*
* Created May 9, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EventFailureException extends Exception {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    public EventFailureException() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @param arg0
     */
    public EventFailureException(String arg0) {
        super(arg0);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param arg0
     */
    public EventFailureException(Throwable arg0) {
        super(arg0);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param arg0
     * @param arg1
     */
    public EventFailureException(String arg0, Throwable arg1) {
        super(arg0, arg1);
        // TODO Auto-generated constructor stub
    }

}
