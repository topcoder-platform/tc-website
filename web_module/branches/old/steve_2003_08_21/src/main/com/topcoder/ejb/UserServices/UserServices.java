package com.topcoder.ejb.UserServices;

import com.topcoder.ejb.AuthenticationServices.User;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;


/**
 *  This is the Remote interface for the UserBean.
 */

public interface UserServices extends EJBObject {

    public User getUser() throws RemoteException;

    public void setUser(User user) throws RemoteException;


}
