/*
* EventFailureException
*
* Created May 9, 2007
*/
package com.topcoder.web.ejb.pacts;

/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author Cucu
 * @version $Id$
 */
public class DevSupportException extends Exception {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    public DevSupportException() {
    }

    /**
     * @param arg0
     */
    public DevSupportException(String arg0) {
        super(arg0);
    }

    /**
     * @param arg0
     */
    public DevSupportException(Throwable arg0) {
        super(arg0);
    }

    /**
     * @param arg0
     * @param arg1
     */
    public DevSupportException(String arg0, Throwable arg1) {
        super(arg0, arg1);
    }

}
