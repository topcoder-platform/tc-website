package com.topcoder.web.ejb.user;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 * @author dok
 * Date: Jan 20, 2004
 */
public interface UserPreferenceHome extends EJBHome {

    UserPreference create() throws CreateException, RemoteException;

}
