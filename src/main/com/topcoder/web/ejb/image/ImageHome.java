package com.topcoder.web.ejb.image;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 6, 2005
 */
public interface ImageHome extends EJBHome {

    Image create() throws CreateException, RemoteException;
}
