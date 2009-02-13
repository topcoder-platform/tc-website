package com.topcoder.web.ejb.userevent;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 * @author dok
 * Date: Apr 2, 2004
 */
public interface UserEventHome extends EJBHome {

    UserEvent create() throws CreateException, RemoteException;
}
