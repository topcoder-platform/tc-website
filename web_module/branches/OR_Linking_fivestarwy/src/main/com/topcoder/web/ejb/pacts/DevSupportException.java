/*
* EventFailureException
*
* Created May 9, 2007
*/
package com.topcoder.web.ejb.pacts;

import com.topcoder.web.tc.controller.legacy.pacts.common.IllegalUpdateException;

/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author Cucu
 * @version $Id$
 */
public class DevSupportException extends IllegalUpdateException {

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

}
