/*
* StateTransitionFailureException
*
* Created Apr 27, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class StateTransitionFailureException extends Exception {

    /**
     * 
     */
    public StateTransitionFailureException() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @param arg0
     */
    public StateTransitionFailureException(String arg0) {
        super(arg0);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param arg0
     */
    public StateTransitionFailureException(Throwable arg0) {
        super(arg0);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param arg0
     * @param arg1
     */
    public StateTransitionFailureException(String arg0, Throwable arg1) {
        super(arg0, arg1);
        // TODO Auto-generated constructor stub
    }

}
