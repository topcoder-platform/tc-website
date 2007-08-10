/*
* StateTransitionFailureException
*
* Created Apr 27, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 * 
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class StateTransitionFailureException extends Exception {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object. 
     */
    private static final long serialVersionUID = 1L;

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
