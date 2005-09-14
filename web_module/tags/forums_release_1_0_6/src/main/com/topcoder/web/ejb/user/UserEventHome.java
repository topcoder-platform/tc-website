/*
 * UserEventHome.java
 *
 * Created on August 9, 2004, 3:04 PM
 */

package com.topcoder.web.ejb.user;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 *
 * @author  rfairfax
 */
public interface UserEventHome extends EJBHome {

    UserEvent create() throws CreateException, RemoteException;

}
