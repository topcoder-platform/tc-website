package com.topcoder.web.ejb.requestservices;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 * User: dok
 * Date: Nov 19, 2004
 * Time: 11:25:00 AM
 */
public interface RequestServicesHome extends EJBHome {

    RequestServices create() throws CreateException, RemoteException;
}
