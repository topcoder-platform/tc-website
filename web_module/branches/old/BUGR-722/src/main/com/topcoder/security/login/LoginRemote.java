package com.topcoder.security.login;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;

import java.rmi.RemoteException;

public interface LoginRemote extends javax.ejb.EJBObject {

    public TCSubject login(String username, String password)
            throws RemoteException, GeneralSecurityException;
    public TCSubject login(String username, String password, String dataSource)
            throws RemoteException, GeneralSecurityException;

}
