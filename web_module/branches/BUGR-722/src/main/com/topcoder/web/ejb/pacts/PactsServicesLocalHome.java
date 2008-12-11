package com.topcoder.web.ejb.pacts;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * The local home interface for the PACTS EJB.
 *
 * @author  Dave Pecora
 * @version 1.00, 03/06/2002
 */

public interface PactsServicesLocalHome extends EJBLocalHome {
    /**
     * Creates and returns a <tt>PactsServicesLocal</tt> object.
     *
     * @return  A new <tt>PactsServicesLocal</tt> object.
     */
    PactsServicesLocal create() throws CreateException;
}

