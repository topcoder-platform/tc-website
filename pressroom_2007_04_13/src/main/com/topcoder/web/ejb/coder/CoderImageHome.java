package com.topcoder.web.ejb.coder;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 6, 2005
 */
public interface CoderImageHome extends EJBHome {

    CoderImage create() throws CreateException, RemoteException;
}
