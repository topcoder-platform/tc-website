/*
* EventFailureException
*
* Created May 9, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EventFailureException extends Exception {

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
