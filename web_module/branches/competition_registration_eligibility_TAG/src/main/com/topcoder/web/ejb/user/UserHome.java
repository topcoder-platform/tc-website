package com.topcoder.web.ejb.user;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface UserHome extends EJBHome {

    public final static String EJB_REF_NAME = "com.topcoder.web.ejb.user.UserHome";

    User create() throws CreateException, RemoteException;

}

;
