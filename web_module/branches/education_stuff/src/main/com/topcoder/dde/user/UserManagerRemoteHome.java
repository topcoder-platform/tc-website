package com.topcoder.dde.user;

import java.rmi.RemoteException;
import javax.ejb.CreateException;

public interface UserManagerRemoteHome extends javax.ejb.EJBHome {

    public static final String EJB_REF_NAME = "dde/UserManager";

    public UserManagerRemote create() throws RemoteException, CreateException;

}
