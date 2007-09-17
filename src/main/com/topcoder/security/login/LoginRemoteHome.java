package com.topcoder.security.login;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import java.rmi.RemoteException;

public interface LoginRemoteHome extends javax.ejb.EJBHome {

    public static final String EJB_REF_NAME = LoginRemoteHome.class.getName();

    public LoginRemote create()
            throws RemoteException, CreateException, EJBException;

}
