package com.topcoder.web.ejb.user;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface UserHome extends EJBHome {

  public final static String EJB_REF_NAME="com.topcoder.web.ejb.user.UserHome";

  User create() throws CreateException, RemoteException;

};
