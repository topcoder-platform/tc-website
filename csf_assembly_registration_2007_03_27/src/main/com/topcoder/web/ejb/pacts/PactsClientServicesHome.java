package com.topcoder.web.ejb.pacts;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 * The home interface for the PACTS Client EJB.
 *
 * @author  Cucu
 * @version 1.00, 03/06/2002
 */

public interface PactsClientServicesHome extends EJBHome {
    /**
     * Creates and returns a <tt>PactsClientServices</tt> object.
     *
     * @return  A new <tt>PactsClientServices</tt> object.
     */
    PactsClientServices create() throws CreateException, RemoteException;
}

