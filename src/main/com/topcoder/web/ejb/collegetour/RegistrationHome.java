package com.topcoder.web.ejb.collegetour;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 5, 2005
 */
public interface RegistrationHome extends EJBHome {
    public Registration create() throws CreateException, RemoteException;

}
