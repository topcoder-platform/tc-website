package com.topcoder.dde.user;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

public interface UserManagerRemoteHome extends javax.ejb.EJBHome {

    public static final String EJB_REF_NAME = "dde/UserManager";

    public UserManagerRemote create() throws RemoteException, CreateException;

}
