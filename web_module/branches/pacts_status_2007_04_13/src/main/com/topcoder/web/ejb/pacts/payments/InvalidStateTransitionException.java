/*
* StateTransitionFailure
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

/**
 * @author Pablo Wolfus (Pablo)
 * @version $Id$
 */
public class InvalidStateTransitionException extends Exception {

    /**
     * 
     */
    public InvalidStateTransitionException() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @param arg0
     */
    public InvalidStateTransitionException(String arg0) {
        super(arg0);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param arg0
     */
    public InvalidStateTransitionException(Throwable arg0) {
        super(arg0);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param arg0
     * @param arg1
     */
    public InvalidStateTransitionException(String arg0, Throwable arg1) {
        super(arg0, arg1);
        // TODO Auto-generated constructor stub
    }

}
