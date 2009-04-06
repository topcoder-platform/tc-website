package com.topcoder.web.ejb.project;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 21, 2005
 */
public interface ProjectHome extends EJBHome {
    public Project create() throws CreateException, RemoteException;
}
