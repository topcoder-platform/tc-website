package com.topcoder.web.ejb.project;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 17, 2006
 */
public interface ProjectWagerHome extends EJBHome {
    public ProjectWager create() throws CreateException, RemoteException;
}
