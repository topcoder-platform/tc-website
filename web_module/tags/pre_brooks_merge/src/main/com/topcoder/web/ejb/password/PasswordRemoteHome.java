package com.topcoder.web.ejb.password;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import java.rmi.RemoteException;

public interface PasswordRemoteHome extends javax.ejb.EJBHome {

    public static final String EJB_REF_NAME = "com/topcoder/web/ejb/password/PasswordEJB";

    public PasswordRemote create() throws RemoteException, CreateException, EJBException;

}
